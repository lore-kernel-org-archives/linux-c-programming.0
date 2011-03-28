From: ".: formica :." <formica@messinalug.org>
Subject: Re: gcc Cortex M3 Programming
Date: Mon, 28 Mar 2011 22:06:44 +0200
Message-ID: <AANLkTi=zQA6k6GE1gSr=jwyf8D60jtT5cvgfUSgDkDuS@mail.gmail.com>
References: <4D90E244.1070904@alice.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=hUNRrpaaUkXQAkxGwm6ecTI5tRX8a5wtfOnhyOJtdhE=;
        b=K4R7vQ3O/Lq8pI4HGnKXZPqSFNtNK6r4npCNaH8QOowXiRqpri/JEdIr1hV6UsFgfK
         2uqFMduulIt92q5u/0+s+LEGOwbWZn/cWvgfx/IYvYYL2kXstXTqud5i8xVoDrpdOvdS
         NzUm9nvBUQR43TLZ7OXWXctJT/PuvHs/jWFPw=
In-Reply-To: <4D90E244.1070904@alice.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dello Iacono salvatore <delloiaconos@alice.it>
Cc: linux-c-programming@vger.kernel.org

You have to use a cross-compiler for cortex-m3. You can use a
gnu/toolchain for cortex-m3.
Instead of gcc, you have to use arm-none-eabi-gcc.
Maybe this link could be usefull:

http://www.micromouseonline.com/blog/2009/05/07/codesourcery-gnu-toolch=
ain-for-the-arm-on-a-mac

Hope this helps.

Roberto

On Mon, Mar 28, 2011 at 9:32 PM, Dello Iacono salvatore
<delloiaconos@alice.it> wrote:
> Hello everyone,
> I'm trying to program the controllers with Cortex M3 core, but I can =
not
> compile with gcc. Does anyone know how to install gcc for arm on a Ma=
c?
> Thank you all.
> Salvatore Dello Iacono
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Roberto (aka formica) Marino
Computer Engineer
=46ree Software User - Me|Lug Member
http://people.gnudev.org/~formica/
Mobile: 349-5740870
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
