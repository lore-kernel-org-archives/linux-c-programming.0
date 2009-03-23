From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Socket programming
Date: Mon, 23 Mar 2009 09:18:25 +0000
Message-ID: <18887.21473.389229.779212@cerise.gclements.plus.com>
References: <20090322054220.1C330C2D@resin14.mta.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20090322054220.1C330C2D@resin14.mta.everyone.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ajhwb@knac.com
Cc: linux-c-programming@vger.kernel.org


Ardhan Madras wrote:

> I was written small network utility in Linux 2.6, glibc 2.7.
> I have been using send() and recv() system call in SOCK_STREAM
> to send or receive fixed size data. for example, i write my data 
> structure like this:
> 
> struct foo
> {
>   char name[16];
>   char pix[1024];
>   int id;
> } bar;
> 
> If i want to send or receive data i just call
> 
> send (socket, &bar, sizeof(struct foo), 0);
> 
> or to receive:
> recv (socket, &bar, sizeof(struct foo), 0);

Apart from the comments which have already been made:

There's no reason to use send() and recv() if the flags argument is
zero. You may as well use read() and write(). Or convert the
descriptor to a FILE* with fdopen() and use fread() and fwrite().

-- 
Glynn Clements <glynn@gclements.plus.com>
