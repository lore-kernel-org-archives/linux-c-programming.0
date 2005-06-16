From: Rajkumar Andrews <rajkumar@rajandrews.net>
Subject: Re: variable length function
Date: Wed, 15 Jun 2005 22:31:51 -0400
Message-ID: <777e5557c301d845e1134ff5a9d61cba@rajandrews.net>
References: <6a00c8d50506142333197a5b0@mail.gmail.com> <20050615083610.15622.qmail@web52909.mail.yahoo.com> <17072.4612.493709.339833@gargle.gargle.HOWL>
Mime-Version: 1.0 (Apple Message framework v622)
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17072.4612.493709.339833@gargle.gargle.HOWL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

umm... also, a little further understanding maybe useful.  A compiler 
(C in this case), will do some 'intelligent' processing and guessing of 
your program.  The compiler may issue warnings or may do something by 
default .. the default settings could either come from the factory (eg. 
Intel's C compiler or IBM's C compiler) or be community driver (eg. GNU 
C).

In the case of GNU C, read the manuals carefully.  Versions change the 
default settings... so nobody can say anything with authority.  The 
manuals and documentation associated with the compiler is 'the 
authority'.  GNU C also allows many defaults to be set or changed by a 
person (systems administrator).

We must also remember that the hardware discussions would also play a 
role here -- now-a-days from 32 bit to 64 bit.  Perhaps there could be 
discussions on 8 bit or 4 bit, but I'm assuming that would be rare.

And, my two-cents-worth-of-advice:  do not take anything for granted 
when you write C programs.  Don't assume anything -- be clear.  Test it 
out yourself and KNOW what happens.  In the example asked by Ankit, I 
would generally do it as follows (although what I've added is almost 
taken for granted and is not necessarily required!):

#include <stdio.h>

int main(void)
{
print("This is main");
return 0;
}

Regards,
RKA

On 15-Jun-05, at 7:33 AM, Glynn Clements wrote:

>
> Ankit Jain wrote:
>
>> Well then i am just trying to clear my concept again.
>>
>> main()
>> {
>>
>>          printf("This is main");
>>
>> }
>>
>> now this simple function main according to this
>> discussion will return a int value.......Am i
>> right....
>
> Correct.
>
>> but is it true with any compiler?
>
> It's true for any compiler which supports pre-ANSI C (aka "K&R C").
> ANSI C requires the return type to be specified.
>
>> another thing........... if it returns a int value and
>> we have not returned any value explicitly.........then
>> what is the value returned ....as far as i know its a
>> non-zero value. but then what will that mean.....?
>
> It's an unspecified value. It could be any "int" value, including
> zero. As there is only one zero but many more non-zero values, it
> probably won't be zero, but it isn't guaranteed.
>
> Hopefully the compiler will issue a warning in this situation.
>
> -- 
> Glynn Clements <glynn@gclements.plus.com>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

