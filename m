From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Complete a character array.
Date: Wed, 11 Jan 2006 18:18:21 +0000
Message-ID: <17349.19437.572848.811275@cerise.gclements.plus.com>
References: <22239.81.33.200.252.1136979040.squirrel@webmail.sinanimodelucro.dyns.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <22239.81.33.200.252.1136979040.squirrel@webmail.sinanimodelucro.dyns.cx>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ibon Castilla <estri@euskalnet.net>
Cc: linux-c-programming@vger.kernel.org


Ibon Castilla wrote:

> I've started with keyboard input functions, and here is my question: how
> can I do to complete an a character array?. Both getchar() and scanf()
> need the user to push ENTER. I remember getche() and getch(), but I didn't
> found any similar function on any library.

If the kernel's terminal driver is in "canonical mode", it doesn't
pass input to the application until you press return. This is so that
it can implement line editing (backspace, Ctrl-W, Ctrl-U).

If you want to read each character as it is typed, you need to disable
canonical mode with tcsetattr().

If you are writing an interactive application, you may want to use the
curses library, which does a lot of the work involved in terminal
handling for you.

-- 
Glynn Clements <glynn@gclements.plus.com>
