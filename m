From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: C99 doesn't allow local scope variables?
Date: Tue, 27 Jan 2004 11:45:52 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16406.20336.841481.184042@cerise.nosuchdomain.co.uk>
References: <200401262130.35636.tabris@tabris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200401262130.35636.tabris@tabris.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tabris <tabris@tabris.net>
Cc: linux-c-programming@vger.kernel.org


tabris wrote:

> simple C program
> 
> #include <stdlib.h>
> #include <stdio.h>
> 
> int main(void)
> {
>     for (int i=0; i < 2; i++)
>         printf("crap\n");
> };
> 
> [tabris@tabriel tmp]$ gcc test.c -o test
> test.c: In function `main':
> test.c:6: error: `for' loop initial declaration used outside C99 mode

You are trying to use C99 syntax in a file which isn't being treated
as such.

The default C dialect is C89 plus GNU extensions (-std=gnu89). The
Info file for gcc 3.0 says that C99 plus GNU extensions (-std=gnu99)
will become the default once the C99 support is complete. Until then,
if you want to use C99, you have to explicitly ask for it with
-std=c99 or -std=gnu99.

See the "C Dialect Options" node in the gcc Info file for more
details.

> What does that mean, and why am I not allowed to make a local scope variable 
> for a for{;;} loop?
> 
> works fine if i declare the variable outside the loop. But I swear I used to 
> do this with gcc 2.95.

You may have been using a modified version of gcc, although I suppose
that it's possible that -std=gnu99 may have been the default for some
versions.

-- 
Glynn Clements <glynn.clements@virgin.net>
