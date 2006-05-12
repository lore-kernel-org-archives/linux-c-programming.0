From: =?iso-8859-1?Q?Jedenastik=2C_G=FCnther?= 
	<guenther.jedenastik@maxolution.at>
Subject: AW: "double free or corruption" - how to solve this?
Date: Fri, 12 May 2006 22:40:10 +0200
Message-ID: <1DC8E51669ADE94C85B69D0E5EAEB746629B8E@manchester.maxolution.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


>Hello Shriramana,


>On Fri, 12 May 2006 13:41:12 +0530 "Shriramana Sharma" <samjnaa@gmail.com> >wrote:

>> One of my programs, which was working quite well till now, suddenly
>> gives me the error:
>> 
>> *** glibc detected *** double free or corruption (top): 0x0808a338 ***
>> Aborted
>> 
>> It is a pure C program compiled with GCC 4.02 -- I do not understand
>> why it does not work suddenly. Please tell me what the above error can
>> be.

>Would be nice to run it from gdb, in order to get the backtrace when it
>crashes. This should help you understand where and why :).


>Regards,

>-- 
>wwp

I have a similar problem, but i don't know how gdb can help with this?
I tried with gdb (btw: I have one process forked (and a few threads) and I think this process creates the problem) but I only get the problem during exit handlers (e.g. SIGINT)

To get back to my question: how can I trace the problem with gdb, if I have forked processes and threads?

Cause it seems, that glibc only prints the line "*** glibc detected *** double free or corruption" and then continues
It doesn't send a SIGABORT or something else, so why should gdb "know" something was wrong? And how could I trace back (using "bt") if I have the problem, but don't know where it occures (cause glibc just prints and continues, not?)
I think the only "simple" way is using electric fence (?)

I'll try this next Monday

But some internal explanations what "*** glibc detected ***" does (not why it occures, but internally happens if it occures), if anyone knows, would be great

Thx and regards
