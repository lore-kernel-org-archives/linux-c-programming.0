From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: opening a directory, and reading it's contents
Date: Sat, 31 Aug 2002 01:44:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15728.4447.267218.234216@cerise.nosuchdomain.co.uk>
References: <20020830174541.A16505@namodn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020830174541.A16505@namodn.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Jennings <nkj@namodn.com>
Cc: linux-c-programming@vger.kernel.org


Nick Jennings wrote:

>  I can't seem to find the function I am looking for. I'd like to
>  open a directory for reading, and iterate through the contents of
>  it (filenames, directories etc). 
> 
>  Is there a platoform independant way to do this?

opendir/readdir/closedir works on all Unix-like systems; that's as
portable as it gets.

>  What's the linux-specific way to do it?

There isn't one.

There is getdents() but, although this is less portable than the
above, it isn't actually Linux-specific.

-- 
Glynn Clements <glynn.clements@virgin.net>
