From: Steve Graegert <graegerts@gmail.com>
Subject: Re: ternary operator
Date: Tue, 28 Jun 2005 20:47:08 +0200
Message-ID: <6a00c8d5050628114797895f3@mail.gmail.com>
References: <6eee1c405062810224f4db7e5@mail.gmail.com>
	 <6a00c8d50506281049335e427d@mail.gmail.com>
	 <6eee1c40506281124101fe259@mail.gmail.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6eee1c40506281124101fe259@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj <vadiraj.cs@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On 6/28/05, Vadiraj <vadiraj.cs@gmail.com> wrote:
> Hi,
> 
> On 6/28/05, Steve Graegert <graegerts@gmail.com> wrote:
> > On 6/28/05, Vadiraj <vadiraj.cs@gmail.com> wrote:
> > > Hi List,
> > >
> > >  I'm confused with the behavior of this program..
> > >
> > > func4()
> > > {
> > >     return 3;
> > > }
> > > func3()
> > > {
> > >     return 2;
> > > }
> > > func2()
> > > {
> > > }
> > >
> > > func1()
> > > {
> > >     return(func2()?func3():func4()) ;
> > > }
> > > int main()
> > > {
> > >
> > >      printf("%d\n",func1() ) ;                       // this prints 3
> > >      printf("%d\n",func2()?func3():func4()) ;  // this prints 2
> > > }
> > >
> > >  I dont understand whats making the two statements to behave differently.
> >
> > I am not able to recreate this behaviour, since both printf()s give
> > "2" on my console and this is exactly what I expected to take place.
> > Just take a look at our discussion about implicit return values on
> > int- and void-valued functions a week or two ago.  If no return value
> > is given explicitly it is undefined and in most cases not zero,
> > therfore not yielding false.  It's chosen randomly.
> 
> >
> > In this case the :? operator says:  if func2() returns true, call
> > func3() else call func4().  In most cases func2() is true.  Nothing
> > magic here.
> 
>  Yes nothing magic here. I did get different values with few changes.
> As far as I understand return values are stored in ax register. In this
> program since func2() does not set AX it should get the value present at
> that time.

AFAIK Return values of type int and pointers are usually stored in EAX
(AX is a 16 bit register), other types like long long may be stored in
EDX:EAX with the most and least significant words in EDX and EAX.

If no return type is given, the value found in EAX is returned
implicitly but this value often is, as you indicated, an artefact of
prior operations.  Nevertheless, a value is returned and some other
operations are performed as with int-valued functions to prevent
things like stack corruption and the like.

BTW: I am not an Intel guy, I'm running Alpha and SPARC Linux.  Please
correct me if I am wrong.

>   Most of the case it would be the return value from the function called before.
> (may be or may not). Thats what I noticed when the code modified like this.
> 
>     func4() ;
>     printf("%d\n", func2()) ; // prints 3
>     func3() ;
>     printf("%d\n", func2()) ; // prints 2
> 

This may indeed be true, but since func2() does not return an int, the
actual return value is an artifact from a prior call to func4() and
func3().  So yes, you are right and everything works as it should. 
When using the ternary operator you're adding some sort of complexety
to the calling sequence with the result that the EAX register may be
used for other purposes, thus holding obviously random values.

Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
