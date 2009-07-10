From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: Help on pipe
Date: Fri, 10 Jul 2009 09:06:27 +0200
Message-ID: <op.uwubc1lg7p4s8u@amdc030.digital.local>
References: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed	delsp=yes"
To: Ardhan Madras <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org

On Fri, 10 Jul 2009 08:22:54 +0200, Ardhan Madras <nightdecoder@gmail.c=
om> =20
wrote:

> #include <sys/types.h>
> #include <sys/wait.h>
> #include <unistd.h>
> #include <stdio.h>
> #include <string.h>
>
> int main(void)
> {
>   pid_t pid;
>   int fds[2], ret;
>   const char *sort =3D "/usr/bin/sort";

"static const char sort[]" would be better IMO.

>   char *argv[2] =3D { "sort", NULL };

"static const char *argv[]" is definitly better here and does not produ=
ce =20
warnings.  Your code discards "const" from pointer (a string literal).

>   ret =3D pipe(fds);
>   if (ret =3D=3D -1) {
>     perror("pipe");
>     return -1;
>   }
>   pid =3D fork();
>   if (pid =3D=3D -1) {
>     perror("fork");
>     return -1;
>   }

Personally I preffer something like:

   switch (fork()) {
   case -1: /* error */  break;
   case  0: /* child */  break;
   default: /* parent */
   }

but suit yourself.

>   if (pid =3D=3D 0) {
>     int ret;

No need to define this variable here.  You already have such variable.

>
>     close(fds[1]);
>     dup2(fds[0], STDIN_FILENO);
>
>     ret =3D execve(sort, argv, NULL);
>     if (ret =3D=3D -1) {
>       perror("execve");
>     }
>     close(fds[0]);
>     _exit(0);

No need to close(), and _exit(0) should be _exit(1) (or -1 if you will)=
 =20
since the chiled finished with error.

>   }
>   else {
>     FILE *stream;
>
>     close(fds[0]);
>     stream =3D fdopen(fds[1], "w");
>     if (!stream) {
>       perror("fdopen");
>       return -1;
>     }
>     fprintf(stream, "this\n");
>     fprintf(stream, "means\n");
>     fprintf(stream, "war\n");
>     fflush(stream);

And here, replace fflush() with fclose().  It seems, data is buffered o=
n =20
kernel level, not only libc level and fflush() cannot handle that.

>     waitpid(pid, &ret, 0);
>     close(fds[1]);

No need to close.

>   }
>   return 0;
> }

--=20
Best regards,                                            _     _
  .o. | Liege of Serenly Enlightened Majesty of         o' \,=3D./ `o
  ..o | Computer Science,  Micha=C5=82 "mina86" Nazarewicz      (o o)
  ooo +-<m.nazarewicz@samsung.com>-<mina86@jabber.org>-ooO--(_)--Ooo--

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
