From: Mohana Sundaram <ksmoha@gmail.com>
Subject: Re: Linux process...
Date: Mon, 30 Mar 2009 12:41:38 +0530
Message-ID: <7fd0b9b40903300011o6aa51396l73873553cf09f2e7@mail.gmail.com>
References: <34e1241d0903292306m3e879639u4752e821349c84ee@mail.gmail.com>
	 <49D0639E.3060101@einfochips.com>
	 <34e1241d0903292357ha2fb36av5480578eddc1c67d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=P9oNDE/b3JGSn2yq6Tix7Noh1wynYVcOJbIQSj6P/d0=;
        b=hSDJGhkR6aSN2w79SJhInsXbwFJAVVbPFPHKnAMVMDSPTycAC0JVn/MKir3pabIM+b
         0pFz90zvn95imaEmZbCWyPsiql7RuhX8btNy4PCcqbE1xe+FQenJ3ssihEg6Eh2O7MAu
         64A8dsx7B5jFJ9Dw2pYcCc7WEZIp+SV/Fs44Q=
In-Reply-To: <34e1241d0903292357ha2fb36av5480578eddc1c67d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: beginner_h4x3r <nightdecoder@gmail.com>
Cc: Rahul K Patel <rahulk.patel@einfochips.com>, linux-c-programming@vger.kernel.org

Please read about virtual memory.. In a nutshell the printed addresses
are virtual addresses not absolute addresses.

Thanks,
- Mohan.
The expert at anything was once a beginner.




On Mon, Mar 30, 2009 at 12:27, beginner_h4x3r <nightdecoder@gmail.com> =
wrote:
> Hi Rahul,
>
> What is the means of process's base address and offset? It's means
> child's base address is offset? how to know child's process stack_int
> address in my demonstration code.
>
> Thanks in advance.
>
> --- curious_hacker
>
> On Mon, Mar 30, 2009 at 1:15 PM, Rahul K Patel
> <rahulk.patel@einfochips.com> wrote:
>> it's offset address and not absolute address.
>> base addresses of your parent and child process will be different so
>> final absolute address (base + offset) will be different for both.
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
