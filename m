From: "mikael-aronsson" <mikael-aronsson@telia.com>
Subject: Re: deletion in singly linked list
Date: Tue, 23 Nov 2004 09:55:21 +0100
Message-ID: <002c01c4d13a$2a228430$bf95d1d9@w128mtec>
References: <1101198249.3786.3.camel@myLinux> <20041123104246.772f55e3@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Justinas <jugu3479@uosis.mif.vu.lt>, Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>

That will break the list, the previous item has to be updated so you will
need to get the first item of the list and walk through the list until you
find the item in front of the one you want to delete and change the "next"
pointer in that item to point to the one in the "next" pointer in the item
you are deleting.

Then you can delete the item you started with.
There is no other way to do it without a double linked list.

Mikael

----- Original Message ----- 
From: "Justinas" <jugu3479@uosis.mif.vu.lt>
To: "Jagadeesh Bhaskar P" <jbhaskar@hclinsys.com>
Cc: "Linux C Programming" <linux-c-programming@vger.kernel.org>
Sent: Tuesday, November 23, 2004 9:42 AM
Subject: Re: deletion in singly linked list


> Hello,
>
> i think You can. For instance n is a pointer to curent node and n->next is
pointer to next node. lets say we like this tmp = n, and n = n->next. After
that free(tmp).
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
> > To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

