From: syedk <syedk@intotoinc.com>
Subject: compiling programs which use pthreads
Date: 25 Jan 2004 15:06:29 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1075023389.27269.12.camel@qa.intotoind.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,
     I am getting strange results while compiling programs which use
pthreads.
I am working on a RedHat Linux on a 2.4 kernel.
to start with i wrote a simple program as follows:


#include <pthread.h>
#include <stdio.h>
void * hello(void *);
main()
{
        pthread_t tid;
        pthread_create(&tid,NULL,hello,NULL);
}
void *hello(void *arg)
{
        printf("Hello World/n");
}

but  when i tried to compile using gcc it is giving linktime error:
undefined reference to pthread_create.
but why is it giving this error when the header file pthread.h is
present.
when i tried to do cat /proc/ksyms | grep pthread_create
no matches were found. Does that mean that pthread library is not
installed in my system?

Can anyone suggest how to hack this and compile my program apart from
downloading some freely available user-level libraries(like gnu
pthreads).
Thanx
Syed SK


