From: =?iso-8859-1?q?Ankit=20Jain?= <ankitjain1580@yahoo.com>
Subject: Memory Allocation Problem
Date: Wed, 15 Sep 2004 07:02:37 +0100 (BST)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20040915060237.55405.qmail@web52910.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <gcc-help-return-17890-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gcc <gcc-help@gcc.gnu.org>, linux prg <linux-c-programming@vger.kernel.org>

      1 #include <stdio.h>
      2 int main()
      3 {
      4    double a[1450][1450];
      5
      6    a[1449][0] = 999;
      7    printf( "%lf\n", a[1449][0] );
      8    return 1;
      9 }


it gives segementation fault

if i use malloc also it gives wrong result

what to do?

ankit

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
