From: "Gu, Zhongshu" <gzs715@gmail.com>
Subject: How to make every page of a process in the page table present?
Date: Wed, 28 Jul 2010 13:49:51 -0400
Message-ID: <AANLkTin8bzODztNO=qS2AAP5LULm9PSy1-c7gvN_brjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:content-type;
        bh=tZimGUA0Y3a6JWL/4zoBYKnt0SWB9e2cNo+RArJ3VOs=;
        b=MlZWvR9yOkcsPOdd2dpJ/nOcsWZW/uSOAuF9C0gs0oDXCr/WQrTKyxroNCAR+w5sdp
         Baupro1M7L346rI/xbnvKswNHwL3LmDg7WEw7DV+dI2pyin6WFTDGkj026FeJ0Rb2m6S
         TnzYkHTjk5dY15Ssp6f5AzYIa5K5457IBs0q8=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

Hi all:
i compiled a static program using gcc on linux and run it under kvm. I
checked every page table entry of this process in guest memory and
found that some pages have been mapped and some ones are not. Is this
the feature of on-demand paging?
My question is whether there is a solution to make all the pte present
and mapped in the page table?
E.g. i fork a new process and load a new elf binary, how to make every
page mapped in the page table of this new process.

Thanks
-- 
Zhongshu
