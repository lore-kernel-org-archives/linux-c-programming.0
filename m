From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: circular linked list
Date: 29 Mar 2004 07:11:38 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1080562296.17774.14.camel@Marx.fesnel.no-ip.org>
References: <c443sr$9f9$1@sea.gmane.org> <4065E03F.9010306@Saklawi.info>
	 <00b001c41556$7a20fed0$2e0110ac@mukco>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <00b001c41556$7a20fed0$2e0110ac@mukco>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Muthukumar <ramana_muthu@yahoo.co.in>
Cc: linux-c-programming@vger.kernel.org

Fundamental Rule of LinkList Traversal: You have to start somewhere. 

The major function of a head node, is to point at that starting place.
doesn't mater if its a single link list; double link list; circular link
list; in order to traverse it, you have to get to a node.  I cannot
think of a better way of doing that then having an established pointer
to a known node.  It also gives many many useful functions in a circular
linked list; for instance if you want to make 1 pass, you start at the
head node and then go head->next until current node is head otherwise,
you might just circle without a clear termination point/ end case. 


On Mon, 2004-03-29 at 01:24, Muthukumar wrote:
> 
> > >        what is the key concept of circular linked list.
> > >
> > >        My known method is we can do using head value of 1 (first data)
> > >        1 - > 2 -> 3 -> 4 ->1  (4 is the last data at this chain)
> > >        Is it correct to do the circular linked list.
> > >        how we have to delete some value in the list.
> > >        If i want to delete 3 means what steps we have to do.
> > >
> > >        Is there a way to simulate the list with out having the assignment
> > >of head.
> > >
> > >
> >   Yes, this is done by passing a pointer to the start pointer. An
> > implementation can be found here :
> > http://annex.sagehall.com/~abukhzam/cp2/CPII.html
> >
> Hai Jad.
> 
> Thanks for the guideline.
> 
> Is there a way to implement a circular linked list without the HEAD assignment.
> First of all ,is it possible ,If else what is the problem with that.
> 
> Regards,
> Muthukumar.
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

