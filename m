From: Eric Bambach <bot403@cisu.net>
Subject: Re: Division in loop
Date: Tue, 8 Sep 2009 21:52:50 -0500
Message-ID: <200909082152.50247.eric@cisu.net>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com> <34e1241d0909081937y5ecbd0davf7edbba9d9b201a0@mail.gmail.com> <34e1241d0909081939x2d20ab45t57fe3f760ae447d0@mail.gmail.com>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <34e1241d0909081939x2d20ab45t57fe3f760ae447d0@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tuesday 08 September 2009 09:39:40 pm you wrote:
> Hi again...
>
> int fd; /* RS232 serial link */
> int fdp; /* file descriptor for a regular file */
> struct stat stat;
> size_t bytes = 0;
> void *buffer; /* buffer, will be allocated */
> ...
>    while (bytes < stat.st_size) {
>        ret = read(fdp, buffer + bytes, stat.st_size - bytes);
>        if (ret == -1) {
>            perror("read");
>            return -1;
>        }
>        ret = write(fd, buffer + bytes, ret);
>        if (ret == -1) {
>            perror("write");
>            return -1;
>        }
>        bytes += ret;
>        progress = (int) (bytes * 100) / stat.st_size;
>        printf("\rcompleted: %i%%", progress); /* NO OUTPUT, UNTIL LOOP
> ENDED */ fflush(stdout);
>    }
> ...
>
> Then i see printf() never output the message until the loop has ended...
> 'fdp' is a file descriptor to a local file, i send it through a serial
> connection (RS232),
> i use a serial connection so i can practice Linux's File I/O operation
> in real world ;p
>
> the receiver can output the progress's message, but the sender (the
> above code) could not...
> this is the receiver codes:
>
> ...
> while (bytes < size) {
>        ret = read(fd, buffer + bytes, size - bytes);
>        if (ret == -1) {
>            perror("read");
>            return -1;
>        }
>        ret = write(fdp, buffer + bytes, ret);
>        if (ret == -1) {
>            perror("write");
>            return -1;
>        }
>        bytes += ret;
>
>        progress = (int) (bytes * 100) / size;
>        printf("\rcompleted: %i%%", progress); /* HAS OUTPUT */
>        fflush(stdout);
>    }
> ...
>
> On Tue, Sep 8, 2009 at 8:49 PM, Glynn Clements<glynn@gclements.plus.com> 
wrote:
> > Tim Walberg wrote:
> >> Maybe you want "(bytes * 100) / size"?
> >
> > However, if int and size_t are 32-bit, that will overflow at around
> > 20 or 40 MB (20 for signed, 40 for unsigned), which isn't really all
> > that much. Converting to either double or long long might be wise,
> > i.e.
> >
> >        percent = (int)(bytes * 100.0) / size;
> > or:
> >        percent = (int)(bytes * 100LL) / size;
> >
> > --
> > Glynn Clements <glynn@gclements.plus.com>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Your printf statements are being buffered by the system. If enough of them 
accumulate you will see them being printed "inside the loop". You need to 
disable  buffering or print to STDERR.
