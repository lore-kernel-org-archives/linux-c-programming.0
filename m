From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: pointer notation
Date: Tue, 28 Oct 2003 10:00:01 -0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F9E5A41.40204@ig.com.br>
References: <20031028094205.GA4228@mrna.tn.nic.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031028094205.GA4228@mrna.tn.nic.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: km <km@mrna.tn.nic.in>
Cc: linux-c-programming@vger.kernel.org

Try to think that p is a MACRO, like as (arbitrary macro):
"#define p  pBaseList+5*(x->element)+1"

When you do:
"p->next"
it ll be:
"pBaseList+5*(x->element)+1->next"

the code above seems to be unsafe, so, if you do:
"(p)->next"
or:
"#define p  (pBaseList+5*(x->element)+1)"
it ll free or code of  "precedence bugs".

Luciano

km wrote, On 28/10/2003 07:42:

> Hi all,
> how different is the notation 
> (p)->next (what do the parenthesis around the pointer signify ? )
> different from  
> p ( while p is a pointer)
> 
> regards,
> KM
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

