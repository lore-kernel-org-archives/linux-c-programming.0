From: vadiraj <vadis.list@gmail.com>
Subject: Re: How to create separate files with debug information?
Date: Mon, 16 Apr 2007 10:42:46 +0530
Message-ID: <1176700366.9368.3.camel@blr-img.blr.novell.com>
References: <4622F702.6000301@gmail.com>
Reply-To: vadis.list@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:subject:from:reply-to:to:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer:content-transfer-encoding;
        b=jFQFv/F+Yc7kqQ/W8wf6Fc4QNqtXDUcmgssm4J6B+XMhUcvcYUKaU9u5MFFsEpw9eK04VcYmF0AFCy5tBLi09trj7mng2wxlxgCqhj0kkm9zn4fuDPqICk47OGNM201BdJD8FzD3JnhMhtkrenj3QxtmJOUoy4PI02b95/TVZR8=
In-Reply-To: <4622F702.6000301@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Mon, 2007-04-16 at 09:39 +0530, Shriramana Sharma wrote:

> Now the questions:
> 
> First: Is this kind of providing separate debug files applicable only 
> for library or also for applications?

Yes you can have debug file for applications too.
> 
> Second: How do I create such .debug files with debug information only? I 
> find that these debug files are not executables.


any binary/library compiled with debug flag are with debugging
information. I believe .debug in your example will be linked to the file
that the application will link. Ex. libQtGui.so ->
libQtGui.so.4.2.3.debug


Cheers,
Vadi

