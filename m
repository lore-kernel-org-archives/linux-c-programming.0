From: "Earl R. Lapus" <elapus@ntsp.nec.co.jp>
Subject: malloc
Date: Mon, 17 Jun 2002 14:26:27 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <LFEIJFMKHCJIHBFOGINPCEPJCBAA.elapus@ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-prog <linux-c-programming@vger.kernel.org>

hi,
   I tried doing this:
       ucp = (unsigned char *) malloc(0);
   it was successful and returned a valid address. I was kinda hoping
   it would do something weird...When I looked at the man page It said 
   something like.. "If your application needs to generate empty objects, 
   you may use malloc(0) for this purpose..."

   So my questions are:
       What do you mean when you say EMPTY OBJECT?
       Does it ocuppy any memory storage?

=========================
 ...what i want and what i need
 IS and WILL always be FREE...
                    -brandon boyd-
=========================
