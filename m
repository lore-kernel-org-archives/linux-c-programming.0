From: _z33 <timid.Gentoo@gmail.com>
Subject: typecasting - explain
Date: Fri, 09 Sep 2005 12:46:22 -0700
Message-ID: <dfrckc$ts5$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

   I'm not able to understand what exactly happens when I typecast a 
data type from one to other. What I had in mind was, that by typecasting 
you are making it clear to the compiler how to handle the data. For 
example, when you get a "void *" from malloc, the reason you typecast it 
to the required data type, is to make sure later the compiler doesn't 
complain or throw an error, when doing some pointer arithmetic on it. Am 
I wrong completely?
   If my conception is correct, then I'm having a serious problem in 
understanding typecasting of function pointers. First of all, I thought 
it is meaningless and the compiler won't allow it. However, to my shock 
I came across a posting today morning on a different newsgroup, claiming 
that it is in fact supported by the ANSI standard. Is it? If so, what 
does such a typecasting mean?

_z33
-- 
I love TUX; well... that's an understatement :)

