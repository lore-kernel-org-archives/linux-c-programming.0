From: Eric Bambach <eric@cisu.net>
Subject: Re: why is "no newline at end of file" a warning?
Date: Thu, 28 Jun 2007 23:52:13 -0500
Message-ID: <200706282352.13703.eric@cisu.net>
References: <46844620.4050902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46844620.4050902@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On Thursday 28 June 2007 18:37, Shriramana Sharma wrote:
> Hello.
>
> gcc (and so many other *nix utilities) often give a warning (sometimes
> even an error) if there is "no newline at end of file". I would like to
> know why this is such a serious issue that it deserves to be called a
> warning (or an error).

I think it warns because a file with no newline could have possibly been 
truncated. Or at least thats what I heard somewhere someplace a while ago :)

> Shriramana Sharma.
>
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Thanks,

Eric
