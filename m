From: Mahavir Jain <mjainp@gmail.com>
Subject: Re: Hi, Needs suggestions for finding and fixing stack/memory
 corruption when calling a function
Date: Tue, 24 May 2011 13:59:59 +0530
Message-ID: <BANLkTimMU-PEop7yJ+U+RsGzft-Y6L4Wcg@mail.gmail.com>
References: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com>
 <BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com> <4DDA7321.1040606@udo.edu>
 <BANLkTikRoOuKgXC2KpSNGAQkz1_YdTffWA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:from
         :date:x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=XYSB8QiSGF6hvDuzCNJpsTI31usCRaRbXZ46v6jNHk0=;
        b=ScDUag7vuTcYE6K/o1ZA/kOQVWrDr2SaSqHKPtE4vso32RNl2Z3xSAmEE0teFVSFUI
         wgXryGpo3SHDWML7XNfPMk9hOClxNUbrOFTBv61kZ0Rm9Pq4uyqO9OFIDurR1jvdm5Wl
         7avbOiCLF7Eg011ozdafonBqQko9E5T0uWdrs=
In-Reply-To: <BANLkTikRoOuKgXC2KpSNGAQkz1_YdTffWA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fawad Lateef <fawadlateef@gmail.com>
Cc: Andrej Gelenberg <andrej.gelenberg@udo.edu>, linux-c-programming@vger.kernel.org

On Mon, May 23, 2011 at 8:29 PM, Fawad Lateef <fawadlateef@gmail.com> w=
rote:
> Hi Andrej,
>
>
> On Mon, May 23, 2011 at 3:45 PM, Andrej Gelenberg
> <andrej.gelenberg@udo.edu> wrote:
>> Hi,
>>
>>
>> heap, stack, buffer overflow? multiple threads? It is bit difficult =
to
>> suggest something without some code. Have you tried to use gdb or
>> valgrind? (do someone know if valgrind work on arm?)
>>
>
> Thanks for replying.
>
> There is _no_ threading only while(1) loop, we have multiple processe=
s
> communicating through pipes but this problem is happening only in one
> process hence I am assuming that something local to that process is
> corrupting memory.
>
> Our root-filesystem don't have gdb support and I think valgrind is
> _not_ supported on arm :(

Try gdb-server that should fit in small root filesystem.
http://www.delorie.com/gnu/docs/gdb/gdbserver.1.html

>
> Is there any possibility that the problem is related to some compiler
> optimization or something along that line ? We are using gcc-4.2.0
> based tool-chain and Linux kernel 2.6.29.
>
> I can't post the code due to two main reasons: -- Its closed source
> and its too big and I don't think that anyone wants to look at code
> with around 20 cpp files and each file has hundreds of lines of code.
>
> Regards,
>
> Fawad Lateef
>
>> Regards,
>> Andrej Gelenberg
>>
>> On 05/23/2011 04:41 PM, Fawad Lateef wrote:
>>> Hello,
>>>
>>> I need some suggestions about how-to approach, find and fix a memor=
y
>>> corruption issue which is happening in a C/C++ very complex and lar=
ge
>>> code (code evolved over several years). Code is running on AT91SAM9=
260
>>> (armv5l architecture; single processor with preemption enabled) and
>>> completely in Linux user-space.
>>>
>>> The problem is:
>>>
>>> -- We are calling a function which has three integer arguments.
>>> With-in that function 2nd and 3rd arguments always gets corrupted
>>> while 1st argument is fine. Just before calling that function print=
ing
>>> arguments is fine.
>>>
>>> Now it will be good if I can get some suggestions about whats
>>> happening and how-to look into this problem. I am thinking that the=
re
>>> is some memory/stack corruption happening somewhere.
>>>
>>> Thanks in advance.
>>>
>>> -- Fawad Lateef
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-c-p=
rogramming" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Thanks,
MJ
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
