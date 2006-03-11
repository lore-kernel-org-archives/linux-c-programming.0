From: Progga <abulfazl@juniv.edu>
Subject: Re: Speaker Sound
Date: Sat, 11 Mar 2006 07:32:38 +0600
Message-ID: <20060311013238.GA605@ju.Imrashi.net.bd>
References: <20060310193329.726.qmail@web51414.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060310193329.726.qmail@web51414.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org
Cc: icemanind@yahoo.com


--uQr8t48UFsdbeI+V
Content-Type: multipart/mixed; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> }
>=20
> The problem is, I'm not sure if I can just read and
> output bytes from a port. Any alternate way would be
> appreciated!

Sample code attached.
Mainly based on the Linux Programmer's Guide.
Runs as suid root.
Depends on ncurses.
Press q-i buttons for various tones.


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="music.c++"


   // Simple harmonium - needs root's privilege to run .


#include<sys/ioctl.h>
#include<sys/kd.h>
#include<sys/types.h>
#include<fcntl.h>
#include<unistd.h>
#include<cerrno>
#include<cstdlib>
#include<curses.h>
#include<iostream>




void
main ( )
{

  char ch ;
  int freq, fd = open ("/dev/console", O_WRONLY);


    initscr() ;




    while( 1 ){


          ch = getch() ;

          switch( ch ){

             case 'u' :

             freq = 46   ;

             break ;


             case 'y' :

             freq = 48   ;

             break ;



             case 't' :

             freq = 53   ;

             break ;


             case 'r' :

             freq = 59   ;

             break ;



             case 'e' :

             freq = 65  ;

             break ;



             case 'w' :

             freq =  70  ;

             break ;



             case 'q' :

             freq =  80  ;

             break ;



             case 'i' :

             freq = 90 ;

             break ;


             default:

               freq = -1 ;

                   }


          if( freq == -1 )break ;

          freq *=10 ;


          ioctl (fd, KIOCSOUND, freq );

          usleep ( 200000 );

          ioctl( fd, KIOCSOUND, 0 ) ;

                                 }



  close (fd);

  endwin() ;

}

--ZPt4rx8FFjLCG7dd--

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (FreeBSD)

iD8DBQFEEii2AjLUsitphWkRAlTHAKDKNIj4x5aijIiJF7EeYpsGiY6FggCfRaoF
8CY863LahD1qobUXgW1h49I=
=nb4D
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
