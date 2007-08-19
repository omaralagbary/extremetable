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
package org.extremesite.service;

import java.util.Collection;

import org.apache.commons.lang.StringUtils;
import org.extremecomponents.table.limit.Filter;
import org.extremecomponents.table.limit.FilterSet;
import org.extremecomponents.table.limit.Sort;
import org.extremesite.dao.PresidentsDao;

/**
 * @author Jeff Johnston
 */
public class PresidentsService {
    private PresidentsDao presidentsDao;
    private int maxExportRows;

    public int getTotalPresidents(FilterSet filterSet, boolean isExported) {
        String totalQuery = presidentsDao.getTotalPresidentsQuery();
        String modTotalQuery = filterQuery(filterSet, totalQuery);
        int totalRows = presidentsDao.getTotalPresidents(modTotalQuery);
        if (isExported && totalRows > maxExportRows) {
            totalRows = maxExportRows;
        }
        return totalRows;
    }
    
    public Collection getPresidents() {
        return presidentsDao.getPresidents();
    }
    
    public Collection getPresidents(FilterSet filterSet, Sort sort, int rowEnd) {
        String patientsQuery = presidentsDao.getPresidentsQuery();
        String modPatientsQuery = filterQuery(filterSet, patientsQuery);
        modPatientsQuery = sortQuery(sort, modPatientsQuery);
        modPatientsQuery = presidentsDao.limitQuery(rowEnd, modPatientsQuery);
        return presidentsDao.getPresidents(modPatientsQuery);
    }
    
    private String filterQuery(FilterSet filterSet, String query) {
        if (!filterSet.isFiltered() || filterSet.isCleared()) {
            return query;
        }
        
        Filter filters[] = filterSet.getFilters();
        for (int i = 0; i < filters.length; i++) {
            Filter filter = filters[i];
            String property = filter.getProperty();
            String value = filter.getValue();
            query = presidentsDao.filterQuery(query, property, value);
        }

        return query;
    }
    
    private String sortQuery(Sort sort, String query) {
        if (!sort.isSorted()) {
            String defaultSortOrder = presidentsDao.getDefaultSortOrder();
            if (StringUtils.isNotBlank(defaultSortOrder)) {
                return query + defaultSortOrder;
            }
            
            return query;
        }

        String property = sort.getProperty();
        String sortOrder = sort.getSortOrder();
        
        return presidentsDao.sortQuery(query, property, sortOrder);
    }

    public void setPresidentsDao(PresidentsDao presidentsDao) {
        this.presidentsDao = presidentsDao;
    }

    public void setMaxExportRows(int maxExportRows) {
        this.maxExportRows = maxExportRows;
    }
}
