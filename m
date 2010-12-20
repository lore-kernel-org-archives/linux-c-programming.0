From: Bogdan Cristea <cristeab@gmail.com>
Subject: Re: unnamed pipe and independent process
Date: Mon, 20 Dec 2010 07:58:32 +0200
Message-ID: <201012200758.32380.cristeab@gmail.com>
References: <AANLkTinutqx=tN3TRMtqa73E0cwnyfUop9FXWz5yvqdy@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:organization:to:subject
         :date:user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=RS1jPhrqscWCxzragmjQ6qYsvhv64NBesn0VcPATw2E=;
        b=hDPqsdAKikie81Ul5BF7/w+9VDtfJBzWhRe0bRiT72cWzz5uKk22InS3Jl1vIZl5NY
         E9BbGrBEz/XeZJg3fTyXWhWI3S6aQL2tmrNd4NgOogwJS6CaZJvxMIrUvnOpmBhFYrL6
         TRHY2MbVvGeeh6nCx1i9kTuCma/BiGHnmbq28=
In-Reply-To: <AANLkTinutqx=tN3TRMtqa73E0cwnyfUop9FXWz5yvqdy@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>, linux-c-programming@vger.kernel.org

On Monday 20 December 2010 06:37:54 you wrote:
> is it possible to  communicate between two independent process using
> unnamed pipes in linux ?
> 
> -Ratheesh
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

This is exactly why named pipes (fifos) are provided.
