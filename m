From: km <km@mrna.tn.nic.in>
Subject: Re: pointer notation
Date: Tue, 28 Oct 2003 23:16:05 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20031028174605.GA5517@mrna.tn.nic.in>
References: <20031028094205.GA4228@mrna.tn.nic.in> <3F9E5A41.40204@ig.com.br>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3F9E5A41.40204@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

Hi all,
i should have posted the snippet before itself to be clear, which i am doing now.

It is from a double-linked list snippet as follows : 
----------------CODE START---------------------------------------
#include<stdio.h>
#include<stdlib.h>
struct node
{
int content;
struct node *next;
struct node *previous;
};
/* prototype declaration */
void add(struct node **s,int c);
/*main program*/
int main()
{
struct node *p;
p = NULL;
add(&p,21);
return 0;
}

/* function */
void add(struct node **s,int c)
{
	struct node *r,*q=*s;

if(*s==NULL)
{
	*s = (struct node *)malloc(sizeof(struct node));
	(*s)->previous = NULL; 		/* (*s) ??? whats that ? */
	(*s)->next = NULL;
	(*s)->content = c
}
else
{
/*bla bla*/
}
}
----------------CODE END-------------------------------------
In the above code we can see the statement called "(*s)->previous = NULL;". I didnt get what exactly it means to be and how different is *s different from (*s) in this context. can it be written in any other form alternatively ? 
	thanks for the feedback,
regards,
KM


-----------------------------------------------------------------
On Tue, Oct 28, 2003 at 10:00:01AM -0200, Luciano Moreira - igLnx wrote:
> Try to think that p is a MACRO, like as (arbitrary macro):
> "#define p  pBaseList+5*(x->element)+1"
> 
> When you do:
> "p->next"
> it ll be:
> "pBaseList+5*(x->element)+1->next"
> 
> the code above seems to be unsafe, so, if you do:
> "(p)->next"
> or:
> "#define p  (pBaseList+5*(x->element)+1)"
> it ll free or code of  "precedence bugs".
> 
> Luciano
> 
> km wrote, On 28/10/2003 07:42:
> 
> >Hi all,
> >how different is the notation 
> >(p)->next (what do the parenthesis around the pointer signify ? )
> >different from  
> >p ( while p is a pointer)
> >
> >regards,
> >KM
> >
> >-
> >To unsubscribe from this list: send the line "unsubscribe 
> >linux-c-programming" in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
> > 
> >
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html




