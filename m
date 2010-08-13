From: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: strcut casts unsigned long
Date: Fri, 13 Aug 2010 09:23:27 -0400
Message-ID: <AANLkTiknw1_aCpyrb+S2AU9=k4-HazX8+NmGgkVUFaX0@mail.gmail.com>
References: <965738.16877.qm@web57908.mail.re3.yahoo.com> <AANLkTikAiKKtzMcpt14W3veeiOe1JV57RyfG3L1L=OPh@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=Jk/uhqKL+sz014Z6kF1US5FzCk0s73LTy5Xg7gf7crQ=;
        b=DDdOwF+Gc7+sb1GgFdxfdEgsES9K4BK1sbG4WO0inXELYK9Ykrak3pYA2k8rrtejZQ
         WSWcgLu/jh7tCb7yJs4e2rCqOZLU7p1sjxadsd746nxmKOk4UPd2XxImfmDXcj65YH/R
         Yl/ctFBwmrS2obIseHjeMMAiVGslu1NNnRuYs=
In-Reply-To: <AANLkTikAiKKtzMcpt14W3veeiOe1JV57RyfG3L1L=OPh@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

>>
>> I have C question on skbuff.h.
>> skb->_skb_dst is defined as unsigned long and dst_entry is struct.
>>
>> Why strct dst_entry casts unsigned long skb->_skb_dst?
>>
>> See below
>>
>> static inline struct dst_entry *skb_dst(const struct sk_buff *skb)
>> {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return (struct dst_entry *)skb->_skb_dst;
>> }

In the kernel, logical addresses are stored in variables of type
unsigned long or void *. Thats why _skb_dst is of type unsigned long.

>>
>> Appreciate any answer!
>>
>> --henry
>
> skb->_skb_dst can be a pointer to both destination cache or =C2=A0rou=
ting
> table . We could type cast to any of those .
>
> -Ratheesh
>
>

As Ratheesh said _skb_dst could be a pointer to two diferent data
structures, that is why _skb_dst is not defined as a struct type.

Best regards,

-----------------------------------------
Javier Mart=C3=ADnez Canillas
+595 981 88 66 58
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
