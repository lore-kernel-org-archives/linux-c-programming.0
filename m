From: "Alexi Jordanov" <a_jordanov@prosyst.bg>
Subject: strange SIGSEGV
Date: Tue, 25 Mar 2003 12:00:29 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <005701c2f2b5$5d8d0300$0266a8c0@psb>
References: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in> <3E65B4EE.8080803@tscheinig.com>
Reply-To: "Alexi Jordanov" <a_jordanov@prosyst.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello to all,

I have a strange problem with listening for file change notification.
Everything is fine in my handler fuction till the moment when I try to send
this information through pipes:

This works fine:
===========
static void handler(int sig, siginfo_t *si, void *data)
{
 fprintf(stderr, "Got an event: %d.\n", si->si_fd);
}

This cause SIGSEGV:
===============
static void handler(int sig, siginfo_t *si, void *data)
{
 fprintf(stderr, "Got an event: %d.\n", si->si_fd);
 if (write(event_pipe[1], &si->si_fd, sizeof(int)) != sizeof(int))
 {
  fprintf(stderr, "Write failed (handler) - %s.\n", errstr);
  fflush(stderr);
 }
}

I try to start debugger to look for the problem, but all that I was found
was:
==================================================
Program received signal SIGSEGV, Segmentation fault.
0x00000004 in ?? ()
(gdb) where
#0  0x00000004 in ?? ()
#1  0x90c3c9ec in ?? ()
Cannot access memory at address 0x5d8bc031
(gdb)

The problem appears when I try to watch simultaneously two times one and the
same directory. But I don't think that this is 100% true, because I don't
have problem with other directories.

Can somebody advise me how to deal with this problem?!

Regards, Alex

