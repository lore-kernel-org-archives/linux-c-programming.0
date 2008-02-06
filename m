From: "Eric Polino" <aluink@gmail.com>
Subject: Re: sprintf with mips
Date: Wed, 6 Feb 2008 16:21:48 -0500
Message-ID: <b21328ed0802061321m276e4634v760cb71909c18a90@mail.gmail.com>
References: <20080206191600.243670@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=4uQMneda/MpH2v2fI8odt/y5bH4UmL+Rtw2X/WAOx1Y=;
        b=YDeSBF6Kwe+wzOTv/7qeipE8wk3dmXLCORoyU/paz9Iov8OfOrPQrfWJlWWFoj/3S5E1jtGCk2zZd0ryMvxxtvhw7lfArwH+hyvRNSY0SZ3WKCdJPZeDwQzWtRtjq+Qp6RJDEyhjUgCLvX/zzcNPiXM6/hpvWeRnS9IOeY30mjo=
In-Reply-To: <20080206191600.243670@gmx.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: linux-c-programming@vger.kernel.org

On Feb 6, 2008 2:16 PM, Christian Stalp <christian.stalp@gmx.de> wrote:
> Hello out there,
> are there any known problems with sprintf under mips? I spend some time to make this code runnable:
>
> sprintf(insertvalues, " %d , ' %s ' , %d ", counter, "192.168.1.1", mytraffic->num_frames);
> printf("input-string: %s\n", insertvalues);
>

I don't know if this really matters...but why are you doing this this
way?  Why not just do it in one line with

printf("input-string:   %d , ' %s ' , %d \n", counter, "192.168.1.1",
mytraffic->num_frames);

Cheers,
Eric

> This works properly under x86 but if I run this under mips, the string is empty! Even if the variable 'counter' is uninitialized or 'mytraffic->num_frames' (which is not the case, I can see the values if I dump them directly with printf) there should be at least that IP-address-string which should be inserted! This is weired. Has anybody an idea what the problem is here?
>
> Thank you.
>
> Gruss Christian
>
>
> --
> GMX FreeMail: 1 GB Postfach, 5 E-Mail-Adressen, 10 Free SMS.
> Alle Infos und kostenlose Anmeldung: http://www.gmx.net/de/go/freemail
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
"None are more hopelessly enslaved than those who falsely believe they
are free."
                                      --Goethe

"Freedom is living without government coercion."
                   --Ron Paul (www.ronpaul2008.com)
