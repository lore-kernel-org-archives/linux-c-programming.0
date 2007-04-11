From: Stephen Kratzer <kratzers@pa.net>
Subject: Re: fgets and ssh
Date: Wed, 11 Apr 2007 10:01:27 -0400
Message-ID: <200704111001.28012.kratzers@pa.net>
References: <1176293837.12452.10.camel@chimay>
Reply-To: kratzers@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1176293837.12452.10.camel@chimay>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?utf-8?q?Beno=C3=AEt_Rouits?= <brouits@free.fr>
Cc: linux-c-programming@vger.kernel.org

On Wednesday 11 April 2007 08:17, Beno=C3=AEt Rouits wrote:
> hello,
> in a minimal shell tutorial written in C, i have a read_line function
> that does:
>
> char* read_line()
> {
>     char* line=3DNULL;
>     line=3D(char*)malloc(512);
>     line=3Dfgets(line,512,stdin);
>     return line;
> }
>
> then i parse this line to build a correct "argv" to pass to execvp()
> everything works well when i use ssh interactively.
>
> The problem i encounter is when i pass a command to ssh into this she=
ll:
>
> ssh -v guest@localhost ls
> [...]
> guest@localhost's password:
> debug1: Authentication succeeded (password).
> debug1: channel 0: new [client-session]
> debug1: Entering interactive session.
> debug1: Sending environment.
> debug1: Sending env LANG =3D fr_FR.utf8
> debug1: Sending command: ls
> ( here the shell waits )
>
> the shell still waits for ls and i have to retype intaractively "ls" =
to
> get the correct result:
>
> ls
> debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
> Desktop
> Examples
> debug1: channel 0: free: client-session, nchannels 1
> debug1: Transferred: stdin 0, stdout 0, stderr 0 bytes in 61.4 second=
s
> debug1: Bytes per second: stdin 0.0, stdout 0.0, stderr 0.0
> debug1: Exit status 9
>
> any explanation would be greatly appreciated.
>
> +ben
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kerne=
l.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

When ssh is executed in the form 'ssh user@host command', the login she=
ll of=20
the user will be called like so: 'shell -c command'. That is, commands =
are=20
not fed into the shell interactively on stdin, they're provided as argu=
ments=20
following a -c option flag.
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
