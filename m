From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: User mode linux- kernel module
Date: Sat, 17 Jul 2010 22:13:59 +0530
Message-ID: <AANLkTin-xKyGFy9pFAtXs-PTJYWLvQ66zdHA7Wvv8bSq@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=VfZJt4b9H2N3MhSkxV+j0SHJPEFt2rHRxk69GgDBVdw=;
        b=w9oRV00nJsu3O5u4VqpVqiMVD5vhMfYT7Um+zjfSEvDUNUHjeZpE51IH5MxEHnOOlN
         oxVQHttjKI8sQvr/m098/1bHQ1ObfRkYWG2pviPdrOGNFkIa+iYiji3nFsswQmd5O0xM
         ClAJ83eXh4xY8cd4Q9qqAy4hNK4b02+mealZM=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org, linux-newbie@vger.kernel.org

Hi ,

 i have ubuntu linux  on my 64 bit machine . I have successully built
and  up an instance of UML  which is 32 bit . I am able to establish
networking also .

 I would like to build a simple hello world kernel module on host 64
bit machine , which should be loaded in UML . How do i build the same
?

Thanks,
Ratheesh
