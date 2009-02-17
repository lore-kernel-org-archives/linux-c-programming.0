From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: WaitForMultipleObjects sources for a C application
Date: Tue, 17 Feb 2009 17:48:44 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F2104324@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Dear All,

I have downloaded the source code for the WaitForMultipleObjects API to
use on Linux box from the following link. 
http://home.arcor.de/rdengler/

However, the sources are developed in the C++. I am not able to use
these sources in my C application due to classes and its definitions.
When I tried to convert the classes into an equivalent C structures I
got the following error. 

std::set<CWinEventHandle*> m_Subscriber; // Used in
WaitForMultipleObjects()

Could you please let me know how can I use CPP sources in a C
application? Is there any equivalent C code for the same
WaitForMultipleObjects?

Thanks in advance.

With Regards,
Srinivas G
