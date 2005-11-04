From: "jywang" <jywang@cnic.cn>
Subject: how to replace a skb in NF_IP_LOCAL_OUT hook
Date: Fri, 4 Nov 2005 08:27:26 +0800
Message-ID: <00e301c5e0d6$888751c0$060ae29f@javaboy>
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

> i want to replace the skb with my own, and in my skb i will change the
data
> in it.
>
> How to do it?
>
> what i do as below:
>
> cp = skb_copy_expand(*skb, skb_headroom(*skb)+12, skb_tailroom(*skb),
GFP_ATOMIC);
> //change the skb->data here
> skb_set_owner_w(cp, (*skb)->sk);
> *skb = cp;
> return NF_ACCEPT;
>
> but, it can't work.



