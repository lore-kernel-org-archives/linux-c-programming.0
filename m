From: adwin <fox@sby.centrin.net.id>
Subject: Re[2]: start learning gcc ... how to ?
Date: Tue, 9 Apr 2002 23:01:18 +0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1913993471.20020409230118@sby.centrin.net.id>
References: <200204091150.g39Bo4825347@jupiter.centrin.net.id>
 <20020409130444.GA276@wotan>
Reply-To: adwin <fox@sby.centrin.net.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020409130444.GA276@wotan>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

MG> Hi,
MG>         gcc has lots of options, but theses are (almost) all I've needed:
MG> -Wall  (Warnings:ALL)
MG> -g      (generate debug info)
MG> -ggdb   (idem but with gdb extensions)
MG> -o      (output to file)
MG> -c      (compile only, don't link for makeing .o)
MG> -ansi   (kindda obvious)
MG> Well, I know is little but it might help you to start

how about with -l option ? (for library). I still don't understand
when I have to use this option and when I don't need to use it.
for example for compiling program that use math.h,it need -lm and when
you  create  a program with QT library you need to use -lqt and -lglut
for opengl etc etc ...

MG> I'd strongly recomend you reading a make tutorial

do you mean gnu automake and autoconf tutorial ?

is there any IDE like Borland Turbo C++ ?
or may be how to use KDevelop ?

-- 
Best regards,
 adwin                            

