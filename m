From: "Ramanan, Venkat (MED)" <Venkat.ramanan@geind.ge.com>
Subject: Debug flag for libraries.
Date: Tue, 1 Jul 2003 11:23:09 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <DD9E117A8BE9F34FA4130376EC9C1F6A048B48B7@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,

I need to compile a program with the debug flag "-g". The program uses some (static) libraries which have already been compiled without the "-g" flag. So, if I need all the debugging information ( line numbers etc. ) even from the libraries, do I need to recompile the libraries? Or is the "-g" flag just for the program, enough to bring all info?

I use "gcc" and "gdb".

What is the "correct" thing to do? Any advice would be greatly appreciated.

Thanks in advance,
Venkat.
