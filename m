From: Mikado <mikado4vn@yahoo.com>
Subject: Problem with Native POSIX Thread Library
Date: Sun, 16 Oct 2005 03:58:00 -0700 (PDT)
Message-ID: <20051016105800.2454.qmail@web53712.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,

I'm using 2.6 kernel with NPTL support in kernel and libc but I cannot create more than 400
threads with NPTL. In the past, I used 2.4 kernel and I can create about 1500 threads. I dont want
to use traditional LinuxThread because I dont like the way it pthread_detach() (it "clone"s too
many processes). Reading some documents about NPTL, I thought it can creates many threads but it's
not true in my case. I need somebody's help. Thanks in adv.

System info:
- Kernel: 2.6.13.4
- RAM: 256 + 128
- CPU: PentiumIII 937.939MHz

My code is below:

===== CODE =====
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

#define MAX 10000

void print_msg(void * msg);
int main(void);

void print_msg(void * arg)
{
        pthread_detach(pthread_self());
        sleep(10);
        pthread_exit(NULL);
}

int main(void)
{
        pthread_t thread_id[MAX];
        int i, ret;

        for (i = 0; i < MAX; i++)
        {
                ret = pthread_create(&thread_id[i], NULL, (void *)&print_msg, (void *)0);
                if (ret)
                        printf("Error creating thread %d\n", i);
        }

        pthread_exit(NULL);
}
===== CODE =====



		
__________________________________ 
Start your day with Yahoo! - Make it your home page! 
http://www.yahoo.com/r/hs
