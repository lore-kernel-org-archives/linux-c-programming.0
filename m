From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: pointer arithmetic vs. arrays
Date: Sun, 26 Feb 2006 15:29:39 +0000
Message-ID: <17409.51555.191516.793031@cerise.gclements.plus.com>
References: <44010CFF.5040806@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44010CFF.5040806@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org


James Colannino wrote:

> Hey everyone.  I've heard (and have also read in "The C Programming 
> Language") that pointer arithmetic in place of arrays is, in general, 
> faster.  However, I've also heard that modern compilers automatically 
> make optimizations that account for this difference.
> 
> In everyone's opinion, taking both readability and issues of speed into 
> account, what is better to use?  I'd imagine this would depend on the 
> situation.  Just trying to pick up better coding habits as I learn :)

In most cases, I'd recommend array indexing.

If something can reasonably be expressed in either form, array
indexing is usually clearer (both to read and to debug), and compilers
which don't optimise array access are rare enough not to be worth
worrying about.

-- 
Glynn Clements <glynn@gclements.plus.com>
