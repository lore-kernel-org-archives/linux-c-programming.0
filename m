From: beginner_h4x3r <nightdecoder@gmail.com>
Subject: Re: Linux process...
Date: Mon, 30 Mar 2009 13:57:26 +0700
Message-ID: <34e1241d0903292357ha2fb36av5480578eddc1c67d@mail.gmail.com>
References: <34e1241d0903292306m3e879639u4752e821349c84ee@mail.gmail.com>
	 <49D0639E.3060101@einfochips.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5PkHwhSG1bIar5pHqUvJY56Nu/f2rqtWq5mBgaJQSl8=;
        b=D/8BiUkrTmcaTuScxmDwKWS3m5W2hq2hsuHLO1cjN3ApjuwdYQCNeLeTkIHGs9ZeUk
         NyTtov2Fk3NgvuJQa9OCZhLEKoXnN7ipJc9PHEB7jE3Iv0jUQz/WLSmshkjis3CQWXuX
         YgyyG6utvV+unWKV4hphhiJ2n2S0jbWJDfkB8=
In-Reply-To: <49D0639E.3060101@einfochips.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rahul K Patel <rahulk.patel@einfochips.com>
Cc: linux-c-programming@vger.kernel.org

Hi Rahul,

What is the means of process's base address and offset? It's means
child's base address is offset? how to know child's process stack_int
address in my demonstration code.

Thanks in advance.

--- curious_hacker

On Mon, Mar 30, 2009 at 1:15 PM, Rahul K Patel
<rahulk.patel@einfochips.com> wrote:
> it's offset address and not absolute address.
> base addresses of your parent and child process will be different so
> final absolute address (base + offset) will be different for both.
