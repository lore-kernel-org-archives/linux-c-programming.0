From: "Daniel." <danielhilst@gmail.com>
Subject: Re: How to check if char pointer is a constant!?
Date: Fri, 8 Jul 2016 09:33:03 -0300
Message-ID: <CAF3SDA5-L--FOXe-AzaRf7QE0Qx+XAuLeWNnFN-96smSEYJ7GA@mail.gmail.com>
References: <CAF3SDA6G32Kub4rK5BSmx7TkWoXnGWW2ESyHnM_+3t-naVPDww@mail.gmail.com>
 <20160707202621.GP620@orbyte.nwl.cc>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=sC9EkucCS43Co2enUqYEbhPqzMiT+XCuk9OlC0qmkXk=;
        b=eoS6bN/XdR2FlWUDX0suahTBdYAJDU3WGo8YLtoxlhBbe3Uy9gFr84AsAVF3fDyzdo
         U8EaajhNalEo17veA77CY7aGujY7HaO2MGzTmsmlsIf+djueOu6Jsj52MhlZir1pug5b
         /PaCW7BbCNkfdclffZ/vSDQ/5VaUapgY5P02tMhlb/XJfmrdwdcHjInPtknSfvi0GgFn
         ceaf88VSrpsw/5hnxIQ1M51zG1b5uTvxfQMcvTbhNpvywdhb4/o/HztiHyw2WR524M0S
         wJ+KtoUQlGS69teIHEDLMo4HZ1SOvRkj/kwyRGgHNJyjObkX21hW5FMpUv63wEPrAkTN
         Zdng==
In-Reply-To: <20160707202621.GP620@orbyte.nwl.cc>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Sutter <phil@nwl.cc>, "Daniel." <danielhilst@gmail.com>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi all thanks for the reply.

I think I wasn't clear. Here is a working example: http://codepad.org/0SUG6IcQ

The function get_pair_from_string() should I) remove trailing spcaes, II) return
the address for key and value using it's last parameters. The problem is that
since I modify the first parameter calling with strings constants generates a
segmentation fault. This is because strings constans aren't modifiable. I wan't
to have better hints when this happen than just "SEGSEGV". I think that the
-Wwrite-strings is what I was looking for :D, thanks Phil!!!

John, I'll be in production, but not at this time. Luckly, that
function is file scoped
so I don't have to bother that much. Still I like to avoid the crypt
"SEGSEGV" error
message as much as possible. Usually I assert for NULL pointers and give a nice
error message but this case is trickier. I'll take Phil advice and use
-Wwrite-strings

Thanks everybody!

Regards,

2016-07-07 17:26 GMT-03:00 Phil Sutter <phil@nwl.cc>:
> Hi,
>
> On Thu, Jul 07, 2016 at 04:40:56PM -0300, Daniel. wrote:
>> I have some function, say
>> void empty(char *p) { p[0] = '\0'; }
>>
>> If I call it like this empty("Hello") it will segfaults since "Hello"
>> is put in readonly section of the program. Is there a way to check for
>> this?! Maybe some nasty gcc extension!?
>
> The problem here is upon calling the function, the const char *
> parameter is implicitly casted to char *. So inside the function there
> is no way to check this I'd say. You can call gcc with -Wwrite-strings
> to have it generate a warning whenever a string constant is assigned to
> a non-const char * variable.
>
> HTH, Phil



-- 
"Do or do not. There is no try"
  Yoda Master
