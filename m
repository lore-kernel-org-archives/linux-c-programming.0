From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: How to send mail from C program on Linux
Date: Wed, 28 Oct 2009 14:36:30 +0100
Message-ID: <20091028133630.GB5728@opentech.at>
References: <20669019.01256731758094.JavaMail.root@wombat>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20669019.01256731758094.JavaMail.root@wombat>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: darshan.ghumare@gmail.com
Cc: linux-c-programming@vger.kernel.org

On Wed, 28 Oct 2009, darshan.ghumare@gmail.com wrote:

> Hi,
>
> In my project I need to send mail on Linux.
> I have used sendmail to send mail but there are failed to send mail to my gmail account.
>
well there is always ugly insecure brute force:

#include <stdlib.h>
#include <stdio.h>

int main(int argc,char ** argv){
        char cmd[128];
        sprintf(cmd,"/usr/bin/mail -v root < /tmp/mail");
        system(cmd);
        return 0;
}

hofrat

