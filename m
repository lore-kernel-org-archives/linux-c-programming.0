From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: ternary operator
Date: Wed, 29 Jun 2005 01:44:30 +0800
Message-ID: <42C18C7E.6030100@hq.ntsp.nec.co.jp>
References: <6eee1c405062810224f4db7e5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6eee1c405062810224f4db7e5@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vadiraj <vadiraj.cs@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

i dont know the reason but the problem could be shrink down to

func2()
{
}

func1()
{
  printf( "%d\n", func2() );
}

int main()
{
  printf( "%d\n", func2() );
  printf("%d\n",func1() ) ;
}

u will notice that the return value from func2(which does not specify 
any explicit return value)
differs when called from main() and from func1()..

this is not a problem about the ternary operator..
this is an issue about the use of implicit/explicit return values...
why are u not  making use of explicit return? and explicit use of int as 
the return type in the
function declarations??


Vadiraj wrote:

>Hi List,
>
> I'm confused with the behavior of this program..
>
>func4()
>{
>    return 3;
>}
>func3()
>{
>    return 2;
>}
>func2()
>{
>}
>
>func1()
>{
>    return(func2()?func3():func4()) ;
>}
>int main()
>{
>     
>     printf("%d\n",func1() ) ;                       // this prints 3
>     printf("%d\n",func2()?func3():func4()) ;  // this prints 2
>}
>
> I dont understand whats making the two statements to behave differently.
>
>
>
>  
>


