From: ern0 <ern0@linkbroker.hu>
Subject: Re: Slow signal delivery to server process with heavy I/O
Date: Mon, 12 Jul 2010 09:06:49 +0200
Message-ID: <4C3ABF09.3090808@linkbroker.hu>
References: <AANLkTimehfszGlcsKm4wt2byyNTb8cGD7DQSBK_W2Ome@mail.gmail.com>	<19513.50328.712544.577528@cerise.gclements.plus.com>	<AANLkTikkVpOnl5DQ8wPm9OIDR70YcTI-LVf9KACK39In@mail.gmail.com> <19514.33382.135366.743597@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=B5vs9wCt7dcnXgMQOjEtH4MA+d50OdkSuG1pEGLPFaw=;
        b=rc3YW9hHcLtznmYsAEUV/5DNEZP10kpQ346i1/RJXTzUvTe/yW902Csd0UyhS9r6B8
         zlxi4X6UzaSegs17/yJmHcHGXHeBDE2B7NgM1FcISTKAHY1j5EgyUobCc40jBCdkJfd8
         HbcftblToPCOR/V7f4bbwJD8XApEYOmFCG004=
In-Reply-To: <19514.33382.135366.743597@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

> The kernel selects one thread which hasn't blocked the signal.

So if you want to catch signals ASAP, is it a good strategy to
- leave one thread for signal catching, it may perform sleeps;
- other threads should block all signals?
-- 
ern0
dataflow programmer & evangelist
