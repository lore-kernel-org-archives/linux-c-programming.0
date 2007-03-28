From: Reggie Cushing <reggie.cushing@um.edu.mt>
Subject: Re: Function stack reallocation
Date: Wed, 28 Mar 2007 15:36:30 +0200
Message-ID: <460A6F5E.6010608@um.edu.mt>
References: <460A177A.4080506@um.edu.mt> <460A5208.7070501@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <460A5208.7070501@computer.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Per Jessen <per@computer.org>
Cc: linux-c-programming@vger.kernel.org, nhorman@tuxdriver.com

cheers for the clarification, very much appreciated.

R.

Per Jessen wrote:
> Reggie Cushing wrote:
>   
>> Hi All - I wish some insight on the possibility of reallocating a
>> function stack to a malloced regions in realtime ie I jump out of a
>> function and the next time I jump in the stack would have moved along
>> with its data. To me it seems unreliable cause the values in the stack
>> have no type hence I would not know if the stack value is a data value
>> or a pointer. If I mistakenly interpret a data value as a pointer I will
>> update the data value resulting in data corruption. I would really wish
>> some expert insight in this on this subject.

>> What you're talking about is something long these lines:
>>
>> a=malloc(chunk);
>> memcpy( chunk, SP, size);
>> SP=chunk;
>>
>>
>> The only way you "know" what's on your stack is by the variable
>> declarations you've made in your code.  The stack, wherever it is, does
>> not contain any type info.
>>
>>
>> /Per Jessen, Zurich
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>     

-- 
Reggie Cushing
Systems Engineer
310, Dept Computer Science and AI
University of Malta, MSD06, MALTA
Tel: +356 2340 2130 

