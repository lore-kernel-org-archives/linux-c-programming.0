From: johan.nilsson@esrange.ssc.se
Subject: Multiple interval timers
Date: Thu, 27 Jun 2002 08:22:43 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <52F988443B24E4449AB186EDCB1C79B5644F17@ratatosk.esrange.ssc.se>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

is it possible to set up multiple interval timers using setitimer, and be
able to differentiate between them in the signal handler?

Using timer_create (POSIX) I'm able to pass extra data to the signal
handler, but I can't find a way of doing it using setitimer. Unfortunately
timer_create, timer_settime etc doesn't seem to be implemented under linux,
at least not without a patch.

// Johan

