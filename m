From: Hossein Mobahi <hmobahi@yahoo.com>
Subject: problem with <asm/semaphore.h>
Date: Tue, 4 Jun 2002 04:19:44 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020604111944.34250.qmail@web12708.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-c-programming@vger.kernel.org

Hi

I compiled the following code with gcc under Redhat
7.2 :

#include <asm/semaphore.h>
main()
{
    struct semaphore sum;
}

It doesn't compile, saying "storage size of `sem'
isn't known".
Please guide me how to fix it.

Sincerely

--Hossein Mobahi


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
