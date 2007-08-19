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
package org.extremesite.view;

import java.util.Iterator;

import org.extremecomponents.table.bean.Export;
import org.extremecomponents.table.core.TableModel;
import org.extremecomponents.table.view.DefaultToolbar;
import org.extremecomponents.table.view.html.BuilderConstants;
import org.extremecomponents.table.view.html.BuilderUtils;
import org.extremecomponents.table.view.html.ToolbarBuilder;
import org.extremecomponents.util.HtmlBuilder;

/**
 * @author Jeff Johnston
 */
public class MessagesToolbar extends DefaultToolbar {
    public MessagesToolbar(HtmlBuilder html, TableModel model) {
        super(html, model);
    }

    protected void columnRight(HtmlBuilder html, TableModel model) {
        boolean showPagination = BuilderUtils.showPagination(model);
        boolean showExports = BuilderUtils.showExports(model);
        
        ToolbarBuilder toolbarBuilder = new ToolbarBuilder(html, model);

        html.td(2).align("right").close();

        html.table(2).border("0").cellPadding("0").cellSpacing("1").styleClass(BuilderConstants.TOOLBAR_CSS).close();

        html.tr(3).close();

        if (showPagination) {

            html.td(4).close();
            toolbarBuilder.firstPageItemAsText();
            html.tdEnd();

            html.td(4).close();
            toolbarBuilder.prevPageItemAsText();
            html.tdEnd();

            html.td(4).close();
            toolbarBuilder.nextPageItemAsText();
            html.tdEnd();

            html.td(4).close();
            toolbarBuilder.lastPageItemAsText();
            html.tdEnd();

            html.td(4).style("width:20px").close();
            html.newline();
            html.tabs(4);
            toolbarBuilder.rowsDisplayedDroplist();
            html.tdEnd();
        }

        if (showExports) {
            Iterator iterator = model.getExportHandler().getExports().iterator();
            for (Iterator iter = iterator; iter.hasNext();) {
                html.td(4).close();
                Export export = (Export) iter.next();
                toolbarBuilder.exportItemAsText(export);
                html.tdEnd();
            }
        }

        html.trEnd(3);

        html.tableEnd(2);
        html.newline();
        html.tabs(2);
        
        html.tdEnd();
    }
}
