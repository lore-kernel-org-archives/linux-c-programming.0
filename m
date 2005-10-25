From: Henry Margies <henry.margies@gmx.de>
Subject: setenv and dlopen
Date: Tue, 25 Oct 2005 19:52:04 +0200
Message-ID: <1130262724.7414.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,

I have a problem using dlopen and setting the LD_LIBRARY_PATH with
putenv or setenv. 


Here is my test code:

#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <unistd.h>

int main(int argn, char** argv)
{
        void* handle;
        int   ret;

        putenv("LD_LIBRARY_PATH=.");
        putenv("PATH=.");

        handle = dlopen("libmylib.so", RTLD_LAZY);

        if (NULL == handle) {
                printf("error: %s\n", dlerror());
        }

        if (2 == argn)
                return 0;

        ret = execlp("dltest", "dltest", "break", NULL);

        if (ret)
                perror("Error in starting dltest: ");
	return ret;
}


I also tried setenv and absolute path-names for LD_LIBRARY_PATH. Setting
LD_LIBRARY_PATH on the console works perfectly. And as you can see,
setting the PATH variable using putenv is also working for execlp.


Any suggestions?


Henry


-- 
Hi! I'm a .signature virus! Copy me into your
~/.signature to help me spread!

