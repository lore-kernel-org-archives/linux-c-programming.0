From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Interprocess communication through stdin
Date: Wed, 21 May 2003 18:43:06 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16075.47786.455440.504984@cerise.nosuchdomain.co.uk>
References: <3EAD78F1.9050408@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3ECB95CF.3010508@fi.uba.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Cc: linux-c-programming@vger.kernel.org


Dar=EDo Mariani wrote:

>    I'm implementing  a program that spawns a child process. I was
> wondering if instead of creating a pipe for interprocess communicatio=
n
> is there any way to send data to the child by its stdin. The problem =
is
> that this child process is a program that accepts input from the stdi=
n
> and I do not want modify it or have a named pipe redirected to its st=
din.

Connect an unnamed pipe to the child's stdin:

	int fds[2];
	pid_t pid;

	pipe(fds);
	pid =3D fork();
	if (pid > 0)
	{
		/* parent */
		close(fds[0]);
	}
	else
	{
		/* child */
		close(fds[1]);
		dup2(fds[0], STDIN_FILENO);
		close(fds[0]);
		execl(prog, arg1, arg2, NULL);
	}

	/* write() to fds[1] to send data to child */

[Error checking omitted for brevity.]

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
