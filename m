From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Question about core files
Date: Fri, 9 Oct 2009 12:09:03 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0910091158400.12677@diagnostix.dwd.de>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de> 
 <ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com> 
 <Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de>
 <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com> 
 <Pine.LNX.4.64.0910071416310.29237@diagnostix.dwd.de>
 <ea11fea30910071036g154fcd81o1dde7e22cb070729@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="646810922-1074793909-1255090143=:12677"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <ea11fea30910071036g154fcd81o1dde7e22cb070729@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: linux-c-programming@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--646810922-1074793909-1255090143=:12677
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hello Manish

First, sorry for the late responce!

On Wed, 7 Oct 2009, Manish Katiyar wrote:

> On Wed, Oct 7, 2009 at 7:51 PM, Holger Kiehl <Holger.Kiehl@dwd.de> wrote:
>> Hello Manish
>>
>> On Wed, 7 Oct 2009, Manish Katiyar wrote:
>>
>>> Hi Holger,
>>>
>>> I don't have the source code, so a bit hard to guess. But you can try
>>> to find out which member of your fsa structure is at offset 236 (0xec)
>>> and look around those lines in the function where you are accessing
>>> that member.
>>>
>>> I am trying to download the AFD source code, which looks like it will
>>> take ages on my slow broadband. Hopefully I can help after that.
>>>
>> If you download, please take afd-1.4.0-0.20.beta.tar.bz2 because that
>> is the one that caused the error. You can get it from:
>>
>> =A0 ftp://ftp.dwd.de/pub/afd/development/afd-1.4.0-0.20.beta.tar.bz2
>>
>> You will find the relevant code in src/fd.c.
>
> Hi Holger,
>
> (gdb) set $offset =3D (int)(&((struct filetransfer_status *)0)->host_stat=
us)
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
Many thanks for finding this out! I think I now, with your help, have a
clue where the error could be. Is there a way to find out what value
fsa_pos had at that time? If it was -1 then it is definitely the error
I am thinking of, but if it is something else then I don't know.

Again many thanks for the valuable help!

Regards,
Holger
--646810922-1074793909-1255090143=:12677--
