From: Gauvain Pocentek <gauvainpocentek@gmail.com>
Subject: wait for childs of a child process
Date: Mon, 09 Feb 2009 15:20:44 +0100
Message-ID: <49903BBC.4010802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,

I have to monitor applications on a system (users who run the application, how
long, etc.), but I'm having troubles with applications which fork during startup
(openoffice for instance).

Here is a snippet of what I planned to use (checks omitted to simplify):

####################################
#include <stdio.h>
#include <sys/wait.h>
#include <sys/types.h>

int main()
{
    int status;
    pid_t p = fork();
    if (p == 0)
        system ("soffice");
    else if (p > 0)
    {
        waitpid (p, &status, 0);
        printf ("done\n");
    }

    return 0;
}

####################################

Is there a way to make wait() or an other syscall monitor the process' children,
or is patching openoffice (and other apps behaving in the same way) the only
solution?

Thanks,
Gauvain Pocentek
