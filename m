From: Balachandar <bala1486@gmail.com>
Subject: Doubt in linux kernel hlist implementation
Date: Thu, 17 Jun 2010 10:36:47 -0400
Message-ID: <AANLkTilV6W3iAOBF9JBEZz8BlwDil0L0bxpkJmNTGK7N@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=852AWiQas/ibVCMu3FaNaJpsLGvEoiYJzoiAebnPjlg=;
        b=AkRbKeTtkBZm9WLOLlrGGd8z9p8/nPki+AlZXUdrRmPktA7HT/nQE0shywHc7aZiYd
         B3rMLH3r62osLiu2dvTfSoKKpeC/sKRHfgSqwad4B6PXILedEU/q/R6LdLNAvCaHqgIJ
         E1BHMacODfqRwHwqAyOjB43+p4CCpEoGDEdQ8=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hi,
=A0=A0I am trying to understand Linux Kernel implementation of linked l=
ist
and hash table. A link to the implementation is=A0here. I understood th=
e
linked list implementation. But i am little confused of why double
pointers is being used in hlist (**pprev). Link for hlist is=A0here. I
understand that hlist is used in implementation of hash table since
head of the list requires only one pointer and it saves space. Why
cant it be done using single pointer (just *prev like the linked
list)? Please help me.

Thanks,
Bala
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
