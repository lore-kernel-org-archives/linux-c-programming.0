From: wwp <subscript@free.fr>
Subject: Re: printf format type, precision...
Date: Sat, 3 Jul 2004 01:19:23 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040703011923.4641036a@tethys.solarsys.org>
References: <Pine.LNX.4.21.0407030018090.1619-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0407030018090.1619-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: mailing-lists@xs4all.nl

Hello J.,


On Sat, 3 Jul 2004 00:32:27 +0200 (CEST) "J." <mailing-lists@xs4all.nl> wrote:

> Saturday, July 03 00:18:09
> 
> Hello,
> 
> I am trying to convert an IP address to it's eq. in base10
> [homework]. However the outcome from the formula listed below isn't giving
> me the right results.  Is this because I'm using the wrong precision type
> for the `result' variable ? If that's the case what other precision type
> should I use instead ? Right now I can't see the format tree's trhu the
> precision forrest anmore .. ehum.

See if the following gives what you expect. Please not the () around the <<
operation, try w/o them (you'll see the difference about operator precedence).


#include <stdio.h>

int main(void) {
 int var1 = 192; 
 int var2 = 168;
 int var3 = 1;
 int var4 = 10;
 long unsigned int result = 0;

 result = (var1 << 24) + (var2 << 16) + (var3 << 8) + var4;
 printf("%lu %0lx\n", result, result);

 return 0;
}


Regards,

-- 
wwp
