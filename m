From: Benjamin Sobotta <mayday@gmx.net>
Subject: Re: C++ temporaries
Date: Thu, 20 Jan 2005 03:49:32 +0000
Message-ID: <1106192972.643.14.camel@rr>
References: <200501192156.00928.a.biardi@tiscali.it>
Reply-To: mayday@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200501192156.00928.a.biardi@tiscali.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: a.biardi@tiscali.it
Cc: linux-c-programming@vger.kernel.org

Hi!

Actually I'm not quite sure about this, but I think you can assume that
this always works. I think what gets actually passed to printf is a
pointer to the value returned by c_str() which in turn is stored in some
independent temporary memory location until printf is done. 
I use a lot of constructs like this and it always worked for me, (Intel
& GNU) however I might still be wrong. :)

Benjamin

On Wed, 2005-01-19 at 21:56 +0100, a.biardi@tiscali.it wrote:
> Hi all,
> 
> I have a function similar to the following, which returns a string:
> 
>   std::string foo() {
>     return <whatever>;
>   }
> 
> ..then I want to use its c_str(), say like this (sorry for the silly 
> example):
> 
>   int main() {
>     printf("foo is %s",foo().c_str());
>   }
> 
> Of course, for printf() to work, the temporary object that is returned 
> by foo() should not be (automatically) destroyed too early, or the 
> pointer returned by c_str() would not be valid anymore.
> 
> So, my question is: *when* is that temporary string created and 
> destroyed? is it safe to assume that it exists until printf() 
> returns, and thus that I can use its c_str() this way?
> 
> I've always thought that the temporary would be destroyed *before* 
> calling printf() [ create a string, get the value for c_str(), 
> destroy the string, invoke printf() ] thus actually passing an 
> invalid pointer in this case, but to my surprise I put together some 
> lines and gcc proved me wrong. Is it just gcc? Or is it a standard 
> C++ behavior?
> 
> Thanks,
> Andrea.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
-- 
Benjamin Sobotta <mayday@gmx.net>

