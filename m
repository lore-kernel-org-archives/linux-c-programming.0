From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: RE: Unable set the priority for a pthread through pthread_setschedparam
Date: Tue, 3 Feb 2009 11:57:53 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F2103C8A@mail.esntechnologies.co.in>
References: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in> <ea11fea30902022144t5a566d8br58ba711400e3ab0a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <ea11fea30902022144t5a566d8br58ba711400e3ab0a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: linux-c-programming@vger.kernel.org

> The man page says it all
> 
>               !EPERM!
>                      the calling process does not have superuser
> permissions
> 
> you cannot unless you have superuser permissions.
>

Dear Manish,

Thanks for the information.

I have seen the man pages and find the following.

EPERM  The caller does not have appropriate privileges to set the
specified
       scheduling policy and parameters.

I have tried to set the super user permissions to a normal user through
user and groups. However I found there are lot of different groups
exists like
adm
apache
avahi
bin
daemon
dbus
dip
etc.

Which groups shall I need to select for setting the super user
permissions?

Thanks in advance.

Thanks and Regards,
Srinivas G

