From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: Re: deletion in singly linked list
Date: Thu, 25 Nov 2004 09:19:37 +0530
Message-ID: <1101354576.3795.1.camel@myLinux>
References: <1101198249.3786.3.camel@myLinux>
	 <20041124154309.5588936e.akaanoken@softminecorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041124154309.5588936e.akaanoken@softminecorp.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alphex Kaanoken <akaanoken@softminecorp.com>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>



/************* start of code ***********/
#include <stdio.h>

typedef struct _node{
	int data;
	struct _node *next;
}node;

void printList(node* head){
	node *temp;
	temp = head;
	while(temp){
		printf("%d\n", temp->data);
		temp = temp->next;
	}
	return;
}

int main(void){

	node *a, *b, *c;
	a = (node*)malloc(sizeof(node));
	b = (node*)malloc(sizeof(node));
	c = (node*)malloc(sizeof(node));
	
	a->data = 1;
	a->next = b;

	b->data = 2;
	b->next = c;

	c->data = 3;
	c->next = NULL;

	node *head;
	head = a;
	
	printList(head); //prints 1, 2, 3 -- its OK

	//deletion of b
	printf("Attaching node with data = %d\n", (b->next)->data);
	b = b->next;
	free(b);
	
	
	printList(head); //prints 1, 2, 0 -- NOT OK -- still a->next points to the location of b, even if its freed!! And also making b = b->next and free(b) removes the link b->next pointing to c. So finally c->data is not obtained!!
	return 0;
}

/********** end of code ************/

It is exactly in the same track as Kaanoken mentioned. But the linked list is broken.

Now how can this be fixed???


-- 
With regards,

Jagadeesh Bhaskar P

