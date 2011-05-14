From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: message queue for two processes.
Date: Sat, 14 May 2011 21:10:11 +0530
Message-ID: <BANLkTi=qk90bwxyG-_CKpqpfzz-Y5PMXMQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=KFQclXmN+MTPvqe9B+sOWfmiJo3c51rXXB0+AwLHq0w=;
        b=CsFKS0dbG+MMdy6HvhFn4IIac6Jm/+AGdXndX/bSOw01YkwiWQogoH9zCe9vywaxzb
         uKThXKIux1tBWE12A0MDj/TpqIIFXo4s1ak3aDkC134TD9dgBYzF6iRS7GnlpGJNX9Wp
         yebjVTfzXYygmXoJeE+bZJfskMSKt0pccbczg=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

There is a server (say A ) and two clients ( say  x and y ). These are
communicating thru message queue mechansim.  They are using same
message queue and different id to communicate.
i read like  -when a message is read , this will be removed from
message queue. Then, how can process x can read  only its intended
messages ?


-Ratheesh
