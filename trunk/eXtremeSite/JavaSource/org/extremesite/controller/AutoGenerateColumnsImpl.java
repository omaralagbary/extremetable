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
package org.extremesite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.extremecomponents.table.bean.Column;
import org.extremecomponents.table.core.AutoGenerateColumns;
import org.extremecomponents.table.core.TableModel;

/**
 * @author Jeff Johnston
 */
public class AutoGenerateColumnsImpl implements AutoGenerateColumns {
    public static String COLUMNS_TO_ADD = "columnsToAdd";
    
    private final static String PROPERTY = "property";
    private final static String CELL = "cell";

    /**
     * Build the columns and add them to the model. 
     * Notice that for most of the attributes I am just sending in null to
     * retrieve the default attribute value from the properties or resource file.
     */
    public void addColumns(TableModel model) {
        Iterator iterator = columnsToAdd().iterator();
        while (iterator.hasNext()) {
            Map columnToAdd = (Map) iterator.next();
            Column column = new Column(model);
            column.setProperty((String) columnToAdd.get(PROPERTY));
            column.setCell((String) columnToAdd.get(CELL));
            model.addColumn(column);
        }
    }
    
    private List columnsToAdd() {
        List columns = new ArrayList();
        columns.add(columnToAdd("fullName", "display"));
        columns.add(columnToAdd("nickName", "display"));
        columns.add(columnToAdd("term", "display"));
        columns.add(columnToAdd("died", "date"));
        return columns;
    }
    
    private Map columnToAdd(String property, String cell) {
        Map column = new HashMap();
        column.put(PROPERTY, property);
        column.put(CELL, cell);
        return column;
    }
}
