From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Misc C question
Date: Fri, 21 Jun 2002 00:24:03 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <aetruc$5h8$2@main.gmane.org>
References: <15633.55133.760880.963357@cerise.nosuchdomain.co.uk>
	<Pine.GSO.4.33.0206201540260.13436-100000@servidor.unam.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.33.0206201540260.13436-100000@servidor.unam.mx>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: GOMEZ NOGUERA DAVIDEDUARDO <davidgn@servidor.unam.mx>
Cc: linux-c-programming@vger.kernel.org


GOMEZ NOGUERA DAVIDEDUARDO wrote:

> I read a while ago of some security issues on doing checks on files before
> opening, wich is harmfull if the program is suid.
> 
> But i dont remember what to do about it.
> can someone refresh it to me?

I presume that you are referring to race conditions, which are a
consequence of point 3 of my previous message:

> 3. Functions which return information about the filesystem (e.g. 
> stat/lstat) return information about the past. Just because the file
> existed (or did not exist) at the time of the check, there's no
> guarantee that the file still exists (or doesn't exist).

A race condition is a situation where the program's behaviour depends
upon the timing of certain events.

An example: suppose that a program wants to traverse a directory tree
(in the sense of the "find" command, "rm -r", etc). When traversing a
directory tree, you need to ignore symbolic links.

A simple approach might look something like this:

	struct stat st;
	...
	if (lstat(filename, &st) < 0)
		error();

	if (S_ISDIR(st.st_mode))
	{
		chdir(filename);
		...
	}

The problem with this is that the directory could be renamed and
replaced with a symbolic link between the call to lstat() and the call
to chdir(), causing the program to chdir() to wherever the symlink
points.

Note that an attacker (someone who is trying to cause a process to
malfunction) may be able to force the lstat and/or chdir calls to take
a long time by using a combination of deeply nested directories,
directories containing a large number of entries, and long "chains" of
symbolic links. So, exploiting this type of race condition isn't as
difficult as it may seem.

One solution is to perform lstat(".", ...) after the chdir, to check
that you changed to the correct directory. This is likely to be safe,
as most systems won't let you rename "." or "..".

> is there anyway you can lock a file access and tell the kernel?

Unless the OS supports mandatory locking (which is rare), locking a
file with flock/lockf/fcntl don't automatically prevent other programs
from accessing the file; they only prevent conflicting locks from
being obtained.

Similarly, lock files only affect programs which check for the
existence of lock files.

> and what would happen if the program crashes without unlocking the
> file?

Kernel locks are released automatically when the program terminates.

This is the main reason for using kernel locks instead of lock files.
The main reasons for using lock files are:

1. They work for device files (/dev/*), and
2. Older NFS implementations don't support kernel locks.

-- 
Glynn Clements <glynn.clements@virgin.net>
