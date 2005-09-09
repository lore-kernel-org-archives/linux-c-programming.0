From: kaushal <kaushal@rocsys.com>
Subject: Re: typecasting - explain
Date: Fri, 09 Sep 2005 13:03:15 +0530
Message-ID: <1126251195.4506.81.camel@kaushal>
References: <dfrckc$ts5$1@sea.gmane.org>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfrckc$ts5$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org

hi _z33,
        Someone correct me if Iam wrong.the idea behind typecasting is
to tell the compiler how u want to access a particular region in
memory.Whether the region has to considered in terms of 4bytes at a time
or interms of 1 byte at a time or 2bytes so on.ie.. when you use a
variable to access a memory region the datatype of the variable would
tell the size of the memory region which has meaningful data for us.
When u typecast a variable it means u r trying to increase or decrease
the memory region size.Compiler simply helps you do that.It will not
bother if you are trying to use the data at that memory location is used
as an address or data.Its how we use it.

cheers-
kaushal.
On Fri, 2005-09-09 at 12:46 -0700, _z33 wrote:
>    I'm not able to understand what exactly happens when I typecast a 
> data type from one to other. What I had in mind was, that by typecasting 
> you are making it clear to the compiler how to handle the data. For 
> example, when you get a "void *" from malloc, the reason you typecast it 
> to the required data type, is to make sure later the compiler doesn't 
> complain or throw an error, when doing some pointer arithmetic on it. Am 
> I wrong completely?
>    If my conception is correct, then I'm having a serious problem in 
> understanding typecasting of function pointers. First of all, I thought 
> it is meaningless and the compiler won't allow it. However, to my shock 
> I came across a posting today morning on a different newsgroup, claiming 
> that it is in fact supported by the ANSI standard. Is it? If so, what 
> does such a typecasting mean?
> 
> _z33

