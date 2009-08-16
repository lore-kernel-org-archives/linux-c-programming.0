From: Reto Glauser <linux@blinkeye.ch>
Subject: Re: mmap() returns with -EINVAL
Date: Sun, 16 Aug 2009 16:11:19 +0200
Message-ID: <4A881387.1080701@blinkeye.ch>
References: <c93f91ee0907300619q2dc38f49q1092b363ed28687@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c93f91ee0907300619q2dc38f49q1092b363ed28687@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: leo mueller <llug.dan@googlemail.com>
Cc: linux-c-programming@vger.kernel.org

On 07/30/2009 03:19 PM,  leo mueller wrote:
>
> by doing a mmap() my program exits with -EINVAL and up to now i have
> no clue why... parametes should be right.
>
> do you have any idea?
>

maybe somethings wrong with your socket. mmap-ping a fd for example only works
if you open the fd O_RDWR, e.g.:

   /** Open a file for writing.
    *  - Creating the file if it doesn't exist.
    *  - Truncating it to 0 size if it already exists. (not really needed)
    *
    * Note: "O_WRONLY" mode is not sufficient when mmap-ing.
   **/
   fd = open( FILEPATH, O_RDWR | O_CREAT | O_TRUNC, ( mode_t )0600 );
   if ( fd == -1 )
   {
      perror( "Error opening file for writing" );
      exit( EXIT_FAILURE );
   }

   /**
    * Now the file is ready to be mmap-ped.
   **/
   map = mmap( 0, FILESIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0 );
   if ( map == MAP_FAILED )
   {
      close( fd );
      perror( "Error mmapping the file" );
      exit( EXIT_FAILURE );
   }


