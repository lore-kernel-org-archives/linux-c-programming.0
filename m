From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Serial Reading
Date: Thu, 20 Apr 2006 15:39:01 +0200
Message-ID: <6a00c8d50604200639s256665efja4bb31353862f6ae@mail.gmail.com>
References: <OF6B1B71E6.FB0713A3-ON83257156.004830D6-83257156.0048FB31@Cyclades.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF6B1B71E6.FB0713A3-ON83257156.004830D6-83257156.0048FB31@Cyclades.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 4/20/06, ronaldo.afonso@avocent.com <ronaldo.afonso@avocent.com> wrote:
>
> Hello all,
>
> I'm trying to read data from a "tty" one character at a time. I'd like that
> when a single byte was inputed on one side of my tty, it imediataly must be
> read by my user space program on the otherside. It is not happening in my
> environment and I belive the cause is a buffer in the tty driver. I'd like
> to know if it could be happening, I mean, could a tty be buffering data
> before send to user space, and if so, what can I do to inform the tty
> driver not buffering data anymore?
> Thanks.

By default, the terminal is configured to be in line-by-line mode to
allow pre-processing of characters and the like.  That mode provides
better usability and improves bandwidth utilization.

To read a character at a time you will have to put the device into raw
mode using the tcsetattr(3) function.  First of all configure the
termios structure accordingly, which means to turn off echoing and
canonical mode.

The following example is adopted (not sure, but I think so) from the
Stevens text and should illustrate the basic idea:

--- BEGIN ---

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <termios.h>
#include <unistd.h>

struct termios tty, otty;

void raw(struct termios tty) {
	tty.c_lflag     &= ~(ECHO | ECHOK | ICANON);
	tty.c_cc[VTIME] = 1;
	tcsetattr(STDIN_FILENO, TCSANOW, &tty);
}


void cooked(struct termios tty) {
	tty.c_lflag     = otty.c_lflag;
	tty.c_cc[VTIME] = 0;
	tcsetattr(STDIN_FILENO, TCSANOW, &tty);
}


int main(int argc, char **argv) {
	int i, j;
	
	/* Get original tty settings and save them in otty */
	tcgetattr(STDIN_FILENO, &otty);
	tty = otty;
	
	/* Set desired mode */
	raw(tty); /* cooked() for canonical mode */
	
	for (i = 0; i < 10; i++) {
		fprintf(stdout, "Type a character: ");
		fflush(stdout);
		j = getchar();
		fprintf(stdout, "%c\n", j);
		fflush(stdout);
	}
	
	/* Reset to the original settings */
	tcsetattr(STDIN_FILENO, TCSANOW, &otty);
	return (0);
}

--- END ---

	\Steve
