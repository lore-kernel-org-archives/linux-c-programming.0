From: Vadiraj <vadiraj.cs@gmail.com>
Subject: time system call expensive?
Date: Thu, 21 Jul 2011 10:11:14 +0530
Message-ID: <CA+NBAy6499cgdzwGuPk6h+Y3D-DxEHP2HEKjtNAgis7K4RTKig@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=6XLfra8A2cRIAR8eTsjyKO8KintqCACnOEDf2vrNBhM=;
        b=nt3B9P3Xc6SUpUEi75nFgyd7mlRp0MWukb53n5R9DO4fcZWbXSoQFcfvXLdosdhq46
         WZ/eLL3zBtpmDgc6mJa15e3mNegNjuFKdFHtNLO3JuTsUvSnM0tguDjtsISr5H4Dyja+
         Inh0omPErdOv7xtg6y3c+TXhdLaPI5XS2D2Gc=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi All,

I'm evaluating time consumed by method. I'm using time(NULL) system
call to capture time before and after the call to the function.
Just wanted to know if this has a considerable performance hit? For
all I believe time syscall is quite optimized and should not really be
matter of concern.

Please let me know if someone have evaluated time(NULL) system over head..

Assuming the method I'm evaluating is a frequently called method.


Thanks in advance.

Regards,
Vadi
