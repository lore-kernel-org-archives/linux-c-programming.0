From: jnf <xjnfx@doityourself.com>
Subject: saved eip question [was Re: c debugging w/ gdb revisited]
Date: Sun, 16 Jun 2002 03:43:46 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020616104346.5EC782757@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

yea i didnt think so, but i figured id ask, i was trying to see if i could follow eip honestly.

any idea why a saved eip would be restored here

call function
add $0xsomevalue, %esp
push $value

why it would die in between add and push, why a saved eip would be restored @ that point is really my question, i guess im asking this to the wrong mailing list ;]


--- Billy O'Connor <billy@oconnoronline.net> wrote:
>   just a quick question, does anyone know if its possible to set a break/watchpoint in gdb when a register points to a certain location?
>   i own the gdb manual, and have been playing in it for a bit and just cant seem to figure it out, is it possible?
>
>
>I don't believe that could be done at all, the machine would have to
>stop whenever it mov'd a value to the register so the debugger could
>examine it.  I don't think that's possible on Intel machines, anyway.
>
>--
>Billy O'Connor

_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
