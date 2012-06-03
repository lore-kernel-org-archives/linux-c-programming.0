From: Krzysztof <kj@limes.com.pl>
Subject: Is it helpful for a compiler to optimize?
Date: Sun, 03 Jun 2012 08:38:00 +0200
Message-ID: <jqf0o8$cj4$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Let's have a below code:

struct st
{
     int iv;
     /*...*/
};

void afun(struct st *stp)
{
     stp->iv++;
     printf("%d\n",stp->iv);
}

Is it helpful for a compiler to do better optimization if I write the 
function as this?

void afun(struct st *stp)
{
     int liv=stp->iv++;

     printf("%d\n",liv);
}

In other words, is it better from optimization point of view to do 
assignments structure members values to local variables then do what you 
need to and then assign them back to member variables?

-- 
Regards
Krzysztof J.


