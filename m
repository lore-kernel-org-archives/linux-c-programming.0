From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Dinamic array allocation
Date: Tue, 26 Oct 2004 13:15:28 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <417DDD70.3060605@hq.ntsp.nec.co.jp>
References: <417DBE66.7050501@crearium.com> <417DCDE9.8000004@hq.ntsp.nec.co.jp> <417DD9BA.8040009@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <417DD9BA.8040009@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Lejanson Go <lejanson@ntsp.nec.co.jp>, Fabio <fabio@crearium.com>, linux-c-programming@vger.kernel.org

This is Mr. Fabio's code:

main(int argc, char *argv[])
{
   char *Array[];
   int length,i;
   char foo[10]="bar";
   length = strlen(foo) + atoi(argv[1]);
   Array = malloc(length)
   for(i=;i<length;i++)
       Array[i]="a";
}

Fabio, ur trying to create an array of char ptrs.....
so u  need to modify the way u mallocs space...
   Array = malloc(length)
is only applicable if u have defined Array
as char *Array;

(and u need to initialize "i" just in case... im not
sure about the default value of ints)



Lejanson C. Go wrote:

> I hope i am correct. :D
>
> ptr = (char *) malloc (strtol(argv[1])+strlen(foo));
>
>
> Ron Michael Khu wrote:
>
>> arvp[1] is string....
>> u should convert it to a numeric type via atoi() or strtol()....
>>
>> =)
>>
>> Fabio wrote:
>>
>>> Hi.
>>>
>>> I am programming a C code that gets argv[1] as the lenght of an 
>>> array that is the copy of an array plus more data.
>>>
>>> So, the appication runs as: ./a.out 100
>>>
>>> It create an array of 100 bytes and adds a static defined array plus 
>>> more data, like:
>>>
>>> char *foo[5]="bar"
>>> main(int argc, char *argv[])
>>> {
>>>    char *Ptr[];
>>>    Ptr = malloc( argv[1]+strlen(foo));
>>>    ....
>>> }
>>>
>>> Makes sense? guess no.
>>>
>>> Any suggestion is welcome.
>>>
>>> thanks in advance
>>> -
>>> To unsubscribe from this list: send the line "unsubscribe 
>>> linux-c-programming" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
>
>

