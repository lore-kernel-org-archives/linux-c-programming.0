From: wwp <subscript@free.fr>
Subject: Re: C99 doesn't allow local scope variables?
Date: Tue, 27 Jan 2004 09:05:12 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040127090512.48879f6e@tethys>
References: <200401262130.35636.tabris@tabris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200401262130.35636.tabris@tabris.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello tabris,


On Mon, 26 Jan 2004 21:30:30 -0500 tabris <tabris@tabris.net> wrote:

[snip]
> [tabris@tabriel tmp]$ gcc test.c -o test
> test.c: In function `main':
> test.c:6: error: `for' loop initial declaration used outside C99 mode
> 
> What does that mean, and why am I not allowed to make a local scope variable
> 
> for a for{;;} loop?
> 
> works fine if i declare the variable outside the loop. But I swear I used to
> 
> do this with gcc 2.95.

ANSI C89 requires int i; to be declared outside from the for(), only ANSI C99
and C++ allow this, IIRC.


Regards,

-- 
wwp
