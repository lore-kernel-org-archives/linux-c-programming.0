From: Ashutosh Ranjan <sigsegv@1net.gr>
Subject: Re: function pointers in C++
Date: 16 Mar 2004 00:40:37 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1079377837.3584.4.camel@athlon.1.4.T.Bird>
References: <1079342899.405577335bb24@webmail.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1079342899.405577335bb24@webmail.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: elathan@phys.uoa.gr
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

hi.

well check out mem_fun() which is standard library function...this takes
the pointer to a member function as its argument and produces something
that can be called for a pointer to the member's class. 
Ex for your code...

taz(mem_function(&Foo::bar) should work...it should take the Foo*
argument and return what Foo::bar() returns !!

regards,

Ashu




On Mon, 2004-03-15 at 14:58, elathan@phys.uoa.gr wrote:
> Hello! 
>  
> Suppose I have: 
>  
> class Foo 
> { 
> public: 
> 	Foo(); 
> 	~Foo(); 
> 	int bar(int); 
> }; 
>  
> Now, why I can't do this: 
>  
> Foo *f = new Foo(); 
> taz(f->bar); 
>  
> Where taz()'s protype is: 
>  
> void taz(int (*f)(int)); 
>  
> In plain C, I can do: 
>  
> int f(int) { ... } 
> taz(f); 
>  
> without a problem. Is there a way to accomplish such a thing (i.e. 
> to pass the pointer of a C++ class's member function to another 
> function that expects a pointer to function as an argument)? 
>  
> Regards, 
> --  
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

