From: "Paul Gimpelj" <pgimpelj@sympatico.ca>
Subject: re: logging console input
Date: Tue, 25 May 2004 12:07:55 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <00ea01c44272$70eb72c0$3410fea9@zoom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Yes. and no. a fork or Tee would be nice.
Someone suggested to use script.
but I would prefer to bounce around consoles and xconsoles.
and trap and journal all input.
thanks
paul

--------------------------------


John T. Williams reponds:

Am I right in saying that what you want is a key logger, which logs
all key strokes regardless of which terminal they are inputted to.

In fact a program that sits between the kernels main keyboard buffer
and user land programs, logging all input before any user land program
can remove them from the main input buffer?


On Tue, 2004-05-25 at 09:54, Paul Gimpelj wrote:
> Well,
>
> Say I am typing all day and night into console and want a record of my
input
> to review later.
> in case I forgot what i typed in hours ago.
>
> Under windows one hooks into the journaling hook vector. by writing a
> program in c.
> This gives the keyboard input so it can be recorded into a file.
>
> Is there a simple way to log the keyboard of the console, or does one need
> to write a module
> to hook the kernel.
>
> thanks.
>
>
> Ps.
> I am using ms mail 6. and wouldn't it be nice if i could just click reply
> and it would send my response
> to the linux-c........
>
> rather than ....
>
> or is there a different email browser set up for this mail list?
>

