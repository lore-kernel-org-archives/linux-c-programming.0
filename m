From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: deletion in singly linked list
Date: Tue, 23 Nov 2004 10:08:32 +0000
Message-ID: <16803.3104.750163.815769@cerise.gclements.plus.com>
References: <1101198249.3786.3.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1101198249.3786.3.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>


Jagadeesh Bhaskar P wrote:

> I am having the address of a single node of a singly linked list. All I
> know about that node is that it is not the head of the list. Now say, I
> want to delete this node. I can infer its next node, but not its
> predicissor. Is there any way to delete that node, without breaking the
> whole linked list down!!

In general, no.

If you want to be able to delete elements, you normally require an
extra level of indirection, i.e. a pointer to the pointer.

E.g. if the node structure is:

	struct node {
		struct node *next;
		/* other fields */
	};

and you have a list:

	struct node *the_list;

you can traverse the list for reading with:

	struct node *l;

	for (l = the_list; l; l = l->next)
	{
		...
	}

But if you want to be able to delete an element, you would use e.g.:

	struct node **p, *l;

	for (p = &the_list; l = *p; )
	{
		if (want_to_delete(l))
		{
			*p = l->next;
			free(l);
		}
		else
			p = &l->next;
	}

The same applies if you want to insert a new element before the
current element.

-- 
Glynn Clements <glynn@gclements.plus.com>
