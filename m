From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: pthread_once
Date: Wed, 22 Sep 2010 19:01:33 +0530
Message-ID: <AANLkTi=Vf3_GZHY7njqezmZNkmqvF6+NLXLc_WTmZtzU@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=6PoGgM0PTzUr8kR3fXHOG4ZeBJbWGdJJ8IyOmudSpWE=;
        b=n9sdtadT+Eelhzf6QMcZ0pbqEju3jCXbqZJ9FHlO+p3VKOaAGLsAsambvrCwjvc+wt
         kKp56Mdvg9FPpyO1bPAE2wiuOP+WtkdmARqPyRIgcfaQzDiR3cKMF6rWuGzQbmgRhqYf
         hG3duLtJscYRLfKdp50wuuJ3qIZhevY/Sr0xI=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org, linux-rt-users@vger.kernel.org

I have an embedded box running 2.6.18 linux with rt patch.

I am developing an  userspace application which need timer_create() .
I have a big desktop machine with a 4 GB ram, running only linux
2.6.18 ( not rt linux ) . I would like to compile and test it on this
Desktop PC .

I compiled my program and linked with librt.a on my Desktop PC. But
when i run my program , it says

undefined symbol: pthread_once

what could be the problem, ???
