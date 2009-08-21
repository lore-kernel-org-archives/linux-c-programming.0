From: Joe <longapple@gmail.com>
Subject: strange stack limit behavior when allocating more than 2GB mem on 
	32bit machine
Date: Thu, 20 Aug 2009 19:47:28 -0800
Message-ID: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=+NSzNL8GbFEA6vnNV6GGdKF7LImXCpDlwRXk/OUaAk4=;
        b=PLqlqg1WFBcZ509Rw1eF0zT90yVzW3zYZefQWqzhDP1jjfRbJHmxlJtj49aL1fXMTH
         Ka30M/LANiGDanOys/yPwjqW74xZ49jV6w9ExZ3S2Tn4/r4V2ivaYkSRGnzGaIi4B1u5
         XmRkC7CAhxih3uZHKr+oK5QlrU8ywxSR0rqqM=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

Here I encounter something which I can't understand.
What I want to do is to allocate ~2.5GB mem, it fails when stack limit
is unlimited, but succeeded when stack limit is 10240.

Here is the code:

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
        char *p;
        long i;
        size_t n;

        if (argc != 2 || atol(argv[1]) <= 0) {
                fprintf(stderr, "usage: malloc value (MB)\n");
                return 1;
        }
        n = 1024 * 1024 * atol(argv[1]);
        if (!(p = malloc(n))) {
                perror("malloc failed");
                return 2;
        }
        printf("Malloc succeeded\n");
        free(p);
        return 0;
}


and here is what confused me:

$ uname -a
Linux stone 2.6.9-11.ELsmp #1 SMP Fri May 20 18:26:27 EDT 2005 i686
i686 i386 GNU/Linux <==== 32bit system
$ free -m
             total       used       free     shared    buffers     cached
Mem:          2024       1996         28          0         30       1401
-/+ buffers/cache:        563       1461
Swap:        10236          0      10236
$ ulimit -s
10240
$ ./malloc 2500
Malloc succeeded               <======= succeeds when stack limit is 10240
$ ulimit -s unlimited
$ ./malloc 2500
malloc failed: Cannot allocate memory   <======== fails when stack
limit is unlimited???


BTW, there is no such problem on 64bit machine


Could you please give some insight on this?

Regards
