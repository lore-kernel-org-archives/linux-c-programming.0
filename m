From: ruler@isolate.net
Subject: Re: multi threaded file access
Date: Fri, 6 Dec 2002 08:38:33 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <39265468443.20021206083833@isolate.net>
References: <3DF08C71.30605@tlabs.ac.za>
Reply-To: ruler@isolate.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3DF08C71.30605@tlabs.ac.za>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello Heinrich,

Friday, December 6, 2002, 6:39:29 AM, you wrote:

HdT> Hello

HdT> I have a tcp/ip server which is offcourse multi threaded :-)

HdT> Is it safe to have to threads access the same file descriptor at the 
HdT> same time?
HdT> Or should I put a mutex over the file descriptor?

HdT> Thanks for your help
HdT> -Heinrich


HdT> -
HdT> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
HdT> the body of a message to majordomo@vger.kernel.org
HdT> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Put a mutex over the writing to file descriptor.  Depends on how much
and what you are writing, it could makes lines combine with each other
into a bunch of garbled letters.

Thanks,

-- 
Best regards,
 ruler                            mailto:ruler@isolate.net


