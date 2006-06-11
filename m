From: James Colannino <james@colannino.org>
Subject: Undefined reference to 'fmod'
Date: Sat, 10 Jun 2006 21:35:49 -0700
Message-ID: <448B9DA5.7050708@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 

Hey everyone.  I included the math.h header, proceeded to use fmod(),
then got the following error:

/tmp/ccKQxpJi.o: In function `main':
04-03-calc.c:(.text+0x144): undefined reference to `fmod'
collect2: ld returned 1 exit status

Does anybody know why it won't link?  fmod() is a part of the standard
library.  This makes me very frustrated :(  Thanks very much in advance.

James
