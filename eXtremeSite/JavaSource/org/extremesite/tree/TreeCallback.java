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
package org.extremesite.tree;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.extremecomponents.table.callback.RetrieveRowsCallback;
import org.extremecomponents.table.core.TableModel;

/**
 * @author Jeff Johnston
 */
public class TreeCallback implements RetrieveRowsCallback {
    
    private static Log logger = LogFactory.getLog(TreeCallback.class);

    public Collection retrieveRows(TableModel model)
            throws Exception {
        logger.debug("TestTreeCallback.retrieveRows()");
        List collection = new ArrayList();
        collection.add(addRow("1", "", "Chapter 1", "Introduction"));
        collection.add(addRow("2", "1", "Preface", " Developing software applications is hard enough even with good tools and technologies."));
        collection.add(addRow("3", "1", "Introduction", "Introduction to the TreeTable with it's functionality and features."));
        collection.add(addRow("4", "1", "Usage", "With the building blocks in place, here are some scenarios for use of the Tree Table."));
        collection.add(addRow("5", "", "Chapter 2", "Basics"));
        collection.add(addRow("6", "5", "TreeTable Tag", "Attributes and syntax for the Tree Table."));
        collection.add(addRow("7", "5", "TreeColumn Tag", "Attributes and syntax for the Tree Column."));
        collection.add(addRow("8", "5", "Filtering and Sorting", "How filtering and sorting behaves in a Tree Table."));
        return collection;
    }

    private Map addRow(String id, String parent, String name, String description) {
        Map row = new HashMap();
        row.put("id", id);
        row.put("parent", parent);
        row.put("name", name);
        row.put("description", description);
        return row;
    }
}
