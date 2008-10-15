From: "johnny_xing" <johnny_xing@banshing.com>
Subject: RE: How to call another separate program and passing some variables in C?
Date: Wed, 15 Oct 2008 14:27:23 +0800
Message-ID: <0E415EA45AC641298E702FBDEDADEA87@johnny>
References: <DF93814AEDB44B7484B8BF8F416AA50D@johnny> <c15440c50810140412r7df6c411xdf24dd6a16590132@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c15440c50810140412r7df6c411xdf24dd6a16590132@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: korfuri@gmail.com
Cc: linux-c-programming@vger.kernel.org

Hi, Uriel

Yes I need to execute two separate programs although I know it would be much
easier if I could put into one program.

The reason is the first program invokes lots of other modules and program
and it has been fixed and running that I don't know how to add in the second
program.

However, if I could invoke the second program using system() and pass some
integers to the second program to generate the output I want, it will be
good enough.

Eg: system("/usr/local/src/program2"); 

The problem is I don't know how to pass some integers upon invoking it.

Is it something like this if I want to pass an integer 1?
system("/usr/local/src/program2" 1);

Thanks & Best Regards,
 
Johnny Xing
-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
korfuri@gmail.com
Sent: 2008年10月14日 19:12
To: johnny_xing
Cc: linux-c-programming@vger.kernel.org
Subject: Re : How to call another separate program and passing some
variables in C?

2008/10/14, johnny_xing <johnny_xing@banshing.com>:
> Hi,
>
> Forgive me if my question is so simple as I am a newbie to programming..
>
> I have two C programming and I want to call second C file within my first
C
> program, upon calling, I need to pass some variables (like 1 or 0) to the
> second program.
>
> Can anyone tell me how to do? I searched system() but it seems not be able
> to do this.
>
> Thanks & Best Regards,
>
> Johnny
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Hi,

You can use system() if you build the command-line (e.g. with
sprintf()) to pass the arguments you want. Then you can access it in
your 2nd program with argc/argv.

An alternative is to use fork() and execve(). Please note that you
have to convert each argument to a string so execve() can use it. Here
again you can use sprintf() for this purpose.

But are you sure you need two separate programs ? You can build 2 C
files together into one binary. That makes passing variables much
easier as it results to a normal function call.

Hope this will help
Regards,
Uriel

-- 
Uriel "Korfuri" Corfa
Epitech student
--
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

