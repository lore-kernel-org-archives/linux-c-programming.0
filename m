From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: getch()
Date: Thu, 7 Nov 2002 20:04:36 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021107200436.C1136@neutrino.particles.org>
References: <200211071046.24987.abulfazl@juniv.edu> <200211072135.59164.abulfazl@juniv.edu>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200211072135.59164.abulfazl@juniv.edu>; from abulfazl@juniv.edu on Thu, Nov 07, 2002 at 09:35:59PM +0600
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Progga <abulfazl@juniv.edu>
Cc: linux-c-programming@vger.kernel.org

On Thu, Nov 07, 2002 at 09:35:59PM +0600, Progga wrote:
>   Is there any way to get a character without pressing return in a simple
>  console application ( something like getch() of ncurses ) ? It's needed in
>  a test shell for getting the arrow keypresses for using the history list.
>  TIA.

Yes. Test it before, it is old code...

Using the code below, I had a loop (it is from a console game I
was trying to write 4-5 years before):

    while (ch! = 'q') {
      fflush (stdin);
      if (read (STDIN_FILENO, &ch, 1) > 0) 
	if (ch >= _UP && ch <= _LEFT) 
	  {
	    check_move (ch);
	    ...
	  }
	....
	....
    }		

And, what was _UP and _LEFT? Hmm... 

[anteater@neutrino berserkers]$ grep _UP *.h
#define _UP 65
[anteater@neutrino berserkers]$ grep _LEFT *.h
#define TOP_LEFT 51
#define BOT_LEFT 52
#define _LEFT 68

Elias

--CUT HERE--

/*
 * Changing Terminal attributes using low level terminal handling,
 * in order to have non-buffered, non-echoed, non-blocking input.
 * 
 * */

#include <stddef.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>

struct termios saved_attrib;

void reset_input_mode(void)
{
	tcsetattr(STDIN_FILENO, TCSANOW, &saved_attrib);
}

void set_input_mode(void)
{
	struct termios attrib;
	char *name;
	
	/* check stdin is a terminal */
	
	if (!isatty(STDIN_FILENO)) {
		fprintf(stderr, "Not a terminal!\n");
		exit(EXIT_FAILURE);
	}
	
	/* save original attributes */
	
	tcgetattr(STDIN_FILENO, &saved_attrib);
	atexit(reset_input_mode);
	
	/* make the changes */
	
	tcgetattr(STDIN_FILENO, &attrib);
	attrib.c_lflag &= ~(ICANON|ECHO); /* disables canonical mode, echo */
	attrib.c_cc[VMIN] = 0;            /* non-blocking input */
	attrib.c_cc[VTIME] = 0;
	tcsetattr(STDIN_FILENO, TCSAFLUSH, &attrib);
}

