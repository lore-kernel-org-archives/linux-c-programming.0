From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Some troubles with linked list/tree
Date: Fri, 30 Apr 2004 05:25:52 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16529.54608.968086.404599@cerise.nosuchdomain.co.uk>
References: <20040429193934.18faf8e1.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040429193934.18faf8e1.alphex@crew.org.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alphex K." <alphex@crew.org.ru>
Cc: linux-c-programming@vger.kernel.org


Alphex K. wrote:

> so I'm have a two linked lists

> so and functions to operate with there

>         while(list->next!=NULL)
>           {
>              list=list->next;
>              id++;
>           }
>         list->next=(struct SfList  *) malloc(sizeof(SfList));
>         list=list->next;

Note: it's simpler, and more efficient, to add new members to the
start of the list.

> and for OapAdvAction structure

> what the right way to add SfList to OapAdvAction ?

	action->list = list;

Or do you want to add a copy of the list?

> I try some methods but it doesn't work?

You are trying to add to action->list, but action->list starts out
uninitialised (i.e. containing garbage).

-- 
Glynn Clements <glynn.clements@virgin.net>
