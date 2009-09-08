From: Saurabh Sehgal <saurabh.r.s@gmail.com>
Subject: Re: Division in loop
Date: Tue, 8 Sep 2009 10:47:59 -0400
Message-ID: <2a46ebd60909080747r6e7d10afxcf004762621810dc@mail.gmail.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=CBxWsL+aiFykl30NDTfhiF4pYg+aJgFbYRBq/wUNej4=;
        b=wNj8EENaq27VNPZD0NQ30z5LzK1oG40uFBNBCTAbRH0/fvi9BfM4HIqBWuFy4zVdhb
         q3ygXou1o5PEhC/GF1Fd31rM/QIp7pmZ83jshVwew7bt5eNk/7dsmp74GRozOZPdcvQJ
         iQgoy82K6Tq4rvboYsykkoKeTVG1PR6TUwdvU=
In-Reply-To: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Where do you initialize the variable size and to what value ?

On Tue, Sep 8, 2009 at 10:40 AM, Randi Botse <nightdecoder@gmail.com> w=
rote:
>
> hi all,
>
> ....
> int fd, fdp;
> unsigned int size;
> int progress =3D 0;
> size_t bytes =3D 0;
> void *buffer;
> ....
>
> /* open fd from a device then create fdp, allocate buffer,, etc. */
>
> while (bytes < size) {
> =A0 =A0 =A0 =A0ret =3D read(fd, buffer + bytes, size - bytes);
> =A0 =A0 =A0 =A0if (ret =3D=3D -1) {
> =A0 =A0 =A0 =A0 =A0 =A0perror("read");
> =A0 =A0 =A0 =A0 =A0 =A0return -1;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0ret =3D write(fdp, buffer + bytes, ret);
> =A0 =A0 =A0 =A0if (ret =3D=3D -1) {
> =A0 =A0 =A0 =A0 =A0 =A0perror("write");
> =A0 =A0 =A0 =A0 =A0 =A0return -1;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0bytes +=3D ret;
>
> =A0 =A0 =A0 =A0progress =3D (int) ((bytes / size) * 100);
> =A0 =A0 =A0 =A0printf("\rcompleted: %i%%", progress);
> =A0 =A0 =A0 =A0fflush(stdout);
> =A0 =A0}
>
> ....
>
> I run this loop to receive some data, the printf() seem not updated,
> the progress output is
> always in it's initial value until the loop was finished. but when i =
do...
>
> progress =3D (int) ((bytes / 2) * 100); /* change size to 2 (or rando=
m number) */
>
> then it's works... what's wrong here???
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--
Saurabh Sehgal
E-mail: =A0 =A0 saurabh.r.s@gmail.com
Phone: =A0 =A0 647-831-5621
LinkedIn: http://www.linkedin.com/pub/1/7a3/436
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
