From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: deletion in singly linked list--pls resend replies
Date: Thu, 25 Nov 2004 12:42:35 +0530
Message-ID: <6eee1c40411242312610a6734@mail.gmail.com>
References: <5959EA4638D8734599AB75EAAFBB6FEFA471DD@mtv01ex04.mindtree.com>
	 <1101203754.3786.54.camel@myLinux> <1101268688.3786.50.camel@myLinux>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1101268688.3786.50.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Wed, 24 Nov 2004 09:28:08 +0530, Jagadeesh Bhaskar P
<jbhaskar@hclinsys.com> wrote:
> On Tue, 2004-11-23 at 15:05, Bakki Srinivas wrote:
> > Until and unless u free the memory obtained by malloc,the address space is
> > still in the process address space.

 I guess the address space is still in our process address space with
in the free pool.
Further request to malloc() with <= freed size is picked up from the
free pool rather from the system...

 Please, correct me if I'm wrong

> 
> Even if i do free it, where will the address A->next point to. Since it
> is not inside the process address space, wont that segfault??
 
> NB: My mail server was down yesterday :-(. If anyone of u had sent any
> replies, pls do resend it.
> 
> --
> Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
cheers,
Vadi
