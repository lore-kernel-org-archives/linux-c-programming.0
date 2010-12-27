From: Uriel Corfa <uriel@corfa.fr>
Subject: Re: malloc
Date: Mon, 27 Dec 2010 19:51:27 +0100
Message-ID: <AANLkTi=UXZrj4uLQbbr7iBERsjPCru2zv_SQsnga2mg+@mail.gmail.com>
References: <AANLkTi=y+++cekRzdH5WMNWOyRg1=TaA6eAeq1dL9+A0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=RfMOj15Swbts6wfc5SAnPrD5rZMEsDDM7wSOaLB6ch8=;
        b=RZu2xeEZGmfDKwuAuMtsOSISnrlFziRdZcFBw1rNQp9U/7+TYKk5o85llhP6+1LU3x
         qOi6SaiWVqoUS3wCrMZoCdskG+8/QcNpWpk4gBfcm36MYjYzhnUhArtiICPJbh9goP9m
         yVKQ2JCigjWvf0V0mSULxB3+A9DQlubysTWF0=
In-Reply-To: <AANLkTi=y+++cekRzdH5WMNWOyRg1=TaA6eAeq1dL9+A0@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Mon, Dec 20, 2010 at 5:39 AM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> Is the below statement right or wrong ?
>
> malloc tries to allocate continous memmory space in virtual address
> space. =A0not in physical address space.

Hi,

This is true, but in theory, malloc doesn't have a notion of a virtual
or physical address space. Malloc is defined as : it tries to allocate
a contiguous memory chunk of at least the required size in a
system-defined pool. The question of setting up virtual address
spaces, of lazy allocation of physical pages, etc. is left up to the
underlying OS. In other terms : it's mmap(2) and brk(2) that take care
of this. Malloc relies on them for this kind of questions.

Regards,

--=20
Uriel Corfa
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
