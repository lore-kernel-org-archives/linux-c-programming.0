From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Re[2]: start learning gcc ... how to ?
Date: Tue, 9 Apr 2002 23:09:49 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15539.26285.354426.644344@cerise.nosuchdomain.co.uk>
References: <200204091150.g39Bo4825347@jupiter.centrin.net.id>
	<20020409130444.GA276@wotan>
	<1913993471.20020409230118@sby.centrin.net.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1913993471.20020409230118@sby.centrin.net.id>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: adwin <fox@sby.centrin.net.id>
Cc: linux-c-programming@vger.kernel.org


adwin wrote:

> MG>         gcc has lots of options, but theses are (almost) all I've needed:
> MG> -Wall  (Warnings:ALL)
> MG> -g      (generate debug info)
> MG> -ggdb   (idem but with gdb extensions)
> MG> -o      (output to file)
> MG> -c      (compile only, don't link for makeing .o)
> MG> -ansi   (kindda obvious)
> MG> Well, I know is little but it might help you to start
> 
> how about with -l option ? (for library). I still don't understand
> when I have to use this option and when I don't need to use it.
> for example for compiling program that use math.h,it need -lm and when
> you  create  a program with QT library you need to use -lqt and -lglut
> for opengl etc etc ...

If you use functions from a particular library, you use -l to specify
that library. However, "gcc" includes "-lc" automatically, and "g++"
includes "-lc -lstdc++" automatically.

The argument to "-l" is the name of the library, without the "lib"
prefix or any suffixes. E.g. "-lX11" will link against libX11.so
(shared library) or libX11.a (static library). If the library isn't in
a standard directory (/lib or /usr/lib), you also need to specify the
directory with "-L" (e.g. "-L/usr/X11R6/lib" for X libraries).

> MG> I'd strongly recomend you reading a make tutorial
> 
> do you mean gnu automake and autoconf tutorial ?

No, he means a tutorial for "make". This is the program which is
normally used to control compilation. If you are building a program
from multiple source files, you don't want to type lots of "gcc"
commands manually. See "info make" (or, if you are using Emacs,
"C-h C-i make RET").

-- 
Glynn Clements <glynn.clements@virgin.net>
