From: Chuck Winters <cwinters@atl.lmco.com>
Subject: Sound Programming and Signals
Date: Thu, 13 Jun 2002 15:41:08 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020613154108.A26285@atl.lmco.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I am trying to write a program which get a SIGIO signal from a
sound device, and then selects on the fd to decide if the device
can accept write, read, exception data.  The problem is that
it doesn't seem like the device every raises a SIGIO signal.  If
I do a kill -SIGIO <test_pid>, my handler runs.  Anyone have any ideas?

Chuck
