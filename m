From: B S Srinidhi <srinidhi-c@deeproot.co.in>
Subject: Re: amd64 :: SIGABRT in malloc()
Date: Thu, 16 Mar 2006 16:22:27 +0530
Message-ID: <1142506349.4517.33.camel@avirat>
References: <1142504931.4517.26.camel@avirat>
	 <44194021.3050200@bitdefender.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44194021.3050200@bitdefender.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

Thanks alot for the quick reply. :)

On Thu, 2006-03-16 at 12:38 +0200, Mihai Dontu wrote:
> Since you managed to get a stack trace (thus using a  program
> that malloc()-s on its own) you can conclude there is nothing
> wrong with malloc(). But there might be a heap corruption  in
> your program. Depends on what your program was  doing  before
> this.

Even I thought so, but this program has stopped working after a recent
(a couple of months back) update of libc6. So was wondering if that
could have caused this problem. I had no issues running this same
program in the older libc (sorry I don't remember the version of the
older libc).

The current version of libc is: 2.3.6-3.

Srinidhi.
-- 
ASCII ribbon campaign ( )         B S Srinidhi
 - against HTML email  X          http://srinidhi.deeproot.co.in
             & vCards / \         DeepRoot Linux

