From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: Re: offtopic
Date: Thu, 26 Jun 2003 10:57:28 -0600 (CST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0306261056040.18286-100000@ns.isi.ulatina.ac.cr>
References: <20030625204313.GM29233@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030625204313.GM29233@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org

> > Hi, I am curious if It's possible to code in C, a small user keylloger.
> > For exmaple, a unprivileged user log on a machine and the "user kelogger"
> > start and all key are logged including those typed on getpass() functions.
> > (ej: passwd) and remote connections with telnet and ssh.
>
> No need to do programming. Simlpy strace user's shell (and any spawned
> processes) and look I/O to file descriptors 0 and 1.

I dont understand. How to "strace the user's shell"?
I would like to this without root access.
The idea is: code a program that keylog the session of oneself. "script"
unix command doesnt work with getpass() functions.

