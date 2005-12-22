From: Neil Horman <nhorman@tuxdriver.com>
Subject: Re: malloc with size 0
Date: Thu, 22 Dec 2005 08:02:27 -0500
Message-ID: <20051222130227.GD3204@hmsreliant.homelinux.net>
References: <1f5f62170512212043w17e1c8e7v3781e0dc72845efc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1f5f62170512212043w17e1c8e7v3781e0dc72845efc@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suma C <gsumac@gmail.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Thu, Dec 22, 2005 at 10:13:57AM +0530, Suma C wrote:
> Hi all
> 
> When  a 0 is passed to malloc, I get a valid pointer instead of a NULL
> .What does this mean?
> 
> thanks  in advance
> 
> regards
> suma
> 
> PS:
> code:
> #include <stdio.h>
> #include <stdlib.h>
> 
> int main()
> {
>         char  *ptr = NULL;
>         ptr = malloc(0);
>         printf("ptr :%u \n",ptr);
>         strcpy(ptr,"abcdefghijkl");
>         printf("%s\n",ptr);  //no seg fault here????
>         return 0;
> }
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

http://www.opengroup.org/onlinepubs/000095399/toc.htm
If you pass 0 into malloc, you will get back NULL or a unique pointer suitable
for passing to free.  There is no guarantee about the amount of memory you can
write to beyond the pointer, and it is in fact not allocated to you (allocation
of 0).  As such, _dont_write_to_it_, as a subseuqent allocation may be
destroyed.  All the pointer is good for (if you get one back) is being passed to
free.

Regards
Neil

-- 
/***************************************************
 *Neil Horman
 *Software Engineer
 *gpg keyid: 1024D / 0x92A74FA1 - http://pgp.mit.edu
 ***************************************************/
