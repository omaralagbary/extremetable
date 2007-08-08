/*
 * Copyright 2004 original author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package org.extremesite.callback;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.extremecomponents.table.callback.FilterRowsCallback;
import org.extremecomponents.table.core.TableModel;

/**
 * @author Jeff Johnston
 */
public class ExactMatchFilterRows implements FilterRowsCallback {
    public Collection filterRows(TableModel model, Collection rows) throws Exception {
        boolean filtered = model.getLimit().isFiltered();
        boolean cleared = model.getLimit().isCleared();

        if (!filtered || cleared) {
            return rows;
        }

        if (filtered) {
            Collection collection = new ArrayList();
            Predicate filterPredicate = new ExactMatchFilterPredicate(model);
            CollectionUtils.select(rows, filterPredicate, collection);

            return collection;
        }

        return rows;
    }
}
