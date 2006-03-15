From: Vamsi <krishna.vamsi@wipro.com>
Subject: Re: Significance of using + before function calls.
Date: Wed, 15 Mar 2006 19:10:01 +0530
Message-ID: <44181931.8000507@wipro.com>
References: <44180FBC.50703@wipro.com> <4417C957.7000205@infoweapons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4417C957.7000205@infoweapons.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Joel M. Pareja" <jpareja@infoweapons.com>
Cc: linux-c-programming@vger.kernel.org


Joel M. Pareja wrote:

> The placement of '+' or '-' before the function call is performing a
> unary operator on the return value of the function.

does it server any purpose ? , unary '+'  operator will not have any 
significance effect on the return value

-Vamsi

>
> Vamsi wrote:
>
>> Hi List,
>>
>> i have seen a code snippet which starts with + symbol,
>>
>> +system("ls -l");
>>
>> what is the significance of using + symbol before system.
>>
>> i also tried using + before printf ,, like +printf("Some text"); and 
>> it is compiling and working tooo,,
>>
>> Can somebody clarify wht does that + signify??
>>
>> Thank You.
>>
>> -Vamsi
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

