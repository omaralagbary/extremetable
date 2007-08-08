package org.extremesite.view;

import org.extremecomponents.table.core.TableConstants;
import org.extremecomponents.table.core.TableModel;
import org.extremecomponents.table.view.html.BuilderUtils;
import org.extremecomponents.table.view.html.TableActions;

public class CustomTableActions extends TableActions {
    public CustomTableActions(TableModel model) {
        super(model);
    }
    
    public String getPageAction() {
        TableModel model = getTableModel();

        StringBuffer action = new StringBuffer("javascript:");
        
        action.append(getClearedExportTableIdParameters());

        String form = BuilderUtils.getForm(model);
        action.append("document.forms.").append(form).append(".");
        action.append(model.getTableHandler().prefixWithTableId()).append(TableConstants.PAGE);
        String page = "this.options[this.selectedIndex].value";
        action.append(".value=").append(page).append(";");

        action.append(getOnInvokeAction());
        
        return action.toString();
    }
}
