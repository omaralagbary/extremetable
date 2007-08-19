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

import org.extremesite.service.PresidentsService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 * @author Jeff Johnston
 */
public class SelectedPresidentsListedController extends AbstractController {
    public PresidentsService presidentsService;
    public String successView;

    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Collection selectedPresidentsIds = SelectedPresidentsUtils.saveSelectedPresidentsIDs(request);
        Collection selectedPresidents = SelectedPresidentsUtils.getSelectedPresidents(presidentsService.getPresidents(), selectedPresidentsIds);
        request.setAttribute("selected", selectedPresidents);
        request.getSession().removeAttribute(SelectedPresidentsConstants.SELECTED_PRESIDENTS);
        return new ModelAndView(successView);
    }

    public void setPresidentsService(PresidentsService presidentsService) {
        this.presidentsService = presidentsService;
    }

    public void setSuccessView(String successView) {
        this.successView = successView;
    }
}
