From: Andriot <andriot@6wind.com>
Subject: Re: Printf and scanf
Date: Mon, 27 Jun 2005 20:11:03 +0200
Message-ID: <20050627181103.ABFB324F@eagle.6wind.com>
References: <20050605122105.1865.qmail@web52905.mail.yahoo.com> <d93f04c70506241420114b28da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <d93f04c70506241420114b28da@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hendrik Visage <hvjunk@gmail.com>
Cc: Ankit Jain <ankitjain1580@yahoo.com>, linux prg <linux-c-programming@vger.kernel.org>, newbie <linux-newbie@vger.kernel.org>

Hendrik Visage wrote:

>On 6/5/05, Ankit Jain <ankitjain1580@yahoo.com> wrote:
>
>  
>
>>i just want to know how scanf function can be used on
>>the place of printf and vice versa
>>    
>>
>
>In the Obfuscated C contest one of the first/early entries is one that
>states "Using read to write" (Or something to similar extend, or
>perhaps even using scanf to print). Reading that code is hackery, and
>from my first glance at the code, it was don't with quote and macro
>hackery.
>
>Thus you could #define scanf __prinf and #define printf __scanf... or
>something with similar confusing
>  
>

Of course, it is not possible to use directly printf like a scanf ;)
But you can use printf to write some values into arguments when you call 
the function. This uses special caracters you put in the format string. 
And this should prevent you to call printf with a string the user wrote, 
because this is a very big security hole.

JP


