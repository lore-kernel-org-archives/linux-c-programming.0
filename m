From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: duplicated modulo
Date: Mon, 4 Apr 2011 10:26:05 +0200
Message-ID: <BANLkTikDWQcXY+5quaRk-Qz9PBxnDdXt0A@mail.gmail.com>
References: <20110401114113.6e2e91af@absol.kitzblitz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=C5px0uwfSvwbKQsFdSNReWYm1SX93lQs96jGWMcpJ8M=;
        b=ecWRplg3uSg3bZGXWYyQGyGuwBtMUMiJC3tt/XwBPosWDWcejnnf6i+0Pu64PAbk7f
         GuSMAOf+NYTDw/1NzmTg0m4HmMZj6SYXqIUgOc4C5bMFNdE6miL0YpXzEEv69O7MZUjW
         KwxFvxMHi6oB0aLDd3FNqMyIHlGONPkq0q6Ps=
In-Reply-To: <20110401114113.6e2e91af@absol.kitzblitz>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nicolas Kaiser <nikai@nikai.net>
Cc: linux-c-programming@vger.kernel.org

On Fri, Apr 1, 2011 at 11:41 AM, Nicolas Kaiser <nikai@nikai.net> wrote=
:
> I'm curious: a duplicated modulo operation can't possibly make
> any difference, can it?
>
> diff -u -p ./arch/powerpc/platforms/powermac/nvram.c /tmp/nothing/arc=
h/powerpc/platforms/powermac/nvram.c
> --- ./arch/powerpc/platforms/powermac/nvram.c =A0 2011-03-31 09:52:41=
=2E674292401 +0200
> +++ /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
> @@ -246,7 +246,6 @@ static u32 core99_calc_adler(u8 *buffer)
> =A0 =A0 =A0 =A0high =3D 0;
> =A0 =A0 =A0 =A0for (cnt=3D0; cnt<(NVRAM_SIZE-CORE99_ADLER_START); cnt=
++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((cnt % 5000) =3D=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 high =A0%=3D 65521UL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0high %=3D 65521UL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0low +=3D buffer[cnt];

The emphasis should be on "shouldn't" not "possibly" ;)

As other mentioned, you could have issues with going to different types=
 etc.

However, the major reason *I* would remove it, is that the division
operation is an expensive operation, and then you still need to get
the remainder too and also since it's mostly superfluous thus adding
bloat.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
