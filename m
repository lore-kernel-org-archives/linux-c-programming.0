From: Ranga Makireddy <ranga.makireddy@gmail.com>
Subject: Re: #include problem
Date: Mon, 18 Oct 2004 12:33:54 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <6eff2af00410180003383f9cfc@mail.gmail.com>
References: <200410151648.i9FGmlqM026477@students.fct.unl.pt>
Reply-To: Ranga Makireddy <ranga.makireddy@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200410151648.i9FGmlqM026477@students.fct.unl.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: C-16 <pmr17184@students.fct.unl.pt>
Cc: linux-c-programming@vger.kernel.org

Define your headers as follows in xxx.h file

#ifndef MY_HEADER
#define <my stuff>
#endif

Cheers,
Ranga


On Fri, 15 Oct 2004 17:48:47 +0100, C-16 <pmr17184@students.fct.unl.pt> wrote:
> Howdy,
> i have a file main.c in my program that needs to include four headers
> aaa.h , bbb.h ,ccc.h and ddd.h . Each one of these headers need to
> include another header xxx.h . With this implementation i get a
> "redefinition" compilation error. How can i solve this problem ? Thanks
> in advance.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
