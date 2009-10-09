From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: Question about core files
Date: Fri, 9 Oct 2009 17:45:49 +0530
Message-ID: <ea11fea30910090515p5c21b577i96078f78b253f6f8@mail.gmail.com>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de> 
	<ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com> 
	<Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de> <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com> 
	<Pine.LNX.4.64.0910071416310.29237@diagnostix.dwd.de> <ea11fea30910071036g154fcd81o1dde7e22cb070729@mail.gmail.com> 
	<Pine.LNX.4.64.0910091158400.12677@diagnostix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=Qc5eJ6Ce6lBWnHuB9MEWbteJtuZDzDMdWUrayUwB4Hk=;
        b=USGR4S5TGY4YjwvB0TAGZQip6eAiYRPaB6WK2pNsAyqzhpEMGPhg8HOomr9a9oD2TK
         N4TW1Ssn9udk6oPwqcvRrVsNTHS+Yx3MxE5kYIqK8b4joiV5LWgSL2mWvEAUZhG6Mhx9
         2VGQWv2Ddb6eBIVJsqWO0Y/3wzCNhGF/A0c5A=
In-Reply-To: <Pine.LNX.4.64.0910091158400.12677@diagnostix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org

On Fri, Oct 9, 2009 at 5:39 PM, Holger Kiehl <Holger.Kiehl@dwd.de> wrot=
e:
> Hello Manish
>
> First, sorry for the late responce!
>
> On Wed, 7 Oct 2009, Manish Katiyar wrote:
>
>> On Wed, Oct 7, 2009 at 7:51 PM, Holger Kiehl <Holger.Kiehl@dwd.de> w=
rote:
>>>
>>> Hello Manish
>>>
>>> On Wed, 7 Oct 2009, Manish Katiyar wrote:
>>>
>>>> Hi Holger,
>>>>
>>>> I don't have the source code, so a bit hard to guess. But you can =
try
>>>> to find out which member of your fsa structure is at offset 236 (0=
xec)
>>>> and look around those lines in the function where you are accessin=
g
>>>> that member.
>>>>
>>>> I am trying to download the AFD source code, which looks like it w=
ill
>>>> take ages on my slow broadband. Hopefully I can help after that.
>>>>
>>> If you download, please take afd-1.4.0-0.20.beta.tar.bz2 because th=
at
>>> is the one that caused the error. You can get it from:
>>>
>>> =A0 ftp://ftp.dwd.de/pub/afd/development/afd-1.4.0-0.20.beta.tar.bz=
2
>>>
>>> You will find the relevant code in src/fd.c.
>>
>> Hi Holger,
>>
>> (gdb) set $offset =3D (int)(&((struct filetransfer_status *)0)->host=
_status)
>> (gdb) p $offset
>> $5 =3D 236
>> (gdb) p/x 236
>> $6 =3D 0xec
>>
>> host_status is at offset 236. In the function start_process I can se=
e
>> that this is used at places by dereferencing below
>> "fsa[fsa_pos].host_status ".
>>
>> At this point my guess would be that you are getting fsa_pos as
>> something illegal ie.. probably you are trying to access beyond the
>> array. Since this is an input to the function, you can just check it=
s
>> value at the start and assert if that is ok and within reasonable
>> range.
>>
>> HTH
>>
> Many thanks for finding this out! I think I now, with your help, have=
 a
> clue where the error could be. Is there a way to find out what value
> fsa_pos had at that time?

Since it is a runtime variable, probably we can get something by
looking at the output of "info registers". But you can try putting

if (fsa_pos <0 ) {
   printf("going to die ... \n");
   return
}

in the start of the function itself and try.

>  If it was -1 then it is definitely the error
> I am thinking of, but if it is something else then I don't know.
>
> Again many thanks for the valuable help!
>
> Regards,
> Holger



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
