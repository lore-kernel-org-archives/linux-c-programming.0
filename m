From: Balachandar <bala1486@gmail.com>
Subject: Re: Error in compiling a module
Date: Wed, 28 Jul 2010 13:28:23 -0400
Message-ID: <AANLkTimkzbse8B0_kUMbaP-DT8Zm1CnZxOnCA+S5CHnE@mail.gmail.com>
References: <AANLkTikcGVVaofeUZtvPs+jpA11uXs-baTZ8O8NvH94i@mail.gmail.com>
	<AANLkTikqZ5YWqgnHbB3Y03kZfC0OpJ7POYKSeU6JESVt@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3CmkKrkKBzqnMpRxoI6q9u5eJ4SY7TGbsqesjw2YpXo=;
        b=jN/kUe+Ukwebvh1QEuPOWp6GXIRs1VSDnhwB10Ie09HQ0SlA1bFXjUAZmbQsCy/aML
         dn+Pugq0DAULow1/gmVvc1aqkoR3vng3rRAAmyLjktppwqF3HuCK3R1Q3i06fDk7h9uh
         jJAc91BpOixAfMa7ukErNSiiEPePia37zYZtw=
In-Reply-To: <AANLkTikqZ5YWqgnHbB3Y03kZfC0OpJ7POYKSeU6JESVt@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mulyadi Santosa <mulyadi.santosa@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

On Wed, Jul 28, 2010 at 12:59 AM, Mulyadi Santosa
<mulyadi.santosa@gmail.com> wrote:
> On Wed, Jul 28, 2010 at 04:17, Balachandar <bala1486@gmail.com> wrote=
:
>> Hello,
>> =A0I am trying add a new network protocol family to the kernel. But =
i
>> get the following error for .h file =A0'11: two or more data types i=
n
>> declaration specifiers
>
> Not sure how to solve that....as to me the message seems incomplete (=
right?).
>
> Easiest way first: are you sure you have included all the neccessary
> header files?
>
> --
> regards,
>
> Mulyadi Santosa
> Freelance Linux trainer and consultant
>
> blog: the-hydra.blogspot.com
> training: mulyaditraining.blogspot.com
>

Thank you for your help. I figured out the mistake. I missed a
semicolon in one of the header file that was included in the file that
showed the error.

Thanks,
Bala
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
