/*
 * ***** BEGIN LICENSE BLOCK *****
 * 
 * Zimbra Collaboration Suite Server
 * Copyright (C) 2010 Zimbra, Inc.
 * 
 * The contents of this file are subject to the Zimbra Public License
 * Version 1.3 ("License"); you may not use this file except in
 * compliance with the License.  You may obtain a copy of the License at
 * http://www.zimbra.com/license.
 * 
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
 * 
 * ***** END LICENSE BLOCK *****
 */
package com.zimbra.cs.service.mail;

import com.zimbra.common.service.ServiceException;
import com.zimbra.common.soap.Element;
import com.zimbra.common.soap.MailConstants;
import com.zimbra.cs.account.Account;
import com.zimbra.cs.filter.RuleManager;
import org.dom4j.QName;

/**
 */
public class GetOutgoingFilterRules extends GetFilterRules {

    @Override
    protected QName getResponseElementName() {
        return MailConstants.GET_OUTGOING_FILTER_RULES_RESPONSE;
    }

    @Override
    protected Element getRulesAsXML(Account account, Element.ElementFactory elementFactory) throws ServiceException {
        return RuleManager.getOutgoingRulesAsXML(elementFactory, account);
    }
}
