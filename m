From: =?ISO-8859-7?Q?Dari=27o_Mariani?= <dmarian@fi.uba.ar>
Subject: Re: mixing C/C++
Date: Mon, 24 Nov 2003 15:44:00 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3FC25170.4050607@fi.uba.ar>
References: <20031124111050.GI1819@pcmag.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Elias Athanasopoulos <elathan@pcmag.gr>
Cc: linux-c-programming@vger.kernel.org

Hello:
   I think that the problem is in

extern "C"
Foo * wrap_foo_ctor()
{
	return new Foo();
}

In your C program you are using a C++ construct inside C, wich may work 
but the C compiler doesn't understand virtual functions so it might be 
confused there.

Elias Athanasopoulos wrote:
> Hello!
> 
> Consider:
> 
> class Bar {
> public:
>   Bar();
>   ~Bar();
> 
>   void dump2(void);
> };
> 
> class Foo : public Bar {
> public:
> 	Foo();
> 	~Foo();
> 
> 	void dump(void);
> };
> 
> extern "C"
> Foo * wrap_foo_ctor()
> {
> 	return new Foo();
> }
> 
> extern "C"
> void wrap_foo_dump(Foo *f)
> {
> 	f->dump();
> }
> 
> extern "C"
> void wrap_bar_dump2(Bar *b)
> {
> 	b->dump2();
> }
> 
> Now, I have a C program:
> 
> int main(void)
> {
> 	struct Foo *f;
> 
> 	f = wrap_foo_ctor();
> 	wrap_foo_dump(f);
> 	wrap_bar_dump2(f);
> }
> 
> which is working as -at least- I expect. Bar::dump2() is 
> called since Foo inherits from Bar.
> 
> However is it correct? I have a larger C++ project, which I'm
> creating wrappers for in C, and I get a segfault in a similar
> case (i.e. when I call a method *deep* inside the inheritence tree of a 
> class). 
> 
> Regards,


