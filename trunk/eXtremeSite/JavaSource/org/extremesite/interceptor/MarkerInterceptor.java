package org.extremesite.interceptor;

import org.apache.commons.lang.StringUtils;
import org.extremecomponents.table.bean.Row;
import org.extremecomponents.table.core.TableModel;
import org.extremecomponents.table.interceptor.RowInterceptor;
import org.extremesite.bean.President;

public class MarkerInterceptor implements RowInterceptor {
    public void addRowAttributes(TableModel tableModel, Row row) {
    }

    public void modifyRowAttributes(TableModel model, Row row) {
        President president = (President) model.getCurrentRowBean();
        String career = president.getCareer();
        if (StringUtils.contains(career, "Soldier")) {
            row.setStyle("background-color:#fdffc0;");
        } else {
            row.setStyle("");
        }
    }
}
