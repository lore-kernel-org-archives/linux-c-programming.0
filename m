From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Initializer element is not constant
Date: Fri, 21 Jan 2005 10:37:12 +0800
Message-ID: <41F06AD8.7080206@hq.ntsp.nec.co.jp>
References: <20050120232132.GE1279@drmemory.local> <41F06AC1.2000605@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <41F06AC1.2000605@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org
Cc: Scott <drmemory@3rivers.net>

Hi,

can u point us to line 124??

I've encountered a similar error message before when i using HP-UX on 
Intel Itanium.
The compiler complained that i used a non-constant in a static array 
declaration...
char a[ maxLen ] ;

in the end, I had to malloc/calloc them... (since i didnt know how to 
tweak or instruct
the compiler to ignore such errors... since the code was already old and 
compilable on
other hp-ux platforms)

-Ron

>
> Scott wrote:
>
>> Hi,
>>
>> It has been a LONG TIME since I've done any programming in C. I have
>> two old programs still in use which were developed on msdos, using the
>> "Mark Williams Let's C" compiler. We're talking 1980's stuff here.
>>
>> Anyway, I thought to try to port them to linux. Can anyone tell me
>> what I'm doing wrong?
>>
>> Here are the relevant portions of indatax.c:
>>
>> char *namectrl = NULL;
>> char *name1 = NULL;
>> char *name2 = NULL;
>>
>> typedef struct {
>>     char *var;    /* destination for storage of the data */
>>     size_t len;    /* max len of the data */
>>     char *(*xlat)();    /* translation routine */
>> } DATUM;
>>
>> DATUM recip_data[] = {
>> {  namectrl, NAMECTRL_LEN, make_upper },
>> {  name1, NAME1_LEN, make_upper },
>> {  name2, NAME2_LEN, make_upper },
>> [...]
>>
>> And these are the errors...
>>
>> indatax.c:124: initializer element is not constant
>> indatax.c:124: (near initialization for `recip_data[0].var')
>> indatax.c:125: initializer element is not constant
>> indatax.c:125: (near initialization for `recip_data[1].var')
>> indatax.c:126: initializer element is not constant
>> indatax.c:126: (near initialization for `recip_data[2].var')
>> [...]
>>
>> gcc version 2.95.3
>>
>> Thanks,
>>
>> Scott Swanson
>> Pendroy, Montana
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>  
>>
>
>


