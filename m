From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: Newbie question on malloc()
Date: Wed, 02 Jun 2004 13:08:13 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1086196092.29970.2.camel@localhost>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
Reply-To: jtwilliams@vt.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wen Guangcheng <wen.guangcheng@cnt.sp.qnes.nec.co.jp>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Since no one else has answered yet.  

As I understand it, that is entirely up to the operation system.  Linux
and NT Kernel systems do reclaim unfreed memory, however I believe one
the major problems with Win98 was that it did not.

Anyone with more information feel free to correct me

On Wed, 2004-06-02 at 07:48, Wen Guangcheng wrote:
> Hello Gurus,
> I have made a daemon in which dynamic memory is gotten
> by malloc(). Does the memory get free automatically without
> free() by the deamon  when the daemon process is killed?
> Thanks in advance.
> 
> --Wen
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

