From: leo mueller <llug.dan@googlemail.com>
Subject: Re: problems with free()
Date: Tue, 28 Apr 2009 13:10:11 +0200
Message-ID: <c93f91ee0904280410p76ef99dfye5ef0a6cb98de2af@mail.gmail.com>
References: <c93f91ee0904280218o2f844cd0u2262db407ca8f468@mail.gmail.com>
	 <c93f91ee0904280220x663ff91fibeca0886af04458f@mail.gmail.com>
	 <6eee1c40904280341n4e332026i7d9800fd4f8059b4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=62IghJzbmrZmIs5mkRxLXdZN84rhjpsym7sUyWWUhoM=;
        b=FnmacRDZhFNW95oGOdFmaCTmnP4+hJnDZMSFVvpnsIvW/fE60Gw+QCQIU8YCCdzCFs
         C1Vm5YXwvsSrY63yRgI6+Z+Lo0uwg5iwMem1OFg0lxoHiPyaUxfvrA2Fol/JRFcBa70l
         DjaWTXtkT41wzCvB3uMVYeoDqf6589yk0lEuo=
In-Reply-To: <6eee1c40904280341n4e332026i7d9800fd4f8059b4@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj <vadiraj.cs@gmail.com>
Cc: linux-c-programming@vger.kernel.org

hi vadiraj,

thanks for your answer! first i thought about that, too, but if i do a
simple ...

char *x = (char *) malloc(1024 * 1024 * 100);
memset(x, 0, 1024 * 1024 * 100);
free(x);

... and put some sleeps in between (& before return)... i can see (->
htop) that
the % of mem is decreasing during runtime.... hmm...

2009/4/28 Vadiraj <vadiraj.cs@gmail.com>:
>
> On Tue, Apr 28, 2009 at 2:50 PM, leo mueller <llug.dan@googlemail.com>
> wrote:
>>
>> hi all,
>>
>> i got a little problem with free() ... i am allocating mem for a
>> special struct and putting it afterwards
>> into a linked list. allocating works fine, but freeing not. i'm
>> tracking the program with htop. after
>> allocating, the percentage of mem usage stays constant ...
>>
>> the test-file is attached.
>>
>> any help is appreciated. big thanks :)
>
> free() will put the chunk into the free pool of the process and not free
> away from the
> process. When you do a malloc again it would first try from the free pool,
> if it finds
> the size requested in the free pool it will give you the same.
> Hence you would not see any change.
>
> You can check that by, freeing an address and then requesting the same size.
> You will see that address freed and address allocated will be same in most
> of
> the case.
>
> Hope this helps.
>
