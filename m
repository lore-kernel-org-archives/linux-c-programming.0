From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: Newbie question on malloc()
Date: Thu, 03 Jun 2004 04:23:54 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40BED20A.2080207@ig.com.br>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki> <20040603012832.GC2562@luna.mooo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040603012832.GC2562@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Micha Feigin <michf@post.tau.ac.il>
Cc: linux-c-programming@vger.kernel.org

My suggests (I expect that it's commom):

If you are making a app for your personal brief use (like a brief tool), 
OK !!
    You can leave OS to control your auto-"freed" memory.
else
    You need to free your allocated memory by yorself (either by itself 
<---- your app).

Luciano.
----------
- Try to use "free()" or "delete".
- app = (your) application/software.



Micha Feigin wrote:

>On Wed, Jun 02, 2004 at 08:48:07PM +0900, Wen Guangcheng wrote:
>  
>
>>Hello Gurus,
>>I have made a daemon in which dynamic memory is gotten
>>by malloc(). Does the memory get free automatically without
>>free() by the deamon  when the daemon process is killed?
>>Thanks in advance.
>>
>>    
>>
>
>It does, but in general its not in good practice to count on process
>exit for freeing memory (a good way to get memory leaks).
>
>  
>
>>--Wen
>>
>>-
>>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> 
>> +++++++++++++++++++++++++++++++++++++++++++
>> This Mail Was Scanned By Mail-seCure System
>> at the Tel-Aviv University CC.
>>
>>    
>>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>
