From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: malloc
Date: Mon, 20 Dec 2010 10:09:46 +0530
Message-ID: <AANLkTi=y+++cekRzdH5WMNWOyRg1=TaA6eAeq1dL9+A0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=0zH3+3uYEfSME7dsaPU8vmgTh2cTqFmU+0Xw7D5Ln50=;
        b=RztMLCZv7A4GINyz69cuF4xIkhUmS6WTHCbeAquuQ7cy7EgK/ebZqoDAi/t+aOVS63
         2ynUfPvgllT3fzCGKyftkso/LCCDMIYd1xSACW/S5xzsHTegIgZx3EhoCfDsWzzxExMn
         RWLLwb8ThIt5mjKACQKpeR/mZ749NXBj3RaH0=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Is the below statement right or wrong ?

malloc tries to allocate continous memmory space in virtual address
space.  not in physical address space.
