From: "Eric Polino" <aluink@gmail.com>
Subject: Re: how to call Functions implemented in other file?
Date: Tue, 27 May 2008 11:23:36 -0400
Message-ID: <b21328ed0805270823l4e2df81dq3b7264234a3dc37d@mail.gmail.com>
References: <17490027.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=bdlK3ZdsYc1T5DuKLuPW7jB14LdbIatWxIW8sqjnhW4=;
        b=po0zH1q767pAUnjvY+i19Fx5zpM6uwxslID4Wjh/I3EGmfTqC362vox1mVv0hAFSQiKhlrUxhJ9Fbj40zde0cWM2IKQ1l78/3I8qdOKDmSWnm9+dJ3eMuKcLQH1d8U4LTm0NCiOie4dSHrgz9zSVfygWnGhzvkU6ywIdaIbIBkM=
In-Reply-To: <17490027.post@talk.nabble.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: houanito <mhyp_power@hotmail.com>
Cc: linux-c-programming@vger.kernel.org

You need to compile this other file and add it to your compile line
and include the .h file for it.  For instance.

/path/to/file/foo.c
/path/to/file/foo.h
/path/to/file/foo.o

/home/user/yourProgram.c

/* yourProgram.c */
#include "/path/to/file/foo.h"

...


$ gcc /path/to/file/foo.o yourProgram.c

This is a very simplified version of what you could do.  Though this
doesn't account for possible library requirements of this object file.
 If this .c file is provided by your distibution or some other
program.  There is most likely a library or something to use the
functionality it has.  In theory this can all work, but things are
rarely designed to work this way.  I would reconsider your desire to
use this .c file.

Cheers,
Eric

On Tue, May 27, 2008 at 9:06 AM, houanito <mhyp_power@hotmail.com> wrote:
>
> hello!
>
> i have a problem using gcc c Complier in Unix.
> I want to use a function which is implemented in a file in another path.This
> function is  written by the distirbuters of the system and so the system
> uses this function.But i want to use that in order to do one part of my
> homework.
> Because the file that contains this function is *.c and not *.h, adding
> #include *.c to my code,generates problem..
>
> any help??thanks!
> --
> View this message in context: http://www.nabble.com/how-to-call-Functions-implemented-in-other-file--tp17490027p17490027.html
> Sent from the linux-c-programming mailing list archive at Nabble.com.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
"None are more hopelessly enslaved than those who falsely believe they
are free."
 --Goethe

"Freedom is living without government coercion."
 --Ron Paul (www.ronpaul2008.com)
