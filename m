From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: operator! and lvalue
Date: Thu, 28 Jun 2007 10:42:19 +0100
Message-ID: <18051.33403.210403.633493@cerise.gclements.plus.com>
References: <4681DA23.7030001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4681DA23.7030001@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> In Thinking in C++ chapter on overloading operators, Bruce Eckel gives
> the following code:
> 
> For a non-member operator:
> 
> int operator!(const Integer& a) {
>    cout << "!Integer\n";
>    return !a.i;
> }
> 
> For a member operator:
> 
> Byte operator!() const {
>    cout << "!Byte\n";
>    return Byte(!b);
> }
> 
> My question is: why is there no "const" before Integer and Byte at the
> head of the function?

Huh? The only "Integer" which isn't preceded by "const" is in the
string literal.

> There's all that stuff about when temporaries are
> returned they are automatically const, but throughout the examples in
> this chapter, only operator! is not explicitly specified to have a const
> return value whereas in all other relevant cases we have the "const"
> specified explicitly.

Why would you want to make the return value "const"?

The situation is different if you're referring a reference or pointer,
but there's no point in making a copied value "const".

BTW, this list is specifically about C programming on Linux; generic
C/C++ questions aren't really on-topic here. The comp.lang.c and
comp.lang.c++ newsgroups (and their *.moderated counterparts) might be
better places to ask such questions; certainly, they are likely to
have many more active users.

-- 
Glynn Clements <glynn@gclements.plus.com>
