From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: dynamic shared library .
Date: Sat, 19 Mar 2011 23:57:07 +0200
Message-ID: <AANLkTinzu7bW_pBNWWHvQHHDP-Z8qhP=4kQbRCn7p8tY@mail.gmail.com>
References: <AANLkTimck7ar6JPzSnNZo_baTz1usHLeUFxkL8GaqriV@mail.gmail.com>
	<AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
	<op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=DnuqNnkn4zTdDzi4svaeWvTDvJyEzxX/gjbkMHpLkNM=;
        b=rtEQoprMzjRu0JjtwdT6gsiTxb6TOrJcsPaXCKqbjl4O8pV/2mhnPNNPD8VYKMX6xL
         lfj5/5IZJM7I3O1qZSZI1B0CeHuoC310Fnff3eOgNSxD6LtXc2+GvBY0BTnaqFGK9m1L
         QPwhUHzcEjJSTeNYtDcjHiWermtYkWu/KJFv0=
In-Reply-To: <op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Nazarewicz <mina86@mina86.com>
Cc: linux-c-programming@vger.kernel.org, ratheesh k <ratheesh.ksz@gmail.com>

On Thu, Feb 3, 2011 at 4:59 PM, Michal Nazarewicz <mina86@mina86.com> w=
rote:
> On Thu, 03 Feb 2011 15:50:27 +0100, ratheesh k <ratheesh.ksz@gmail.co=
m>
> wrote:
>
>> when =A0dll is loaded =A0.
>>
>> =A0at the start of execution of elf ?
>>
>> =A0 =A0 OR
>>
>> =A0when the =A0reference is made into library function or data ?
>
> Depends what you mean by "loaded". =A0At start of execution, dynamic =
loader
> reads shared object's header files, maps the library to memory accord=
ingly
> and probably does some more magic with symbol resolution, etc. (I'm n=
ot
> an expert and what dynamic loader does is not that trivial).

That would be "normal" libraries that at compile time have been
referenced as needed to be dynamically linked. Ie. those libraries
that you have called/referenced in the compiled code and that the
linker have resolved to be in that dynamoc library. You can find that
list by using "ldd /path/to/<executable>" which would also show you
where the run time linker found those libraries (based on the ld.so
configured paths and the LD_LIBRARY_PATH setting)

Then the "fun" part are those dynamic executables that is loadedby the
program "on demand". An example systemwide is the name service stuff
refered to by the /etc/nsswitch.conf file. Another example is Apache's
loadable modules like the php, perl modules that is not refered to at
startup time by the ELF run time loader, but rather loaded as the
program executes and reads the config files that requests those
modules to be loaded.

>
> However, the whole file is not read into memory and instead, needed
> portions are read as code references them.

Typically the library/dll/.so is mmap(2)ed into the executable address
space, and only read as that part are referenced.

> --
> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
> .o. | Liege of Serenly Enlightened Majesty of =A0 =A0 o' \,=3D./ `o
> ..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0(o o)
> ooo +-<email/jid: mnazarewicz@google.com>--------ooO--(_)--Ooo--
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
