From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Fri, 2 Jul 2004 23:32:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16613.57971.207623.58581@cerise.nosuchdomain.co.uk>
References: <20040702102014.58508.qmail@web8310.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040702102014.58508.qmail@web8310.mail.in.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?q?Dinesh=20Ahuja?= <mdlinux7@yahoo.co.in>
Cc: lucianolnx@ig.com.br, linux-c-programming@vger.kernel.org


Dinesh Ahuja wrote:

> There is a concept of constant folding in C++.
> Whenever you declare any data member of class as a
> constant, the compiler should allocate the memory for
> it in the object layout and compiler should know the
> size of the variable in advance. Suppose, if I have a
> class like below :
> 
> class MyClass {
>    const int size;
>    int arrSize[size];
> };
> This will not compile because compiler can not do the
> constant folding in above case as memory needs to be
> allocated for the constant data member size.

However, the title explicitly says:

	STATIC const attribute in C++ (How to ?)

[Emphasis mine.]

There is a difference.

> The above problem can be resolved by using enums.
> class MyClass {
>    enum {size = 100};
>    int arrSize[size];
> };

It can also be resolved using an initialised static const member:

class MyClass {
   static const int size = 100;
   int arrSize[size];
};

-- 
Glynn Clements <glynn.clements@virgin.net>
