From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: Re: deletion in singly linked list
Date: Tue, 23 Nov 2004 15:03:20 +0530
Message-ID: <1101202400.3786.51.camel@myLinux>
References: <5959EA4638D8734599AB75EAAFBB6FEFA471DB@mtv01ex04.mindtree.com>
	 <003b01c4d13c$ba026aa0$bf95d1d9@w128mtec>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <003b01c4d13c$ba026aa0$bf95d1d9@w128mtec>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mikael-aronsson <mikael-aronsson@telia.com>
Cc: Bakki Srinivas <bakki_srinivas@mindtree.com>, Justinas <jugu3479@uosis.mif.vu.lt>, Linux C Programming <linux-c-programming@vger.kernel.org>

As I said in my last mail, A->B->C. Now A->next is relying simply on the
address of B. Now wont changing that break the list???

On Tue, 2004-11-23 at 14:43, mikael-aronsson wrote:
> Yeah, that would work if you can move items between the links, just make
> sure there are no pointers in other places that rely on the contents of
> linked list.
> 
> Mikael
> 
> ----- Original Message ----- 
> From: "Bakki Srinivas" <bakki_srinivas@mindtree.com>
> To: "mikael-aronsson" <mikael-aronsson@telia.com>; "Justinas"
> <jugu3479@uosis.mif.vu.lt>; "Jagadeesh Bhaskar P" <jbhaskar@hclinsys.com>
> Cc: "Linux C Programming" <linux-c-programming@vger.kernel.org>
> Sent: Tuesday, November 23, 2004 10:00 AM
> Subject: RE: deletion in singly linked list
> 
> 
> how is this--- 
> copy the content of the next item and place it in the current pointed
> item,check if the next item pointed by the next item is NULL if it is then
> delete the next item else move the pointer till it reaches NULL finally
> delete the last one.
> 
> Srinivas
> 
> -----Original Message-----
> From: mikael-aronsson [mailto:mikael-aronsson@telia.com]
> Sent: Tuesday, November 23, 2004 2:25 PM
> To: Justinas; Jagadeesh Bhaskar P
> Cc: Linux C Programming
> Subject: Re: deletion in singly linked list
> 
> 
> That will break the list, the previous item has to be updated so you will
> need to get the first item of the list and walk through the list until you
> find the item in front of the one you want to delete and change the "next"
> pointer in that item to point to the one in the "next" pointer in the item
> you are deleting.
> 
> Then you can delete the item you started with.
> There is no other way to do it without a double linked list.
> 
> Mikael
> 
> ----- Original Message ----- 
> From: "Justinas" <jugu3479@uosis.mif.vu.lt>
> To: "Jagadeesh Bhaskar P" <jbhaskar@hclinsys.com>
> Cc: "Linux C Programming" <linux-c-programming@vger.kernel.org>
> Sent: Tuesday, November 23, 2004 9:42 AM
> Subject: Re: deletion in singly linked list
> 
> 
> > Hello,
> >
> > i think You can. For instance n is a pointer to curent node and n->next is
> pointer to next node. lets say we like this tmp = n, and n = n->next. After
> that free(tmp).
> >
> > On Tue, 23 Nov 2004 13:54:10 +0530
> > Jagadeesh Bhaskar P <jbhaskar@hclinsys.com> wrote:
> >
> > > I am having the address of a single node of a singly linked list. All I
> > > know about that node is that it is not the head of the list. Now say, I
> > > want to delete this node. I can infer its next node, but not its
> > > predicissor. Is there any way to delete that node, without breaking the
> > > whole linked list down!!
> > >
> > > -- 
> > > Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
> > >
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>

