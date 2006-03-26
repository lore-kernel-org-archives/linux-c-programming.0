From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Integer arithmetic vs double precision arithmetic
Date: Sun, 26 Mar 2006 17:12:11 +0100
Message-ID: <17446.48475.703425.729255@cerise.gclements.plus.com>
References: <200603262044.37068.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603262044.37068.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> I am trying to work out whether to use an integer or a double for my internal 
> storage variable of a class meant to store a time.
> 
> Qt uses an unsigned integer with millisecond being the best precision, but I 
> am wondering, why I should lose the extra digits of precision that I could 
> get if I used a double.
> 
> Is there a marked increase in computing speed if integer arithmetic is used 
> compared to double precision?

It depends upon the architecture, but a double could be a lot slower
than an int.

-- 
Glynn Clements <glynn@gclements.plus.com>
