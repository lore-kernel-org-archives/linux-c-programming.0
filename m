From: xmp <xmp@multipasto.net.co>
Subject: Re: Misc C question
Date: Wed, 19 Jun 2002 23:44:24 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020619234424.A480@nietzsche>
References: <20020619214332.A299@nietzsche>
    <010701c21808$1a7315b0$0201a8c0@ws1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <010701c21808$1a7315b0$0201a8c0@ws1>; from ruler@isolate.net
    on Wed, Jun 19, 2002 at 11:10:59PM -0400
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mike <ruler@isolate.net>
Cc: linux-c-programming@vger.kernel.org

> Basically, you could use the fexist() function (I think that's what its
> called), or the way most people do it..
> FILE *blah;
> if ((blah = fopen("/path/to/file, "r")) != NULL) {
>     printf("File does not exist.");
>     exit(0);
> }
hi, thanks for reply me.
About your example, What happens if the file exist and you dont have "r" permission? the call will return NULL?.

bye


