From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: Unable set the priority for a pthread through 
	pthread_setschedparam
Date: Tue, 3 Feb 2009 13:41:55 +0530
Message-ID: <ea11fea30902030011g54b997e9vb9a1828bd350a9ac@mail.gmail.com>
References: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in>
	 <ea11fea30902022144t5a566d8br58ba711400e3ab0a@mail.gmail.com>
	 <F5BA82141F7AA94885B9643C77EEA5F2103C8A@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=U3rDsBuvtlwrG+hZTXiVHOjNceSFOa4pgOor0+XMkUw=;
        b=WbI1E0/q/4T9rGlADieisChMAx4VDxpEZeMTWZEaWD8ssU30X9WYkR3xTpTo5+IFYx
         05S3kqqKSh5ynvntpX//0VObdxTktfjM/F1q5qG2VE1YG9VbJ7DAj05aeb0SPaCTJVUn
         UqUc9sX9ElbOSey9Y7KMvL6EzsiQLvQWxSmxQ=
In-Reply-To: <F5BA82141F7AA94885B9643C77EEA5F2103C8A@mail.esntechnologies.co.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Srinivas G." <srinivasg@esntechnologies.co.in>
Cc: linux-c-programming@vger.kernel.org

On Tue, Feb 3, 2009 at 11:57 AM, Srinivas G.
<srinivasg@esntechnologies.co.in> wrote:
>> The man page says it all
>>
>>               !EPERM!
>>                      the calling process does not have superuser
>> permissions
>>
>> you cannot unless you have superuser permissions.
>>
>
> Dear Manish,
>
> Thanks for the information.
>
> I have seen the man pages and find the following.
>
> EPERM  The caller does not have appropriate privileges to set the
> specified
>       scheduling policy and parameters.
>
> I have tried to set the super user permissions to a normal user through
> user and groups. However I found there are lot of different groups

one with id 0 .. see /etc/group

Thanks -
Manish

> exists like
> adm
> apache
> avahi
> bin
> daemon
> dbus
> dip
> etc.
>
> Which groups shall I need to select for setting the super user
> permissions?
>
> Thanks in advance.
>
> Thanks and Regards,
> Srinivas G
>
>
