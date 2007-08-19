package org.extremesite.controller;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.extremecomponents.table.bean.Column;
import org.extremecomponents.table.bean.Export;
import org.extremecomponents.table.bean.Row;
import org.extremecomponents.table.bean.Table;
import org.extremecomponents.table.context.Context;
import org.extremecomponents.table.context.HttpServletRequestContext;
import org.extremecomponents.table.core.TableConstants;
import org.extremecomponents.table.core.TableModel;
import org.extremecomponents.table.core.TableModelImpl;
import org.extremesite.dao.PresidentsDao;
import org.extremesite.interceptor.AssemblerInterceptor;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class Assembler {

    public String getTable(Map parameterMap, HttpServletRequest request) {
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());

        PresidentsDao presidentsDao = (PresidentsDao) webApplicationContext.getBean("presidentsDao");
        Collection presidents = presidentsDao.getPresidents();

        Context context = null;
        if (parameterMap == null) {
            context = new HttpServletRequestContext(request);
        } else {
            context = new HttpServletRequestContext(request, parameterMap);
        }

        TableModel model = new TableModelImpl(context);
        try {
            return build(model, presidents).toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "";
    }

    private Object build(TableModel model, Collection presidents) throws Exception {
        Table table = model.getTableInstance();
        table.setTableId("assembler");
        table.setItems(presidents);
        table.setAction(model.getContext().getContextPath() + "/assembler.run");
        table.setTitle("Presidents");
        table.setOnInvokeAction("buildTable('assembler')");
        table.setWidth("700px");
        model.addTable(table);
        
        Export export = model.getExportInstance();
        export.setView(TableConstants.VIEW_XLS);
        export.setViewResolver(TableConstants.VIEW_XLS);
        export.setImageName(TableConstants.VIEW_XLS);
        export.setText(TableConstants.VIEW_XLS);
        export.setFileName("output.xls");
        model.addExport(export);

        Row row = model.getRowInstance();
        row.setHighlightRow(Boolean.FALSE);
        model.addRow(row);

        Column columnName = model.getColumnInstance();
        columnName.setProperty("fullName");
        columnName.setInterceptor((AssemblerInterceptor.class).getName());
        model.addColumn(columnName);

        Column columnNickName = model.getColumnInstance();
        columnNickName.setProperty("nickName");
        model.addColumn(columnNickName);

        Column columnTerm = model.getColumnInstance();
        columnTerm.setProperty("term");
        model.addColumn(columnTerm);

        Column columnDied = model.getColumnInstance();
        columnDied.setProperty("died");
        columnDied.setCell(TableConstants.DATE);
        model.addColumn(columnDied);

        Column columnCareer = model.getColumnInstance();
        columnCareer.setProperty("career");
        model.addColumn(columnCareer);

        return model.assemble();
    }
}
