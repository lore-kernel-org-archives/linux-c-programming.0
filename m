From: SVisor <svisor@lycos.com>
Subject: How to suspend a thread (without pthread)
Date: Wed, 25 May 2005 08:11:11 +0200
Message-ID: <d714qk$8iu$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

As subject says,

I need to suspend threads (for locking purpose) but I do not want to use 
Posix threads library (pthread). Neither do I want to access __KERNEL__ 
protected parts of the kernel API.

There must be a user accesible API for this. The nearest Ive found is 
sched_yield( ), but it just moves a thread (process) to the end of 
run-queue.

// Jarmo

