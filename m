From: Gerald Waugh <gwaugh@frontstreetnetworks.com>
Subject: child processes
Date: Mon, 22 Apr 2002 09:39:01 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <02042209461600.15975@linux1.fastinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I am not doing a good job of explaining my requirements, but I am looking for
ideas...
 I have an assignment to do an applicaiton that must communicate on
three different TCP ports...
I was wondering if I could run a daemon that would create three child
processes, one for each of the tcp ports?
Then have the daemon run any time there was communications activity on any of
the ports
The daemon must translate the data coming in any one of the ports to a protocol
acceptable to the port the data is to be sent to.
Any ideas?.

 --

Gerald Waugh
http://www.frontstreetnetworks.com
Front Street Networks LLC - 203-785-0699
229 Front Street, Ste. #C, New Haven CT, 06513-3203
