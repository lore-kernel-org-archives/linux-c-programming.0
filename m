From: "Luciano Moreira - igLnx" <lucianolnx@ig.com.br>
Subject: Re: Detecting deamons running
Date: Sat, 29 Mar 2003 13:51:52 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001a01c2f613$80b93c70$2101a8c0@xlucm>
References: <00b701c2f54e$4a57afb0$0b00a8c0@SPLUCIANO><7disu3cm2o.fsf@cerberus.central.fluidsignal.com><16004.48895.735914.786641@cerise.nosuchdomain.co.uk><026301c2f583$6d71a340$0b00a8c0@SPLUCIANO> <16004.60607.261721.211481@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

Our users are issuing SIGKILL to deamons and turning power off without
shutdown, and their "boss" are requesting us to add more integrity to the
system.

Thinking about your questions and considering that kill(pid, 0), will
returns ok, for any runnig process, including process belonging by others
users  (I cant code 'n test it now - I dont know). I think that will be
necessary to send a "User Signal" to test a valid PID, like as a "private"
message, thus, if the proccess was my deamon, kill() will returns
successful, otherwise, the PID can be another PID beyond my "User Table
Process".

Well, above was only a proposal to add more integrity to the system, but I
know that it doesnt is perfect, without sureness that never will exists
another deamon that handles the "User Signal" running under this user.

I HAVE TO SAY: Our application is multiplataform, it needs to run over AIX,
Linux, SCOUnix, Solaris (and Windows with a lot of #ifdefs) - Currently it's
running well over all these plataforms.

Thank you very much,

Luciano



----- Original Message -----
From: "Glynn Clements" <glynn.clements@virgin.net>
To: "Luciano Moreira - igLnx" <lucianolnx@ig.com.br>
Cc: <linux-c-programming@vger.kernel.org>
Sent: Friday, March 28, 2003 9:45 PM
Subject: Re: Detecting deamons running


>
> Luciano Moreira - igLnx wrote:
>
> > EXPLAINING BETTER:
> >
> > Today we'are writing the PID to a file, and when it is used (later), is
> > necessary to test de PID with "kill(pid, 0);", but still existing a
problem:
> >
> > When the deamon is droped down with SIGKILL, and the others programs or
my
> > users stay a long time without consulting the deamon's PID, the OS could
> > raise a new process with the same PID (currently free), that is saved in
the
> > deamon's PID file.
> >
> > How can this problem be fixed ?  (how is it fixed today ?)
>
> It can't be fixed, and all existing daemons have the same problem.
>
> OTOH, most daemons run under system accounts, so normal users can't
> send signals to them, and anyone with root privilege presumably has
> enough sense not to use SIGKILL.
>
> > (Somebody suggest us to use shared memory (or SOCKET) mated with another
> > deamon, that whould be the "PID Server", instead using PID file - We
think
> > that it's bad and so complex, and still can give us a "infinite problem"
if
> > we need to control the new mated deamon)
>
> What exactly is the .pid file meant to achieve? Is it just a
> convenience, or are there system integrity considerations?
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

