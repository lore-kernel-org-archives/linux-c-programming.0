From: Bharat Jain <bharat@veveotv.com>
Subject: Re: Sorted List
Date: Sat, 26 Nov 2005 17:36:43 +0530
Message-ID: <43884FD3.8030008@veveotv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

After the while loop "sp" would be containing the address of the node 
after
 which the new node is to be inserted.
 
 It is done in this way because *sp = *sp->next would modify the global
 "empty" pointer which we dont want. "empty" should always point to
 first element of the list.  
 
 Hope this helps.

