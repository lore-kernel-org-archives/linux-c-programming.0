From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Dinamic array allocation
Date: Tue, 26 Oct 2004 12:12:28 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <417DCEAC.2000408@hq.ntsp.nec.co.jp>
References: <417DBE66.7050501@crearium.com> <417DCDE9.8000004@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <417DCDE9.8000004@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Fabio <fabio@crearium.com>, linux-c-programming@vger.kernel.org

oops.. i meant argv[1] not arvp[1]

sorry.

ex:
malloc( atoi( argv[1] ) + strlen( foo) );

Ron Michael Khu wrote:

> arvp[1] is string....
> u should convert it to a numeric type via atoi() or strtol()....
>
> =)
>
> Fabio wrote:
>
>> Hi.
>>
>> I am programming a C code that gets argv[1] as the lenght of an array 
>> that is the copy of an array plus more data.
>>
>> So, the appication runs as: ./a.out 100
>>
>> It create an array of 100 bytes and adds a static defined array plus 
>> more data, like:
>>
>> char *foo[5]="bar"
>> main(int argc, char *argv[])
>> {
>>    char *Ptr[];
>>    Ptr = malloc( argv[1]+strlen(foo));
>>    ....
>> }
>>
>> Makes sense? guess no.
>>
>> Any suggestion is welcome.
>>
>> thanks in advance
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
>

