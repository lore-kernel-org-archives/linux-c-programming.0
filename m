From: Nikola <root.admin1@zg.t-com.hr>
Subject: ftw , nftw doesn't work
Date: Wed, 25 Apr 2007 14:45:27 +0200
Message-ID: <462F4D67.5090600@zg.t-com.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

I am trying to parse dir tree with ftw and nftw on Linux (debian) but 
without result.

------------------------------------------------------

#include <stdio.h>
#include <ftw.h>


int fn(const char *file, const struct stat *sb, int flag){

        printf("-->\n");
}


int main(int argc,char **argv){


        ftw("/etc/", fn, 5);

        return 0;
}

------------------------------------------------------

bash# gcc test.c
bash# ./a.out
-->
bash#

------------------------------------------------------

Does anyone knows what might be the problem.

tnx in advance.

