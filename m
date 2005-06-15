From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: variable length function
Date: Thu, 16 Jun 2005 01:22:17 +0800
Message-ID: <42B063C9.40306@hq.ntsp.nec.co.jp>
References: <17072.4612.493709.339833@gargle.gargle.HOWL>	 <20050615155926.76725.qmail@web52910.mail.yahoo.com> <6a00c8d505061509263ca76278@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505061509263ca76278@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve Graegert <graegerts@gmail.com>
Cc: Ankit Jain <ankitjain1580@yahoo.com>, Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

Mr Ankit Jain,

u can verify all these "main return value" ambiguity
by making a simple script file that would print the return value
of the last app executed. In bash u could simply use "echo $?" on the 
command line.

So in dos mode, Perhaps u could make use of  "echo %errorlevel%" on the 
dos prompt

with these simple shell commands, u will then be able to see for urself 
if a
void-valued main would implicity return an int or not...

-ron


Steve Graegert wrote:

>On 6/15/05, Ankit Jain <ankitjain1580@yahoo.com> wrote:
>  
>
>>hi
>>    
>>
>
>[snip]
>
>  
>
>>if i write the same module in it then it takes void as
>>the default return type...........?
>>    
>>
>
>No it does not.  When specifying no return type int is returned
>implicitly.  Under Windows, even if main is void-valued, the exit
>code, whatever value it may have, is converted to int.
>
>  
>
>>--- Glynn Clements <glynn@gclements.plus.com> wrote:
>>
>>    
>>
>>>Ankit Jain wrote:
>>>
>>>      
>>>
>>>>Well then i am just trying to clear my concept
>>>>        
>>>>
>>>again.
>>>      
>>>
>>>>main()
>>>>{
>>>>
>>>>         printf("This is main");
>>>>
>>>>}
>>>>
>>>>now this simple function main according to this
>>>>discussion will return a int value.......Am i
>>>>right....
>>>>        
>>>>
>>>Correct.
>>>
>>>      
>>>
>>>>but is it true with any compiler?
>>>>        
>>>>
>>>It's true for any compiler which supports pre-ANSI C
>>>(aka "K&R C").
>>>ANSI C requires the return type to be specified.
>>>
>>>      
>>>
>>>>another thing........... if it returns a int value
>>>>        
>>>>
>>>and
>>>      
>>>
>>>>we have not returned any value
>>>>        
>>>>
>>>explicitly.........then
>>>      
>>>
>>>>what is the value returned ....as far as i know
>>>>        
>>>>
>>>its a
>>>      
>>>
>>>>non-zero value. but then what will that mean.....?
>>>>        
>>>>
>>>It's an unspecified value. It could be any "int"
>>>value, including
>>>zero. As there is only one zero but many more
>>>non-zero values, it
>>>probably won't be zero, but it isn't guaranteed.
>>>
>>>Hopefully the compiler will issue a warning in this
>>>situation.
>>>
>>>--
>>>Glynn Clements <glynn@gclements.plus.com>
>>>
>>>      
>>>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>


