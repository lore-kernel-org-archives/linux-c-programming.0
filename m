From: Bubulac Tatiana <bubulac@unidec.ro>
Subject: Signal and wait question
Date: Tue, 21 May 2002 18:20:39 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CEA65C6.D0473BEB@unidec.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org, redhat-list@redhat.com

Hi ,

I have a parent that catch the SIGTERM and SIGALRM signals.
...
 signal (SIGTERM, die);
 signal (SIGALRM, dummy);
...
for (min = 0; min < 15 && not_done; min++)
    {
      alarm ((unsigned int) 60); /* wait for 1 minute */
      pid = wait (&status);    /* Wait for a process to end */
      alarm ((unsigned int) 0); /* Reset alarm */
....
}

and a child that use the same signal catch function.
...
signal (SIGTERM, die);
...


Here is the die fucntion.
#include......
void die();

void die ()
{
  signal (SIGTERM, (void (*)())die);
  printf("child receives SIGTERM signal\n");
  return;
}

void s_down();

void s_down ()
{
  extern BOOLEAN l_down;

  signal (SIGALRM, (void (*)())s_down);
  l_down = TRUE;
  printf("child receive SIGALRM signal\n");
  return;
}

When I send a sigterm signal only the parent display
"parent receives SIGTERM signal" and stack here.
If I give a kill -9 child pid the parent displays "Normal
Termination"and than Killed.

Why the parent stack in wait() and child do not receive any signal?

TIA.

Bubulac Tatiana.

