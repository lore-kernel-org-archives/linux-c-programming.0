From: "Alphex K." <alphex@crew.org.ru>
Subject: Some troubles with linked list/tree
Date: Thu, 29 Apr 2004 19:39:34 +0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040429193934.18faf8e1.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: linux-c-programming@vger.kernel.org

Hi guys!
I'm have a one question
so I'm have a two linked lists
typedef struct                                                                  
{                                                                               
   int id;                                                                      
   int sf_id;                                                                   
   char *from_date;                                                             
   char *to_date;                                                               
   struct SfList *next;                                                         
} SfList;

typedef struct                                                                  
{                                                                               
   int id;                                                                      
   char *name;                                                                  
   char *author;                                                                
   char *note;                                                                  
   int cl_id;                                                                   
   SfList * list;                                                               
   struct OapAdvAction *next;                                                   
} OapAdvAction;

so and functions to operate with there
SfList * AddSfEntry(SfList * list,int sf_id,char *from_date,char *to_date)           
{                                                                                    
   int id=0;                                                                         
   SfList * lp=list;                                                                 
   if(list!=NULL)                                                                    
     {                                                                               
        id=1;                                                                        
        while(list->next!=NULL)                                                      
          {                                                                          
             list=list->next;                                                        
             id++;                                                                   
          }                                                                          
        list->next=(struct SfList  *) malloc(sizeof(SfList));                        
        list=list->next;                                                             
        list->next=NULL;                                                             
        list->id=id;                                                                 
        list->sf_id=sf_id;                                                           
        list->from_date=from_date;                                                   
        list->to_date=to_date;                                                       
        return lp;                                                                   
     }                                                                               
   else                                                                              
     {                                                                               
        list=(struct SfList  *) malloc(sizeof(SfList));                              
        list->next=NULL;                                                             
        list->id=id;                                                                 
        list->sf_id=sf_id;                                                           
        list->from_date=from_date;                                                   
        list->to_date=to_date;                                                       
        return list;                                                                 
     }                                                                               
   // end ;-)                                                                        
}

and for OapAdvAction structure
OapAdvAction * AddAdvAction(OapAdvAction * action,char *name,char *author,           
                            char *note,int cl_id,SfList * list)                      
{                                                                                    
   OapAdvAction * lp=action;                                                         
   int id=0;                                                                         
   if(action!=NULL)                                                                  
     {                                                                               
        id=1;                                                                        
        while(action->next!=NULL)                                                    
          {                                                                          
             action=action->next;                                                    
             id++;                                                                   
          }                                                                          
        action->next=(struct OapAdvAction  *) malloc(sizeof(OapAdvAction)+sizeof(SfL$
        action=action->next;                                                         
        action->next=NULL;                                                           
        action->id=id;                                                               
        action->name=name;                                                           
        action->author=author;                                                       
        action->note=note;                                                           
        action->cl_id=cl_id;                                                         
        // adding list                                                               
        /*while(list!=NULL)                                                          
          {                                                                          
             action->list=AddSfEntry(action->list,list->sf_id,list->from_date,       
                                     list->to_date);                                 
             list=list->next;                                                        
          }*/                                                                        
        action->list=(struct SfList  *) malloc(sizeof(list));                        
        action->list=list;                                                           
        return lp;                                                                   
     }                                                                               
   else                                                                              
     {                                                                               
        action=(struct OapAdvAction  *) malloc(sizeof(OapAdvAction)+sizeof(SfList)); 
        action->next=NULL;                                                           
        action->id=id;                                                               
        action->name=name;                                                           
        action->author=author;                                                       
        action->note=note;                                                           
        action->cl_id=cl_id;                                                         
        // adding list                                                               
        /*while(list!=NULL)                                                          
          {                                                                          
             action->list=AddSfEntry(action->list,list->sf_id,list->from_date,       
                                     list->to_date);                                 
             list=list->next;                                                        
          }*/                                                                        
        action->list=(struct SfList  *) malloc(sizeof(list));                        
        action->list=list;                                                           
        return action;
}
}

what the right way to add SfList to OapAdvAction ?
I try some methods but it doesn't work?

Thanx

---===---
Alphex Kaanoken
Senior developer of Crew IT research labs
web: http://crew.org.ru
mailto:Alphex@Crew.Org.RU
