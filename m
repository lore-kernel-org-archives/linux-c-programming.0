From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Detecting deamons running
Date: Fri, 28 Mar 2003 21:30:39 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16004.48895.735914.786641@cerise.nosuchdomain.co.uk>
References: <00b701c2f54e$4a57afb0$0b00a8c0@SPLUCIANO>
	<7disu3cm2o.fsf@cerberus.central.fluidsignal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <7disu3cm2o.fsf@cerberus.central.fluidsignal.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org


Andr=E9s Rold=E1n wrote:

> > I have a application that run like a deamon, which write in a file =
its PID,
> > that is used to stop it later by others programs. But, I ve noted t=
hat my
> > users send signal 9 to stop deamons, and my application cannot remo=
ve its
> > PID file, because it cannot handle singal 9, keeping its PID file a=
t HD
> > (FileSystem).
> >
> > Can someone sugest me a way to know the deamon's PID, without write=
 it to a
> > file ?
> > OR
> > How can I do to know if my deamon is running and get its PID ?
>=20
> $ pidof process
>=20
> will return the PID or the PIDs of the specified process. If it retur=
ns
> nothing, there is not such a process running.

pidof will return all PIDs which match a given name, which isn't
necessarily the same thing as determining the PIDs of specific
processes.

E.g. if you want to find the PID of the sendmail daemon, you have to
read /var/run/sendmail.pid; "pidof sendmail" won't make any
distinction between the daemon and other processes with the name
"sendmail" (which may not even be running the same "sendmail"
program).

BTW, root should never use "killall", for similar reasons.

The correct solution is to use a PID file. If a user issues SIGKILL,
then tough; there are limits to how far you should go toward
preventing users from shooting themselves in the foot.

Note that the same problem exists for most other inter-process
communication mechansims, such as FIFOs, Unix domain sockets or SysV
IPC entities.

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
