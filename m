From: "Jose Luis Alarcon Sanchez" <jlalarcon@bunniwerks.zzn.com>
Subject: Re: How to execute a process in background by exec functions?
Date: Sun, 11 Apr 2004 17:37:32 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <80BEFFCCAAE8E374782232F2462F1582@jlalarcon.bunniwerks.zzn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org
Cc: jowillia@vt.edu

---- Begin Original Message ----
running a process in the background simply means not waiting for it to
complete.  So a parent process that wanted to make a child process run
ls in the =B4background=A1 would do something like this: (again this sh=
ould
be treated as sudo code that just looks a lot like C)

_______________________CODE__________________
int
main (int argC, char** argV) {
int bg =3D 1;  // test condition for running in the background
int pid;=20
int status;

if( (pid =3D fork()) =3D=3D  0 )   {
	/* child code starts here */
	execl(=B4/bin/ls=A1, =B4/bin/ls=A1, 0 );=20

} else {
	/* this is the critical point, if you call wait, the parent 	process
stops until the child process returns, which would be fg 	behavior (at
least in a shell).  If the=20
	parent doesn't call wait (or waitpid), then both parent and 	child wil=
l
run at the same time. (i.e. The child runs in the 	background */=20
	if( !bg) { =20
		wait(&status);
	}
	/* Parent Code Starts here */
}

return 0;
}
_________________________END CODE_____________________

There are also considerations about input and output, and bringing the
process from the background to the forground, and sending it back into
the background, and so forth.  If your really interested in how this
works and how to address the more complex issues, I suggest that you
read the source code for GNU BASH, which is freely available (at this
point everyone must think I'm a spokes person for GNU)  or Read the
O'Reilly books "Learning the bash Shell, 2nd Edition", and "Practical
C Programming, 3rd Edition"
---- End Original Message ----


  Hi John.

  I am trying compile the code you paste in your message,
but i get an error with the line

execl(=B4/bin/ls=A1, =B4/bin/ls=A1, 0 );

Process_Exec.c:15:11: warning: character constant too long for its type
Process_Exec.c: In function `main':
Process_Exec.c:15: error: `bin' undeclared (first use in this function)
Process_Exec.c:15: error: (Each undeclared identifier is reported only
once
Process_Exec.c:15: error: for each function it appears in.)
Process_Exec.c:15: error: stray '\241' in program
Process_Exec.c:15: error: `ls' undeclared (first use in this function)=20

  I'm afraid that it is for the character before the '/',
i can't get it with any key. But i am not sure, i am a very=20
newbie C programmer.

  I hope you can help me.

  Thanks, very much, in advance.

  Regards.

  Jose.


http://www.lordofunix.org

=46reeBSD RELEASE 5.2.
Mandrake Linux 9.2 Kernel 2.6.2 XFS.
Registered BSD User 51101.
Registered Linux User #213309.
Memories..... You are talking about memories.=20
Rick Deckard. Blade Runner.


Get your Free E-mail at http://bunniwerks.zzn.com
___________________________________________________________
Get your own Web-based E-mail Service at http://www.zzn.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
