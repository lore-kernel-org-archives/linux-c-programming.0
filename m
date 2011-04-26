From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: Re: malloc question
Date: Tue, 26 Apr 2011 17:20:22 +0530
Message-ID: <BANLkTikHaA7hnSJ9X7nFiBXZFaf-nPKNog@mail.gmail.com>
References: <BANLkTik1ZqN2cOqu65f380wfgOHQpwX7gg@mail.gmail.com>
	<BANLkTikCz0uyFkU2Df-hiAmmj+-ZRABdVQ@mail.gmail.com>
	<BANLkTinW-j2DiwbVC5u8BfJMU7jK3_KbwA@mail.gmail.com>
	<BANLkTikL+p2dBYBGKjwKkUUMYoPm7XxKGg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=M1fS3V98vOZcRGtaC225F4pvZpN+dptMOgBHgCeAUlc=;
        b=Ig0pEk0MttGlNU4FHzPvsljJ/DCAZ0OU4RF5lIjJwMJoOFMJKyODb2N2+sx0V+OObv
         s7g81KndTq3AfQAVv4JboK9azRoShqw8qCk+xQjs/+2/6lMLY3QlCFTFZfHCdXzDtLjc
         XcTZ+Vdja3UmO3kgeFSK+QQK07028v6Iwpugg=
In-Reply-To: <BANLkTikL+p2dBYBGKjwKkUUMYoPm7XxKGg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Randi Botse <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org

On Tue, Apr 26, 2011 at 4:27 PM, Daniel Baluta <daniel.baluta@gmail.com=
> wrote:
> On Tue, Apr 26, 2011 at 1:54 PM, ratheesh kannoth
> <ratheesh.ksz@gmail.com> wrote:
>> On Tue, Apr 26, 2011 at 4:10 PM, Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>>> On Tue, Apr 26, 2011 at 1:33 PM, Randi Botse <nightdecoder@gmail.co=
m> wrote:
>>>> Hi All,
>>>>
>>>> I want to ask malloc() behaviour, consider these codes;
>>>>
>>>> ...
>>>> char *ptr =3D malloc(1);
>>>> strcpy(ptr, "what");
>>>> puts(ptr);
>>>> ....
>>>>
>>>> Confusingly, the strcpy() copied all bytes to ptr, but I just mana=
ge
>>>> to allocate ptr only for 1 byte, I guess I will have segfault here=
,
>>>> why this happen? why the string successfully copied into ptr? , is
>>>> those code legal?
>>>
>>> You didn't get segfault because you were lucky.
>>>
>>> Memory is allocated in multiples of page size (usually 4K).
>>> The memory after your allocated byte is valid in your case.
>>>
>>> thanks,
>>> Daniel.
>>> --
>>
>> U could read a little more about vm_page_struct. ( virtual address
>> space to =A0physical page ).
>
> Can you elaborate on this?
>
> Daniel.
>

Daniel,

Note: Pls read Linux Kernel internals 2.6.


malloc() and free() works on virtual address space.

malloc(1)           - this allotes a virtual address space of 4k.

strcpy(ptr, "what" ) -    the 4k virtual address is mapped to a 4k
page frame thru page fault exception. Now you have a valid virtual
address of 4k.

free(ptr)              - tells OS that  this virtual address space (
4k )  can be reallotted if there is a need . But  each program has a
virtual address space of 3GB ( 32 bit
                                   ,4GB minus 1GB (kernel) ).  SO ptr
is a valid pointer unless
                                                   1) vitual address
space is realloted.
                                                   2) page frame is
realloted for some other page ( LRU algorithm )
so if ptr is valid , you could do  following

 *(ptr ++ ), *ptr ... etc .


-ratheesh
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
