From: "Singh, Umesh K (MED)" <Umesh.Singh@geind.ge.com>
Subject: RE: stack trace
Date: Fri, 22 Aug 2003 09:24:41 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <DD9E117A8BE9F34FA4130376EC9C1F6A05ED111F@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

thanks all of you, i think i got fair amount of homework. will try all
the suggestions and come back to you guys very soon if i have some
doubt. what i was looking is the trace equivalent to gdb or dbx output.
yeah, i am compiling with debug info and without optimization. i think
assert(3) or abort(2) is also a nice idea which will be useful in lot of
cases but in my case i won't prefer to terminate my program in most of
the cases.

thanks,
-umesh

-----Original Message-----
From: Fekete Gabor [mailto:feketga@delfin.unideb.hu]
Sent: Thursday, August 21, 2003 11:42 AM
To: linux-c-programming
Subject: Re: stack trace




On Thu, 21 Aug 2003, Singh, Umesh K (MED) wrote:

> is it possible to get the stack trace without attaching the process to
debugger. For Ex. can i write a func let's say "print_stack_trace()" and
call it anywhere in my program to print the stack trace at that point of
time.

read this:
http://www.linuxjournal.com/article.php?sid=6391
it might help.

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
