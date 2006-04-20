From: Mihai Dontu <mdontu@bitdefender.com>
Subject: Re: Serial Reading
Date: Thu, 20 Apr 2006 16:23:20 +0300
Message-ID: <44478B48.8050001@bitdefender.com>
References: <OF6B1B71E6.FB0713A3-ON83257156.004830D6-83257156.0048FB31@Cyclades.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF6B1B71E6.FB0713A3-ON83257156.004830D6-83257156.0048FB31@Cyclades.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

ronaldo.afonso@avocent.com wrote:
> 
> 
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
> 
> 
> ====================================================
> Ronaldo Z. Afonso
> Software Engineering
> Avocent Corporation, formerly Cyclades
> ronaldo.afonso@avocent.com
> Phone: 55 11 5033-3361
> Fax: 55 11 5033-3388
> www.avocent.com
> ====================================================
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
Hi,

This is a small demo I made some time ago. Should help.

#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/select.h>
#include <termios.h>
#include <unistd.h>

int main( void )
{
     fd_set read_fd;
     struct termios t;
     struct timeval tv;

        /* Since '0' is open()-ed to STDIN... let's use this */
        /* "See" what the terminal knows */
     tcgetattr( 0, &t );

        /* "Tell" the terminal not to wait for EOL (Enter) */
     t.c_lflag &= ~( ICANON );

        /* This should be restored if not needed anymore */
        tcsetattr( 0, TCSANOW, &t );

     printf( "Waiting for ESC ...\n" );
     while ( 1 ) {
          memset( &tv, 0, sizeof( tv ) );
          tv.tv_sec = 1;

                /* These two below shold not be needed (should be outside the loop), but somehow the program won't work without
them */
          FD_ZERO( &read_fd );
          FD_SET( 0, &read_fd );

                /* Aaa... multiplexing for the penguins :-) */
          if ( select( 1, &read_fd, NULL, NULL, &tv ) > 0 && FD_ISSET( 0, &read_fd ) ) {
               unsigned v = 0;

                        /* Read what we've got so far */
               read( 0, &v, sizeof( v ) );

                        /* Mask out the extra data and leave the character code */
               v &= 0x7F;

                        /* This has been deduced experimentaly :-) */
                if ( v == 0x1b ) printf( "ESC!\n" );
          } else {
                       /* Do something */
                       printf( "Zum\n" );
                }
     }
     return 0;
}

Enjoy,
M.D.

-- 

|_|0|_|
|_|_|0|
|0|0|0|


-- 
This message was scanned for spam and viruses by BitDefender.
For more information please visit http://www.bitdefender.com/

