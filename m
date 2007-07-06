From: yyy <yaoyy@rising.com.cn>
Subject: link error
Date: Fri, 06 Jul 2007 14:53:58 +0800
Message-ID: <1183704838.5947.14.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

When i link .o file to a dynamic lib, errors appear,
My link sentence such as:
g++ -g -shared -fPIC -o xxx.so xxx.o xxxx.o ....

the error such as:
`.L303' referenced in section `.rodata' of xxx.o: defined in discarded
section `.gnu.linkonce.t._ZN3ALT9TVSPrintfIcEEiPT_PKS1_Pv' of xxx.o

any one has any advice, i'm appreciate.



