From: Progga <abulfazl@juniv.edu>
Subject: Re: getch()
Date: Fri, 8 Nov 2002 15:04:01 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200211081504.01461.abulfazl@juniv.edu>
References: <200211071046.24987.abulfazl@juniv.edu> <200211072135.59164.abulfazl@juniv.edu> <20021107200436.C1136@neutrino.particles.org>
Reply-To: abulfazl@juniv.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021107200436.C1136@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


> 	tcgetattr(STDIN_FILENO, &attrib);
> 	attrib.c_lflag &= ~(ICANON|ECHO); /* disables canonical mode, echo */
> 	attrib.c_cc[VMIN] = 0;            /* non-blocking input */
> 	attrib.c_cc[VTIME] = 0;
> 	tcsetattr(STDIN_FILENO, TCSAFLUSH, &attrib);

 Thanks all for the super suggestions. I only had to change one line for 
getting what I need :

 > 	attrib.c_cc[VMIN] = 0;            /* non-blocking input */
to
 	attrib.c_cc[VMIN] = 1;            /* blocking input */

 If input is taken in non-blocking mode then something like:

  while( read( STDIN_FILENO, &ch, 1 ) != 1 ) ;

  needs to be used. It's also OK. But to use getchar()/cin, using blocking 
mode appeared the most suitable. So I did the change. The chance to control 
the echo and nonecho mode is another beauty. I needed the nonecho and it was 
already in the code. Thanks again from me and my friend Mahbub.

 Khoda Hafez 
 Progga

