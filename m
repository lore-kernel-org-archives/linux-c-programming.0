From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: functions to determine dementions of console?
Date: Sun, 30 May 2004 23:35:18 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040530203518.GH7410@luna.mooo.com>
References: <Pine.LNX.4.58.0405231854400.11050@debian> <Pine.LNX.4.21.0405302056120.30001-100000@hestia>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0405302056120.30001-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sun, May 30, 2004 at 09:12:32PM +0200, J. wrote:
> On Sun, 23 May 2004, ameer armaly wrote:
> 
> > Hi all.
> > I was wondering if there are a set of functions/system calles to let me
> > know what someone's set their tty length and heighth too?  I do this
> > because I don't want to presume 80x25 in case someone's got it set
> > otherwise.
> > 

Its usually done using the environment variables in COLUMNS, AFAIK. They
appear after the first null of argv IIRC.

> > Ameer
> 
> on the console the command `stty -a` will print:
> speed 9600 baud; rows 33; columns 89; line = 0;
> ....
> ....
> etc..
> 
> For a c program have a look at the term manpage and use the settings from
> 'terminfo'
> 
> #include <stdio.h>
> #include <term.h>
> #include <ncurses.h>
> 
> int main(void) {
>  int num_rows = 0, num_columns = 0;
> 
>  setupterm(NULL, fileno(stdout), (int *)0); 
>  num_rows = tigetnum("lines");
>  num_columns = tigetnum("cols");
> 
>  printf("terminal:\ncolumns: %d\nrows %d\n", num_columns, num_rows);
> 
>  return 0;
> }
> 
> etc.....
> 
> G00dlUcK.....
> 
> Jeroen Reynders.
> 
> --
> http://www.xs4all.nl/~winnetou/
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
