package org.extremesite.interceptor;

import org.extremecomponents.table.bean.Column;
import org.extremecomponents.table.core.TableModel;
import org.extremecomponents.table.interceptor.ColumnInterceptor;

public class AssemblerInterceptor implements ColumnInterceptor {
    public void addColumnAttributes(TableModel tableModel, Column column) {
    }

    public void modifyColumnAttributes(TableModel model, Column column) {
        String fullName = column.getPropertyValueAsString();
        column.setValue("<a href=\"http://www.whitehouse.gov/history/presidents/\"> " + fullName + "</a>");
    }
}
