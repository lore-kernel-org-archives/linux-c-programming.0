From: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: System hang at high bandwidth
Date: Fri, 26 Mar 2004 01:05:28 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0403260056310.4797-100000@csews72.cse.iitk.ac.in>
References: <1080048682.7452.69.camel@one.test.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1080048682.7452.69.camel@one.test.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kanth@cse.iitk.ac.in
Cc: linux-c-programming@vger.kernel.org


Hi, 
  I am using linux 2.4.20-8 smp kernel on a dual processor Xeon 2GHz 
processor with 4 Intel PRO 1000 MT Desktop adapters. I am using latest 
version of e1000 drivers with NAPI enabled. I am facing a problem. I want 
to read packets from one NIC and send them to one of the other three NICs 
based on some hash function. When I try this experiment at high speeds 
(>250 Mbps) using either raw sockets (application level programming) or by 
writing a kernel module for IP_PREROUTING_HOOK, my system is hanging. Can any one please help me out 
by telling some possible reason for this and how to get rid of this.
   Is it OK to use 4 NICs simultaneously at such high speeds.
Thanks in advance,
Ananth.    

