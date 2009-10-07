From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Question about core files
Date: Wed, 7 Oct 2009 14:21:20 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0910071416310.29237@diagnostix.dwd.de>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de> 
 <ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com> 
 <Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de>
 <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hello Manish

On Wed, 7 Oct 2009, Manish Katiyar wrote:

> Hi Holger,
>
> I don't have the source code, so a bit hard to guess. But you can try
> to find out which member of your fsa structure is at offset 236 (0xec)
> and look around those lines in the function where you are accessing
> that member.
>
> I am trying to download the AFD source code, which looks like it will
> take ages on my slow broadband. Hopefully I can help after that.
>
If you download, please take afd-1.4.0-0.20.beta.tar.bz2 because that
is the one that caused the error. You can get it from:

    ftp://ftp.dwd.de/pub/afd/development/afd-1.4.0-0.20.beta.tar.bz2

You will find the relevant code in src/fd.c.

Holger
