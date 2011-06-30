From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: initializing a struct
Date: Thu, 30 Jun 2011 13:03:26 +0200
Message-ID: <op.vxvyb01k3l0zgt@mnazarewicz-glaptop>
References: <BANLkTimgJN2_SH+_mvkckZKBefCLN6aM=g@mail.gmail.com>
 <BANLkTikvCRn1mdCosk=-Bm8EqDamE5FtpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:content-type:to:subject:references:date:mime-version
         :content-transfer-encoding:from:message-id:in-reply-to:user-agent;
        bh=e4J6hFhs4IrZ+s5Wx8dp7AeCxb17I1Bw4HBVhDI/gAs=;
        b=on5ERJA34K++FR/2EC3CnsHcC1+UotDg5l3+qIqjJ0CluuydjIGXYGxxEPlNr7FjPr
         LAlXuhA5i3T/oIISCBjstFasm0dLhmTKJdAs/Y0pxuj5hcktNLF80j7GJ0B+nPBHA/VS
         l4/ZvHC4KTdskYDljhjWVure29IyRVoGTryws=
In-Reply-To: <BANLkTikvCRn1mdCosk=-Bm8EqDamE5FtpQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming <linux-c-programming@vger.kernel.org>, Vadiraj <vadiraj.cs@gmail.com>

On Thu, 30 Jun 2011 12:18:25 +0200, Vadiraj <vadiraj.cs@gmail.com> wrote:
> I'm stuck with logical reason for initializing a struct variable. Please  
> help..
> Consider a struct defined this way..

> struct foo {
>      int a;
>      char *ptr;
> };

> in my function I declare a local variable of this struct.

>  void bar()
>  {
>        struct foo local_var[10];
>        ...
>        ...
>  }

> do you suspect a initialization issue? do we need to initialize the
> local array local_var[10] ?

Yes.  The array has random data.

> What's the best practice?

Uh? Initialise it if you need.

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
