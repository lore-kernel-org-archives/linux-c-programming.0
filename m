From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: Newbie question on malloc()
Date: Thu, 3 Jun 2004 04:28:32 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040603012832.GC2562@luna.mooo.com>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, Jun 02, 2004 at 08:48:07PM +0900, Wen Guangcheng wrote:
> Hello Gurus,
> I have made a daemon in which dynamic memory is gotten
> by malloc(). Does the memory get free automatically without
> free() by the deamon  when the daemon process is killed?
> Thanks in advance.
> 

It does, but in general its not in good practice to count on process
exit for freeing memory (a good way to get memory leaks).

> --Wen
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
