From: "Jason P. Winters" <jason@txt.com>
Subject: Re: Memory Leak issue
Date: Sat, 16 Nov 2002 07:31:31 -0800 (PST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200211161531.gAGFVWla005493@grinch.txt.com>
References: <OF7DE96D1E.50C4E532-ON65256C73.002605A2@pune.tcs.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF7DE96D1E.50C4E532-ON65256C73.002605A2@pune.tcs.co.in> from "Hemant Mohan" at Nov 16, 2002 12:29:38 PM
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hemantm@pune.tcs.co.in
Cc: linux-c-programming@vger.kernel.org

 
> Is it possible to have a C function return a char*, and have void arguememnts 
> without the caller having to free the memory??
> I mean something like this:
> 
> char* foo(void)
> {
>    char *ret;
>    .....  
>   
>    return(ret);
> }
> 
> int main()
> {
>    ....
>    char * temp;
>    temp = foo();
>    /* here I don't want to do a free(temp) */
>    .....
> 
> }


> To my understanding in this case the function foo will have to internally to 
> do a malloc for ret before doing any processing on it.

This is very true.

> And it will not be able free this memory.  This implies that the calling
> function will have to free the return pointer of foo somewhere to prevent
> any memory leakeage.  Is there any alternative solution to return a char* ?

Well, you have to get memory from somewhere... as an alternative, you could
allocate it in the main routine and pass the address along to foo instead
of void, but you still end up with main having to free memory.

Basically, if you get it, you have to free it...  at some point or another.

Why are you trying to avoid freeing memory?

Ciao!

Jason
-- 
|UUCP  jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4
