From: "Jason P. Winters" <jason@txt.com>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 24 Jul 2002 14:05:44 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200207242105.g6OL5i2L021592@grinch.txt.com>
References: <go0nha.u6f.ln@thune.mrc-home.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <go0nha.u6f.ln@thune.mrc-home.org> from "Mike Castle" at Jul 24, 2002 12:56:00 PM
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Castle <dalgoda@ix.netcom.com>
Cc: linux-c-programming@vger.kernel.org

 
Mike Castle said:
> In article <20020717123023.A2248@cs.pdx.edu>,
> Marius Nita  <marius@cs.pdx.edu> wrote:
> >It seems that this issue has become a religious thing, tho I don't see why. It
> >is clear that the return of malloc need not (and must not--for correctness) be
> >casted.
> 
> I believe it was necessary for pre or early ANSI C, so a lot of old code
> written by some pretty smart people used it.

I beleive that totally.  And when you add in the fact that a lot of people
move transparently between C and C++, which still requires casting, you can
see that adding the extra casts is a common and easilly understood thing.

Which probably contributed to why I never noticed I didn't need to do it in C
anymore.. ;}

Ciao all!

Jason
-- 
|UUCP  jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4
