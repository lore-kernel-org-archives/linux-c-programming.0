From: "J." <mailing-lists@xs4all.nl>
Subject: printf(), aligning fields
Date: Sat, 23 Aug 2003 22:31:26 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0308232217220.23476-100000@hestia>
References: <Pine.LNX.4.44.0308222010400.17321-100000@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0308222010400.17321-100000@praktifix.dwd.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

I am trying to print collums from a c program, as the
following example illustrates:

  Total  Number   Folder
  -----  ------   ------
  15502   17      cronlog
  189897  42      linux/debian-curiosa
  161751  32      linux/debian-firewall
   4305   1       linux/debian-general
  17431   1       linux/debian-news
  107517  1       linux/vger-kernel-announce
  61136   16      linux/vger-kernel-c-programming
   8580   2       linux/vger-kernel-gcc

How can I can align the output to the max right field boundry without
overcrossing that field boundry if the field value gets longer?

Do I really have to check the length of the value before printing it with,
%*s, and then determine how many spaces I need? 

Thnkx...

JM

