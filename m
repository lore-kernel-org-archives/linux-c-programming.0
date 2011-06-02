From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: macro to print filename
Date: Thu, 02 Jun 2011 21:11:02 +0200
Message-ID: <op.vwgp8ov63l0zgt@mnazarewicz-glaptop>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
 <op.vweraiul3l0zgt@mnazarewicz-glaptop>
 <BANLkTinEDc3DLbaFezBxL=QQ0Nie83+NAQ@mail.gmail.com>
 <op.vwevg1xb3l0zgt@mnazarewicz-glaptop>
 <BANLkTin7xYkdGqUKFqUp2hu3oktBxOzBgg@mail.gmail.com>
 <BANLkTikKFX=aV4JqRz-5cTMtiUBTS1ni3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:cc:subject:references
         :date:mime-version:content-transfer-encoding:from:message-id
         :in-reply-to:user-agent;
        bh=mTcy4xy8F0mDhGwa67C8osxwGseIuzYbhztb7EcHI94=;
        b=gz+u0z5XpoYMCfFEY7D3a01FYpmtQADz7Hy/phO6ERFFN6MrcFxIZQMXpCwaexFNFD
         54CAB4LH9R6zGcw3ijclPg/27Iu9tHSUW3kCgCgbzS9YU1vJJ2o1iBOQqy0415pcszoe
         Bv+FL9vJbB7HQeKNrd2uUrjPrzRJLmMZeqVb4=
In-Reply-To: <BANLkTikKFX=aV4JqRz-5cTMtiUBTS1ni3Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Zhongye Jia <jia.zhongye@gmail.com>, ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, 02 Jun 2011 20:11:05 +0200, ratheesh kannoth wrote:
> so we could use __FILE__ with Makefile to solve this problem. We could
>  use __FILE__  in our program and define Makefile for each directory.
> From toplevel directory, call using - make -C subdir/ . This will give
> help __FILE__ macro to exapand to just filename since "make" is
> executing inside the directory.

This might not work in included files though.  Also, I'm not sure if
it's guaranteed that __FILE__ is always a relative path.

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
