From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: array pointer
Date: Tue, 18 Jan 2011 18:53:53 +0530
Message-ID: <AANLkTi=DzN67nS=+s4408dBkAptJsA97=0EkYY+8WX9d@mail.gmail.com>
References: <AANLkTi=n0P0DQSU8a2OMgEaeUAeCNuecjSg0+2MdF8+_@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=pdvWxMcmvVtUJt9KPRbHSil2iq2r1uDaPcQ4Ve7NBqM=;
        b=Or2rtPjjMFQMZVklAsl5vvjQLd+YIaNFPvqPq2zS9CgaGLk8V99by37Pce/SbGf/w5
         RbC1qZvq2RgyWOnyG60MifupuI2TBufR55jIUsSG/tcpXUWmCGzqWq+B5m0S1JlVca7C
         HwJg7WxWJOnudvYD2KB6fhnjZIHuVVQOtwpMk=
In-Reply-To: <AANLkTi=n0P0DQSU8a2OMgEaeUAeCNuecjSg0+2MdF8+_@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

i made a mistake  d_ptr is  int **d_ptr

On Tue, Jan 18, 2011 at 6:52 PM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> int =A0*s_ptr;
> int =A0*d_ptr;
> int arr[2][2]=3D{1,2,3,4};
>
> s_ptr=3D*arr; =A0/* This is perfectly fine */
> d_ptr=3Darr /* this line throws a =A0warning: assignment from incompa=
tible
> pointer type */
>
> What is the problem here ?
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
