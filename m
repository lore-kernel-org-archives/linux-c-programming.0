From: "J." <mailing-lists@xs4all.nl>
Subject: Re: functions to determine dementions of console?
Date: Sun, 30 May 2004 21:12:32 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0405302056120.30001-100000@hestia>
References: <Pine.LNX.4.58.0405231854400.11050@debian>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0405231854400.11050@debian>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: ameer armaly <ameer@charter.net>

On Sun, 23 May 2004, ameer armaly wrote:

> Hi all.
> I was wondering if there are a set of functions/system calles to let me
> know what someone's set their tty length and heighth too?  I do this
> because I don't want to presume 80x25 in case someone's got it set
> otherwise.
> 
> Ameer

on the console the command `stty -a` will print:
speed 9600 baud; rows 33; columns 89; line = 0;
....
....
etc..

For a c program have a look at the term manpage and use the settings from
'terminfo'

#include <stdio.h>
#include <term.h>
#include <ncurses.h>

int main(void) {
 int num_rows = 0, num_columns = 0;

 setupterm(NULL, fileno(stdout), (int *)0); 
 num_rows = tigetnum("lines");
 num_columns = tigetnum("cols");

 printf("terminal:\ncolumns: %d\nrows %d\n", num_columns, num_rows);

 return 0;
}

etc.....

G00dlUcK.....

Jeroen Reynders.

--
http://www.xs4all.nl/~winnetou/


