From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: Re: deletion in singly linked list
Date: Tue, 23 Nov 2004 14:39:46 +0530
Message-ID: <1101200986.3786.26.camel@myLinux>
References: <1101198249.3786.3.camel@myLinux>
	 <20041123104246.772f55e3@localhost.localdomain>
	 <002c01c4d13a$2a228430$bf95d1d9@w128mtec>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002c01c4d13a$2a228430$bf95d1d9@w128mtec>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mikael-aronsson <mikael-aronsson@telia.com>
Cc: Justinas <jugu3479@uosis.mif.vu.lt>, Linux C Programming <linux-c-programming@vger.kernel.org>

On Tue, 2004-11-23 at 14:25, mikael-aronsson wrote:
> That will break the list, the previous item has to be updated 

But according to the solution by Justinas, say, the nodes be A, B and C.
Now C's address is assigned to B's address. So shouldnt any link, like
A->next, point to C automatically?
-- 
Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>

