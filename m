From: Glynn Clements <glynn@gclements.plus.com>
Subject: RE: Custom defined object in a signal handler
Date: Thu, 29 Mar 2007 04:21:12 +0100
Message-ID: <17931.12456.535437.727595@cerise.gclements.plus.com>
References: <17931.925.199685.326663@cerise.gclements.plus.com>
	<460b06e1.2894bac9.6e94.23cd@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <460b06e1.2894bac9.6e94.23cd@mx.google.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sreevathsa <sreevathsa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Sreevathsa wrote:

> I am working on a multithreaded application in which, in one of the code
> paths, multiple threads need to setup a SIGALRM signal (to achieve TCP
> retrasmission kind of functionality). When each thread does this, it also
> need to pass the address of the structure that it operated upon, so that
> when the signal is delivered, the signal handling thread will know the
> address of the strucutre and can act upon it.

Signal handlers are per-process, not per-thread; only the mask is
per-thread. Likewise for timers.

-- 
Glynn Clements <glynn@gclements.plus.com>
