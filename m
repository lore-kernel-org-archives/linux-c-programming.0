From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Detecting deamons running
Date: Sat, 29 Mar 2003 00:45:51 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16004.60607.261721.211481@cerise.nosuchdomain.co.uk>
References: <00b701c2f54e$4a57afb0$0b00a8c0@SPLUCIANO>
	<7disu3cm2o.fsf@cerberus.central.fluidsignal.com>
	<16004.48895.735914.786641@cerise.nosuchdomain.co.uk>
	<026301c2f583$6d71a340$0b00a8c0@SPLUCIANO>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <026301c2f583$6d71a340$0b00a8c0@SPLUCIANO>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org


Luciano Moreira - igLnx wrote:

> EXPLAINING BETTER:
> 
> Today we'are writing the PID to a file, and when it is used (later), is
> necessary to test de PID with "kill(pid, 0);", but still existing a problem:
> 
> When the deamon is droped down with SIGKILL, and the others programs or my
> users stay a long time without consulting the deamon's PID, the OS could
> raise a new process with the same PID (currently free), that is saved in the
> deamon's PID file.
> 
> How can this problem be fixed ?  (how is it fixed today ?)

It can't be fixed, and all existing daemons have the same problem. 

OTOH, most daemons run under system accounts, so normal users can't
send signals to them, and anyone with root privilege presumably has
enough sense not to use SIGKILL.

> (Somebody suggest us to use shared memory (or SOCKET) mated with another
> deamon, that whould be the "PID Server", instead using PID file - We think
> that it's bad and so complex, and still can give us a "infinite problem" if
> we need to control the new mated deamon)

What exactly is the .pid file meant to achieve? Is it just a
convenience, or are there system integrity considerations?

-- 
Glynn Clements <glynn.clements@virgin.net>
