From: =?iso-8859-1?q?Dinesh=20Ahuja?= <mdlinux7@yahoo.co.in>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Mon, 5 Jul 2004 06:35:27 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040705053527.45632.qmail@web8304.mail.in.yahoo.com>
References: <40E5F9F5.4080009@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40E5F9F5.4080009@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

The problem which you are facing is a bug in MSVC.
MSVC does not support in-class initialization of const
static data member. 

Read the following link :

http://www.corfield.org/index.php?event=cplusplus.section&section=mcon

The compiler which supports in-class initialization of
const static data members provides the feature of
const-folding and hence it can be used to set the size
of an array.

Regards
Dinesh

--- Luciano Moreira - igLnx <lucianolnx@ig.com.br>
wrote: > Ok, but during our talk, I had asked for
anothers
> ways to do anything 
> similar, and I get a way using enum. And another
> hands, my compiler 
> (MSVC), doesn't compile static const "initialized
> member", like as:
> 
> class MyClass {
>    static const int size = 100;
>    int arrSize[size];
> };
> 
> It seems to think that I m trying to initialize a
> pure virutal function with wrog sintax, because it
> need "=0" and not "=100".
> Sorry, I dont know why, but MSVC cannot compile it,
> I already searched MS documentation, but no answers.
> 
> Luciano
> 
> Glynn Clements wrote:
> 
> >Dinesh Ahuja wrote:
> >
> >  
> >
> >>There is a concept of constant folding in C++.
> >>Whenever you declare any data member of class as a
> >>constant, the compiler should allocate the memory
> for
> >>it in the object layout and compiler should know
> the
> >>size of the variable in advance. Suppose, if I
> have a
> >>class like below :
> >>
> >>class MyClass {
> >>   const int size;
> >>   int arrSize[size];
> >>};
> >>This will not compile because compiler can not do
> the
> >>constant folding in above case as memory needs to
> be
> >>allocated for the constant data member size.
> >>    
> >>
> >
> >However, the title explicitly says:
> >
> >	STATIC const attribute in C++ (How to ?)
> >
> >[Emphasis mine.]
> >
> >There is a difference.
> >
> >  
> >
> >>The above problem can be resolved by using enums.
> >>class MyClass {
> >>   enum {size = 100};
> >>   int arrSize[size];
> >>};
> >>    
> >>
> >
> >It can also be resolved using an initialised static
> const member:
> >
> >class MyClass {
> >   static const int size = 100;
> >   int arrSize[size];
> >};
> >
> >  
> > 

________________________________________________________________________
Yahoo! India Careers: Over 50,000 jobs online
Go to: http://yahoo.naukri.com/
