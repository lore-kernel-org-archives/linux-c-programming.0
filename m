From: Mehran Rezaei <mehran@cs.unt.edu>
Subject: Re: realloc
Date: Mon, 05 Aug 2002 18:26:54 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3D4EC36E.43A58552@cs.unt.edu>
References: <20020805163543.A7759@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Winters <cwinters@atl.lmco.com>
Cc: linux-c-programming@vger.kernel.org

Chuck Winters wrote:

> Hello all,
>         Anyone know why a program would freeze at realloc?  I thought
> if there was a problem, realloc would just fail.
>
> Thanks,
> Chuck
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi,

The problem happens just because of specific allocator that you are using. You can
avoid it by simply malloc new area, copy the content and free previos one. Just as
follow:

#include <sys/mman.h>
ptr1=malloc(size1);
.
.
.
ptr2=realloc(ptr1,size2);

...........................

ptr1=malloc(size1);
.
.
.
ptr2=malloc(size2);
memcpy(ptr2,ptr1,size1);
free(ptr1);

Good Luck,

Mehran

