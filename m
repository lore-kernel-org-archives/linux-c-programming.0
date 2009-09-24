From: pei lin <telent998@gmail.com>
Subject: Re: Using PAT features from user space
Date: Thu, 24 Sep 2009 11:40:37 +0800
Message-ID: <d6b7c4190909232040w29650j1199f5f4eafd67bd@mail.gmail.com>
References: <95b4a97b0909121820m2c912878t6b7cbff7f4fbacd6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=WNpDcDeEE/bX+wBWzXzePGvFdTjDUKLKq29qcTCNbWo=;
        b=xt+X58WO1mT2vLm1XY5692O9YZ56fFIGYDtC2EQ9p5+3CesYQN7pj1ZjX0Zj72kYFN
         /q5tG/EMNhOuY9x2QwGlkLTx1OygOk/0RYjxhDvaAB8/vmt6zuNhFixIJiRjn1IGau2X
         Lvr4NkC43ZxIvAwukhyIosC4QfHtLU4mqcbh4=
In-Reply-To: <95b4a97b0909121820m2c912878t6b7cbff7f4fbacd6@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Pignotti <alexpigna.dev@gmail.com>
Cc: linux-c-programming@vger.kernel.org

http://www.mjmwired.net/kernel/Documentation/x86/pat.txt
http://www.mjmwired.net/kernel/Documentation/x86/mtrr.txt
hope this can give u some clues.

Best Regards
Lin

2009/9/13 Alessandro Pignotti <alexpigna.dev@gmail.com>:
> Hi everyone,
>
> I'm writing an high performance application on x86-64 that allocate
> some memory to store a write only journal. I was wondering if there is
> a way to ask the kernel to mark such pages as write combining memory.
> More in general, it's possible to use PAT from userspace? I was
> expecting some mmap flag like MAP_NOCACHE, but there not seems to be
> any such flags.
>
> Regards,
> Alessandro
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
