From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: initializing a struct
Date: Thu, 30 Jun 2011 15:48:25 +0530
Message-ID: <BANLkTikvCRn1mdCosk=-Bm8EqDamE5FtpQ@mail.gmail.com>
References: <BANLkTimgJN2_SH+_mvkckZKBefCLN6aM=g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=jXmk0EIf/qFVD3/fJRizns4Q6Xpv4PB0q1/Nq052p/U=;
        b=GkwP0x+GWNzizWUl/AlpCMy6zm1Ol6DKoxpSRgS1hnGAnOwZ6PLXc09AGpCOsWPtXK
         Ltvh0RSgu+oe6MpaxisWhm73l7poaFyf2fc2olrxzHGGW7UR8ItR5CnCamWta+ljkRGC
         He5ubBJ7TNVGvJgSCzHZf0do1OC9rcOEfHqzc=
In-Reply-To: <BANLkTimgJN2_SH+_mvkckZKBefCLN6aM=g@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

 Hey Guys,
 I'm stuck with logical reason for initializing a struct variable. Plea=
se help..
 Consider a struct defined this way..
 struct foo
 {
 =A0 =A0 int a;
 =A0 =A0 char *ptr;
 };
 in my function I declare a local variable of this struct.
 void bar()
 {
 =A0 =A0 =A0 struct foo local_var[10];
 =A0 =A0 =A0 ...
 =A0 =A0 =A0 ...
 }
 do you suspect a initialization issue? do we need to initialize the
local array local_var[10] ? What's the best practice?
 Thanks in advance.

 Cheers,
 Vadi
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
