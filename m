From: Ronaldo.Afonso@cyclades.com
Subject: Re: Nanoseconds precision
Date: Thu, 25 Aug 2005 10:20:12 -0300
Message-ID: <OF3E405C3B.BEC69946-ON83257068.0048A143-83257068.004942CA@Cyclades.com>
References: <6a00c8d505082505406cec57eb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505082505406cec57eb@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org, linux-c-programming-owner@vger.kernel.org





All the functions in the libc do not show me nanosecond's precision. What
they do is get a microsecond number and multiply it by 1000. So, I realized
that it has to be that way because it's impossible to get a nanosecond's
precison on a machine with a 2Ghz clock. The system needs more than a
nanosecond to execute an instruction, so any nanosecond's precision, at
leas on a 2Ghz machine, should be inaccurate. I'm just sharing what I've
found.

Anyway, I'd like to thank everyone who helped me with this question.




                                                                           
             Steve Graegert                                                
             <graegerts@gmail.                                             
             com>                                                       To 
             Sent by:                  "Ronaldo.Afonso@cyclades.com"       
             linux-c-programmi         <Ronaldo.Afonso@cyclades.com>       
             ng-owner@vger.ker                                          cc 
             nel.org                   linux-c-programming@vger.kernel.org 
                                                                   Subject 
                                       Re: Nanoseconds precision           
             08/25/2005 09:40                                              
             AM                                                            
                                                                           
                                                                           
                                                                           
                                                                           




On 8/25/05, Ronaldo.Afonso@cyclades.com <Ronaldo.Afonso@cyclades.com>
wrote:
>
> Hello all,
>
> I need to get nanosecond's precision from the time of my system. I've
> analyzing the code of the "date command" and it seems it really doesn't
> show me  nanosecond's precision, what it, in fact, does is just multiply
by
> 1000 a microsecond's precison number that it gets from a system call.
Does
> anybody know how I can really get a nanosecond's precision from my
system?

librt contains time-related functions with nanosecond precision.  To
see what inside try this:

             $ nm /lib/librt.so.1 | grep clock_

I am sure, there is something of use for you.

Regards

             \Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


