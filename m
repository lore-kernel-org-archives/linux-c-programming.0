From: Wrazlov <wrazlov@gmx.net>
Subject: Building a program "static"
Date: Tue, 29 Oct 2002 10:00:17 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200210291000.17896.wrazlov@gmx.net>
Reply-To: wrazlov@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,
I tried to build a program to be static, but it always says that some library 
was not found, altough it works very well if it's built normal (shared):
gcc -L/usr/qt-3.0.4/lib -lqt-mt -static program.static program.o
ld says: "-lqt-mt not found"
What's wrong with the linker-options?
 Thanks for helping...


