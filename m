From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: strcut casts unsigned long
Date: Fri, 13 Aug 2010 12:14:15 +0530
Message-ID: <AANLkTikAiKKtzMcpt14W3veeiOe1JV57RyfG3L1L=OPh@mail.gmail.com>
References: <965738.16877.qm@web57908.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=wtRsK9eUKvs2AX1C6bsNkXuyJ1icQ7OshWIXVnzGXsw=;
        b=oKzZH/vZAS8smi1JQHgK0qfSqLsDGXGJ3iVj9xMZZBWMOVW5BmLvdE1kBJnnj2XmM3
         3i21ZPenRhSegZ8ycmWsWx7kw9xKT8vFeZw+74fk/JC14jPjoOLjqphaUHf/4XDJQUqc
         TwDoN8dWuoOR/8cYZLI3xwulbm8XRcKcp5qtk=
In-Reply-To: <965738.16877.qm@web57908.mail.re3.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: hong zhang <henryzhang62@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

On Fri, Aug 13, 2010 at 7:47 AM, hong zhang <henryzhang62@yahoo.com> wr=
ote:
> List,
>
> I have C question on skbuff.h.
> skb->_skb_dst is defined as unsigned long and dst_entry is struct.
>
> Why strct dst_entry casts unsigned long skb->_skb_dst?
>
> See below
>
> static inline struct dst_entry *skb_dst(const struct sk_buff *skb)
> {
> =A0 =A0 =A0 =A0return (struct dst_entry *)skb->_skb_dst;
> }
>
> Appreciate any answer!
>
> --henry

skb->_skb_dst can be a pointer to both destination cache or  routing
table . We could type cast to any of those .

-Ratheesh











\\> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
