From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Capturing output of a process.
Date: Fri, 19 Dec 2003 08:59:51 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16354.48647.177896.19382@cerise.nosuchdomain.co.uk>
References: <DD9E117A8BE9F34FA4130376EC9C1F6A08D3EE71@BANMLVEM01.e2k.ad.ge.com>
	<16354.21736.871304.763744@cerise.nosuchdomain.co.uk>
	<20031219110502.B340@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031219110502.B340@Imrashi.net.bd>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Progga <abulfazl@juniv.edu>
Cc: linux-c-programming@vger.kernel.org


Progga wrote:

> > Most practical solutions involve allocating a pseudo-tty *before*
> > starting the process whose output is to be logged.
> 
>  If I want to write something LIKE an SSL server, should I follow this same
> technique to capture the output of a child process ?

If you want to provide anything resembling a login session, you need
to use a pseudo-tty. I.e. any situation where you need the facilities
of a tty (line discipline, process groups, job control etc), and can't
make do with just pipes or a socket.

This includes remote logins (ssh, telnet, rlogin etc), terminal
emulators (xterm, rxvt, screen etc), session capture (script etc).

All of these programs use the same basic mechanism: allocate a
pseudo-tty, fork() a child process with stdin/stdout/stderr connected
to the slave, while the program itself (sshd, xterm etc) reads/writes
the master.

Pseudo terminals get their own chapter in Stevens[1] (chapter 19),
although almost everything which applies to "real" terminals (chapters
9 (Process Relationships) and 11 (Terminal I/O)) also applies to
pseudo-terminals.

[1] Advanced Programming in the Unix(R) Environment
    W Richard Stevens
    Addison-Wesley

-- 
Glynn Clements <glynn.clements@virgin.net>
