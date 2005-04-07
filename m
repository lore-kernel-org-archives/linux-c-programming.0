From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Multithreading with C++
Date: Thu, 7 Apr 2005 14:52:54 -0400
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3679@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Cc: linux prg <linux-c-programming@vger.kernel.org>

Eric wrote:

Did you compile with -lpthread and -D_REENTRANT? If I remeber correctly, this 
is something I had alot of trouble with when I started thread programming. 
Similiar error and everything. Compiled but the library calls weren't 
working. Make sure to include <pthread.h> too  ;)

yes included <pthread.h>, defined -D_REENTRANT and linked with -lpthread

I have written multi-threaded code in C, this is the first time that I have attempted 
to encapsulate a thread in a C++ object.  Must be missing something. :-(

George
