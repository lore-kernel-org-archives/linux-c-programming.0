From: Billy O'Connor <billy@oconnoronline.net>
Subject: Re: error in system call
Date: Fri, 14 Jun 2002 00:59:21 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020614045921.85CA689@dps7.oconnoronline.net>
References: <LFEIJFMKHCJIHBFOGINPGELPCBAA.elapus@ntsp.nec.co.jp>
Reply-To: billy@oconnoronline.net
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <LFEIJFMKHCJIHBFOGINPGELPCBAA.elapus@ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elapus@ntsp.nec.co.jp
Cc: linux-c-programming@vger.kernel.org

   while ( (pid = fork()) < 0 );

   would result to an infinite loop if 
   such limit is reached.

   >>I COULD BE WRONG WITH THIS<<

No, I believe you're correct.  I'd at least do:

   while ( (pid = fork()) < 0 )
   	 sleep(n);

--
Billy O'Connor
