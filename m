From: "Trevor Woollacott [ MTN - Innovation Centre ]" <Woolla_T@mtn.co.za>
Subject: RE: problems with free()
Date: Tue, 28 Apr 2009 16:48:12 +0200
Message-ID: <DB3D4A973BBA18429901743FBD435AE605DDF64D93@SMXMB01-FLD.mtn.co.za>
References: <c93f91ee0904280218o2f844cd0u2262db407ca8f468@mail.gmail.com>
	 <c93f91ee0904280220x663ff91fibeca0886af04458f@mail.gmail.com>
	 <6eee1c40904280341n4e332026i7d9800fd4f8059b4@mail.gmail.com>
 <c93f91ee0904280410p76ef99dfye5ef0a6cb98de2af@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c93f91ee0904280410p76ef99dfye5ef0a6cb98de2af@mail.gmail.com>
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: leo mueller <llug.dan@googlemail.com>, Vadiraj <vadiraj.cs@gmail.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

>From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of leo mueller
>Sent: Tuesday, 28 April 2009 01:10 PM
>To: Vadiraj
>Cc: linux-c-programming@vger.kernel.org
>Subject: Re: problems with free()
>
>hi vadiraj,
>
>thanks for your answer! first i thought about that, too, but if i do a
>simple ...
>
>char *x = (char *) malloc(1024 * 1024 * 100);
>memset(x, 0, 1024 * 1024 * 100);
>free(x);
>
>... and put some sleeps in between (& before return)... i can see (->
>htop) that
>the % of mem is decreasing during runtime.... hmm...
>
>2009/4/28 Vadiraj <vadiraj.cs@gmail.com>:
>>
>> On Tue, Apr 28, 2009 at 2:50 PM, leo mueller <llug.dan@googlemail.com>
>> wrote:
>>>
>>> hi all,
>>>
>>> i got a little problem with free() ... i am allocating mem for a
>>> special struct and putting it afterwards
>>> into a linked list. allocating works fine, but freeing not. i'm
>>> tracking the program with htop. after
>>> allocating, the percentage of mem usage stays constant ...
>>>
>>> the test-file is attached.
>>>
>>> any help is appreciated. big thanks :)
>>
>> free() will put the chunk into the free pool of the process and not free
>> away from the
>> process. When you do a malloc again it would first try from the free pool,
>> if it finds
>> the size requested in the free pool it will give you the same.
>> Hence you would not see any change.
>>
>> You can check that by, freeing an address and then requesting the same size.
>> You will see that address freed and address allocated will be same in most
>> of
>> the case.
>>
>> Hope this helps.
>>

Vadiraj is correct. I'm not going into the details of how malloc() and free() work, but (very) basically, when you use malloc() the heap is searched for a free chunk. If there isn't a large enough chunk available, it will make more space available on the heap using the syscall brk(). When you call free(), the chunk is given back to the heap, making it available for a later stage. Even after free, the heap usually stays that size and the memory isn't returned to the OS immediately (It may depend on the C implementation).
But I think that in order to keep the number of brk() syscalls to a minimum (for optimal performance), it will probably wait until there is one large chunk that can be freed instead of freeing lots of smaller chunks.


NOTE: This e-mail message is subject to the MTN Group disclaimer see http://www.mtn.co.za/SUPPORT/LEGAL/Pages/EmailDisclaimer.aspx
