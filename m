From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Where am I using so much memory?
Date: Sun, 22 Jul 2007 18:02:02 +0100
Message-ID: <18083.36234.878243.211828@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0707221046430.18612@praktifix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0707221046430.18612@praktifix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


Holger Kiehl wrote:

> I am trying to find out why one of my process (written in C) is suddenly
> using so much memory. Under normal conditions VSZ is 5132 and RSS is 2020.
> Now after running a view days VSZ is 280896 and RSS is 13700. And it stays
> at that level, so I assume it must have been in some code pass that is
> hardly used. The program is large so I am looking for a way to locate
> the variable that uses the memory with the help of gdb. The process
> is compiled with debug information (-ggdb3).

> Is there a way that I can find with the help of gdb the variable name that
> had or still has this 270MB allocated?
> 
> Or is there some other way to find at which place in the code I am using
> so much memory?

Try mtrace():

 -- Function: void mtrace (void)
     When the `mtrace' function is called it looks for an environment
     variable named `MALLOC_TRACE'.  This variable is supposed to
     contain a valid file name.  The user must have write access.  If
     the file already exists it is truncated.  If the environment
     variable is not set or it does not name a valid file which can be
     opened for writing nothing is done.  The behavior of `malloc' etc.
     is not changed.  For obvious reasons this also happens if the
     application is installed with the SUID or SGID bit set.

     If the named file is successfully opened, `mtrace' installs special
     handlers for the functions `malloc', `realloc', and `free' (*note
     Hooks for Malloc::).  From then on, all uses of these functions
     are traced and protocolled into the file.  There is now of course
     a speed penalty for all calls to the traced functions so tracing
     should not be enabled during normal use.

     This function is a GNU extension and generally not available on
     other systems.  The prototype can be found in `mcheck.h'.

-- 
Glynn Clements <glynn@gclements.plus.com>
