From: QingHua Wang <qhwang@ieeta.pt>
Subject: program killed
Date: Thu, 14 Aug 2003 11:07:47 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200308141107.47697.qhwang@ieeta.pt>
References: <Pine.A41.4.20.0308132043580.88086-100000@delfin.unideb.hu>
Reply-To: qhwang@ieeta.pt
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.A41.4.20.0308132043580.88086-100000@delfin.unideb.hu>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi there,

Can anyone give me some hints about why my program is killed by system? I am 
now debugging a program but after it runs for a while, I got a message saying 
"Program terminated with signal SIGKILL, Killed". What's the causes? 
Memory? I am the only user since I disconnected the computer (64 MB RAM) to 
the network.  Last night I also run my program on my laptop (256 MB RAM), it 
worked well when I used a part of data set (image). With the whole data the 
program also got killed. I checked the syslog and found "VM: kill the program 
XXX". I used MALLOC_CHECK_ but there is no memory abuse. Any suggestion?

Many thanks in advance.

QingHua
