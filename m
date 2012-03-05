From: Andrej Gelenberg <andrej.gelenberg@udo.edu>
Subject: Re: Unicode or not?
Date: Mon, 05 Mar 2012 15:04:18 +0100
Message-ID: <4F54C7E2.3000307@udo.edu>
References: <jj2b8n$uka$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <jj2b8n$uka$1@dough.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Krzysztof <kj@limes.com.pl>
Cc: linux-c-programming@vger.kernel.org

HI,

it's always char **, which encoding the arguments has, depends on system
locale (mostly LANG environment variable), but it must be always some
sort of multibyte encoding at most (like utf8). UCS 2 (UTF-16) would
break many existing programs.

http://stackoverflow.com/questions/1664476/is-it-possible-to-use-a-unicode-argv

and here, how to covert between utf8 and wchar:
http://www.ibm.com/developerworks/linux/library/l-linuni/index.html

On 03/05/2012 01:23 PM, Krzysztof wrote:
> Does it happen that command line which is passed to program arguments is
> "unicoded"? In other words, when should "main" be defined as "main(int
> argc, wchar_t **argv)"?
> 

Regards,
Andrej Gelenberg
