From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Subject: Re: function pointers in C++
Date: Mon, 15 Mar 2004 11:38:00 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4055BFC8.4040609@fi.uba.ar>
References: <1079342899.405577335bb24@webmail.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1079342899.405577335bb24@webmail.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Probably what you need is the "pointer to member". It's described in
chapter 15, section 5 in "The C++ Programming Language", from Stroustrup.

elathan@phys.uoa.gr wrote:
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
> 


