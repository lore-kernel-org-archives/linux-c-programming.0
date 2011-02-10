From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: same pid ?
Date: Thu, 10 Feb 2011 17:07:25 +0530
Message-ID: <AANLkTim1woaCE=eMNZFSOjAOOm9XJJ_OVobSoGTKnq_o@mail.gmail.com>
References: <AANLkTincdyMFR2Yb-HVvKmqoVTyTvSXweM5K_WLzFijC@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type;
        bh=ROlHuontPy8rasQWWcX6DBYLHwVGG3Zsx1+wXGhc67Q=;
        b=NTtk5tdnYQr/c1AolE5k21H1GdgIHb3pli3rTq2hdlWKiBWk9JFejcEuSslgZNoJR/
         DVQ7pqcx4Zc6Ct8MH6v1qBI1DTZubS/1z+rAf7hia4WFMIeKMDCWP6HbRGnYrHsUPja7
         hicnlmWmZM5XGkOnjfkVrNnNLwxo/H23EOu8s=
In-Reply-To: <AANLkTincdyMFR2Yb-HVvKmqoVTyTvSXweM5K_WLzFijC@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

i created two threads with pthread library. But both threads returns
same pid with getpid() function. ???


-Ratheesh
