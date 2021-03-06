/*
 * ***** BEGIN LICENSE BLOCK *****
 * Zimbra Collaboration Suite Web Client
 * Copyright (C) 2006, 2007, 2008, 2009, 2010 Zimbra, Inc.
 * 
 * The contents of this file are subject to the Zimbra Public License
 * Version 1.3 ("License"); you may not use this file except in
 * compliance with the License.  You may obtain a copy of the License at
 * http://www.zimbra.com/license.
 * 
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
 * ***** END LICENSE BLOCK *****
 */

ZmNotebookFileView = function(parent, controller) {
	ZmListView.call(this, {parent:parent, controller:controller});
	this._controller = controller;
}

ZmNotebookFileView.prototype = new ZmListView;
ZmNotebookFileView.prototype.constructor = ZmNotebookFileView;

ZmNotebookFileView.prototype.toString = function() {
	return "ZmNotebookFileView";
};

//
// Data
//

ZmNotebookFileView.prototype._controller;

ZmNotebookFileView.prototype._fileListView;

//
// Public methods
//

ZmNotebookFileView.prototype.handleActionPopdown = function(ev) { /*TODO*/ };
