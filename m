From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Initializer element is not constant
Date: Sat, 22 Jan 2005 01:46:31 +0800
Message-ID: <41F13FF7.4020802@hq.ntsp.nec.co.jp>
References: <20050120232132.GE1279@drmemory.local> <41F06AC1.2000605@hq.ntsp.nec.co.jp> <41F06AD8.7080206@hq.ntsp.nec.co.jp> <20050121162726.GA977@drmemory.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050121162726.GA977@drmemory.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Scott <drmemory@3rivers.net>
Cc: linux-c-programming@vger.kernel.org

have u tried changing the first field of each element??
something like... replacing those char ptrs with something static?

example:

DATUM recip_data[] = {
{  "i am a constant str", NAMECTRL_LEN, make_upper },       
{  "i am a constant str", NAME1_LEN, make_upper },

u might notice that some of  "initializer element is not constant" 
errors will be significantly reduced....

perhaps, the compiler is complaining that u have used something 
"dynamic"(or at least non-static) in defining a
"statically" allocated data structure(recip_data)
=(

perhaps u can change the way u define/declare ur variables/data 
structures....


Scott wrote:

>On Fri, Jan 21, 2005 at 10:37:12AM +0800, Ron Michael Khu wrote:
>  
>
>>Hi,
>>
>>can u point us to line 124??
>>
>>    
>>
>>>>DATUM recip_data[] = {
>>>>{  namectrl, NAMECTRL_LEN, make_upper },        <-- Line 124
>>>>{  name1, NAME1_LEN, make_upper },
>>>>        
>>>>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>



