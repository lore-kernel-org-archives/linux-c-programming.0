From: =?iso-8859-1?q?Dinesh=20Ahuja?= <mdlinux7@yahoo.co.in>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Fri, 2 Jul 2004 11:20:14 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040702102014.58508.qmail@web8310.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lucianolnx@ig.com.br, subscript@free.fr
Cc: linux-c-programming@vger.kernel.org

Hi Henry,

There is a concept of constant folding in C++.
Whenever you declare any data member of class as a
constant, the compiler should allocate the memory for
it in the object layout and compiler should know the
size of the variable in advance. Suppose, if I have a
class like below :
class MyClass {
   const int size;
   int arrSize[size];
};
This will not compile because compiler can not do the
constant folding in above case as memory needs to be
allocated for the constant data member size.

The above problem can be resolved by using enums.
class MyClass {
   enum {size = 100};
   int arrSize[size];
};

This will work as enum doesn't have any linkage and
hence no memory is allocated for them. Even use of
extern keyword prevents constant folding for a
constant variable.

I hope the above thing may have helped you.

Thanks & Regards
Dinesh-Ahuja

> > Henry Margies wrote:
> >Just put the definition in the cpp file.
> >Header File:
> >class Foo
> >{
> >	public:
> >		static const int DEFSIZE;
> >};
> >
> >in CPP-File:
> >
> >const int Foo::DEFSIZE=100
>>
> >Why does this not work for you?
> >
> >Henry



________________________________________________________________________
Yahoo! India Careers: Over 50,000 jobs online
Go to: http://yahoo.naukri.com/
