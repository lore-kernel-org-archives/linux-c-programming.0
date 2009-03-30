From: beginner_h4x3r <nightdecoder@gmail.com>
Subject: Linux process...
Date: Mon, 30 Mar 2009 13:06:30 +0700
Message-ID: <34e1241d0903292306m3e879639u4752e821349c84ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=d6DCzpD6kkBCF9b8xSTKT21EFdLj1QEwaAPNNo9rgDs=;
        b=DnaM/WGtpjf6bOch+8yaHa//aeqGfBQwXN3GeAYlbnEc9HM2mna65G3ubrJsBQf8Xq
         2bbcZcZ72EZdFE1R4ns8TDW77ry7flPp+m3eGQ+K/viFXNo3UFQDcZX3IdealdPqlU1G
         5XcA8MWwT1pMqJY+JHHTadwbE39i0DY84BAIQ=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi All..

I am a beginner hacker, i want to learn Linux from scratch. I read
some resources on Linux's process management. Process duplicates it's
page table to it's child process, right? so i wrote demonstrate code
to prove this.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main (void) {
  pid_t child;
  int stack_int;

  child = fork ();
  if (child == 0) {
      sleep (1); /* ;p */
      printf ("child process stack_int value %i, address: %p\n",
stack_int, &stack_int);
      exit (0);
    }
  if (child == -1) {
      perror ("fork");
      return -1;
    }
  stack_int = 32;
  printf ("main process stack_int value %i, address: %p\n", stack_int,
&stack_int);
  waitpid (child, NULL, 0);

  return 0;
}

The output is:
main process stack_int value 32, address: 0xbf9c66ec
child process stack_int value 8495092, address: 0xbf9c66ec

stack_int value is different from parent and it's child.

My question: why the stack_int has a same address between parent and
it's child ?, but confusedly... they have a different value, i was
though it should be different, since process duplicate it's page to
child, please explain me. ;)

Thanks before.

--- curious_hacker
