From: Akos Marton <makos999@gmail.com>
Subject: Re: How does one get the description of an errno value
Date: Sun, 15 Mar 2009 19:13:14 +0100
Message-ID: <a913862f0903151113y72fe76d5x968516aee6ef8f85@mail.gmail.com>
References: <gpim9l$dia$1@ger.gmane.org>
	 <6a00c8d50903150420ke10afcfs7c78a11355c5957a@mail.gmail.com>
	 <49BCDBBA.3000209@yahoo.com.br>
	 <a913862f0903150619o43657d87q2f45dbdbc7071659@mail.gmail.com>
	 <49BD1E25.4010305@yahoo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=9EAAJoI/kBaTe/AUJAYS70T3N0BOCxCIix4J/ln2rOE=;
        b=bEmHas1pCD7Fs9rZKds4vChCNzPaTU2oWxufPcy/CSralSe+LWXgLduzSjw33fT/fI
         DnXsczg4H+qOJ/itYuEgKwur2PVKz9cujRmdCm7zgBcb19OQ+JcZ6nQFobmczojmhd8Y
         6d28mwMcctZ2vvo/jxQobSIVCjVL30ipkongc=
In-Reply-To: <49BD1E25.4010305@yahoo.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tiago Maluta <maluta_tiago@yahoo.com.br>
Cc: linux-c-programming@vger.kernel.org

On Sun, Mar 15, 2009 at 4:26 PM, Tiago Maluta <maluta_tiago@yahoo.com.br> wrote:
> Akos Marton wrote:
>> hi,
>>
>> /usr/include/linux/err.h on my PC with the value 4095.
>>
>> mAkos
>>
>
> What lib contains err.h?
> My /usr/include/linux contains only errno.h
>
> I'm using glibc 2.8

I'm using glibc 2.7
You can do a find in your /usr/include/ as
sh$ find /usr/include/ -name "*h" -exec cat {} + | grep MAX_ERRNO
if there are some output, check which file contains this macro.

mAkos
-- 
People seldom notice clothes, if you wear a big smile.
OLVASD: http://napirajz.hu
