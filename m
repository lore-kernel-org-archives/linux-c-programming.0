From: "Alphex K." <alphex@crew.org.ru>
Subject: Re: Some troubles with linked list/tree
Date: Fri, 30 Apr 2004 13:15:53 +0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040430131553.03ec8bd4.alphex@crew.org.ru>
References: <20040429193934.18faf8e1.alphex@crew.org.ru>
	<16529.54608.968086.404599@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16529.54608.968086.404599@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Fri, 30 Apr 2004 05:25:52 +0100
Glynn Clements <glynn.clements@virgin.net> wrote:

> 
> 
> Alphex K. wrote:
> 
> > so I'm have a two linked lists
> 
> > so and functions to operate with there
> 
> >         while(list->next!=NULL)
> >           {
> >              list=list->next;
> >              id++;
> >           }
> >         list->next=(struct SfList  *) malloc(sizeof(SfList));
> >         list=list->next;
> 
> Note: it's simpler, and more efficient, to add new members to the
> start of the list.
I khown this, but in a project I must use this method
> 
> > and for OapAdvAction structure
> 
> > what the right way to add SfList to OapAdvAction ?
> 
> 	action->list = list;
> 
> Or do you want to add a copy of the list?
Yes, I want to have a copy of SfList * list, which initializated out of function , in 
OapAdvAction lnked list
> 
> > I try some methods but it doesn't work?
> 
> You are trying to add to action->list, but action->list starts out
> uninitialised (i.e. containing garbage).
How I can initializate it in OapAdvAction * AddAdvAction(OapAdvAction * action,char *name,char *author,           
                            char *note,int cl_id,SfList * list) ?? it's my question.
Of couse I can initializate it in this function, but it doesn't work ;-( 
What is better working method to add ?
> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


---===---
Alphex Kaanoken
Senior developer of Crew IT research labs
web: http://crew.org.ru
mailto:Alphex@Crew.Org.RU
