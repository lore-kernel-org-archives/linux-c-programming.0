From: mk3god <mk3god@yahoo.co.in>
Subject: SIGSEGV within strcmp() within localtime() ...?
Date: Tue, 08 Feb 2005 07:01:02 +0000
Message-ID: <1107846062l.27933l.0l@mithrandir>
Reply-To: mk3god@yahoo.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	Format=Flowed"
To: c-programming <linux-c-programming@vger.kernel.org>

Hello,

A program simulating a monte carlo routine for photon migration written in  
standard C core dumps on me with a SIGSEGV. Its being run on an intel P4,  
running redhat linux 9, with a 2.4.20-8 kernel. I have listed the backtrace  
that I get when using ddd and the function fragment where the signal is  
received below.

Apologies for the length of the message. All help is appreciated.

the program backtrace:
---------
Program received signal SIGSEGV, Segmentation fault.
0x4207985a in strcmp () from /lib/tls/libc.so.6

(gdb) frame 9
#9  0x42015704 in __libc_start_main () from /lib/tls/libc.so.6
(gdb) frame 8
#8  0x08048b0c in main (argc=2, argv=0xbfffee84) at trmc_2fls_core.c:55
(gdb) frame 7
#7  0x08048fd3 in doAnisotropicScatter (num_p=100000, tp=0x8159df0) at  
trmc_2fls_core.c:159
(gdb) frame 6
#6  0x0804a5b5 in dumpPhotonIntensity (tp=0x8159df0) at trmc_2fls_core.c:662
(gdb) frame 5
#5  0x42095f31 in localtime () from /lib/tls/libc.so.6
(gdb) frame 4
#4  0x42097ae8 in __tz_convert () from /lib/tls/libc.so.6
(gdb) frame 3
#3  0x42096fdc in tzset_internal () from /lib/tls/libc.so.6
(gdb) frame 2
#2  0x4209875e in __tzfile_read () from /lib/tls/libc.so.6
(gdb) frame 1
#1  0x42096e20 in __tzstring () from /lib/tls/libc.so.6
(gdb) frame 0
#0  0x4207985a in strcmp () from /lib/tls/libc.so.6
(gdb)
---------
The begining lines of the function dumpPhotonIntensity():
---------
void dumpPhotonIntensity(const tissue *tp)
{
  int i, j;
  FILE *fp;
  char TRdumpfnames[100];
  char timestamp[100];
  char temp_floriginname[100], real_floriginname[100];
  time_t current_t;
  struct tm *current_tm;

  current_t = time((time_t *)NULL);
  current_tm = localtime(&current_t); //crashes here :-???
  ...

}


Thanks,

-kk



