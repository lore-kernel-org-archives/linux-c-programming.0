From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: function cast?
Date: Thu, 28 Jan 2010 11:50:41 +0530
Message-ID: <ea11fea31001272220w6e8aa529y7c9eb39bb6294729@mail.gmail.com>
References: <34e1241d1001272205y32e92727pab9ee3cf310dcbc7@mail.gmail.com> 
	<34e1241d1001272209j3c5ae625seb555dbc5889d8a2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=splkwlRPQoWp1qUZZZkAl3F/h+M1/Vs8ievvdsEcydI=;
        b=SWbs9c1Rrel42jR2OCyy10+UdrV1IXS36ISxPahGGUclag0mfPOw0WBDIeFz3Oj7GO
         f4GHSSJUZdCd1Rdz2a7iOnmOkLqvq3ueuCE9bi+DDtXiwOXtmV9BWkQvwsnoSqCJzRFU
         YRwHIUB/YWgmYzwBb8fweJx0+jV5UtelFmaUg=
In-Reply-To: <34e1241d1001272209j3c5ae625seb555dbc5889d8a2@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Jan 28, 2010 at 11:39 AM, Randi Botse <nightdecoder@gmail.com> =
wrote:
> (sorry for my first uncomplete email, please abandon the first mail)
>
> Hi All,
>
> Sometimes i see codes are written like this:
>
> (void) printf(fmt);
>
> - or -
>
> (void) close(fd);
>
> What these means? i think it is not necessary to put that 'void' on a
> statement, or it just like when we cast a data type like:
>
> double d =3D 93.43;
> int i =3D (int) d;
>
> but why those function need to be casted in a 'void' ?

Some time it is also to shut up static analysis tools, which might
crib if the function is supposed to return a value and you have not
used the return value. It might be intentional or you might have just
missed. So inorder to show that it is intetional not to use the return
value we typecast it.

Thanks -
Manish

>
> Thanks,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
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
