<%--
 * ***** BEGIN LICENSE BLOCK *****
 * Zimbra Collaboration Suite Web Client
 * Copyright (C) 2007, 2008, 2009, 2010, 2011 Zimbra, Inc.
 * 
 * The contents of this file are subject to the Zimbra Public License
 * Version 1.3 ("License"); you may not use this file except in
 * compliance with the License.  You may obtain a copy of the License at
 * http://www.zimbra.com/license.
 * 
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
 * ***** END LICENSE BLOCK *****
--%>
<%@ tag body-content="empty" %>
<%@ attribute name="context" rtexprvalue="true" required="true" type="com.zimbra.cs.taglib.tag.SearchContext" %>
<%@ attribute name="id" rtexprvalue="true" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="com.zimbra.i18n" %>
<%@ taglib prefix="mo" uri="com.zimbra.mobileclient" %>
<%@ taglib prefix="zm" uri="com.zimbra.zm" %>
<%@ taglib prefix="app" uri="com.zimbra.htmlclient" %>
<c:set var="id" value="${not empty id?id:(empty param.id ? context.currentItem.id : param.id)}"/>
<mo:handleError>
    <zm:getMailbox var="mailbox"/>
    <zm:getContact id="${id}" var="contact"/>
    <zm:getUserAgent var="ua" session="true"/>
    <c:set var="context_url" value="${requestScope.baseURL!=null?requestScope.baseURL:'zmain'}"/>
    <zm:currentResultUrl var="closeUrl" value="${context_url}" context="${context}"/>
    <zm:computeNextPrevItem var="cursor" searchResult="${context.searchResult}" index="${context.currentItemIndex}"/>
    <zm:currentResultUrl var="actionUrl" value="${context_url}" context="${context}" action="view" id="${contact.id}"/>
</mo:handleError>
<c:set var="title" value="${zm:truncate(contact.displayFileAs,20,true)}" scope="request"/>
<form id="zForm" action="${fn:escapeXml(actionUrl)}" method="post" onsubmit="return submitForm(this);">
    <input type="hidden" name="doContactAction" value="1"/>
    <input type="hidden" name="crumb" value="${fn:escapeXml(mailbox.accountInfo.crumb)}"/>

    <input name="moreActions" type="hidden" value="<fmt:message key="actionGo"/>"/>

    <!--Application Toolbar  -->
    <mo:contactToolbar contact="${contact}" urlTarget="${context_url}" context="${context}" keys="false" isTop="true" mailbox="${mailbox}"/>
    <div class="wrap-dcontent" id="wrap-dcontent-view">
                    <div id="dcontent-view" style="padding-bottom:5px;">
        <div class="Stripes header">
            <div>
                <div>
                    <span class="${contact.isGroup ? 'ImgGroupPerson_48' : 'ImgPerson_48'}" style="float:left;">&nbsp;</span>
                    <div class="td aleft">
                        <strong>
                            <c:choose>
                                <c:when test="${empty contact.displayFileAs}">
                                    <fmt:message var="noDisplayAs" key="noDisplayAs" />
                                    ${fn:escapeXml(noDisplayAs)}
                                </c:when>
                                <c:otherwise>
                                    <app:contactDisplayName contact="${contact}" />
                                </c:otherwise>
                            </c:choose>
                        </strong>
                        <c:if test="${not empty contact.jobTitle}">
                            <div style="font-size:0.9em;">${fn:escapeXml(contact.jobTitle)}</div>
                        </c:if>
                        <c:if test="${not empty contact.company}">
                            <div style="font-size:0.9em;">${fn:escapeXml(contact.company)}</div>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:if test="${contact.isFlagged || (contact.hasTags && mailbox.features.tagging)}">
                <div class="tbl">
                    <div class="tr nr">
                <span class="td aleft">
                <c:if test="${contact.isFlagged}">
                    <span class="Img ImgFlagRed">&nbsp;</span></c:if>
                <c:if test="${contact.hasTags and mailbox.features.tagging}">
                    <c:set var="tags" value="${zm:getTags(pageContext, contact.tagIds)}"/>
                    <c:forEach items="${tags}" var="tag">
                        <span class="Img ImgTag${zm:capitalize(tag.color)}">&nbsp;</span><span>${fn:escapeXml(tag.name)}</span>
                    </c:forEach>
                </c:if>
                </span>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="msgBody">

                    <mo:displayContact contact="${contact}"/>
                </div>    
            </div>
        </div>    
    <c:if test="${ua.isiPad == false}">
        <mo:contactToolbar contact="${contact}" urlTarget="${context_url}" context="${context}" keys="false" isTop="false" mailbox="${mailbox}"/>
    </c:if>
    </div>
    </div>
</form>
