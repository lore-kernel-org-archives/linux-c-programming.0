From: "Camillo Dell'mour" <c.dellmour@web.de>
Subject: Re: how to link mqueue library
Date: Thu, 16 Dec 2004 08:39:06 +0200
Message-ID: <1438051141@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi Ron
the math lib is named libm and the curses lib  libcurses

so the by the -l option in gcc you do not have to write "lib..."

I don't  who the mqueue libary is named, But I think libqueue so you shoult write -lqueue

ron wrots --
> 
> Hello.
> 
> I seem to have a problem linking the mqueue library....
> What's the library name to be added to the "-l" option of cc/gcc?
> If -lm is for the math library... -lcurses for ncurses,
> what's the library name for mqueue? -lmqueue??
> 
> -Ron.
> 


__________________________________________________________
Mit WEB.DE FreePhone mit hoechster Qualitaet ab 0 Ct./Min.
weltweit telefonieren! http://freephone.web.de/?mc=021201

