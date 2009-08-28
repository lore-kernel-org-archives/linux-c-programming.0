From: Ben Rosenberg <scdlbx@gmail.com>
Subject: Re: Help on bit operation
Date: Fri, 28 Aug 2009 10:02:04 -0700
Message-ID: <ca4725240908281002h4fc32b39t23fb84518bd0ab6a@mail.gmail.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
	 <19093.53306.413232.981055@cerise.gclements.plus.com>
	 <34e1241d0908262343p1cd899a8o4c9e956371d570b3@mail.gmail.com>
	 <34e1241d0908272152r32591e52wb1885433edb9a9ff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=e5tZFdmRCEmqxL20fgtLfxOBPBuEfzG3+sk+5c9lIOw=;
        b=oxPRQ2u5tAEXke6ZJ1tREnCvd8jy3F/zv+n/nvF7X8ycLzXGgJ02HKNLwOkMzteR91
         Xm2NPIfdg9iBOoR0eiJBC9AMdzi3cBm6lNl6XowDwtwImKOQxY1lH0pJkq79+SjEuv/d
         hdv8ztj+nbtBWq5VNqfmeOnwcGN6OchkEtnmU=
In-Reply-To: <34e1241d0908272152r32591e52wb1885433edb9a9ff@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Aug 27, 2009 at 9:52 PM, Randi Botse<nightdecoder@gmail.com> wr=
ote:
> Hi again.
>
> I was able to solve my bit packing/unpacking problems with bit mask
> and shift operations, but i have no idea how to do this using a
> bit-field structure, can someone give me a example?
>
> Thanks
> =A0 =A0 =A0 =A0 =A0 =A0 - Randi
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Glynn's example of bitfields is cleaner and better than this, but I
put a basic implementation of bitfields using your parameters at the
end of this message. From my understanding, the way bitfields are
implemented in C is with bit shifts and masks, so I don't think there
is a performance difference between the two.

#include <stdio.h>

struct bitfield {
    unsigned int a:6;
    unsigned int b:4;
    unsigned int c:8;
    unsigned int d:5;
    unsigned int e:9;
};

int main(void) {
    struct bitfield foo;
    foo.a =3D  43;
    foo.b =3D  11;
    foo.c =3D 120;
    foo.d =3D  30;
    foo.e =3D 418;
    printf("%u %u %u %u %u\n",foo.a,foo.b,foo.c,foo.d,foo.e);
    return 0;
}


Ben
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
