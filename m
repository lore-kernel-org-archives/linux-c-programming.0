From: Zhongye Jia <jia.zhongye@gmail.com>
Subject: Re: Hi, Needs suggestions for finding and fixing stack/memory
 corruption when calling a function
Date: Mon, 23 May 2011 22:59:09 +0800
Message-ID: <BANLkTikQ0PCeB6rd0Omhzq=J9RFJ2QZyvQ@mail.gmail.com>
References: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com> <BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=snyMy7Ib8rq2TUiCuBPCQ8JIWLN+Np8ostd2y2qxV1M=;
        b=Je661yhL7/M8pUtaq5eVQVLrWM9n3rhIv2FIzQhbeZKsShZM2+lPwZyuH0sREiEY35
         H7RDE8W7I3zjInNgfCgdu+IGY2hIYwycZW0vFARtLAQtAdzTP1frJqusi9f5e1+Co0ir
         QQnXCW5VA111n5pUhkf3PgDLdHD51hqjswhd0=
In-Reply-To: <BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fawad Lateef <fawadlateef@gmail.com>
Cc: linux-c-programming@vger.kernel.org

would you please provide your problem code? according to your
description, it highly seems that some of your pointers accidentally
write that memory, but i'm not sure.
you may use a debugger to watch that block of memory and see when it ch=
anged.

On Mon, May 23, 2011 at 10:41 PM, Fawad Lateef <fawadlateef@gmail.com> =
wrote:
> Hello,
>
> I need some suggestions about how-to approach, find and fix a memory
> corruption issue which is happening in a C/C++ very complex and large
> code (code evolved over several years). Code is running on AT91SAM926=
0
> (armv5l architecture; single processor with preemption enabled) and
> completely in Linux user-space.
>
> The problem is:
>
> -- We are calling a function which has three integer arguments.
> With-in that function 2nd and 3rd arguments always gets corrupted
> while 1st argument is fine. Just before calling that function printin=
g
> arguments is fine.
>
> Now it will be good if I can get some suggestions about whats
> happening and how-to look into this problem. I am thinking that there
> is some memory/stack corruption happening somewhere.
>
> Thanks in advance.
>
> -- Fawad Lateef
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
