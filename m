From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: How to execute a process in background by exec functions?
Date: 08 Apr 2004 09:25:05 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1081430703.29492.33.camel@Marx.fesnel.no-ip.org>
References: <407316A0.1060708@telefonica.net>
	 <002001c41d2c$18e27f80$de01a8c0@qnessmphibiki>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002001c41d2c$18e27f80$de01a8c0@qnessmphibiki>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Wen Guangcheng <wen.guangcheng@cnt.sp.qnes.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org

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
O'Reilly books "Learning the bash Shell, 2nd Edition", and "Practical C
Programming, 3rd Edition"



On Thu, 2004-04-08 at 01:41, Wen Guangcheng wrote:
> Hello All,
> I am trying to execute a process in background by exec functions.
> But it failed when I call the function of execv by
> execv("/home/wen/daemon &", NULL);
> The error is ENOENT(No such file or directory). =20
> Would anyone tell me how to do it?
> Thanks in advance.
>=20
> Best regards,
>=20
> --Wen
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
