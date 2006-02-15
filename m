From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Socket and STDIN pooling
Date: Wed, 15 Feb 2006 13:46:30 +0800
Message-ID: <43F2C036.4000302@hq.ntsp.nec.co.jp>
References: <43F16A09.8070807@hq.ntsp.nec.co.jp> <6a00c8d50602132236l2c7e5337v471ca48c8b8a4f79@mail.gmail.com> <43F2BC05.5030700@hq.ntsp.nec.co.jp>
Reply-To: ronkhu@ntsp.nec.co.jp
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43F2BC05.5030700@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org


 >I have a question about pooling 2 sockets and stdin.
 >I am currently making an application which accepts
 >input from the stdin.

 >It had a connection to a server connecting to 2ports.
 >If for example the stdin is a blocking descriptor and
 >the 2 other descriptors are to be checked real time
 >how can it be done without using threads?


pseudo-code for polling multiple file descriptors:
( no error checking..)

set STDIN in mySet
set socket1 in mySet
set socket2 in mySet

for( ; ; )
{
  copy mySet to mySet2
  while ( select( largestFd, &mySet2, NULL, NULL, NULL ) > 0 )
  {
      for (  i=0; i<=largestFd; i++ )
     {
         if ( i is in mySet2)
         {
            <u can do a fork() here if u want>
            switch( i )
            {
                 case STDIN:  <process input>; break;
                 case socket1:  <process data>; break;
                 case socket2:  <process data>; break;
             }
         }
     }
  }
}

Of coure there are many ways of traversing thru an fdset...




