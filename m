From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: start learning gcc ... how to ?
Date: Fri, 12 Apr 2002 12:22:25 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020412122224.B1132@neutrino.particles.org>
References: <200204091150.g39Bo4825347@jupiter.centrin.net.id> <20020409130444.GA276@wotan> <1913993471.20020409230118@sby.centrin.net.id> <20020409193450.B1149@neutrino.particles.org> <1018533665.9524.5.camel@abodh.lan.deeproot.co.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1018533665.9524.5.camel@abodh.lan.deeproot.co.in>; from sushmita@deeproot.co.in on Thu, Apr 11, 2002 at 07:31:05PM +0530
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sushmita roy <sushmita@deeproot.co.in>
Cc: linux-c-programming@vger.kernel.org

On Thu, Apr 11, 2002 at 07:31:05PM +0530, sushmita roy wrote:
> On Tue, 2002-04-09 at 22:04, Elias Athanasopoulos wrote:
> 
> > When your program uses functions that someone else has implemented
> > for you, then you have to link the appropriate shared libraries. This
> > can happen either statically, either dynamically.
> 
> Can anyone please highlight on the fact as how do we link libraries
> statically or dynamically...
> what's the difference exactly???
> i usually compile my programs like -
> 
> gcc sys_monitor.c -lcgic -lflate -L(specify the path here).. -o
> sys_monitor.o

By default, gcc forces dynamic linking, but you can use the -static
switch to make an explicit static linking.

Dynamic linking means that the elf of your app knows just what libraries
depends on. It doesn't embed the actual code. Instead, the dynamic linker
adds the required code whenever you run your application, by loading
the correct libraries. Using dynamic linking you reduce the size of your
executable, but you must be sure that you have the exact libraries needed
in every machine that your application runs.

Static linking means that the whole needed code would be added in the elf.
This results to huge executables, but also able to run everywhere since
they don't have any library depedencies.

% echo "int main(void) {}" > foo.c
% gcc foo.c -o foo
% ls -l foo
-rwxrwxr-x    1 anteater anteater    13592 Apr 12 12:18 foo
% gcc foo.c -static -o foo
% ls -l foo
-rwxrwxr-x    1 anteater anteater  1673122 Apr 12 12:18 foo

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
