package com.zimbra.qa.selenium.projects.zcs.tests.preferences.instantmessaging;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import com.zimbra.qa.selenium.framework.core.*;
import com.zimbra.qa.selenium.framework.util.HarnessException;
import com.zimbra.qa.selenium.framework.util.RetryFailedTests;
import com.zimbra.qa.selenium.projects.zcs.tests.CommonTest;


public class InstantMessaging extends CommonTest {
	@BeforeClass(groups = { "always" })
	public void zLogin() throws Exception {
		super.NAVIGATION_TAB="mail";
		super.zLogin();
	}

	@Test(groups = { "smoke", "full" }, retryAnalyzer = RetryFailedTests.class)
	public void instantMessaging_1() throws Exception {
		if (SelNGBase.isExecutionARetry.get())
			handleRetry();

		// dummy test

		SelNGBase.needReset.set(false);
		
		throw new HarnessException("implement me!");
	}

}