From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: Switching between foreground and background
Date: Tue, 23 Sep 2003 12:07:24 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <003e01c381ec$c76473a0$ed64a8c0@descartes>
References: <20030922104825.81134.qmail@web20002.mail.yahoo.com> <003501c3811f$610395a0$ed64a8c0@descartes> <3F702813.8030200@gsecone.com>
Reply-To: "John T. Williams" <jtwilliams@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rvk@gsecone.com, "John T. Williams" <jtwilliams@vt.edu>
Cc: Silambu Chelvan <silambu_mdu@yahoo.com>, linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org

I have to admit that I don't know why, but every resource I've ever read
about causing programs to gain daemon behavior has involved forking 2 times
and then starting the program code.  If anyone here does know why, I'd would
be happy to hear it.



----- Original Message ----- 
From: "Raghuveer" <rvk@gsecone.com>
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: "Silambu Chelvan" <silambu_mdu@yahoo.com>;
<linux-newbie@vger.kernel.org>
Sent: Tuesday, September 23, 2003 7:01 AM
Subject: Re: Switching between foreground and background


> John T. Williams wrote:
>
> >I think part of the problem here might be conceptual.
> >
> >If I understand what you want, you'd like, on a signal, for your program
to
> >go into the background (still running but no longer blocking the terminal
> >input/output). On another signal you would like the program to come back
to
> >the foreground.
> >
> >If this is the case, the problem you're facing is that the program being
in
> >the foreground and the background is actually part of the shell, not a
> >property of the program running.  Most Shells provide a way to switch
> >programs from the foreground to the background and back.
> >BASH for example I could type
> >
> >$>./myprogram
> >(cntr + Z) //suspends the current program and prings the prompt back
> >$>bg  (runs the program in the background)
> >
> >The only way that I know of to force a program to run in the background
in
> >the code is to make it a daemon which is done by forking twice
> >
> >int main(  ) {
> >   if(fork()==0)  {
> >            if( fork() == 0 )  {
> >                    program code starts here
> >             }
> >            exit(0);
> >    }
> >    exit(0);
> >}
> >
> >
> I don't feel it's required to fork() twice for making it a daemon, once
> is enough. Ya, but should use setpgrp() or setpid() and close stdin, out
> and err after the fork and go to infinite loop.
>
> -Raghu
>
> >
> >----- Original Message ----- 
> >From: "Silambu Chelvan" <silambu_mdu@yahoo.com>
> >To: <linux-newbie@vger.kernel.org>
> >Sent: Monday, September 22, 2003 6:48 AM
> >Subject: Switching between foreground and background
> >
> >
> >
> >
> >>Hi all,
> >>
> >>I have written some program with signal handler. Is
> >>this possible, if
> >>one of the signals registered with my program is
> >>raised, my program
> >>should goto background and should come to foreground
> >>when some other of the
> >>registered signal is raised. how to do it?
> >>
> >>Any function available to switch a process between
> >>foreground and
> >>background at runtime?
> >>
> >>with regards,
> >>M. SilambuChelvan
> >>
> >>
> >>__________________________________
> >>Do you Yahoo!?
> >>Yahoo! SiteBuilder - Free, easy-to-use web site design software
> >>http://sitebuilder.yahoo.com
> >>-
> >>To unsubscribe from this list: send the line "unsubscribe linux-newbie"
in
> >>the body of a message to majordomo@vger.kernel.org
> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>Please read the FAQ at http://www.linux-learn.org/faqs
> >>
> >>
> >
> >-
> >To unsubscribe from this list: send the line "unsubscribe linux-newbie"
in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >Please read the FAQ at http://www.linux-learn.org/faqs
> >
> >
> >
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at http://www.linux-learn.org/faqs

