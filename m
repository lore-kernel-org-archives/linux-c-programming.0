From: Alphex Kaanoken <akaanoken@softminecorp.com>
Subject: Re: deletion in singly linked list
Date: Thu, 25 Nov 2004 13:11:42 +0300
Message-ID: <20041125131142.652bdb95.akaanoken@softminecorp.com>
References: <1101198249.3786.3.camel@myLinux>
	<20041124154309.5588936e.akaanoken@softminecorp.com>
	<1101354576.3795.1.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1101354576.3795.1.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, 25 Nov 2004 09:19:37 +0530
Jagadeesh Bhaskar P <jbhaskar@hclinsys.com> wrote:
ok, you made some mistakes
> 
> 
> /************* start of code ***********/
> #include <stdio.h>
> 
> typedef struct _node{
> 	int data;
> 	struct _node *next;
> }node;
> 
> void printList(node* head){ /*this is ok, but you make pointer to unsiged*/
> 	node *temp;
> 	temp = head;
> 	while(temp){ /*! make for safetly while(tmep!=NULL)*/
> 		printf("%d\n", temp->data);
> 		temp = temp->next;
> 	}
> 	return;
> }
> 
> int main(void){
> 
> 	node *a, *b, *c;
> 	a = (node*)malloc(sizeof(node));
> 	b = (node*)malloc(sizeof(node));
> 	c = (node*)malloc(sizeof(node));
> 	
> 	a->data = 1;
> 	a->next = b;
> 
> 	b->data = 2;
> 	b->next = c;
> 
> 	c->data = 3;
> 	c->next = NULL;
/*it's can't be worked! I'm usually write a simple function for this and it's working*/
> 	node *head;
> 	head = a;
> 	
> 	printList(head); //prints 1, 2, 3 -- its OK
> 
> 	//deletion of b
> 	printf("Attaching node with data = %d\n", (b->next)->data);
> 	b = b->next;
> 	free(b);
/*it's not true way - use my function*/
> 	
> 	
> 	printList(head); //prints 1, 2, 0 -- NOT OK -- still a->next points to the location of b, even if its freed!! And also making b = b->next and free(b) removes the link b->next pointing to c. So finally c->data is not obtained!!
> 	return 0;
> }
> 
> /********** end of code ************/
> 
> It is exactly in the same track as Kaanoken mentioned. But the linked list is broken.
> 
> Now how can this be fixed???
> 
So, I'm write a functions- for deletion from list ypu will see in my prevous message
for add mamber to the end of list use something like this function:
mylist * AddItem(mylist *ptr,void *data)
{
  mylist *lp=ptr;
  int id=0;
  if(ptr!=NULL){
    ++id;
    while(ptr->next!=NULL)
      {
        ptr=ptr->next;
        ++id;
      }
    ptr->next=(app_list*) malloc(sizeof(app_list);
    ptr=ptr->next;
    ptr->next=NULL;
    ptr->id=id;
    ptr->data=data; /*see how you will be work with pointers*/
    return lp;
  }
  else{
    ptr=(app_list*) malloc(sizeof(app_list);
    ptr->next=NULL;
    ptr->id=id;
    ptr->data=data;
    return ptr;
  }
}
it's worked with my singly linked list structure example in prevous message
If you need to insert/add to start of list, just rewrite this function it's simple.
In addition just imagenate you linked list structure in mind and understand that 
is very simple
in linked list you have "members" with pointer to the next member, 
if you need to remove member in any place you must do following things
 - find member to remove
 - take a pointer of prev member and change him to the next member that following after removeing member
 - free memory that malloced for removing member
it's all
also if you need to make addition to the end of list faster you can create 
a pointer to the end of list, in this case you don;t need to go for the end of list when 
you want to add the new member.

Best wishes
> 
> -- 
> With regards,
> 
> Jagadeesh Bhaskar P
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
System Developer of
SoftMine Corp.
Alphex Kaanoken
