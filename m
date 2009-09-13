From: Alessandro Pignotti <alexpigna.dev@gmail.com>
Subject: Using PAT features from user space
Date: Sat, 12 Sep 2009 18:20:52 -0700
Message-ID: <95b4a97b0909121820m2c912878t6b7cbff7f4fbacd6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=xYHTuh5bBlnzye74NpZPcBj6BFu0QR8KFiZ6lxS4RU4=;
        b=H5r00AKg7ywL+il8e4oMq2mGFXlW7Hm/xs8vU+9MpJvDlxgsL29VnwSPQg1eiQt7hw
         kQigrD/PKoK/PtjuGB00+hRqGewPc2kV4wBTeo9dQwVFzT4XMmQcrVqz1FPeNA3dRhgi
         2jTdOL6mDe0RBK1hSAyhBcf79mdRMfcsiFLfo=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi everyone,

I'm writing an high performance application on x86-64 that allocate
some memory to store a write only journal. I was wondering if there is
a way to ask the kernel to mark such pages as write combining memory.
More in general, it's possible to use PAT from userspace? I was
expecting some mmap flag like MAP_NOCACHE, but there not seems to be
any such flags.

Regards,
Alessandro
