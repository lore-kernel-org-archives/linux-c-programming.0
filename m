From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: execv fails with EFAULT
Date: Wed, 07 Mar 2007 17:24:32 +0530
Message-ID: <45EEA7F8.5080908@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

When I tried the following program
void test4()
{
    printf("doing execv\n");
    if(execv("/bin/ls", "-l") == -1)
        printf("exec failed with errno %d\n", errno);
    else
        printf("exec succeed\n");
}

I see that execv is failing with errno 14(EFAULT).
I am using RH9 2.6 kernel. Does anybody know what is the cause?

Regards
Prasanta

