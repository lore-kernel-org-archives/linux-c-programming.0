From: "Nanakos Chrysostomos" <nanakos@wired-net.gr>
Subject: Sorted List
Date: Sat, 26 Nov 2005 04:28:21 +0200 (EET)
Message-ID: <1379.62.1.10.54.1132972101.squirrel@webmail.wired-net.gr>
Reply-To: nanakos@wired-net.gr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi ,all.Can someone please explain this source code with an example???

***********************************************************************
#include <stdio.h>

typedef struct list_tag {
        int data;
        struct list_tag *next;
}ListNode;

typedef ListNode *slist;
slist empty = NULL;

void slistInsert(slist *sp,int t)
{
        ListNode *n=(ListNode *)malloc(sizeof(ListNode));
        if(n == NULL)
        {
                printf("Out of memory\n");
                exit(1);
        }
        n->data = t;
        while(*sp!=NULL && (*sp)->data < t)
        {
        sp = &((*sp)->next);   //Why we do this here,i miss this point
        }
        n->next = *sp;
        *sp = n;

}


void slistRemove(slist *sp,int t)
{
        ListNode *n;
        while(*sp!=NULL && (*sp)->data <t)
                sp = &((*sp)->next);
        if(*sp == NULL)
        {
                printf("Not found\n");
                exit(1);
        }

        n=*sp;
        *sp = (*sp)->next;
        free(n);
}

void slistPrint(slist s)
{
        ListNode *n;
        for(n=s;n!=NULL; n=n->next)
                printf("%d\n",n->data);
}

void main()
{

      slistInsert(&empty,4);
      slistInsert(&empty,8);

      slistInsert(&empty,24);
      slistInsert(&empty,50);
      slistInsert(&empty,20);
      slistInsert(&empty,2);
      slistRemove(&empty,4);
      slistInsert(&empty,18);
      slistPrint(empty);
}

Thank you very much in advance.

