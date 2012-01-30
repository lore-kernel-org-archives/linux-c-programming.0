From: Shawn <citypw@gmail.com>
Subject: Re: user defined functions
Date: Mon, 30 Jan 2012 21:39:13 +0800
Message-ID: <CABniQZPUN-qawut7HEh0R0DQAWcCXcO6pxZMXn+uGOTMdctGLg@mail.gmail.com>
References: <CAGZFCEFFn0ggkciB2XoQXNGFJBs-U-mhaqzRNaCZoYjar8G1qw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=A8Gwa/sCZ7plMuyYeG4xUzqjxVKp3HQsm9HY0n22HtE=;
        b=uNS1UyOKEa88i3amVk3YPZTHlc+SHElkVPhkduuf7hSslKKCHZ0/6pAbc6PpYPOdXa
         TinqBvg+2pQu32WU+AeKtSiDjq85IO61lLCdKCVKcYmNm88YZsAP03qakoAy36viF2Rl
         LQwU4/9pMBWDRoG9jXxebe650zIbIiJrVdpi0=
In-Reply-To: <CAGZFCEFFn0ggkciB2XoQXNGFJBs-U-mhaqzRNaCZoYjar8G1qw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

hey Ratheesh,

On Tue, Jan 24, 2012 at 10:51 PM, ratheesh kannoth
<ratheesh.ksz@gmail.com> wrote:
> HI all,
>
> I would like to find out all user defined =C2=A0functions in an elf e=
xecutable.
>
> i compiled my c++ program using =C2=A0g++ =C2=A0and created the elf e=
xecutable.
>
> -Ratheesh
> --
you may try "nm a.out | grep T".



--=20
GNU powered it...
GPL protect it...
God blessing it...

regards
Shawn
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
