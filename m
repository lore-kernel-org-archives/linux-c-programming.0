From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: printf *%f
Date: Wed, 12 Jan 2011 13:09:08 +0530
Message-ID: <AANLkTikSFEK-5m0a1mFKbyFRwA7wNqTkzejbLEv_-=73@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=tRMgvwI94SwQ8h+vKkabEYJEuuD1eJrTjYsxxQBLukw=;
        b=s3clYNmi23LLWgfIHeDrF7ii6Y4kXMBljjqusa5YcH4MOqxnRVVcnKwhs5vLuAF8y2
         iNNH2PZFByVbwkMHv8MVr/MwH/aTnSemEKsguxuGpe/MSv8Bwg18jkFmCTBoR1yQnAAf
         IgAvHiJF6kuleWVwf7Hmm54OiOD2GWuUr/DCM=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

double x=45.9876 ;

printf("%4.2f" , x); is working fine ...  But printf("%*f , 4.2 , x) ;
behaves odd in my  fedora 8 pentium machine. any clue ?

Does *  substitute only integers ?


-Ratheesh
