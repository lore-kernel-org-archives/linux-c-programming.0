From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: line buffered stdin
Date: Mon, 11 Jan 2010 22:06:26 +0530
Message-ID: <ea11fea31001110836q5afe9dcn1022bd7d80228abe@mail.gmail.com>
References: <4B4B5173.20504@max01.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=w65dBKQjPkNMAyeFLNSFJveZTFCOMVzhHW4ZgvOvyFQ=;
        b=YMoTEXg0HLo/r4//eaqjH2XBWJtGQg9vAs+A3UhRHjbyjvXxx9p3JbXQmaBk7waoKh
         cpLHBh49UuXFJSMNJ7k10uP+R6bgGiT5wFZQgmoGZTGNKtkTTJgMxekD0yDTAUKD4dIu
         IqY/VdOVzoDpWU9qUFoCxKxYVJQpiI5qzBfgo=
In-Reply-To: <4B4B5173.20504@max01.eu>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bastian Ruppert <ng@max01.eu>
Cc: linux-c-programming@vger.kernel.org

On Mon, Jan 11, 2010 at 9:57 PM, Bastian Ruppert <ng@max01.eu> wrote:
> Hello,
>
> under Linux stdin is line buffered, that means you can read one byte =
with
> following statement:
>
> read(0,&myvar,1);
>
> You get the byte after typing one or more chars AND return.
>
> But i need this function to return after every char entered in stdin.
>
> Is there a function that reads stdin without line buffering?
>
> Is it possible to disable the linebuffer or to reduce the buffersize =
to one?
=46irst two links in google search.

http://www.linux.org/docs/ldp/howto/NCURSES-Programming-HOWTO/init.html
http://www.flipcode.com/archives/_kbhit_for_Linux.shtml
> Does this kind of manupilation have consequences for the hole system =
or just
> for
> the app
> doing this?
>
> Any Ideas are very welcome,
> thank you.
>
> Regards
> Bastian.
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Thanks -
Manish
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[$\*.^ -- I miss being one of them
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
