From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: fakeroot implementaion
Date: Tue, 8 Jul 2014 17:14:01 +0530
Message-ID: <CAGZFCEFu_8kYCH_Jd_+c7oKhhT80ZX=WR6BWMwsUMrEutjSr7w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=LSDMQW21MGU2B/lcnEaOAT8VuLkzMbL0WK/e5c4MYsg=;
        b=c7q1FE20w1NBDMPZaMduZ3faZMxDeE7jty71qt81t4Rz/rAUZWOOk69h4nfJhzQrfq
         6GW7Dlgb94AGdI9kZyhmfDgDZXa5V3G9FopAZ5ng1Ka0agJ4zI1sf6ukz04nbvvL7LCi
         do2ED0/gEaN0vANgqh+oWFKSxUOAnYBRQnyM/K8QIXKhLh18adV0mieAIVEEIxP+ZzP3
         cZCwhd539AgZx4SF3fJ9qqeefNlCJ7XFA+zl4x4G6WqEZd9wWY5BlCh+1kostIRYT/AO
         UmIkZPJlJ9fy8dxuF7keHm132XSznTQxJguQGalApplFh+mdU98mB7EPoMkQEvXrjLKR
         5Oqw==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi list,

1. where is the  "fake" owner info is stored in inode ?. i could see
the file ownership of a file as  "root" form fakeroot shell ; but is
different from other  host shell .

2. Does fakeroot runs any daemon process ?

-Ratheesh
