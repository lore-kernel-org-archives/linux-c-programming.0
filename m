From: "Task Struct From Hell" <taskstructfromhell@googlemail.com>
Subject: Re: c preprocessor expansion
Date: Fri, 9 Jan 2009 08:15:13 +0000
Message-ID: <ef37ea20901090015i3d4ae177k5d587125ab0b212f@mail.gmail.com>
References: <ef37ea20901080949i2cd875fbk58b4ae3605655812@mail.gmail.com>
	 <a3399010901081011p607d688es98a4ca77581b0a88@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=PuTmk7hY4wGNkAHwoEtthDVjGck//pO9sXvQ8FVYF24=;
        b=ILj0yVZfdklh7YFUUqKrYYiD3I2IOZ+5tUpfxLLvWcQz3yaTNfVBH/nC90n8UNNz2m
         WuIpy360nAVoR9ZjvbW4TsomK0xwV8Lb2uCAkr1baP9knivWwmiGNEj/X4FabJEd+R73
         novEzONmR9YSznbJdd51qgbrO/tX96ntF8UeM=
In-Reply-To: <a3399010901081011p607d688es98a4ca77581b0a88@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ninjaboy <n0b0dyn1nj4@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Jan 8, 2009 at 6:11 PM, ninjaboy <n0b0dyn1nj4@gmail.com> wrote:
> 2009/1/8 Task Struct From Hell <taskstructfromhell@googlemail.com>:
>> Hi,
>>
>> I was wondering if gcc has any argument which allows for the expansion
>> of all macros in a file, just so if we have something like the
>> following:
>>
>>
>> #define FOO "bar"
>>
>> int main() {
>>   printf(FOO);
>> }
>>
>> It will output this:
>>
>> int main() {
>>   printf("bar");
>> }
>>
>
> gcc -E code.c -o codemacro.m

Cheers for all responses so far!
