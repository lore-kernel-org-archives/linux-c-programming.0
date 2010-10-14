From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Multiple shared libraries.
Date: Thu, 14 Oct 2010 18:26:23 +0530
Message-ID: <AANLkTim05jXryypVSyQYChuUK_Y3X8Mg63fSq-w7E+G_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=PYrfbhtTBsCK6NMvq/aDYlnvxzeeJ+0mq5cfBGlpNFs=;
        b=DG+E41xAQs1x2FIvJu+Cuia59n0UlfPsPjWVWjHdnoYV6w+53Hqj1WBWh4c0OzW/8E
         MCx7nfTX9aXMDEo5aVMB9+urdVPY/v4L2lvFN7WfquDLLsP1i5IuP8LehKGbX0vEiHkx
         zxcx6lmNiCmSZ9ETLJmmJylbY0HSj/K5/nZfg=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I have 3 libraries  , say A,B ,C .

C is first compiled as shared library with -fPic option.
B is using C. and is also compiled with  -fPic option.

I buit library A.  in A , there are calls to function implemented in
B. A is also built with -fPic option.


I  coded an application say x. X is linked with library A
dynamically.  X is called function in A. When i run the program , it
says "cant resolve symbols " for those functions in C .

i tried linking   X with A, B and C with no result . Any clue ?
