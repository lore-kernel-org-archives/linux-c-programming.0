From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: Re: deletion in singly linked list
Date: Thu, 25 Nov 2004 15:56:31 +0530
Message-ID: <1101378391.3795.59.camel@myLinux>
References: <1101198249.3786.3.camel@myLinux>
	 <20041124154309.5588936e.akaano ken@softminecorp.com>
	 <1101354576.3795.1.camel@myLinux>
	 <20041125131142.652bdb95.akaanoken@softminecorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041125131142.652bdb95.akaanoken@softminecorp.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alphex Kaanoken <akaanoken@softminecorp.com>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>

Thanks for the reply. Adding my comments below:

On Thu, 2004-11-25 at 15:41, Alphex Kaanoken wrote:
> if you need to remove member in any place you must do following things
>  - find member to remove
>  - take a pointer of prev member and change him to the next member that following after removeing member
>  - free memory that malloced for removing member
But I had explained previously, that this is a special case. I dont know
which is the head and which is the tail of a singly linkedlist. All I
know is that this is a node of the linked list and say the format of the
node. So from this I can get only the pointer to its next node. How can
I find its previous node? Is there a way to find it out?

Otherwise its simply linkedlist manipluation, and thatz not what I asked
for :-(

-- 
With regards,

Jagadeesh Bhaskar P
R&D Engineer
HCL Infosystems Ltd
Pondicherry
INDIA

