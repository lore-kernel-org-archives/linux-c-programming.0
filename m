From: Shanks <mshanks79@yahoo.co.in>
Subject: Re: problem with <asm/semaphore.h>
Date: Tue, 4 Jun 2002 04:44:21 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <adi9k5$c4o$2@main.gmane.org>
References: <20020604111944.34250.qmail@web12708.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020604111944.34250.qmail@web12708.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hossein Mobahi <hmobahi@yahoo.com>, linux-kernel@vger.kernel.org
Cc: linux-c-programming@vger.kernel.org

Hi Hossein,

If you look inside <asm/semaphore.h> you will see that
the definition of struct semaphore is within a 
conditional #ifdef __KERNEL__

Hence __KERNEL__ needs to be defined for this code to
compile.
Try compiling like this
$> gcc -D__KERNEL__ file.c

Regards,
Shanks

--- Hossein Mobahi <hmobahi@yahoo.com> wrote:
> Hi
> I compiled the following code with gcc under Redhat
> 7.2 :
> #include <asm/semaphore.h>
> main()
> {
>     struct semaphore sum;
> }
> 
> It doesn't compile, saying "storage size of `sem'
> isn't known".
> 
> Sincerely
> --Hossein Mobahi

__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
