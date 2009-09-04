From: Jonathan Nell <crtrn13@gmail.com>
Subject: Re: Byte ordering
Date: Fri, 4 Sep 2009 13:57:11 +0100
Message-ID: <48e952f40909040557j60e5d363y35880a9ef5cfa431@mail.gmail.com>
References: <34e1241d0909040504l7a60b9d6xe5daaf2f53658824@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=wQeZGd+pEwSawpxPjiJLvvFqQA/tI/6snJZB48j1zW4=;
        b=lJvyrA6k6VFcCavWjCmLiusfGgqX33IfY50z94QEyK+T8FvyfLvhC6nl1PdfYQKySl
         XSYwuW8sSGn3YAGDC8KxvN+i3iqW+vDDfwkhHxnQWawgage2gwV4H/MuRBNamP8SNYTn
         TSnvOjfijVDudo/3IHK55jwEYzFYGFFEnccoU=
In-Reply-To: <34e1241d0909040504l7a60b9d6xe5daaf2f53658824@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

2009/9/4 Randi Botse <nightdecoder@gmail.com>:
> Hi all,
>
> Given some codes:
>
> ...
> unsigned int val =3D 0x0a0b0c0d;
> unsigned char *str;
>
> str =3D (unsigned char *) &val;
> printf("%.2x %.2x %.2x %.2x\n", *str, *(str + 1), *(str + 2), *(str +=
 3));
> ...
>
> the output is =A0" 0d 0c 0b 0a "
>
> the given codes try to divide a 32 bit integer into it's 8 bit nibble=
s.
> with bit shifting and masking ( that you all teach me.... thanks u ;)
> ) i can get it correctly:
>
> printf("%.2x %.2x %.2x %.2x\n", val >> 24 & 0xff, val >> 16 & 0xff,
> val >> 8 & 0xff, val & 0xff)); =A0/* 0a 0b 0c 0d */
>
> but when address it with pointer to character i got it reversed, coul=
d
> you please explain me why pointer to character reverse the ordering?
> if what i need is only to reverse the ordering (pointer to character
> index) to get a valid order? and if this a valid method?
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0- Randi

It's all to do with endianness and depends on the architecture you
have compiled for. x86 is little-endian, so your integer 0x0a0b0c0d is
actually stored as 0d0c0b0a in memory. So 'str', your pointer' is
actually pointing to the first byte in memory of the integer - i.e.
0x0d and incrementing the pointer will cause it to point to each byte
in turn as is stored in memory. So, if you want your code to be
portable across architectures with different endianness, you'll need
to use bit shifting as in your second example.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
