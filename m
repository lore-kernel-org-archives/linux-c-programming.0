From: Vikas S <vikas_soolapani@yahoo.com>
Subject: Variable to sizeof function.
Date: Fri, 15 Jul 2005 07:02:06 -0700 (PDT)
Message-ID: <20050715140207.78402.qmail@web31901.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi,

I want to find out the size of a structure which the user will give as an argument 
as follows.

#include <>  -- All includes..
..
main(int arc, char *argv[])
{
printf("Size of structure %s is: %d\n", argv[1], sizeof(struct argv[1]));
}

However, I'm unable to compile. It's giving:
"sizeof applied to an incomplete type".

How can I get it working.

Thanks,
Vikas

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
