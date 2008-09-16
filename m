From: "Xu Yang" <risingsunxy@googlemail.com>
Subject: looking for a function
Date: Tue, 16 Sep 2008 15:26:33 +0200
Message-ID: <ab40e9c0809160626o1cc6e7en5e09650a1d04affe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=EViVbmTSkIU1F9/MCyTrqW63Fk/ow0IaNdvvhXolUvM=;
        b=vx6f87a0Q1Vwo154xlWN/8z6QEN9BSRRro4aIB3SA0s7bQ8azGek7kO6hcJTlF7X/k
         No++04LM94nyyEA0MjsivgmyHJLg00idmgYreyN98PW4q3H3QSkryCfuyPfz+ubUhe4A
         gTk2ggm819tlXuvewFAYoL3JyF3mrmSLTCQEY=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi guys,

I am looking for a function that can show me the current thread is
running on which cpu.

e.g I am using pthread to write a multithreaded program, in each
thread I would like to insert such kind of function so that I can know
on which cpu this thread is running on.

which function should be used?

thanks for the help!!

best regards,



Yang
