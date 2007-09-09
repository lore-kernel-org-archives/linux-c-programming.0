From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Testing if a file or directory exist
Date: Sun, 9 Sep 2007 14:15:57 +0100
Message-ID: <18147.61965.904640.471967@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


Holger Kiehl wrote:

> What is the quickest way to test if a file or directory exist.
> I can think of three different system calls that can be used:
> access(), stat() and open(). Writting a little test program I
> found that this is also the order of which is the quickest,
> that is access() is the quickest and open() the slowest. The code
> for the test programms is shown below.
> 
> The question I have is there any other system call that I can use
> that would be cheaper then access(). Even if they are linux specific
> system calls I would like to know.
> 
> Thanks,
> Holger
> 
> access.c
> 
>     #include <stdio.h>
>     #include <string.h>
>     #include <unistd.h>
>     #include <errno.h>
> 
>     #define MAX_LOOPS 5000000
> 
>     int main(void)
>     {
>        unsigned int i;
> 
>        for (i = 0; i < MAX_LOOPS; i++)
>        {
>           if (access("abcd", R_OK) != 0)

If you just want to check for existence, use F_OK. If you use R_OK,
the call will fail if you don't have read permission for the file.

OTOH, if access(..., R_OK) succeeds, that doesn't necessarily mean
that opening the file for read will succeed.

-- 
Glynn Clements <glynn@gclements.plus.com>
