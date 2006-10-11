From: Henry Margies <henry.margies@gmx.de>
Subject: Re: Turning PC monitor on/off
Date: Wed, 11 Oct 2006 10:11:57 +0200
Message-ID: <1160554317.4000.3.camel@localhost.localdomain>
References: <f68850780610102304g35ea4fa6pb4bf2a0db9b14668@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <f68850780610102304g35ea4fa6pb4bf2a0db9b14668@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: C programming list <linux-c-programming@vger.kernel.org>

On Wed, 2006-10-11 at 11:34 +0530, Raseel Bhagat wrote:
> Hi,
>  I want to write a C code for toggling my PC monitor on/off in Linux.
> Can some one point to any reading material or a hint or line of thought ?
> 

Maybe it also helps to look at the sources of xset program  of X11.

xset dpms force off

Turns off the monitor (until you press a key or so).


Henry

