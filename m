From: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: How to send mail from C program on Linux
Date: Wed, 28 Oct 2009 11:31:42 -0300
Message-ID: <390803460910280731n2e0fd58bwf53c039dfd7646d9@mail.gmail.com>
References: <20669019.01256731758094.JavaMail.root@wombat> 
	<20091028133630.GB5728@opentech.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=rOL2UO1kl5ymfcCF/YERDtQ/c5wm2cfv8n1rCXp66hE=;
        b=GUDfV5tWvJEdcxqpCd5WDjrh1F4zPlSXezR8/0qUgvdo8QnP3wyXIw5KZj9JR/V9h7
         JHnKcmkyxO2sS4M1rHbbqhIMiDvuRVjYbIdxDcOilSpgRHi0Vtxr1J78VKcNFnjWFKId
         elqw2AwXMK8mk02eurk4kq0rB+Xeoc1pfvNyQ=
In-Reply-To: <20091028133630.GB5728@opentech.at>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: darshan.ghumare@gmail.com, linux-c-programming@vger.kernel.org

I think the best way it is sending mail through a STMP server using a
STMP Library.

In that way you wont depend on external environment (does the system
have sendmail installed?)

With a quick google search I found this one:

http://freshmeat.net/projects/libsmtp

Best regards,

-----------------------------------------
Javier Mart=C3=ADnez Canillas
+595 981 88 66 58
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
