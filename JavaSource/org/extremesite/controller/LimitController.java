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

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.extremecomponents.table.context.Context;
import org.extremecomponents.table.context.HttpServletRequestContext;
import org.extremecomponents.table.limit.Limit;
import org.extremecomponents.table.limit.LimitFactory;
import org.extremecomponents.table.limit.TableLimit;
import org.extremecomponents.table.limit.TableLimitFactory;
import org.extremesite.service.PresidentsService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 * @author Jeff Johnston
 */
public class LimitController extends AbstractController {
    private String successView;
    private int defaultRowsDisplayed;
    private PresidentsService presidentsService;

    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView(successView);

        Context context = new HttpServletRequestContext(request);
        LimitFactory limitFactory = new TableLimitFactory(context);
        Limit limit = new TableLimit(limitFactory);

        int totalRows = presidentsService.getTotalPresidents(limit.getFilterSet(), limit.isExported());

        limit.setRowAttributes(totalRows, defaultRowsDisplayed);

        Collection presidents = presidentsService.getPresidents(limit.getFilterSet(), limit.getSort(), limit.getRowEnd());

        mv.addObject("presidents", presidents);
        mv.addObject("totalRows", new Integer(totalRows));

        return mv;
    }

    public void setSuccessView(String successView) {
        this.successView = successView;
    }

    public void setDefaultRowsDisplayed(int defaultRowsDisplayed) {
        this.defaultRowsDisplayed = defaultRowsDisplayed;
    }

    public void setPresidentsService(PresidentsService presidentsService) {
        this.presidentsService = presidentsService;
    }
}
