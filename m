From: =?UTF-8?Q?Micha=C5=82_Nazarewicz?= <mina86@tlen.pl>
Subject: Re: thread: reentrant question
Date: Sat, 26 Dec 2009 11:42:20 +0100
Message-ID: <705f7e740912260242o5b45c1ccxd3f7c8709107fe0a@mail.gmail.com>
References: <34e1241d0912241041v60c031a2kc31fdb3b4ebbd317@mail.gmail.com>
	 <edf0f34e0912241130y20f6a9daj7085e57ee498e211@mail.gmail.com>
	 <34e1241d0912252132y48945feek8c803ccb8625cbbc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=2nCTq0j8KP4Q8UKxZj3+bv+1AKBrmokMU+Fc+RHRU/k=;
        b=W0S4UUzKtsMRbrDgaBxDKu824Z3THGQ5dQ7c7jDB0BSghnqDGHYsN+OxMf0hitKnDS
         Wwa4xQR8ZkgMIc+Bmtvor9gupJetw3Le0ScmE/TzK+79yPriZH/CwBaD22iecpJOiJOV
         z7ZE97UjLeIYbyJT02rCcHSh8/ZyRWUSQsqHo=
In-Reply-To: <34e1241d0912252132y48945feek8c803ccb8625cbbc@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: vinit dhatrak <vinit.dhatrak@gmail.com>, linux-c-programming@vger.kernel.org

2009/12/26 Randi Botse <nightdecoder@gmail.com>:
> Hi Vinit,
>
> So, does this function actually reentrant when free() has not been
> called?, thanks for your explanation.

This function is reentrant both when free(3) is called and when
free(3) is not called (but it introduce memory leaks in the second
case).

As I've written before, the only issue may be with printf(3) as output
from various threads may get mixed together.
