From: Thomas Steudten <alpha@steudten.com>
Subject: Re: pointer notation
Date: Tue, 28 Oct 2003 11:17:28 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F9E4238.3020807@steudten.com>
References: <20031028094205.GA4228@mrna.tn.nic.in>
Reply-To: alpha@steudten.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031028094205.GA4228@mrna.tn.nic.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: km <km@mrna.tn.nic.in>
Cc: linux-c-programming@vger.kernel.org

Hi

(p)->next and p->next are the same. I think you saw a sourcecode, where
maybe p is replaced by a macro like #define p ptr->a.
However the priority in c is "()" first, then "->".


>  Hi all,
>  how different is the notation 
>  (p)->next (what do the parenthesis around the pointer signify ? )
>  different from  
>  p ( while p is a pointer)

-- 
Tom

LINUX user since kernel 0.99.x 1994.
RPM Alpha packages at http://alpha.steudten.com/packages
Want to know what S.u.S.E 1995 cdrom-set contains?


