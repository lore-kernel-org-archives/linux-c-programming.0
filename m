From: "Luciano Moreira - igLnx" <lucianolnx@ig.com.br>
Subject: Re: Detecting deamons running
Date: Fri, 28 Mar 2003 20:40:34 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <026301c2f583$6d71a340$0b00a8c0@SPLUCIANO>
References: <00b701c2f54e$4a57afb0$0b00a8c0@SPLUCIANO><7disu3cm2o.fsf@cerberus.central.fluidsignal.com> <16004.48895.735914.786641@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

EXPLAINING BETTER:

Today we'are writing the PID to a file, and when it is used (later), is
necessary to test de PID with "kill(pid, 0);", but still existing a pro=
blem:

When the deamon is droped down with SIGKILL, and the others programs or=
 my
users stay a long time without consulting the deamon's PID, the OS coul=
d
raise a new process with the same PID (currently free), that is saved i=
n the
deamon's PID file.

How can this problem be fixed ?  (how is it fixed today ?)

(Somebody suggest us to use shared memory (or SOCKET) mated with anothe=
r
deamon, that whould be the "PID Server", instead using PID file - We th=
ink
that it's bad and so complex, and still can give us a "infinite problem=
" if
we need to control the new mated deamon)

Luciano Moreira

----- Original Message -----
=46rom: "Glynn Clements" <glynn.clements@virgin.net>
To: <linux-c-programming@vger.kernel.org>
Sent: Friday, March 28, 2003 6:30 PM
Subject: Re: Detecting deamons running


>
> Andr=E9s Rold=E1n wrote:
>
> > > I have a application that run like a deamon, which write in a fil=
e its
PID,
> > > that is used to stop it later by others programs. But, I ve noted=
 that
my
> > > users send signal 9 to stop deamons, and my application cannot re=
move
its
> > > PID file, because it cannot handle singal 9, keeping its PID file=
 at
HD
> > > (FileSystem).
> > >
> > > Can someone sugest me a way to know the deamon's PID, without wri=
te it
to a
> > > file ?
> > > OR
> > > How can I do to know if my deamon is running and get its PID ?
> >
> > $ pidof process
> >
> > will return the PID or the PIDs of the specified process. If it ret=
urns
> > nothing, there is not such a process running.
>
> pidof will return all PIDs which match a given name, which isn't
> necessarily the same thing as determining the PIDs of specific
> processes.
>
> E.g. if you want to find the PID of the sendmail daemon, you have to
> read /var/run/sendmail.pid; "pidof sendmail" won't make any
> distinction between the daemon and other processes with the name
> "sendmail" (which may not even be running the same "sendmail"
> program).
>
> BTW, root should never use "killall", for similar reasons.
>
> The correct solution is to use a PID file. If a user issues SIGKILL,
> then tough; there are limits to how far you should go toward
> preventing users from shooting themselves in the foot.
>
> Note that the same problem exists for most other inter-process
> communication mechansims, such as FIFOs, Unix domain sockets or SysV
> IPC entities.
>
> --
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
