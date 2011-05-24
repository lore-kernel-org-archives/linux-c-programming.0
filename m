From: Fawad Lateef <fawadlateef@gmail.com>
Subject: Re: Hi, Needs suggestions for finding and fixing stack/memory
 corruption when calling a function
Date: Tue, 24 May 2011 10:02:25 +0100
Message-ID: <BANLkTi=C7H=NK65aT4m0Mw-ecy6v2Kx44A@mail.gmail.com>
References: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com>
 <BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com> <BANLkTimx+=DxYCCqtSKjGWUm63jBAe+iug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=eD2Jqk5aXrDEDbOHRbq/Jq51zwT2gAy0wdg0r/nJ3IA=;
        b=AQvDecdJIACdYCa3lKNMT1CFgG3BnfTTCix52Ocb4UhdhIg3WIzBKxng56Gob/yhjf
         PXSGeVwSbWlb7w4bxXmTeioHJBpsHFKBPUm4Q4RxNSPzKQ0Lu1A4Jr0rboxpPsh6/hGo
         GM0TkhATVCnW6S4Nx+E44CdORz+faag4kUUFg=
In-Reply-To: <BANLkTimx+=DxYCCqtSKjGWUm63jBAe+iug@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ern0 <ern0@linkbroker.hu>
Cc: linux-c-programming@vger.kernel.org

On Tue, May 24, 2011 at 7:08 AM, ern0 <ern0@linkbroker.hu> wrote:
> Sounds like wrong compilation. Have you recompiled both the caller an=
d the
> callee functions? Is the compiling target set correctly (btw ARM inte=
gers
> are always put on 32-bit boundaries)? What are the types of the param=
eters?
> Try to change its order. Finally, if nothing works, pass them differe=
nt way,
> one-by-one (setFirst(), setSecond(), SetThirdAndperform()) or with po=
inters,
> I mean foo(int*) instead of foo(int).
>

Thanks for reply and suggestions. Both functions are part of single
application and I tried rebuilding all of them again. For now I added
two more temporary arguments between 1st and 2nd arguments and the
required arguments getting correct values thats why I am assuming that
by adding temporary variables we moved the memory corruption from real
arguments into temporary arguments. After adding these arguments my
function is behaving correctly so for now this is a work-around _but_
I want to figure-out its proper fix (as the same sort of issue we
faced in our cgi based web-pages code some weeks earlier).

Hence I needs suggestion that is this really a memory corruption or
some compiler issues ? If its a compiler issue then its not a big
problem but if its memory corruption issue then we have to _fix_ it
asap.

My compilation arguments are:

* Compilation ----- armv5l-linux-g++ -Wall -Wno-write-strings
-mcpu=3Darm9 -Os -DARM9_LINUX_GCC -D_GNU_SOURCE -DUNIX -pipe -fPIC -c -=
o
xxxxxxxxxxx.o xxxxxxxxxxx.cc

* Linking Shared Library ----- armv5l-linux-g++ -shared -o xxxxxx.so

* Linking Executable ----- armv5l-linux-g++ -Wl,-rpath,/mnt/apps/lib
-Wall -Wno-write-strings -mcpu=3Darm9 -Os -DARM9_LINUX_GCC -D_GNU_SOURC=
E
-DUNIX -pipe -s ..........


Thanks,

=46awad Lateef


> On Mon, May 23, 2011 at 16:41, Fawad Lateef <fawadlateef@gmail.com> w=
rote:
>>
>> Hello,
>>
>> I need some suggestions about how-to approach, find and fix a memory
>> corruption issue which is happening in a C/C++ very complex and larg=
e
>> code (code evolved over several years). Code is running on AT91SAM92=
60
>> (armv5l architecture; single processor with preemption enabled) and
>> completely in Linux user-space.
>>
>> The problem is:
>>
>> -- We are calling a function which has three integer arguments.
>> With-in that function 2nd and 3rd arguments always gets corrupted
>> while 1st argument is fine. Just before calling that function printi=
ng
>> arguments is fine.
>>
>> Now it will be good if I can get some suggestions about whats
>> happening and how-to look into this problem. I am thinking that ther=
e
>> is some memory/stack corruption happening somewhere.
>>
>> Thanks in advance.
>>
>> -- Fawad Lateef
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> ern0
> Haben Sie Fragen?
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
