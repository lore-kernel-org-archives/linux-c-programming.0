From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: same pid ?
Date: Thu, 10 Feb 2011 13:22:41 +0100
Message-ID: <op.vqosn2a93l0zgt@mnazarewicz.zrh.corp.google.com>
References: <AANLkTincdyMFR2Yb-HVvKmqoVTyTvSXweM5K_WLzFijC@mail.gmail.com>
 <AANLkTim1woaCE=eMNZFSOjAOOm9XJJ_OVobSoGTKnq_o@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:subject:references:date
         :mime-version:content-transfer-encoding:from:organization:message-id
         :in-reply-to:user-agent;
        bh=dSRSXk2CjJGYSmsc1Rc0FGF2WKDHc6GnjQoLlg4ieEs=;
        b=r0QtHIuVaa1wMbvGtmQzrt91q7flhnwEE9KO+RF/PNloLhklZ1XgQYf9GA4neahzYQ
         vli70nFmTX85hVwgyo1jtr36jQy0DaWz66NjdxQMEArqReU6JZ4uvRuu9V31LiBJ6hTF
         wCNX/8adPO87DuOydmRzZruXWsOzjy6JUjwuI=
In-Reply-To: <AANLkTim1woaCE=eMNZFSOjAOOm9XJJ_OVobSoGTKnq_o@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org, ratheesh k <ratheesh.ksz@gmail.com>

On Thu, 10 Feb 2011 12:37:25 +0100, ratheesh k <ratheesh.ksz@gmail.com>  
wrote:
> i created two threads with pthread library. But both threads returns
> same pid with getpid() function. ???

PID is a Process ID.  All threads in given process have the same PID.

-- 
Best regards,                                       _     _
.o. | Liege of Serenly Enlightened Majesty of     o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz  (o o)
ooo +-<email/jid: mnazarewicz@google.com>--------ooO--(_)--Ooo--
