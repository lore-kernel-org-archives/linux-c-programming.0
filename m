From: joy <gracecott@sancharnet.in>
Subject: Re: array size 1 ? 	All headers
Date: Wed, 21 Jul 2004 08:47:11 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40FDE037.6080309@sancharnet.in>
References: <20040721015338.M80608@sni.ph>
 <20040720235713.4cb83b20.lcapitulino@terra.com.br>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <20040720235713.4cb83b20.lcapitulino@terra.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Luiz Fernando N. Capitulino wrote:

> The program:
>
> char tst[1];
> tst[0]='g';
> tst[1]='r';
>
> printf("%c %c\n", tst[0], tst[1]);
>
> compiles and works here! but to be honest, I don't why. I can prove it is
>an odd case, becase this also works (here):
>
>  
>
correct me if I'm wrong, but I feel that the code you have written is 
the classic case of a buffer overflow.
C , (I think) , does not check for array boundaries and leaves this work 
to be done by the programmer.
this is the basis of all those nasty worms running free!

> char tst[1];
> tst[0]='g';
> tst[1]='r';
> tst[2]='z';
>
> printf("%c %c %c\n", tst[0], tst[1], tst[2]);
>
>PS: GCC compiled.
>
>  
>

