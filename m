From: "Nate Jenkins" <nate@uniwest.com>
Subject: Re: Double values - what precision do I use for fprintf?
Date: Fri, 13 Jan 2006 16:35:40 -0800
Message-ID: <007201c618a2$7233be00$8e01a8c0@Nate>
References: <200601121800.19678.samjnaa@gmail.com><6a00c8d50601121051n691ee179kef3298829025e973@mail.gmail.com><012101c617be$5b7afe10$8e01a8c0@Nate> <17352.15389.697568.176591@cerise.gclements.plus.com>
Reply-To: "Nate Jenkins" <nate@uniwest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org


>
> Nate Jenkins wrote:
>
>> If it is a 64-bit-floating-point data type, then isn't one supposed to 
>> use
>> the "long" modifier, i.e. "%.52f" -> "%.52lf"?  Or is that not portable?
>
> You cannot pass a float to printf(); a float will automatically be cast to
> double.
>
> More generally, a float argument will be cast to double if the
> function doesn't have a prototype, or if the prototype doesn't specify
> a type for the argument (i.e. for a variadic function). Similarly,
> char and short values are automatically converted to int in such
> circumstances.
>
> -- 
> Glynn Clements <glynn@gclements.plus.com>
>

So for a short example:
(this should compile but with a few casting warnings)

<.......code.......>

float fNum = 3.1415926535897932384626433832795; // will get truncated
double dNum = fNum; // will get some extra garbage trailing
char cNum = '*'; // 42 in ASCII
short sNum = cNum;
int nNum = cNum;


//////////// floating point number types ////////////

printf("%f \n", fNum);
// IIRC,  7 digits --> "3.141593

printf("%f \n", dNum);
// IIRC, 15 digits --> "3.14159200000261"
// or something like that due to extra garbage
// trailing without formatting?

printf("%lf \n", dNum);
// same --> "3.14159200000261"  Should not work but it does?


//////////// integer number types ////////////

printf("%c \n", cNum);
printf("%c \n", (char)(sNum));
printf("%c \n", (char)(nNum));
// so all of these would show --> "*" ?

printf("%hi \n", cNum);
printf("%hi \n", sNum);
printf("%hi \n", (short)(nNum));
// so all of these would show --> "42" ?

printf("%d \n", cNum);
printf("%d \n", sNum);
printf("%d \n", nNum);
// so all of these would show --> "42" ?

<......./code.......>



Are my comment assumptions wrong?  I have been using "%lf" for years... 
Could the old compiler I use be made to consider "%lf" the same as "%f" ?

Nate


