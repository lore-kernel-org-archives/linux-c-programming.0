From: Alphex Kaanoken <akaanoken@softminecorp.com>
Subject: Re: deletion in singly linked list
Date: Wed, 24 Nov 2004 15:43:09 +0300
Message-ID: <20041124154309.5588936e.akaanoken@softminecorp.com>
References: <1101198249.3786.3.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1101198249.3786.3.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, 23 Nov 2004 13:54:10 +0530
Jagadeesh Bhaskar P <jbhaskar@hclinsys.com> wrote:

> I am having the address of a single node of a singly linked list. All I
> know about that node is that it is not the head of the list. Now say, I
> want to delete this node. I can infer its next node, but not its
> predicissor. Is there any way to delete that node, without breaking the
> whole linked list down!!
> 
> -- 
> Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
So, You must have something like following structure
typedef struct _mylist {
int id; /*I'm usually use it - you may don't including it*/
void *data; /*pointer to data*/
struct _mylist *next; /*pointer to the next list member*/
} mylist;

For deletion from this list use something code like that - 
mylist * DelItem(mylist *ptr,int id) /*id of member that you want to delete*/
{
  mylist *prev=NULL;
  mylist *curr;
  curr=ptr; /*save pointer address*/

  while(curr!=NULL && curr->id!=id){ /*search for member with pointed id*/
    prev=curr;
    curr=curr->next;
  }
  if(curr==NULL) /*nothing to delete NOTE!: don't make `curr' unsigned!*/
    return ptr;
  if(curr==ptr) /*just see what the member*/
    ptr=curr->next;
  else
    prev->next=curr->next;
  free(curr->data); /*if you need to free some data that pointer by void* */
  free(curr); /*free member*/
  return ptr; /*return pointer to the start of linked list*/
}

use this function - 
MyList=DelItem(MyList,2);

This function's algorythm working very well and stable. It can delete anything item - in start 
of list, middle if list, or at end of list ;-)

Best wishes.
