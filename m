From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: WaitForMultipleObjects sources for a C application
Date: Tue, 17 Feb 2009 18:21:13 +0530
Message-ID: <ea11fea30902170451n73afe5c2x32500db847870bb1@mail.gmail.com>
References: <F5BA82141F7AA94885B9643C77EEA5F2104324@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ALuIFHsp66AU56klVDBgqX3U/Jo/UO4bTz5E/6IJEm0=;
        b=o3SZ/ZcPAK/AWQEGbRdwC5FscJY3sjub2PxI4J7aYF7gUVujsB7k2lqZwWNZJvExiY
         CRLYLk5+C7OB0/cpBBwLwVt3yCZO/ux1GfutN4P4oz7/4cWBeW5p/KcfwRsHMNjfFk+s
         xpwzdh3vsmvqFvsLBADzgFE2r/SlZ5oJgPYiY=
In-Reply-To: <F5BA82141F7AA94885B9643C77EEA5F2104324@mail.esntechnologies.co.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Srinivas G." <srinivasg@esntechnologies.co.in>
Cc: linux-c-programming@vger.kernel.org

On Tue, Feb 17, 2009 at 5:48 PM, Srinivas G.
<srinivasg@esntechnologies.co.in> wrote:
> Dear All,
>
> I have downloaded the source code for the WaitForMultipleObjects API to
> use on Linux box from the following link.
> http://home.arcor.de/rdengler/
>
> However, the sources are developed in the C++. I am not able to use
> these sources in my C application due to classes and its definitions.
> When I tried to convert the classes into an equivalent C structures I
> got the following error.
>
> std::set<CWinEventHandle*> m_Subscriber; // Used in
> WaitForMultipleObjects()
>
> Could you please let me know how can I use CPP sources in a C
> application? Is there any equivalent C code for the same
> WaitForMultipleObjects?

Aren't they more or less equivalent to condition variables ?? You can
also have a look at the below link
http://www.ibm.com/developerworks/eserver/library/es-win32linux-sem.html

Thanks -
Manish



>
> Thanks in advance.
>
> With Regards,
> Srinivas G
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
