From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: fork: why to copy process to run new program?
Date: Mon, 4 Jul 2005 15:51:08 +0100
Message-ID: <17097.19676.624647.951351@gargle.gargle.HOWL>
References: <daa27s$1kr$1@sea.gmane.org>
	<17096.39828.119917.882703@gargle.gargle.HOWL>
	<dab7ij$fs7$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dab7ij$fs7$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom <tom.lobato@terra.com.br>
Cc: linux-c-programming@vger.kernel.org


Tom wrote:

> >>         Why, when a program needs to open another, have fork to copy all
> >>         the
> >> initial program just for 'exec' the another? Could'nt initial program
> >> just to "tell" the kernel for open the second program?
> > 
> > I'm not sure what you're getting at.
> > 
> > If you're asking why fork() and exec() can't be combined into a single
> > spawn() primitive, the answer is twofold:
> 
> sorry by not clear explanation of my question in prev article.
> but I think your answer help to kill my doubt (I say "help" cause I have to
> understand more the whole thing before, maybe reading some docs).
> 
> but my question could be done so: couldn't processA (example.. bash), when
> wants to run processB (example.. ls), just "tell" the kernel (using some
> system call, sure) "hey, please, open /bin/ls. Oh, do you need some env
> vars? ok, here is the list, PWD=/home/tom, VAR2=VALUE2, etc.. Oh do you
> want to know about file descriptos? ok, here is...".

Well, that's essentially what exec() does, but exec() runs the
specified program *in* place of whichever program called exec().

If you want to run a specified program without terminating the current
program, you have to fork() a new process and have the new process run
the program.

-- 
Glynn Clements <glynn@gclements.plus.com>
