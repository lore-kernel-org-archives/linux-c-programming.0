From: joy <gracecott@sancharnet.in>
Subject: Re: Problem with read() and named pipe (FIFO)
Date: Tue, 17 Aug 2004 08:51:38 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <412179C2.5010003@sancharnet.in>
References: <20040816144752.43149.qmail@web12701.mail.yahoo.com>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <20040816144752.43149.qmail@web12701.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Hossein Mobahi <hmobahi@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

Hossein Mobahi wrote:

>
>The problem is that prg1 does not produce any return
>(I mean '\n'), and numbers are separated by space.
>Therefore, read(fd,n,buf) blocks even if "n" is
>smaller than what prg1 has actually written to the
>pipe (no matter what n is, even if the pipe's buffer
>contains more characters than n, read first waits for
>return and onces gets it, it will copy n bytes of the
>buffer to buf). On the other hand opening in
>  
>
Funny. I have used read() to get 2 characters out of a binary file with 
no "\n"'s
and it never behaved like this. Also the man page make sno mention of 
this either.
Did you try this out? How about fread/fwrite?

Joy.M.Monteiro

>non-blocking fashion doesn't help, because I want my
>program to wait for the output of prg1. Is there any
>way to make read() return once the pipe has more
>characters than n? What about defining another
>delimiter such as "blank", instead of "return"? Let me
>add that I do not want to touch kernel sources, I am
>looking for a more portable solution using available
>system calls or shell's capabilities.
>
>Thnx
>
>--Hossein
>
>
>  
>

