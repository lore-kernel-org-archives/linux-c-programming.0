From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: How to execute a process in background by exec functions?
Date: 11 Apr 2004 13:05:00 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1081703027.19558.5.camel@Marx.fesnel.no-ip.org>
References: <80BEFFCCAAE8E374782232F2462F1582@jlalarcon.bunniwerks.zzn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <80BEFFCCAAE8E374782232F2462F1582@jlalarcon.bunniwerks.zzn.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jose Luis Alarcon Sanchez <jlalarcon@bunniwerks.zzn.com>
Cc: linux-c-programming@vger.kernel.org

The single quotes need to be double quotes=20
so the call should look like=20

execl("/bin/ls", "ls", 0); =20





On Sun, 2004-04-11 at 13:37, Jose Luis Alarcon Sanchez wrote:
> ---- Begin Original Message ----
> running a process in the background simply means not waiting for it t=
o
> complete.  So a parent process that wanted to make a child process ru=
n
> ls in the =B4background=A1 would do something like this: (again this =
should
> be treated as sudo code that just looks a lot like C)
>=20
> _______________________CODE__________________
> int
> main (int argC, char** argV) {
> int bg =3D 1;  // test condition for running in the background
> int pid;=20
> int status;
>=20
> if( (pid =3D fork()) =3D=3D  0 )   {
> 	/* child code starts here */
> 	execl(=B4/bin/ls=A1, =B4/bin/ls=A1, 0 );=20
>=20
> } else {
> 	/* this is the critical point, if you call wait, the parent 	process
> stops until the child process returns, which would be fg 	behavior (a=
t
> least in a shell).  If the=20
> 	parent doesn't call wait (or waitpid), then both parent and 	child w=
ill
> run at the same time. (i.e. The child runs in the 	background */=20
> 	if( !bg) { =20
> 		wait(&status);
> 	}
> 	/* Parent Code Starts here */
> }
>=20
> return 0;
> }
> _________________________END CODE_____________________
>=20
> There are also considerations about input and output, and bringing th=
e
> process from the background to the forground, and sending it back int=
o
> the background, and so forth.  If your really interested in how this
> works and how to address the more complex issues, I suggest that you
> read the source code for GNU BASH, which is freely available (at this
> point everyone must think I'm a spokes person for GNU)  or Read the
> O'Reilly books "Learning the bash Shell, 2nd Edition", and "Practical
> C Programming, 3rd Edition"
> ---- End Original Message ----
>=20
>=20
>   Hi John.
>=20
>   I am trying compile the code you paste in your message,
> but i get an error with the line
>=20
> execl(=B4/bin/ls=A1, =B4/bin/ls=A1, 0 );
>=20
> Process_Exec.c:15:11: warning: character constant too long for its ty=
pe
> Process_Exec.c: In function `main':
> Process_Exec.c:15: error: `bin' undeclared (first use in this functio=
n)
> Process_Exec.c:15: error: (Each undeclared identifier is reported onl=
y
> once
> Process_Exec.c:15: error: for each function it appears in.)
> Process_Exec.c:15: error: stray '\241' in program
> Process_Exec.c:15: error: `ls' undeclared (first use in this function=
)=20
>=20
>   I'm afraid that it is for the character before the '/',
> i can't get it with any key. But i am not sure, i am a very=20
> newbie C programmer.
>=20
>   I hope you can help me.
>=20
>   Thanks, very much, in advance.
>=20
>   Regards.
>=20
>   Jose.
>=20
>=20
> http://www.lordofunix.org
>=20
> FreeBSD RELEASE 5.2.
> Mandrake Linux 9.2 Kernel 2.6.2 XFS.
> Registered BSD User 51101.
> Registered Linux User #213309.
> Memories..... You are talking about memories.=20
> Rick Deckard. Blade Runner.
>=20
>=20
> Get your Free E-mail at http://bunniwerks.zzn.com
> ___________________________________________________________
> Get your own Web-based E-mail Service at http://www.zzn.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
