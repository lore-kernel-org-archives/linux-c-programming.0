From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: timer->result
Date: Wed, 29 Sep 2004 10:02:38 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E3066113853B@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Ankit Jain' <ankitjain1580@yahoo.com>, "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Cc: linux prg <linux-c-programming@vger.kernel.org>

> Ankit wrote:
> 
> /* this program must be linked with librt */

> if u can tell me the compiler and linker options for
> this program..could not ru nthis program

I am using gcc (version 3.3.3) on a RedHat Fedora 2 box.
I was able to compile the program (assuming that its name 
is time.c) as:

gcc time.c -o time_test -lrt

George
