From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: proper declaration/definition of inline functions?
Date: Tue, 2 Aug 2005 15:02:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0508021501100.29269@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  what is the proper usage of inline functions?  would you first
declare it inline in a header file, and also define it inline in the
corresponding source file?  (yes, i know the compiler is under no
obligation to inline them ... i just want to know the canonical way to
use them.)

rday
