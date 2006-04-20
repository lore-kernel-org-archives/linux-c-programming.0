From: ronaldo.afonso@avocent.com
Subject: Serial Reading
Date: Thu, 20 Apr 2006 10:17:08 -0300
Message-ID: <OF6B1B71E6.FB0713A3-ON83257156.004830D6-83257156.0048FB31@Cyclades.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org





Hello all,

I'm trying to read data from a "tty" one character at a time. I'd like that
when a single byte was inputed on one side of my tty, it imediataly must be
read by my user space program on the otherside. It is not happening in my
environment and I belive the cause is a buffer in the tty driver. I'd like
to know if it could be happening, I mean, could a tty be buffering data
before send to user space, and if so, what can I do to inform the tty
driver not buffering data anymore?
Thanks.


====================================================
Ronaldo Z. Afonso
Software Engineering
Avocent Corporation, formerly Cyclades
ronaldo.afonso@avocent.com
Phone: 55 11 5033-3361
Fax: 55 11 5033-3388
www.avocent.com
====================================================

