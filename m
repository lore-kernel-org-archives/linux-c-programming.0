From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: parse error
Date: Sun, 26 Sep 2004 15:32:52 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040926143252.39003.qmail@web52902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

hi

i could not understand why compiler has put semi colon
before else due t owhich this parse error comes....

thanks

  
#define exch(x,y) { int tmp; tmp=x; x=y; y=tmp; }

However that wouldn't work in some cases. The
following code is meant to be an if-statement with two
branches:

  if(x>y)
    exch(x,y);          // Branch 1
  else  
    do_something();     // Branch 2

But it would be interpreted as an if-statement with
only one branch:

  if(x>y) {                     // Single-branch
if-statement!!!
    int tmp;            // The one and only branch
consists
    tmp = x;            // of the block.
    x = y;
    y = tmp;
  }
  ;                             // empty statement
  else                  // ERROR!!! "parse error
before else"
    do_something();


________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
