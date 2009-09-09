From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: Division in loop
Date: Tue, 8 Sep 2009 22:37:16 -0400
Message-ID: <34e1241d0909081937y5ecbd0davf7edbba9d9b201a0@mail.gmail.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
	 <20090908145838.GF947@comcast.net>
	 <19110.64410.498993.60369@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=IMVxy9BHW5kfUTIYe7m9K3Ph9gCtT9OtU0uKM442BSA=;
        b=EL5ggjbvd6OW+1IklPHR3XtreZCWOjnyJ7qhR57ELUmh0dNqlbzud1V+uRrOoN2C2t
         Fc6hLaW5Pl1jEAOtRb346RBaXX+VVN301p9viBBRqv/p/xqfiTGMVyPoxRegvdJ/Mv4S
         I5+GxUnJJYEvVWcS5jB8d9NupAh52X7JlXWJE=
In-Reply-To: <19110.64410.498993.60369@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Hi again...

int fd; /* RS232 serial link */
int fdp; /* file descriptor for a regular file */
struct stat stat;
size_t bytes =3D 0;
void *buffer; /* buffer, will be allocated */
=2E..
    while (bytes < stat.st_size) {
        ret =3D read(fdp, buffer + bytes, stat.st_size - bytes);
        if (ret =3D=3D -1) {
            perror("read");
            return -1;
        }
        ret =3D write(fd, buffer + bytes, ret);
        if (ret =3D=3D -1) {
            perror("write");
            return -1;
        }
        bytes +=3D ret;
        progress =3D (int) (bytes * 100) / stat.st_size;
        printf("\rcompleted: %i%%", progress);
        fflush(stdout);
    }
=2E..

Then i see printf() never output the message until the loop has ended..=
=2E
'fdp' is a file descriptor to a local file, i send it through a serial
connection (RS232),
i use a serial connection so i can practice Linux's File I/O operation
in real world ;p

the receiver can output the progress's message, but the sender (the
above code) could not...
this is the receiver codes:

=2E..
while (bytes < size) {
        ret =3D read(fd, buffer + bytes, size - bytes);
        if (ret =3D=3D -1) {
            perror("read");
            return -1;
        }
        ret =3D write(fdp, buffer + bytes, ret);
        if (ret =3D=3D -1) {
            perror("write");
            return -1;
        }
        bytes +=3D ret;

        progress =3D (int) (bytes * 100) / size;
        printf("\rcompleted: %i%%", progress); /* THIS NEVER OUTPUT,
UNTIL LOOP END! */
        fflush(stdout);
    }
=2E..



On Tue, Sep 8, 2009 at 8:49 PM, Glynn Clements<glynn@gclements.plus.com=
> wrote:
>
> Tim Walberg wrote:
>
>> Maybe you want "(bytes * 100) / size"?
>
> However, if int and size_t are 32-bit, that will overflow at around
> 20 or 40 MB (20 for signed, 40 for unsigned), which isn't really all
> that much. Converting to either double or long long might be wise,
> i.e.
>
> =A0 =A0 =A0 =A0percent =3D (int)(bytes * 100.0) / size;
> or:
> =A0 =A0 =A0 =A0percent =3D (int)(bytes * 100LL) / size;
>
> --
> Glynn Clements <glynn@gclements.plus.com>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
