From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: start learning gcc ... how to ?
Date: Tue, 9 Apr 2002 19:34:50 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020409193450.B1149@neutrino.particles.org>
References: <200204091150.g39Bo4825347@jupiter.centrin.net.id> <20020409130444.GA276@wotan> <1913993471.20020409230118@sby.centrin.net.id>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1913993471.20020409230118@sby.centrin.net.id>; from fox@sby.centrin.net.id on Tue, Apr 09, 2002 at 11:01:18PM +0700
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adwin <fox@sby.centrin.net.id>
Cc: linux-c-programming@vger.kernel.org

On Tue, Apr 09, 2002 at 11:01:18PM +0700, adwin wrote:

> how about with -l option ? (for library). I still don't understand
> when I have to use this option and when I don't need to use it.

When your program uses functions that someone else has implemented
for you, then you have to link the appropriate shared libraries. This
can happen either statically, either dynamically. Libraries contain
code that can be called from other programs. This is a great feature
and help us to avoid duplicating our code. 

By default, gcc links to your code the libc (standard C library). Libc
contains the well known functions such as printf(), scanf(), etc. The
-l switch informs the linker to perform further linking and attach
to your source the code that is embeded in the libraries, which are
listed after the  switch.

> is there any IDE like Borland Turbo C++ ?
> or may be how to use KDevelop ?

KDevelop helps for KDE (or plain Qt) apps. Glade is a form designer
for GTK+ apps. Adjusta is a full IDE for Gnome/GTK+ apps. 

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
