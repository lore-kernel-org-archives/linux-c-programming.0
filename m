From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: line buffered stdin
Date: Mon, 11 Jan 2010 20:51:48 +0000
Message-ID: <19275.36708.583271.381994@cerise.gclements.plus.com>
References: <4B4B5173.20504@max01.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4B4B5173.20504@max01.eu>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bastian Ruppert <ng@max01.eu>
Cc: linux-c-programming@vger.kernel.org


Bastian Ruppert wrote:

> under Linux stdin is line buffered,

More precisely, it's line buffered if stdin is a tty, fully-buffered
otherwise.

> that means you can read one byte with
> following statement:
> 
> read(0,&myvar,1);
> 
> You get the byte after typing one or more chars AND return.
> 
> But i need this function to return after every char entered in stdin.
> 
> Is there a function that reads stdin without line buffering?

User-space buffering of a stream (i.e. a "FILE *") can be controlled
with setvbuf() (or the other functions described in the setvbuf(3)
manpage).

However, the terminal driver also performs line-buffering by default
(so that you can edit the current line with Backspace, Ctrl-W,
Ctrl-U). This can be disabled with tcsetattr() (see ern0's reply for
details), although this also disables the use of Ctrl-D to generate
EOF.

> Is it possible to disable the linebuffer or to reduce the buffersize to one?
> Does this kind of manupilation have consequences for the hole system or 
> just for the app doing this?

setvbuf() only applies to a specific process. tcsetattr() affects the
terminal device, so you must restore the state upon termination (both
normal termination via exit() or return from main(), and abnormal
termination via a signal), upon suspension (i.e. SIGTSTP; you can't
catch SIGSTOP), or if you invoke a child process (via e.g. system())
which might need to use the terminal.

-- 
Glynn Clements <glynn@gclements.plus.com>
