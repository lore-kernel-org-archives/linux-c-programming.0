From: "Alphex K." <alphex@crew.org.ru>
Subject: Re: Some troubles with linked list/tree
Date: Fri, 30 Apr 2004 19:18:46 +0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040430191846.13580061.alphex@crew.org.ru>
References: <20040429193934.18faf8e1.alphex@crew.org.ru>
	<16529.54608.968086.404599@cerise.nosuchdomain.co.uk>
	<20040430131553.03ec8bd4.alphex@crew.org.ru>
	<16530.22206.809391.568597@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16530.22206.809391.568597@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Fri, 30 Apr 2004 14:38:06 +0100
Glynn Clements <glynn.clements@virgin.net> wrote:

> 
> 
> Alphex K. wrote:
> 
> > > > I try some methods but it doesn't work?
> > > 
> > > You are trying to add to action->list, but action->list starts out
> > > uninitialised (i.e. containing garbage).
> > 
> > How I can initializate it in OapAdvAction * AddAdvAction(OapAdvAction * action,char *name,char *author,           
> >                             char *note,int cl_id,SfList * list) ?? it's my question.
> 
> Set:
> 
> 	action->list=NULL;
> 
> before attempting to add entries with AddSfEntry().
> 
thanx 
It work, but when I try to read from OapAdvAction I fecth "Seg fault" or incorrect value in on of the 
fields - and broken SfList * list; - But when I try view this in first attempt - it worked normally
Where is my error - 
so it's function show content - (to gtk clist)
void _FillActionsTable(OapAdvAction *list,int what)                                  
{                                                                                    
   OapAdvAction * lp=NULL;                                                           
   OapAdvAction * temp=NULL;                                                         
   temp=OapCpyAdvAction(temp,actions);                                               
   lp=OapCpyAdvAction(lp,actions);                                                   
   char *entr[3];                                                                    
   while(lp!=NULL)                                                                   
     {                                                                               
        entr[0]=calloc(1,8);                                                         
        sprintf(entr[0],"-%d-",lp->id);                                                
        entr[1]=lp->name;                                                            
        entr[2]=lp->author;                                                          
        entr[3]=lp->note;                                                            
        if(what==0)                                                                  
          gtk_clist_append(GTK_CLIST(imanactlist),entr);                             
        else                                                                         
          gtk_clist_append(GTK_CLIST(iviewactactionlist),entr);                      
        free(entr[1]);                                                               
        lp=lp->next;                                                                 
     }                                                                               
   lp=OapFreeAdvAction(lp);                                                          
   actions=OapFreeAdvAction(actions);                                                
   actions=OapCpyAdvAction(actions,temp);                                            
   temp=OapFreeAdvAction(temp);                                                      
}
where actions is global variable (OapAdvAction * actions)
and functions - 
 OapAdvAction * OapFreeAdvAction(OapAdvAction * action)                               
{                                                                                    
   while(action!=NULL)                                                               
     {                                                                               
        action->list=FreeSfList(action->list);                                       
        action=DelAdvAction(action,action->id);                                      
     }                                                                               
   return action;                                                                    
}                                                                                    
                                                                                     
OapAdvAction * OapCpyAdvAction(OapAdvAction * daction,OapAdvAction * saction)        
{                                                                                    
   daction=NULL;                                                                     
   while(saction!=NULL)                                                              
     {                                                                               
        daction=AddAdvAction(daction,saction->name,saction->author,saction->note,    
                             saction->cl_id,saction->list);                          
        saction=saction->next;                                                       
     }                                                                               
   return daction;                                                                   
}

thanx for advance.

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
