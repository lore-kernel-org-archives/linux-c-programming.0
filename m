From: Steve Graegert <graegerts@gmail.com>
Subject: Re: ternary operator
Date: Tue, 28 Jun 2005 19:49:11 +0200
Message-ID: <6a00c8d50506281049335e427d@mail.gmail.com>
References: <6eee1c405062810224f4db7e5@mail.gmail.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6eee1c405062810224f4db7e5@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj <vadiraj.cs@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On 6/28/05, Vadiraj <vadiraj.cs@gmail.com> wrote:
> Hi List,
> 
>  I'm confused with the behavior of this program..
> 
> func4()
> {
>     return 3;
> }
> func3()
> {
>     return 2;
> }
> func2()
> {
> }
> 
> func1()
> {
>     return(func2()?func3():func4()) ;
> }
> int main()
> {
> 
>      printf("%d\n",func1() ) ;                       // this prints 3
>      printf("%d\n",func2()?func3():func4()) ;  // this prints 2
> }
> 
>  I dont understand whats making the two statements to behave differently.

I am not able to recreate this behaviour, since both printf()s give
"2" on my console and this is exactly what I expected to take place. 
Just take a look at our discussion about implicit return values on
int- and void-valued functions a week or two ago.  If no return value
is given explicitly it is undefined and in most cases not zero,
therfore not yielding false.  It's chosen randomly.

In this case the :? operator says:  if func2() returns true, call
func3() else call func4().  In most cases func2() is true.  Nothing
magic here.

-- 
Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
