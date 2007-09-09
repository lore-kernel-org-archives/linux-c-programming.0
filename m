From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Testing if a file or directory exist
Date: Sun, 9 Sep 2007 09:26:00 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

What is the quickest way to test if a file or directory exist.
I can think of three different system calls that can be used:
access(), stat() and open(). Writting a little test program I
found that this is also the order of which is the quickest,
that is access() is the quickest and open() the slowest. The code
for the test programms is shown below.

The question I have is there any other system call that I can use
that would be cheaper then access(). Even if they are linux specific
system calls I would like to know.

Thanks,
Holger

access.c

    #include <stdio.h>
    #include <string.h>
    #include <unistd.h>
    #include <errno.h>

    #define MAX_LOOPS 5000000

    int main(void)
    {
       unsigned int i;

       for (i = 0; i < MAX_LOOPS; i++)
       {
          if (access("abcd", R_OK) != 0)
          {
             (void)fprintf(stderr, "access() error : %s\n", strerror(errno));
             return 1;
          }
       }
       return 0;
    }


stat.c

    #include <stdio.h>
    #include <string.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <unistd.h>
    #include <errno.h>

    #define MAX_LOOPS 5000000

    int main(void)
    {
       unsigned int i;
       struct stat  stat_buf;

       for (i = 0; i < MAX_LOOPS; i++)
       {
          if (stat("abcd", &stat_buf) == -1)
          {
             (void)fprintf(stderr, "stat() error : %s\n", strerror(errno));
             return 1;
          }
       }
       return 0;
    }


open.c

    #include <stdio.h>
    #include <string.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <fcntl.h>
    #include <errno.h>

    #define MAX_LOOPS 5000000

    int main(void)
    {
       int          fd;
       unsigned int i;

       for (i = 0; i < MAX_LOOPS; i++)
       {
          if ((fd = open("abcd", O_RDONLY)) == -1)
          {
             (void)fprintf(stderr, "open() error : %s\n", strerror(errno));
             return 1;
          }
          else
          {
             (void)close(fd);
          }
       }
       return 0;
    }

