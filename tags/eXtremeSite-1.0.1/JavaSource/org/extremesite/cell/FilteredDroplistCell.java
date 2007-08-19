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
package org.extremesite.cell;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.comparators.NullComparator;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.extremecomponents.table.bean.Column;
import org.extremecomponents.table.cell.FilterDroplistCell;
import org.extremecomponents.table.core.TableModel;

/**
 * @author Jeff Johnston
 */
public class FilteredDroplistCell extends FilterDroplistCell {
    private static Log logger = LogFactory.getLog(FilterDroplistCell.class);

    protected Collection getFilterDropList(TableModel model, Column column) {
        List droplist = new ArrayList();
        
        Set options = new HashSet();

        String firstNameFilter = model.getLimit().getFilterSet().getFilterValue("firstName");

        Collection beans = model.getCollectionOfBeans();
        for (Iterator iter = beans.iterator(); iter.hasNext();) {
            Object bean = iter.next();
            try {
                String firstName = BeanUtils.getProperty(bean, "firstName");
                if (StringUtils.isNotBlank(firstNameFilter) && !firstName.equals(firstNameFilter)) {
                    continue;
                }

                Object lastName = getFilterOption(column, bean); 
                if ((lastName != null) && !options.contains(lastName)) {
                    droplist.add(new Option(lastName));
                    options.add(lastName);
                }
            } catch (Exception e) {
                logger.debug("Problems getting the droplist.", e);
            }
        }

        BeanComparator comparator = new BeanComparator("label", new NullComparator());
        Collections.sort(droplist, comparator);

        return droplist;
    }
}
