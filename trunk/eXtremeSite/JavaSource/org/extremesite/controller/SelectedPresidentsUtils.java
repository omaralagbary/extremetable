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

import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.extremesite.bean.President;

/**
 * Get the List of presidents, as well as the List of presidents that were
 * selected.
 * 
 * @author Jeff Johnston
 */
public class SelectedPresidentsUtils {
    public static Collection saveSelectedPresidentsIDs(HttpServletRequest request) {
        Collection presidents = (Collection) request.getSession().getAttribute(SelectedPresidentsConstants.SELECTED_PRESIDENTS);

        if (presidents == null) {
            presidents = new ArrayList();
            request.getSession().setAttribute(SelectedPresidentsConstants.SELECTED_PRESIDENTS, presidents);
        }

        Enumeration parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = (String) parameterNames.nextElement();
            if (parameterName.startsWith("chkbx_")) {
                String presidentId = StringUtils.substringAfter(parameterName, "chkbx_");
                String parameterValue = request.getParameter(parameterName);
                if (parameterValue.equals(SelectedPresidentsConstants.SELECTED)) {
                    if (!presidents.contains(presidentId)) {
                        presidents.add(presidentId);
                    }
                } else {
                    presidents.remove(presidentId);
                }
            }
        }

        return presidents;
    }

    public static Collection getSelectedPresidents(Collection presidents, Collection selectedPresidentsIds) {
        Collection result = new ArrayList();

        for (Iterator iter = selectedPresidentsIds.iterator(); iter.hasNext();) {
            String selectedPresident = (String) iter.next();
            result.add(getPresident(presidents, selectedPresident));
        }

        return result;
    }

    private static President getPresident(Collection presidents, String selectedPresident) {
        for (Iterator iter = presidents.iterator(); iter.hasNext();) {
            President president = (President) iter.next();
            Integer presidentId = president.getPresidentId();
            if (presidentId.toString().equals(selectedPresident)) {
                return president;
            }
        }

        return null;
    }
}