From: "J." <mailing-lists@xs4all.nl>
Subject: Re: clear the screen
Date: Mon, 21 Feb 2005 08:59:46 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0502210854220.600-100000@hestia>
References: <1108969688.5088.12.camel@localhost.localdomain>
Reply-To: linux-c <linux-c-programming@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <1108969688.5088.12.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c <linux-c-programming@vger.kernel.org>

On Mon, 21 Feb 2005, kaushal wrote:

> hello all,
> 	Sorry for a very basic question.I would like to know how to clear the
> screen from within a c program without using system("clear") or any of
> the ncurses functions.Can we do this using printf?My program is in raw
> mode so is there any feature available by which I can use the termios
> structure for clearing the screen if it is not possible with printf.Long
> ago when I used work in the dos platform I used conio.h and clrscr()
> rourine.I guess I have to write that clrscr() routine's code itself.Im
> working on a linux machine now.
> 
> Thanks in advance.
> -kaushal.

Don't know if this is of any help to you:
 
#include <stdio.h>

int main(void) {

 printf("\e[0m\e[2J\e[1;1H");

 return 0;
}

When the compiler is called with some warning flags it might complain
about a non-standard escape sequence, but it compiles fine and it works.
 
Goodluck & Regards,

J.

--
http://www.rdrs.net

