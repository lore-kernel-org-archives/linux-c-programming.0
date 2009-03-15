From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: How does one get the description of an errno value
Date: Sun, 15 Mar 2009 12:20:25 +0100
Message-ID: <36ca99e90903150420t565c21f0hc98a66a5df15fff5@mail.gmail.com>
References: <gpim9l$dia$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=0vPsq9cg/jx8V4wXa7v1Gvtbsr05oaEhWHddGA8kODU=;
        b=st/XL5HmPLwK3OWzWWaVS+BujhsuntqqbM3bZd6cVug0EmuCQV+QrMnBvLr4uLLh7Q
         UOvcXn2TqbSnRxiIDDyMPLRVOvLzi6F9NHoDkAVwGG0WrbwCtzTU1JENBgKnp5T4pZ22
         0ygluF/u+84nor6jcTuGWsWkL0bOFKcU1/SQI=
In-Reply-To: <gpim9l$dia$1@ger.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Angel Tsankov <fn42551@fmi.uni-sofia.bg>
Cc: linux-c-programming@vger.kernel.org

On Sun, Mar 15, 2009 at 11:46, Angel Tsankov <fn42551@fmi.uni-sofia.bg>=
 wrote:
> Hello,
>
> Is there a function which returns the description of an errno value a=
nd, if
> so, which is it?
strerror(3)

Bert
>
> Regards,
> Angel Tsankov
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
