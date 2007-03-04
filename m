From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: Handling ioctl() argp memory
Date: Sun, 4 Mar 2007 17:52:20 +0100
Message-ID: <d9def9db0703040852m2df3b0d8l42cf57b0c8ae9e15@mail.gmail.com>
References: <20070304164844.GA7231@wintermute.farpoint>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=XPV9sisSJwfb1cJ3NPFCZ1v0C+JplXaYcKZUyLxPgSQkZiYgqMH+qn0Ix/oDtgpxXyOss3OxHtJZzrSL6tGV6PCn2SyezclWnFxvSulaQXGl2YPn1lINFtKirvLZgZBHxaYqpHMufxj0SWW3bDSlaipg0eD5Wd69LQDWAVsDmm0=
In-Reply-To: <20070304164844.GA7231@wintermute.farpoint>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: leslie.polzer@gmx.net
Cc: linux-c-programming@vger.kernel.org

Hi Leslie,

could you show us the sourcecode?

Markus

On 3/4/07, leslie.polzer@gmx.net <leslie.polzer@gmx.net> wrote:
>
> Hello folks,
>
>   I'm passing an array to a ioctl.
>   ioctl(2) says it needs to point at memory, so I'm allocating it.
>   Do I need to, or rather, am I allowed to free the memory afterwards?
>
>   It seems I'm getting segfaults when I free the memory...
>
>     Leslie
>
> --
> gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83
> http://nic-nac-project.de/~skypher/
>


-- 
Markus Rechberger
