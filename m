From: canbaby <canbaby@21cn.com>
Subject: Re: array size 1 ? 	All headers
Date: Wed, 21 Jul 2004 11:19:57 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40FDE0DD.50008@21cn.com>
References: <20040721015338.M80608@sni.ph> <20040720235713.4cb83b20.lcapitulino@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040720235713.4cb83b20.lcapitulino@terra.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Cc: Gre Taguran <gtaguran@sni.ph>, linux-c-programming@vger.kernel.org

Luiz Fernando N. Capitulino wrote:

> Hi Gre,
>
>Em Wed, 21 Jul 2004 10:27:35 +0800
>"Gre Taguran" <gtaguran@sni.ph> screveu:
>
>| i think its not array of 1 but instead array of 2 which is 0 and 1 index.
>
> Wrong.
>
> K&R defines array as: array[lenght]
>
> So, if you defines an array as:
>
> int luiz[10]
>
> You will have 10 memory cells for it, and if you do:
>
> int luiz[1]
>
> You will have one memory cell.
>
> But, the _access_ is made from 0, so for the first example, we have:
>
> luiz[0], luiz[1], luiz[2]... luiz[9].
>
> For the second, just:
>
> luiz[0].
>
>| maybe 
>| it is because u were thinking that the last array index (in this case is 1) is 
>| null, but it is only applicable when handling string because string needs a 
>| terminated string. ex.
>| 
>| char tst[1];
>| tst[0]='g';
>| tst[1]='r';
>| printf("%s",tst); //this would print gr<and more chars here because it is not 
>| terminated
>| printf("%c=%c"); //this will print gr meaning tst[1] is alocated by 'r'
>
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
but your code had  over the array bound, the sequent is risk.
I  think the GCC should detect the index value
