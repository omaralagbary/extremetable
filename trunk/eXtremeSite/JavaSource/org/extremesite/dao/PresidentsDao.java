/*
 * Copyright 2004 original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.extremesite.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.extremesite.bean.President;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultReader;

/**
 * @author Jeff Johnston
 */
public class PresidentsDao {
    private JdbcTemplate jdbcTemplate;
    
    private final static String presidentsQuery = 
        "    president_id presidentId, " + 
        "    first_name firstName, " +
        "    last_name lastName, " +
        "    nick_name nickName,  " +
        "    CONCAT(first_name, ' ' + last_name) fullName, " +
        "    term,  " +
        "    born,  " +
        "    died,  " +
        "    education, " + 
        "    career,  " +
        "    political_party politicalParty " +
        " FROM presidents ";
    
    private final static String totalPresidentsQuery = 
        " SELECT count(*) FROM presidents ";
    
    
    public String getPresidentsQuery() {
        return presidentsQuery;
    }
    
    public String getTotalPresidentsQuery() {
        return totalPresidentsQuery;
    }

    public Collection getPresidents() {
        return getPresidents(presidentsQuery);
    }

    public Collection getPresidents(String query) {
        query = "SELECT" + query;
        
        return jdbcTemplate.query(query, new ResultReader() {
            List results = new ArrayList();

            public List getResults() {
                return results;
            }

            public void processRow(ResultSet rs)
                    throws SQLException {
                President president = new President();
                president.setPresidentId(new Integer(rs.getInt("presidentId")));
                president.setFirstName(rs.getString("firstName"));
                president.setLastName(rs.getString("lastName"));
                president.setNickName(rs.getString("nickName"));
                president.setFullName(rs.getString("fullName"));
                president.setTerm(rs.getString("term"));
                president.setBorn(rs.getDate("born"));
                president.setDied(rs.getDate("died"));
                president.setEducation(rs.getString("education"));
                president.setCareer(rs.getString("career"));
                president.setPoliticalParty(rs.getString("politicalParty"));
                results.add(president);
            }
        });        
    }

    public int getTotalPresidents(final String query) {
        return jdbcTemplate.queryForInt(query);
    }
    
    public String filterQuery(String query, String property, String value) {
        StringBuffer result = new StringBuffer(query);

        if (query.indexOf("WHERE") == -1) {
            result.append(" WHERE 1 = 1 "); //stub WHERE clause so can just append AND clause
        }
        
        if (property.equals("fullName")) {
            result.append(" AND CONCAT(first_name, ' ' + last_name) like '%" + value + "%'");
        } else if (property.equals("nickName")) {
            result.append(" AND nick_name like '%" + value + "%'");
        } else {
            result.append(" AND " + property + " like '%" + value + "%'");
        }
        
        return result.toString();
    }

    public String sortQuery(String query, String property, String sortOrder) {
        StringBuffer result = new StringBuffer(query + " ORDER BY ");
        
        if (property.equals("fullName")) {
            result.append("concat(first_name, ' ' + last_name) " + sortOrder);
        } else {
            result.append(property + " " + sortOrder);
        }

        return result.toString();
    }    
    
    public String limitQuery(int rowEnd, String query) {
        return " LIMIT 0 " + rowEnd + " " + query;
    }    
    
    public String getDefaultSortOrder() {
        return " ORDER BY concat(first_name, ' ' + last_name) ";        
    }    
    
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }    
}
