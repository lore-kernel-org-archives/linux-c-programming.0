From: Jarmo <SVisor@lycos.com>
Subject: Re: typecasting - explain
Date: Fri, 09 Sep 2005 11:28:56 +0200
Message-ID: <dfrkke$k2t$1@sea.gmane.org>
References: <dfrckc$ts5$1@sea.gmane.org> <1126251195.4506.81.camel@kaushal> <dfri89$cse$2@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfri89$cse$2@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

...
>   I'm sorry my wording of the explanation of the typecasting is, I 
> agree, flawed. But, do tell me more on typecasting function pointers. 
> Does it mean anything different or still the same as typecasting of 
> normal data types?

Functions are only "jump" labels. Thou you cant expect a program to work 
if you cross typecast functions with different argument (or return) 
values. This because the function expects arguments to be in "right" 
register or stack position. And caller expects return values to be in 
right register.

// Jarmo

