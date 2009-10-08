From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: Question about core files
Date: Fri, 9 Oct 2009 00:17:34 +0530
Message-ID: <ea11fea30910081147k26afa2c0g4234617fac5ce234@mail.gmail.com>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de> 
	<ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com> 
	<Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de> <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com> 
	<Pine.LNX.4.64.0910071416310.29237@diagnostix.dwd.de> <ea11fea30910071036g154fcd81o1dde7e22cb070729@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=Crg8nXiuGf1XVmKitvXTM2TtrNrzHyAyx7P6/mXquR0=;
        b=AncAil78FpAeZ75arFPjnbe2Kf6x4Xp56KLdof5F48yGSRXAPgLd2GEcaLlM0idPCv
         qkmmzlJD3LcN2lrti/5AEdheOXtA30CU8zxdOxXeo/Jv924jmRiCZeUbLuEGZHZAqFiz
         dY9DKGw3Z4t3VEhbA+sv0yrMoi6LMlEygusqI=
In-Reply-To: <ea11fea30910071036g154fcd81o1dde7e22cb070729@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org

On Wed, Oct 7, 2009 at 11:06 PM, Manish Katiyar <mkatiyar@gmail.com> wr=
ote:
> On Wed, Oct 7, 2009 at 7:51 PM, Holger Kiehl <Holger.Kiehl@dwd.de> wr=
ote:
>> Hello Manish
>>
>> On Wed, 7 Oct 2009, Manish Katiyar wrote:
>>
>>> Hi Holger,
>>>
>>> I don't have the source code, so a bit hard to guess. But you can t=
ry
>>> to find out which member of your fsa structure is at offset 236 (0x=
ec)
>>> and look around those lines in the function where you are accessing
>>> that member.
>>>
>>> I am trying to download the AFD source code, which looks like it wi=
ll
>>> take ages on my slow broadband. Hopefully I can help after that.
>>>
>> If you download, please take afd-1.4.0-0.20.beta.tar.bz2 because tha=
t
>> is the one that caused the error. You can get it from:
>>
>> =A0 ftp://ftp.dwd.de/pub/afd/development/afd-1.4.0-0.20.beta.tar.bz2
>>
>> You will find the relevant code in src/fd.c.

Hi Holger,

Have you been able to trace the bug ?


>
> Hi Holger,
>
> (gdb) set $offset =3D (int)(&((struct filetransfer_status *)0)->host_=
status)
> (gdb) p $offset
> $5 =3D 236
> (gdb) p/x 236
> $6 =3D 0xec
>
> host_status is at offset 236. In the function start_process I can see
> that this is used at places by dereferencing below
> "fsa[fsa_pos].host_status ".
>
> At this point my guess would be that you are getting fsa_pos as
> something illegal ie.. probably you are trying to access beyond the
> array. Since this is an input to the function, you can just check its
> value at the start and assert if that is ok and within reasonable
> range.
>
> HTH
>
>
>>
>> Holger
>>
>
>
>
> --
> Thanks -
> Manish
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [$\*.^ -- I miss being one of them
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
