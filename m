From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: Monitoring a program
Date: Mon, 1 Mar 2004 17:50:52 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <007d01c3ffdf$a62aab70$ed64a8c0@descartes>
References: <4FEDBC17.643129B5.0000FADF@aol.com> <002f01c3ffd5$8379cb60$ed64a8c0@descartes>
Reply-To: "John T. Williams" <jtwilliams@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John T. Williams" <jtwilliams@vt.edu>, Llfrg@aol.com, linux-c-programming@vger.kernel.org



Have you considered using the 'time' program?

You could do something like (say the target program is ls again)


time ls 2>> statfile

the only problem is that you wouldn't see anything sent to stderr while the
program was executing
if you want your users to be unaware of this you could do something like

mv /bin/ls /bin/ls.bk

then make the file

/bin/ls
----------------------------------------
#!/bin/bash
time ls 2>> statfile
----------------end file---------------
----- Original Message ----- 
From: "John T. Williams" <jowillia@vt.edu>
To: <Llfrg@aol.com>; <linux-c-programming@vger.kernel.org>
Sent: Monday, March 01, 2004 4:38 PM
Subject: Re: Monitoring a program


> Let me see if I understand what you are trying to do.  Lets pretend the
> target program is ls.
> Whenever ls is run by any user you would like you daemon to store
> statistical information about the execution of ls.
>
> You might have to get this information from the kernels process table.
> While executing the information you want is available in the procfs,
however
> when the process completes the information disappears.  It has been awhile
> since I took my OS class, so I'm not sure if the information is still
> available in the kernel's data structures or not.  I believe it would be
> until another process with the same pid runs, but there is a good chance
> that I'm wrong.
>
> Depending on what you are trying to accomplish there may be better/easier
> ways to accomplish your goal.
>
> --
> John
>
> ----- Original Message ----- 
> From: <Llfrg@aol.com>
> To: <linux-c-programming@vger.kernel.org>
> Sent: Monday, March 01, 2004 1:22 PM
> Subject: Monitoring a program
>
>
> > Hi,
> >
> > I would like to monitor a program execution. I intend to have a program
> (or daemon) that, whenever the target program (whose name is to be passed
as
> a paramenter) starts (i.e when ps -C progname returns any process), gets
> statistics like cpu usage and store them on a file, finishing when the
> target program finishes. What would be an efficient way to do that?
> >
> > Thanks,
> > Leonardo.
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

