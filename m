From: "John T. Williams" <jtwilliams@vt.edu>
Subject: Re: pthread library
Date: Thu, 10 Mar 2005 19:40:44 -0500
Message-ID: <000d01c525d2$f5ffa960$660aa8c0@descartes2>
References: <d0qi7v$e9a$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

nope.  ThreadB will continue to run even if ThreadA is waiting for a system
call to return.  This is part of the purpose of threads.

----- Original Message ----- 
From: "Tyler" <tyler@agat.net>
To: <linux-c-programming@vger.kernel.org>
Sent: Thursday, March 10, 2005 5:38 PM
Subject: pthread library


> Hi,
>
> I have a little question about the pthread library under linux.
> For example, we have a thread A and a thread B.
> If A do a read (which is a blocking operation), all the process will be
> blocked so thread B will be blocked too.
> That's true ?:)
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


