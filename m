From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Creating an NSS module
Date: Tue, 29 Apr 2003 00:09:33 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16045.46253.955065.525478@cerise.nosuchdomain.co.uk>
References: <3EAD78F1.9050408@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3EAD78F1.9050408@fi.uba.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Cc: linux-c-programming@vger.kernel.org


Dar=EDo Mariani wrote:

>   I'm creating an NSS module for the passwd and group databases. I=20
> implemented the following functions:

[snip]

> The libc functions getgrent(), getgrnam(), getgrgid() and the finger=20
> command work, but the groups command doesn't and also the chgrp doesn=
't=20
> work for an user other than root. Any ideas on what happens? Am I=20
> missing some function?

I suspect that the problem is that you haven't logged in using the new
groups.

The "id" command (used by the "groups" script) lists the supplementary
GIDs of the current process. Similarly, the chgrp program uses the
chown() system call to change a file's group; this insists that the
new group is among the process' supplementary GIDs.

The supplementary GID's are set upon login (usually via the
initgroups() libc function), and are inherited by child processes. The
initgroups() function uses the setgroups() system call to set the
process' supplementary GIDs as defined in the groups database. The
setgroups() system call requires root privilege, so ordinary programs
can't use it.

Changing the groups database (whether you change the data directly or,
as in this case, change the mechanism by which it is obtained) will
not affect the supplementary GIDs of any existing process. You will
have to "log in" (whether via login, telnetd/sshd, xdm etc) in order
for any changes in the groups database to take effect for
authentication purposes.

OTOH, programs which use the groups database directly (i.e. the
getgr*() functions) will reflect any changes immediately.

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
