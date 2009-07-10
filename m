From: Ardhan Madras <nightdecoder@gmail.com>
Subject: Re: Help on pipe
Date: Fri, 10 Jul 2009 14:34:30 +0700
Message-ID: <34e1241d0907100034t22683272y198d2616bc058ebe@mail.gmail.com>
References: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
	 <op.uwubc1lg7p4s8u@amdc030.digital.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=8CpsghToWdgrgTB5HGVZufhAWPQdA6sk5z/+Hr2e/y8=;
        b=ZProOA3RFbbLlsQ6T6NWKOv3ZxwiEIGwSVUYSVG2364RT4t9m9Tn0R/GUsE/YURb6K
         /jv+Cqd/qTONvf9p065C0VlxQyKVy06igPwRKTHHh8KTMa/JDsnXHhfiH4GOjj14lXM/
         ZpuwKjzgcB3WESQ+9kv10iO0YtWGULhLyCdXA=
In-Reply-To: <op.uwubc1lg7p4s8u@amdc030.digital.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-2?Q?Micha=B3_Nazarewicz?= <m.nazarewicz@samsung.com>

My demo can run. i use -Wall flag, the "const char *argv[2] =3D {
"sort", NULL }" as you said warned with:

pipe.c:35: warning: passing argument 2 of 'execve' from incompatible
pointer type.

but it's perfect for  "char * const argv[2] =3D { "sort", NULL }"

and i define "int ret" for both process, but i undestand forking
mechanism on GNU/Linux.

sorry i don't write the code cleanly.. My point is only to make the
"sort" working, im now understand that "sort" will always wait for
input until it's end (peer closed the input).

Thank you very much.



2009/7/10 Micha=B3 Nazarewicz <m.nazarewicz@samsung.com>:
> On Fri, 10 Jul 2009 08:22:54 +0200, Ardhan Madras <nightdecoder@gmail=
=2Ecom>
> wrote:
>
>> #include <sys/types.h>
>> #include <sys/wait.h>
>> #include <unistd.h>
>> #include <stdio.h>
>> #include <string.h>
>>
>> int main(void)
>> {
>>  pid_t pid;
>>  int fds[2], ret;
>>  const char *sort =3D "/usr/bin/sort";
>
> "static const char sort[]" would be better IMO.
>
>>  char *argv[2] =3D { "sort", NULL };
>
> "static const char *argv[]" is definitly better here and does not pro=
duce
> warnings.  Your code discards "const" from pointer (a string literal)=
=2E
>
>>  ret =3D pipe(fds);
>>  if (ret =3D=3D -1) {
>>    perror("pipe");
>>    return -1;
>>  }
>>  pid =3D fork();
>>  if (pid =3D=3D -1) {
>>    perror("fork");
>>    return -1;
>>  }
>
> Personally I preffer something like:
>
>  switch (fork()) {
>  case -1: /* error */  break;
>  case  0: /* child */  break;
>  default: /* parent */
>  }
>
> but suit yourself.
>
>>  if (pid =3D=3D 0) {
>>    int ret;
>
> No need to define this variable here.  You already have such variable=
=2E
>
>>
>>    close(fds[1]);
>>    dup2(fds[0], STDIN_FILENO);
>>
>>    ret =3D execve(sort, argv, NULL);
>>    if (ret =3D=3D -1) {
>>      perror("execve");
>>    }
>>    close(fds[0]);
>>    _exit(0);
>
> No need to close(), and _exit(0) should be _exit(1) (or -1 if you wil=
l)
> since the chiled finished with error.
>
>>  }
>>  else {
>>    FILE *stream;
>>
>>    close(fds[0]);
>>    stream =3D fdopen(fds[1], "w");
>>    if (!stream) {
>>      perror("fdopen");
>>      return -1;
>>    }
>>    fprintf(stream, "this\n");
>>    fprintf(stream, "means\n");
>>    fprintf(stream, "war\n");
>>    fflush(stream);
>
> And here, replace fflush() with fclose().  It seems, data is buffered=
 on
> kernel level, not only libc level and fflush() cannot handle that.
>
>>    waitpid(pid, &ret, 0);
>>    close(fds[1]);
>
> No need to close.
>
>>  }
>>  return 0;
>> }
>
> --
> Best regards,                                            _     _
>  .o. | Liege of Serenly Enlightened Majesty of         o' \,=3D./ `o
>  ..o | Computer Science,  Micha=B3 "mina86" Nazarewicz      (o o)
>  ooo +-<m.nazarewicz@samsung.com>-<mina86@jabber.org>-ooO--(_)--Ooo--
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
