From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Question about core files
Date: Fri, 9 Oct 2009 12:43:25 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0910091238000.12677@diagnostix.dwd.de>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de> 
 <ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com> 
 <Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de>
 <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com> 
 <Pine.LNX.4.64.0910071416310.29237@diagnostix.dwd.de>
 <ea11fea30910071036g154fcd81o1dde7e22cb070729@mail.gmail.com> 
 <Pine.LNX.4.64.0910091158400.12677@diagnostix.dwd.de>
 <ea11fea30910090515p5c21b577i96078f78b253f6f8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="646810922-1440105844-1255092205=:12677"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <ea11fea30910090515p5c21b577i96078f78b253f6f8@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: linux-c-programming@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--646810922-1440105844-1255092205=:12677
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Oct 2009, Manish Katiyar wrote:

> On Fri, Oct 9, 2009 at 5:39 PM, Holger Kiehl <Holger.Kiehl@dwd.de> wrote:
>> Hello Manish
>>
>> First, sorry for the late responce!
>>
>> On Wed, 7 Oct 2009, Manish Katiyar wrote:
>>
>>> On Wed, Oct 7, 2009 at 7:51 PM, Holger Kiehl <Holger.Kiehl@dwd.de> wrot=
e:
>>>>
>>>> Hello Manish
>>>>
>>>> On Wed, 7 Oct 2009, Manish Katiyar wrote:
>>>>
>>>>> Hi Holger,
>>>>>
>>>>> I don't have the source code, so a bit hard to guess. But you can try
>>>>> to find out which member of your fsa structure is at offset 236 (0xec)
>>>>> and look around those lines in the function where you are accessing
>>>>> that member.
>>>>>
>>>>> I am trying to download the AFD source code, which looks like it will
>>>>> take ages on my slow broadband. Hopefully I can help after that.
>>>>>
>>>> If you download, please take afd-1.4.0-0.20.beta.tar.bz2 because that
>>>> is the one that caused the error. You can get it from:
>>>>
>>>> =A0 ftp://ftp.dwd.de/pub/afd/development/afd-1.4.0-0.20.beta.tar.bz2
>>>>
>>>> You will find the relevant code in src/fd.c.
>>>
>>> Hi Holger,
>>>
>>> (gdb) set $offset =3D (int)(&((struct filetransfer_status *)0)->host_st=
atus)
>>> (gdb) p $offset
>>> $5 =3D 236
>>> (gdb) p/x 236
>>> $6 =3D 0xec
>>>
>>> host_status is at offset 236. In the function start_process I can see
>>> that this is used at places by dereferencing below
>>> "fsa[fsa_pos].host_status ".
>>>
>>> At this point my guess would be that you are getting fsa_pos as
>>> something illegal ie.. probably you are trying to access beyond the
>>> array. Since this is an input to the function, you can just check its
>>> value at the start and assert if that is ok and within reasonable
>>> range.
>>>
>>> HTH
>>>
>> Many thanks for finding this out! I think I now, with your help, have a
>> clue where the error could be. Is there a way to find out what value
>> fsa_pos had at that time?
>
> Since it is a runtime variable, probably we can get something by
> looking at the output of "info registers". But you can try putting
>
How can I find which register is fsa_pos?

    (gdb) info registers
    rax            0x7fb48a2c8718   140413389014808
    rbx            0x4acb3bcd       1254833101
    rcx            0x0      0
    rdx            0x7fb48a2c9010   140413389017104
    rsi            0x68     104
    rdi            0x7fb48a3795d8   140413389739480
    rbp            0x0      0x0
    rsp            0x7fffe4906840   0x7fffe4906840
    r8             0x7fb48a346018   140413389529112
    r9             0x0      0
    r10            0x3f     63
    r11            0x25c8   9672
    r12            0x5d     93
    r13            0xbbfe88b9       3154020537
    r14            0xfffffffffffff708       -2296
    r15            0x1      1
    rip            0x404b5f 0x404b5f <start_process+143>
    eflags         0x10207  [ CF PF IF RF ]
    cs             0x33     51
    ss             0x2b     43
    ds             0x0      0
    es             0x0      0
    fs             0x0      0
    gs             0x0      0
    fctrl          0x0      0
    fstat          0x0      0
    ftag           0x0      0
    fiseg          0x0      0
    fioff          0x0      0
    foseg          0x0      0
    fooff          0x0      0
    fop            0x0      0
    mxcsr          0x0      [ ]

> if (fsa_pos <0 ) {
>   printf("going to die ... \n");
>   return
> }
>
> in the start of the function itself and try.
>
Yes, I have already added that. Thanks!

Holger
--646810922-1440105844-1255092205=:12677--
