From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Re: max heap usage of a Linux process
Date: Tue, 14 Nov 2006 11:56:39 +0530
Message-ID: <4559619F.3090904@sun.com>
References: <455873BA.1060908@Sun.COM>
 <d9def9db0611130609q305b243y188f01902c9ff418@mail.gmail.com>
 <1450f66c0611130739k5391a9adu26f9698f22df4c85@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <1450f66c0611130739k5391a9adu26f9698f22df4c85@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Dan Gary <funkychunkymunky@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Actually, I have the process-pid(s) and I want to find out 
programmatically, what's the max heap size that had been consumed by 
that process at any given moment(based on user command) from another 
process. It seems mallinfo().uordblks will give total occupied size of 
memory not the max heap size consumed. Also, how do I use malloc_stats()?

--Prasanta
Dan Gary wrote:

> unless parent is asking about malloc'd space, then mallinfo() or
> malloc_stats() might be what they're looking for, memory profiling the
> manual way, gotta love it
>
> On 11/13/06, Markus Rechberger <mrechberger@gmail.com> wrote:
>
>> Hi,
>>
>> On 11/13/06, Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com> wrote:
>> > Hi,
>> >
>> > Can anybody please tell how can I obtain the max. heap usage of a 
>> Linux
>> > process?
>> >
>>
>> theoretically 3 GB (3/4 of 4gb - which are addressable by 32 bit) on 
>> a 32bit machine on a 64bit machine 3/4 of 16exabyte.
>>
>> cheers,
>> Markus
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



