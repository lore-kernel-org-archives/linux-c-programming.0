From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: convert time to UTC, strptime() returns -1 ?
Date: Fri, 3 Oct 2003 23:28:30 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20031003222830.GA6059@lsd.di.uminho.pt>
References: <3F69538E00004185@mail-bcm01.alestra.net.mx> <Pine.LNX.4.21.0310012128140.21094-100000@hestia>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0310012128140.21094-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

On Wed, Oct 01, 2003 at 09:40:44PM +0200, J. wrote:
>  if(strptime(tstr, "%a %b %d %T %Ey", &timestruct) == 0)
                                  ^^^^
You should use %Y, %y or %EY. For %Ey, the number is an offset from %EC,
that in my current locale is 1900.

So the year is ending up in 3903, beyond the 32/31 bit limit for the
number of seconds from Jan 1 1970.

Regards,
Luciano Rocha
