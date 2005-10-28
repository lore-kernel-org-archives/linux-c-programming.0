From: Christoph Bussenius <mail@der-pepe.de>
Subject: Re: Pointers to int
Date: Fri, 28 Oct 2005 18:09:20 +0200
Message-ID: <20051028160920.GF6673@opaque.pepe>
References: <4362255E.90303@racsa.co.cr> <20051028160530.GE6673@opaque.pepe>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051028160530.GE6673@opaque.pepe>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Cc: Fabio Andres Miranda <fabiomiranda@racsa.co.cr>, linux-c-programming@vger.kernel.org

On Fri, Oct 28, 2005 at 06:05:30PM +0200, Christoph Bussenius wrote:
> As postincrement (++) has higher priority than dereference (*), p++ is
> what will be evaluated first.  So p will be incremented by the size of
> an integer (probably 4).  After that, p will point to the second integer
> of the array, i. e. array[1].  Now you use * to access that very
> location and store j-8 there.

Sorry, I was mistaken.  As the result of a POSTincrement is the value
before incrementing, the result will be like:
*p = j-8;
p++;

Christoph

-- 
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
