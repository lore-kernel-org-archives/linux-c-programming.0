From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Some troubles with linked list/tree
Date: Fri, 30 Apr 2004 19:38:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16530.40216.44668.159290@cerise.nosuchdomain.co.uk>
References: <20040429193934.18faf8e1.alphex@crew.org.ru>
	<16529.54608.968086.404599@cerise.nosuchdomain.co.uk>
	<20040430131553.03ec8bd4.alphex@crew.org.ru>
	<16530.22206.809391.568597@cerise.nosuchdomain.co.uk>
	<20040430191846.13580061.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040430191846.13580061.alphex@crew.org.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alphex K." <alphex@crew.org.ru>
Cc: linux-c-programming@vger.kernel.org


Alphex K. wrote:

> > > > > I try some methods but it doesn't work?
> > > > 
> > > > You are trying to add to action->list, but action->list starts out
> > > > uninitialised (i.e. containing garbage).
> > > 
> > > How I can initializate it in OapAdvAction * AddAdvAction(OapAdvAction * action,char *name,char *author,           
> > >                             char *note,int cl_id,SfList * list) ?? it's my question.
> > 
> > Set:
> > 
> > 	action->list=NULL;
> > 
> > before attempting to add entries with AddSfEntry().
> 

> It work, but when I try to read from OapAdvAction I fecth "Seg
> fault" or incorrect value in on of the fields - and broken SfList *
> list; - But when I try view this in first attempt - it worked
> normally
> Where is my error - 

> so it's function show content - (to gtk clist)
> void _FillActionsTable(OapAdvAction *list,int what)                                  
> {                                                                                    
>    OapAdvAction * lp=NULL;
>    OapAdvAction * temp=NULL;
>    temp=OapCpyAdvAction(temp,actions);
>    lp=OapCpyAdvAction(lp,actions);
>    char *entr[3];
>    while(lp!=NULL)
>      {
>         entr[0]=calloc(1,8);
>         sprintf(entr[0],"-%d-",lp->id);
>         entr[1]=lp->name;
>         entr[2]=lp->author;
>         entr[3]=lp->note;

For a start, "entr" only has three elements (entr[0] to entr[2]), so
you shouldn't be assigning to entr[3]. Doing so will typically
overwrite one of the other local variables.

-- 
Glynn Clements <glynn.clements@virgin.net>
