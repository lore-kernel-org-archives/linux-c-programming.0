From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: File I/O wrapper?
Date: Sun, 30 Jan 2005 11:45:59 +0000
Message-ID: <16892.51447.238545.617773@gargle.gargle.HOWL>
References: <1450f66c05012411557e328fa1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1450f66c05012411557e328fa1@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Gary <funkychunkymunky@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Dan Gary wrote:

> I'm working on a new logging system and came across the idea of using
> a program through a symbolic link instead of a file for a log.
> 
> Basically I would write a program that logs to a variety of
> configurable sources, and would act as a file when it comes to I/O,
> doing whatever processing I want in between the "actual" file and the
> calling program.
> 
> My only hang up so far is actually getting the program to emulate file
> I/O without writing to the program file itself.
> 
> So in simple terms, I want a program to act like a file, and I'm stuck on How.
> 
> A FIFO isn't quite what I need, but close, although I need a single
> point of reference to handle all I/O, exactly like a file.
> 
> And I can't/don't want to rewrite every potential calling program to
> work with this.
> 
> I've been thinking I'm going to have to do a kernel module, but I was
> hoping someone might know a way I can implement this w/o doing a kmod.

Implement a networked-filesystem (e.g. NFS, SMB) server which handles
requests by some means other than directly modifying an actual
filesystem. You can then mount the filesystem using the kernel's
existing NFS/SMB client functionality.

This is the only possible approach that doesn't involve either
extending the kernel or modifying client processes.

OTOH, you can modify client *processes* without actually modifying
client *programs* by preloading a shared library which intercepts all
relevant library functions.

-- 
Glynn Clements <glynn@gclements.plus.com>
