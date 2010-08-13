From: hong zhang <henryzhang62@yahoo.com>
Subject: strcut casts unsigned long
Date: Thu, 12 Aug 2010 19:17:29 -0700 (PDT)
Message-ID: <965738.16877.qm@web57908.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1281665849; bh=4GnbuMGMlH3A3Q6zDx0eUNb4xSF3PIIfZmWLRUAn8eg=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=crzwrEdyco3wu2/G0ETx2Se40lGus2XPKISRaXjvLD4jQ3dvNuHheH8xK9m4fYzog1Gdus5pqeFz7+CV8FMFzJ4wewQ3ExSlCeeBuULHFAf4OYHgcTwlg07v2HLjcagcSsUPF/CstPlBvXUCe1dVvQmgA7e4O5h5fis4pE2k6pY=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

List,

I have C question on skbuff.h.
skb->_skb_dst is defined as unsigned long and dst_entry is struct.

Why strct dst_entry casts unsigned long skb->_skb_dst?

See below

static inline struct dst_entry *skb_dst(const struct sk_buff *skb)
{
	return (struct dst_entry *)skb->_skb_dst;
}

Appreciate any answer!

--henry


      
