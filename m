From: p.boehm@d-trust.net
Subject: Antwort: Re: Antwort: Re: -EFAULT during freeing a pointer to a structure
Date: Fri, 8 Oct 2004 14:27:11 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF9FBCFEF1.D1EE727C-ONC1256F27.0043E708@bln.d-trust.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org


sorry, but it isn't a problem of loop. check this while running the prog...

test one:

     #define MAXNUM 7
     compile it and run ...
     you'll see while freeing ptr->next[0] an -EFAULT occours.

test two:

     #define MAXMUM 8
     compile it and run ...
     you'll see freeing ptr->next[0] works fine.

my question: why it is so.

thanks
pb

