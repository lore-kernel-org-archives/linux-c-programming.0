From: Wayne Wu <techunter@gmail.com>
Subject: Re: #include problem
Date: Sun, 7 Nov 2004 03:39:40 +0000 (UTC)
Message-ID: <loom.20041107T043719-733@post.gmane.org>
References: <200410151648.i9FGmlqM026477@students.fct.unl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

C-16  <pmr17184 <at> students.fct.unl.pt> writes:

> 
> Howdy,
> i have a file main.c in my program that needs to include four headers
> aaa.h , bbb.h ,ccc.h and ddd.h . Each one of these headers need to
> include another header xxx.h . With this implementation i get a
> "redefinition" compilation error. How can i solve this problem ? Thanks
> in advance.
> -
> 
> 

you should use define a macro in xxx.h, for example __XXX_H_
then use the following codes in other headr files:
#ifndef __XXX_H_
#include "xxx.h"
#endif


