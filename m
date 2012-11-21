From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: cat a /proc entry
Date: Wed, 21 Nov 2012 09:34:09 +0530
Message-ID: <CAGZFCEFaWrXMDAjCrXipiPyLxeWaQzGgn=GtLZhFHDwdrMAHcw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=axuYWrn0p9QbpUAp+xBU9i75tYytKDxz0fgDokU+1EI=;
        b=XZCgYRmyfKkgnqtRme9KW9VpynzwHROE5Bkdqz0BIZoqFSzFF96Gesnj/+z/sHa1DB
         Cy+bAusuoJ+JAJlIjoS0tdmHM684Q75H4bJC+mcE7IagpAk5h/GS6dAgs6dGMvfXKqig
         1HGUs1Rf4jjKr81Rea2g4GACa4awNM7fbKFgelibU1/epj5TmORD53p4VbUpYZ5BNr0F
         dz+camQEC5u2u7v8MSfnHC0/WLDjaGymHJUhHgnaNrBTEzjDYdP9/OUDm+CQhnXShm8u
         Q7jzbPH8+YvhjQOwN63Qq475tFYipv4V/emCDkBXPr/T+tFu6INOychB/NJLhKd6u3sA
         WmpQ==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-newbie <linux-newbie@vger.kernel.org>, linux-c-programming@vger.kernel.org

Hi,

is there size limit on the buffer content as i am using  "cat" command
( so ,not allocating any buffer in userspace, so not doing any
copy_to_user from kernel; simply doing  sprintf(buffer, %s , data )
from kernel  for a big data  )

-Ratheesh
