From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: ternary operator
Date: Tue, 28 Jun 2005 23:54:58 +0530
Message-ID: <6eee1c40506281124101fe259@mail.gmail.com>
References: <6eee1c405062810224f4db7e5@mail.gmail.com>
	 <6a00c8d50506281049335e427d@mail.gmail.com>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50506281049335e427d@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi,

On 6/28/05, Steve Graegert <graegerts@gmail.com> wrote:
> On 6/28/05, Vadiraj <vadiraj.cs@gmail.com> wrote:
> > Hi List,
> >
> >  I'm confused with the behavior of this program..
> >
> > func4()
> > {
> >     return 3;
> > }
> > func3()
> > {
> >     return 2;
> > }
> > func2()
> > {
> > }
> >
> > func1()
> > {
> >     return(func2()?func3():func4()) ;
> > }
> > int main()
> > {
> >
> >      printf("%d\n",func1() ) ;                       // this prints 3
> >      printf("%d\n",func2()?func3():func4()) ;  // this prints 2
> > }
> >
> >  I dont understand whats making the two statements to behave differently.
> 
> I am not able to recreate this behaviour, since both printf()s give
> "2" on my console and this is exactly what I expected to take place.
> Just take a look at our discussion about implicit return values on
> int- and void-valued functions a week or two ago.  If no return value
> is given explicitly it is undefined and in most cases not zero,
> therfore not yielding false.  It's chosen randomly.


> 
> In this case the :? operator says:  if func2() returns true, call
> func3() else call func4().  In most cases func2() is true.  Nothing
> magic here.

 Yes nothing magic here. I did get different values with few changes.
As far as I understand return values are stored in ax register. In this
program since func2() does not set AX it should get the value present at
that time.
  Most of the case it would be the return value from the function called before.
(may be or may not). Thats what I noticed when the code modified like this.

    func4() ;
    printf("%d\n", func2()) ; // prints 3
    func3() ;
    printf("%d\n", func2()) ; // prints 2

 Please add clarity to this if necessary. Thank you very much.
  

-- 
cheers,
Vadi
