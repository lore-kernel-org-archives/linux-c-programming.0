From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Some troubles with linked list/tree
Date: Fri, 30 Apr 2004 14:38:06 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16530.22206.809391.568597@cerise.nosuchdomain.co.uk>
References: <20040429193934.18faf8e1.alphex@crew.org.ru>
	<16529.54608.968086.404599@cerise.nosuchdomain.co.uk>
	<20040430131553.03ec8bd4.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040430131553.03ec8bd4.alphex@crew.org.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alphex K." <alphex@crew.org.ru>
Cc: linux-c-programming@vger.kernel.org


Alphex K. wrote:

> > > I try some methods but it doesn't work?
> > 
> > You are trying to add to action->list, but action->list starts out
> > uninitialised (i.e. containing garbage).
> 
> How I can initializate it in OapAdvAction * AddAdvAction(OapAdvAction * action,char *name,char *author,           
>                             char *note,int cl_id,SfList * list) ?? it's my question.

Set:

	action->list=NULL;

before attempting to add entries with AddSfEntry().

-- 
Glynn Clements <glynn.clements@virgin.net>
