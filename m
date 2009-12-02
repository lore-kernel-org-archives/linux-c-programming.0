From: Toan Pham <tpham3783@gmail.com>
Subject: Dynamic make target
Date: Wed, 2 Dec 2009 12:49:35 -0500
Message-ID: <ffb2c0280912020949i3db06e02i118df36e13aaaf41@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=cwyqGCnxfLC7rfQhdZ9GwV2uFFyT5i0lMW1s8tfkt3o=;
        b=BntGEReIOuU11Xa6MdRnaKLZxaz7UErtWXWgedk8XVbnkbGJ/QHQHSYQu3ol+aSpRq
         vjRD+HOxTNHNiyLh+mnBwAKXBPoduO2yHlLQlKRbkq17JwFYvtcy0O4sMg4NB08EwTbJ
         Li4Nj9fZtiIiegPovNuTB9qDifjB9VfB1N5vo=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

hi all,

I do not know where to ask this question perhaps this mailing list is
best because it had to do with c complilation.

I would like to set up a make target dynamicly.  for example

when one issue command:  make sda1
it auto compile and install to a mount point @ /mnt/sda1

similiarly: make sda2 would compile and install to /mnt/sda2


i know that in a makefile one can accomplish this by setting up two targets, ie.

sda1:
       make all
       mount /dev/sda1 /mnt/sda1
       cp releases/* /mnt/sda1
       umount /mnt/sda1

sda2:
       make all
       mount /dev/sda1 /mnt/sda2
       cp releases/* /mnt/sda2
       umount /mnt/sda2


i am curious if we can simplify everything by having a make target
like this when no matches found

$param1:
       make all
       mount /dev/sda1 /mnt/$param1
       cp releases/* /mnt/$param1
       umount /mnt/$param1

thank you,

Toan
