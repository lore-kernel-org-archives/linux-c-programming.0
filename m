From: Leon Romanovsky <leon@leon.nu>
Subject: Re: Problem with scatter/gather IO
Date: Wed, 13 Jul 2011 15:16:14 +0300
Message-ID: <CALq1K=LLCLqE9k4QaqtDCxgPH8fniTPCssqDvSoOuOYT_j4Kag@mail.gmail.com>
References: <CAA6iF_6Y4VbHSKnNMYhAhTjf=ZoQZxwO+nqYPmV=R5=6c=KKiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAA6iF_6Y4VbHSKnNMYhAhTjf=ZoQZxwO+nqYPmV=R5=6c=KKiQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, Jul 13, 2011 at 14:54, Randi Botse <nightdecoder@gmail.com> wro=
te:
>
> Hi,
>
> I will read/write file with readv() and writev(), I have problem to
> use that since the struct iovec will be a variable-length array, if i
> have code.
>
> struct foo {
> =C2=A0 =C2=A0unsigned char data[100];
> =C2=A0 =C2=A0unsigned char another_data[28];
> };
> unsigned len;
> ....
>
> /* calculate len */
> /* use len as array's member size */
> struct iovec iov[len];
> printf("len is: %i\n", len);
> readv(fd, iov, len);
>
> I got: BAD ADDRESS, and if I remove the printf() then I will get
> INVALID ARGUMENT. What the possible problem with that?
>
> Thanks,
> --

Did you try "man readv" ?
You didn't initialized iovec struct.
http://pubs.opengroup.org/onlinepubs/009695399/functions/readv.html

--
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon@leon.nu
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
