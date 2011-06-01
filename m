From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: macro to print filename
Date: Wed, 01 Jun 2011 19:38:32 +0200
Message-ID: <op.vweraiul3l0zgt@mnazarewicz-glaptop>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:subject:references:date
         :mime-version:content-transfer-encoding:from:message-id:in-reply-to
         :user-agent;
        bh=23u6Zl/KhP8lLLJziJokB3TFBKLuaWGKFu2O3GENf0c=;
        b=gZDKRi2bg3jbnpcEzfCoTd1+hEFVefiOYBkBNDsy3j4gYKL7dKXBWNHdRdgc6Xv9ah
         0IxrQ3LbyPpVPPlF46RbMhIZopdScKZ4BUKAqkCGE0oxMclmD0ZkD9tFWLEy0WyhD3Ju
         fYjFb2eGd/pGvtPmdk8Fydl0+e0tzDr4DfXEg=
In-Reply-To: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org, ratheesh kannoth <ratheesh.ksz@gmail.com>

On Wed, 01 Jun 2011 18:07:42 +0200, ratheesh kannoth  
<ratheesh.ksz@gmail.com> wrote:
> __FILE__ macro prints relative path name of the file.

Not prints but expands to but we know what you mean. ;)

> I need only filename. How to extract this?
>
> I don't want to use any string library - since it includes more
> Processing and needs to store the character array in executable.
> Is there any method at preprocessing level to do this.

I can say with 99,9% confidence that there is no such thing in C
standard and 99% that there is no such thing in GCC.

You probably can do that in C++ with templates if that's any
constellation.

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
