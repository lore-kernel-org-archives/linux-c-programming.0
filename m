From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: make rule heritage, is that possible?
Date: Mon, 27 Jan 2014 11:24:21 -0200
Message-ID: <52E65E05.6070307@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=0guIw/7tMvxHSfRYUk2XQab35JTySPzChBXRB/l3YSk=;
        b=rwWstCWLAjXjQSkS1QO6G0APzQYL+IK3SFzm1q86FVfJ+xfTSN68MPNimI+c03gxjp
         D8iP2tX+CaHhn0oq+MroBdUCqKW8iGW0BG3UWDQfeBYetW3k/OTQTlR5hPUBtmQhAQ+p
         Szu9aM8RMPRMSpsWjQaELwaOMWfGoP75yccdlzHVu2bMJGx9blciMy+5gWppQ3xqSafZ
         RmwG1kITkFcWYD+oESiN45ztqK4WdFoDoD9Nh9vSvZD+zD2qVIJ7B+ycuD1TbJX8/R0x
         BAT/poDWg32HtzPZFKzx3a8D5GFFKPSpu0TOmJveDv/eu+5dBo4xXNQoNHGXT9eTYLLM
         8e4g==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I was writing a set of makefiles to build some of my projects and I see 
me copying/pasting some rules that are exactly the same, only changing 
the directory where they are executed and the variables contents.

Is there a way to write this kind of rules once and let it been 
inherited from a make directory level to another...

I think on something like this,

Top Makefile
--
generic-rule:
	...
--

subdir/Makefile
--
inherit generic-rule
--

I think about writing this rules on a Common.mk makefile and -include 
this file. Does anyone tried someting like that before?
