From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: can't understand linking behaviour
Date: Tue, 29 May 2007 00:29:18 +0100
Message-ID: <18011.26062.21505.664418@cerise.gclements.plus.com>
References: <46599AB7.1010701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46599AB7.1010701@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> main.c calls function firstcall()
> a.c defines function firstcall() which calls secondcall()
> b.c defines function secondcall()
> 
> To build the executable main, I need to do:
> 
> gcc -fPIC -c a.c
> gcc -fPIC -shared -o liba.so a.o
> gcc -fPIC -c b.c
> gcc -fPIC -shared -o libb.so b.o
> gcc -o main main.c -L. -la -lb
> 
> My question is, why does not the creation of liba.so require the 
> presence of and linking against libb.so, seeing as a.o contains 
> firstcall() which calls secondcall() present only in libb.so?
> 
> The gcc command building liba.so does not use -c which would prevent the 
> linker from being called. So if the linker is called then it should 
> require the presence of and linking to libb.so to resolve the reference 
> to the external function secondcall(). But this does not happen.

Libraries can have undefined references. Sometimes this is necessary,
e.g. if the library depends upon a function which is supposed to be
provided by the executable.

> What does happen is that I am supposed to specify at the point of 
> building the *executable* not only the libraries that the executable 
> depends on, but also the libraries that *those* libraries depend on, as 
> well as, presumably, any third-level, fourth-level and upto n-th level 
> dependencies.

Not if the libraries themselves have dependency information. E.g.:

	gcc -fPIC -c b.c
	gcc -fPIC -shared -o libb.so b.o
	gcc -fPIC -c a.c
	gcc -fPIC -shared -o liba.so a.o -L. -lb
	gcc -o main main.c -L. -Wl,-rpath-link,. -la

> This seems highly counter-intuitive. Why would the linker require *only* 
> at *executable* build-time the libraries,

You're looking it at the wrong way.

Why would the linker require all external symbols to be resolved at
the time the library is built?

> and the whole dependency *tree* at that, to be specified?

Ultimately, any symbols which are required must be provided, so this
is checked when the executable is built. There isn't any need to check
it before then.

> Why does it not need at each level of 
> build of an executable or library its and only its own dependencies?

Because there is no reason for such a requirement.

-- 
Glynn Clements <glynn@gclements.plus.com>
