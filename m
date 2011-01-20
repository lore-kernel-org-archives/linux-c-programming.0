From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Dynamic linking library
Date: Thu, 20 Jan 2011 17:07:25 +0530
Message-ID: <AANLkTinrAZgHcpjbdYt53y+wqK4F9OBUH8PtMyxvwXEO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=rSB0taTQHafoH6M+j/FHDjMbMtailQzUTesYKZva2PY=;
        b=P1baWeWq7ESwfsrA746ISZO5X1e+XENGTpGTnY/lSVgWpPpmwS9B92Zum+sGo8WD74
         hqjYzCRnvuUw8w7vuFSfy/fSWMxuSbk+FDNZ4ItmfzGpZXbuGJuM0rL3W08FLfaHLSnI
         sA0wcnhmxIILsUPW6w4QmCJ0NvuXhCOqc75HI=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Suppose there are two executable elf . say A, B . And these two are
using  libctest.so.
When A is executed  libctest.so is loaded into RAM and linear address
is  correctly mapped.

If we execute program B after A ,  will library will be loaded again ?
else, how OS know that libctest is already loaded into physical page ?
(so it can  map linear address to it )

-Ratheesh
