From: Jad Saklawi <Jad@Saklawi.info>
Subject: Re: c++ compiling problem. undefined reference to main
Date: Tue, 06 Apr 2004 23:55:40 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4073194C.2000506@Saklawi.info>
References: <407316A0.1060708@telefonica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <407316A0.1060708@telefonica.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: srg <srgqwerty@telefonica.net>
Cc: linux-c-programming@vger.kernel.org

srg wrote:

> Hello:
>
> We have a problem compiling c++ code.
> At the bottom of this message you can see the compiler error.
>
> [..]

> # g++ -o cj_enteros cj_enteros.cpp
> /usr/lib/gcc-lib/i486-linux/3.3.3/../../../crt1.o(.text+0x18): In 
> function `_start':
> ../sysdeps/i386/elf/start.S:98: undefined reference to `main'
> collect2: ld returned 1 exit status


 Yes, your code cj_enteros.cpp doesn`t have a main function. To compile 
it do g++ -c cj_entros.cpp you will get  cj_entros.o. To link to 
hello.cpp use g++ cj_entros.o hello.c -o youroutput


Greets,
Jad
