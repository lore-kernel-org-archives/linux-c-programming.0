From: Jorge Opaso Pazos <jopaso@trofeospazos.com>
Subject: Re: Question!
Date: Wed, 03 Sep 2003 17:09:23 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F565883.6040901@trofeospazos.com>
References: <000601c37247$f40f6540$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000601c37247$f40f6540$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Mariano Moreyra wrote:
> Hi!!
> First...I'd like to know if there is any kind of digest on this list =
to see
> old submited messages.
>=20
> Now...I have a little problem.
> I have a process that is listening for incoming connections on a sock=
et.
> That process waits for a command and then
> forks a child to run a bash script.
> The problems is:
> 	- When the bash script runs the safe_mysql script to run MySql engin=
e, it's
> like the child process never ends.
> 	  And because of that, the parent can't close the connection with th=
e
> client socket.
> 	- But if the bash script doesn't run the safe_mysql script...the chi=
ld
> process dies successfully and everything end
> 	  Ok
>=20
> Sorry about my english, but I hope that I made my self clear....
> Bye!
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

env=EDame el script.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
