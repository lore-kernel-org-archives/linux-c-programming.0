From: Justinas <jugu3479@uosis.mif.vu.lt>
Subject: Re: deletion in singly linked list
Date: Tue, 23 Nov 2004 18:57:55 +0200
Message-ID: <20041123185755.194d428c@localhost.localdomain>
References: <1101198249.3786.3.camel@myLinux>
	<20041123104246.772f55e3@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041123104246.772f55e3@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Justinas <jugu3479@uosis.mif.vu.lt>
Cc: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>, Linux C Programming <linux-c-programming@vger.kernel.org>

sorry, my mistake, i wrote it in a hurry, before lectutes:).

i wanted to write like tris:
*n = *(n->next).

On Tue, 23 Nov 2004 10:42:46 +0200
Justinas <jugu3479@uosis.mif.vu.lt> wrote:

> Hello,
> 
> i think You can. For instance n is a pointer to curent node and n->next is pointer to next node. lets say we like this tmp = n, and n = n->next. After that free(tmp).
> 
> On Tue, 23 Nov 2004 13:54:10 +0530
> Jagadeesh Bhaskar P <jbhaskar@hclinsys.com> wrote:
> 
> > I am having the address of a single node of a singly linked list. All I
> > know about that node is that it is not the head of the list. Now say, I
> > want to delete this node. I can infer its next node, but not its
> > predicissor. Is there any way to delete that node, without breaking the
> > whole linked list down!!
> > 
> > -- 
> > Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
