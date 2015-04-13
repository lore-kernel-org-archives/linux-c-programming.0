From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: functional tests for atomic operations
Date: Mon, 13 Apr 2015 08:48:55 +0200
Message-ID: <CADtGFvmNLrrO3QJf_w9s=yNb_bkqG2pAeiBHwgwyykMMHfhKUA@mail.gmail.com>
References: <55270D25.9040407@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=O41bU9TcSqKzlyMZZtThYUzyvlTt/G5skojIoV7Bv6o=;
        b=nehymGTX9cqmStchBEhAZ2HV6cAF+DKURepa9CsmaaKMW/m9FySB9IVbdCUG31FDxo
         31B8bvfIZRlDomkderHhy3N6yE0nN/hPhKYzanddkL3CgUxm7NzpywAGIx8aV0ZtOzQV
         JCCoFt+A9i3TlYX+M/ik5iMVj7c6YG/Q7xtHw2lLoUiS4VqSBuSzkzfqN/fa31SUiqUx
         NZPWVEOjqrOIvUIJ5ACNitEcFJ35ElQ2X6pvng4cCoXJBQXwQoNzYKikef0mx7vDP9ST
         a15FZRHY5NS+wI21rKv8dXMaRgvFSDGksIgQSpeyWbEheOn27dyygMOBycmccZPpdkbq
         1TLQ==
In-Reply-To: <55270D25.9040407@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?Sm/Dq2wgS3LDpGhlbWFubg==?= <weedlight@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hi Jo=C3=ABl,

 Atomic operations are by "convention" (and here I'll refer to
Tannebaum etc.) put inside of "critical areas" that you protect with
something like a mutex/semaphore/etc. that provides the needed
concurrency prevention, but needs to be made fine grained, ie. each
variable/operation shared should have it's own mutex/semaphore/etc.

 Atomic operations, as in single instructions, are only really
"guaranteed" at the assembler level for the CPU instruction(s) that
the CPU(s) are able to guarantee atomicity, and
mutexes/semaphores/etc. are implemented using those low level
instructions, to provide you with the needed abstraction without
having to know the specifics of the CPU (ie.
Sparc/x86/Itanium/ARM/PowerPC/etc.). To make it more "intuitive, you
could always abstract the specific atomic updates/operation in a
function call and just declare it inline etc. for performance


On Fri, Apr 10, 2015 at 1:37 AM, Jo=C3=ABl Kr=C3=A4hemann <weedlight@gm=
ail.com> wrote:
> Hi, earlier me experienced problems by using atomic operations on GNU=
/Linux.
> Are there functional tests out there me could run? The root case is
> uncertain because there were known issues like unsigned long overflow=
 and
> concurrent read access.
>
> I'm developing a music sequencer and dealing often with threads. For =
now me
> did a work-around using mutices. But me intend to use atomic operatio=
ns
> again because it makes more intuitive and simpler.
>
> http://gsequencer.org is hosted on GitHub as
> https://github.com/weedlight/ags-devel
>
> For the grand picture the engine is running and me adjust dial widget=
 to
> modify AgsPort field by atomic operations.
>
> At the moment me tries to bring 0.4.2 version to a successful end, ma=
rked as
> stable.
>
> kind regards,
> Jo=C3=ABl
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
