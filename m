From: "Matthew Studley" <matthew.studley@uwe.ac.uk>
Subject: Re: gcc : cpp Memory Exhausted
Date: Wed, 24 Sep 2003 16:12:54 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <010701c382ae$5490ec10$caba0ba4@uwe.ac.uk>
References: <20030922104825.81134.qmail@web20002.mail.yahoo.com> <003501c3811f$610395a0$ed64a8c0@descartes> <3F702813.8030200@gsecone.com> <003e01c381ec$c76473a0$ed64a8c0@descartes> <00fb01c382a9$3178a560$caba0ba4@uwe.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I have 'solved' the problem; I was just compiling one of the source files, I
deleted all compiled output and recompiled all the source.  No problem!

This is bizarre!

I have no idea what was causing this though, and would really appreciate any
ideas!

regards

Matt

----- Original Message -----
From: Matthew Studley <matthew.studley@uwe.ac.uk>
To: <linux-c-programming@vger.kernel.org>
Sent: Wednesday, September 24, 2003 3:36 PM
Subject: gcc : cpp Memory Exhausted


> Hi - I wonder whether anybody can help me?
>
> I'm compiling some code on a robot (Slack 7.0, P 1).  I've compiled it
many
> times before on this platform with no problem.  Now when I make I get the
> error:
>
> cpp: Memory exhausted
>
> ...and the process fails
> Anybody got any ideas?
>
> regards
>
> Matt
>
>  ==============================================
> Matthew Studley
>
> The Intelligent Computer Systems Centre
> Faculty of Computing, Engineering
>         and Mathematical Sciences
> Coldharbour Lane, Frenchay
> BS16 1QY
> United Kingdom
>
> tel : 07092 306548
> fax : 07092 306548
>
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> This incoming email to UWE has been independently scanned for viruses and
any virus detected has been removed using McAfee anti-virus software
>
>
>

