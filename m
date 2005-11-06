From: Markus Rechberger <mrechberger@gmail.com>
Subject: Re: lseek question
Date: Sun, 6 Nov 2005 03:04:39 +0100
Message-ID: <d9def9db0511051804m1f443b00x89a655efc503f0b8@mail.gmail.com>
References: <436D5913.504@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <436D5913.504@crearium.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fabio <fabio@crearium.com>
Cc: linux-c-programming@vger.kernel.org

Hi Fabio,

On 11/6/05, fabio <fabio@crearium.com> wrote:
> Hello people,
>
> What's wrong with this code:
>
> -bash-3.00$ cat lseek.c ; wc -l datafile ; gcc lseek.c ; ./a.out 1000
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> main(int argc, char *argv[])
> {
>         FILE *fp;
>         int offset=atoi(argv[1]);
>         fp=fopen("datafile","r");
>         lseek(fp,offset,SEEK_SET);

regarding man lseek
off_t lseek(int filedes, off_t offset, int whence);
it requires an integer filehandle, FILE *fp is not an integer!

you're probably looking for fseek

       int fseek( FILE *stream, long offset, int whence);
       long ftell( FILE *stream);
       void rewind( FILE *stream);
       int fgetpos( FILE *stream, fpos_t *pos);
       int fsetpos( FILE *stream, fpos_t *pos);

hope this helps,
Markus
