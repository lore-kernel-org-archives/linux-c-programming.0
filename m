From: Gerald Waugh <gwaugh@frontstreetnetworks.com>
Subject: select: Interrupted system call
Date: Sat, 27 Apr 2002 11:04:07 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200204271503.g3RF3lF04667@fsn3.frontstreetnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>


I am attempting to run a program that manages several tcp/ip connections
It runs for a while then I get the subject error, also below
select: Interrupted system call
I think it may be because I am not handling any signals.
How do I fix it? Asn which signals should I be catching?
TIA

-- 
Gerald Waugh : Registered Linux user # 255245
http://www.frontstreetnetworks.com
Front Street Networks LLC - ph. 203.785.0699
229 Front Street, Ste. #C, New Haven, CT, United States of America
11:01am up 36 days, 18:28, 3 users, load average: 1.09, 1.18, 1.14
