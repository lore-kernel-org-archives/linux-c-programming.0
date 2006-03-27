From: <krishna.vamsi@wipro.com>
Subject: Startup function before main.
Date: Mon, 27 Mar 2006 16:37:57 +0530
Message-ID: <DC91351678E31E4FB24B551221F507EC028D5063@blr-itp-msg.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi List,
 
Before Executing the main function, a startup routine will be executed
which will set up the initial environment for the process.
 
This Startup routine will be supplied by the kernel and linked by the
Linker. My question is : Can we add one more startup routine before
executing the main program, if yes how??
 
 
-Vamsi
