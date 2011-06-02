From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: Re: macro to print filename
Date: Thu, 2 Jun 2011 23:41:05 +0530
Message-ID: <BANLkTikKFX=aV4JqRz-5cTMtiUBTS1ni3Q@mail.gmail.com>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
	<op.vweraiul3l0zgt@mnazarewicz-glaptop>
	<BANLkTinEDc3DLbaFezBxL=QQ0Nie83+NAQ@mail.gmail.com>
	<op.vwevg1xb3l0zgt@mnazarewicz-glaptop>
	<BANLkTin7xYkdGqUKFqUp2hu3oktBxOzBgg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=bbZzOsBTBX1dNLGA9j0DdYBNYNqZJawofBW8zgIFNQk=;
        b=BAVBykP9DI7GC/6/TB7BS9922VuI8kaJOpcj7a5lG2yD5ZzRyeqFHeBsNI4gXRfrmR
         68AO74b51yMmQkT/M5MLR9otZz2AnKK5d8P0VPBgwa66mk9RAZ11D9019hvncB70fWEr
         oVtE108nZontpe5LE7Z6unsVRF7X1hwlObpng=
In-Reply-To: <BANLkTin7xYkdGqUKFqUp2hu3oktBxOzBgg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Zhongye Jia <jia.zhongye@gmail.com>
Cc: Michal Nazarewicz <mina86@mina86.com>, linux-c-programming@vger.kernel.org

On Thu, Jun 2, 2011 at 7:09 PM, Zhongye Jia <jia.zhongye@gmail.com> wro=
te:
> thanks very much! it works very well only except that the
> initialization should be placed out of the struct. the compiling time
> computation in c++ is really amazing.
>
> 2011/6/2 Michal Nazarewicz <mina86@mina86.com>:
>> On Wed, 01 Jun 2011 20:45:06 +0200, Zhongye Jia <jia.zhongye@gmail.c=
om>
>> wrote:
>>>
>>> I do not think this can be done in *compiling* time, neither macro =
in
>>> c nor template in c++, so would you be so kind to offer the solutio=
n
>>> by using template or just give =A0some tips? Since I'm not that goo=
d at
>>> c++ :)
>>
>> I was thinking along the lines of:
>>
>> template<unsigned offset>
>> struct _filename {
>> =A0 =A0 =A0 =A0static const char *const val =3D __FILE__[offset] =3D=
=3D '/'
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0? __FILE__ + offset + 1
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: _filename<offset-1>::val;
>> };
>>
>> template<>
>> struct _filename<0> {
>> =A0 =A0 =A0 =A0static const char *const val =3D __FILE__;
>> };
>>
>> static const char *const filename =3D _filename<sizeof(__FILE__) - 1=
>;
>>
>> I'm a bit rusty so I dunno if that'll work in this format.
>>
>> --
>> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
>> .o. | Liege of Serenely Enlightened Majesty of =A0 =A0 =A0o' \,=3D./=
 `o
>> ..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0 =A0(o o)
>> ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

This is nice one.

so we could use __FILE__ with Makefile to solve this problem. We could
 use __FILE__  in our program and define Makefile for each directory.
=46rom toplevel directory, call using - make -C subdir/ . This will giv=
e
help __FILE__ macro to exapand to just filename since "make" is
executing inside the directory.

-Ratheesh
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
