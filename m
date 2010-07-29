From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: the kernelnewbies wiki.
Date: Thu, 29 Jul 2010 16:28:26 -0400
Message-ID: <AANLkTi=-uTg5NnSrcP9_SOLg64Zjt35U5476nCs+5Wyv@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:cc:content-type;
        bh=EKfsu4qqCARtafK3pVEdACVbfYYqB/wJPOLpJE2Tm8Q=;
        b=HFzkI1/OL+3M6d/K3/9qFOigb3MVqJdtZAa4dkwrG2FcippptXasH/v028yNoPET5u
         KEahbpBbhG9vlIrCL/Bp7huV5HKM9K/vIUrc/T74o5qoLi6uhuRSR2pFyFZ6efiQwCwi
         va1JBWt0S7JP/p5M6u3ljwXZGJzSTy6TJfnaQ=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Mulyadi Santosa <mulyadi.santosa@gmail.com>, Balachandar <bala1486@gmail.com>, kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

On Thu, Jul 29, 2010 at 2:10 PM, Jim Cromie <jim.cromie@gmail.com> wrote:
> On Wed, Jul 28, 2010 at 10:51 PM, Mulyadi Santosa
> <mulyadi.santosa@gmail.com> wrote:
>> Hi...
>>
>> On Thu, Jul 29, 2010 at 00:28, Balachandar <bala1486@gmail.com> wrote:
>>> Thank you for your help. I figured out the mistake. I missed a
>>> semicolon in one of the header file that was included in the file that
>>> showed the error.
>>
>> I think it would be great if you and some guys here write about
>> "mistakes I ever did when I write kernel codes" in kernelnewbies
>> wiki....so that others might learn about it.
>>
>> Just 2 cents suggestion...
>>
>> --
>> regards,
>>
>> Mulyadi Santosa
>> Freelance Linux trainer and consultant
>
>
> Hi Mulyadi,
>
> Youre a regular here, and would have some "authority" on making recommendations.
>
> The trouble I have with "edit the wiki" suggestions is that people
> get intimidated by questions of "where to put stuff ?".
>
> I just looked at HelpforBeginners
> http://kernelnewbies.org/HelpForBeginners
>
> and encountered this:
> You are encouraged to edit the WikiSandBox whichever way you like.
> Please restrain yourself from editing other pages until you feel at
> home with the ways a wiki works.
>
> The unintended message I got from this is "dont touch the other stuff",
> which doesnt set the bar low enough to encourage contributions -
> it implies that "judges" might not like your content or its placement.

I don't know the details, but the openSUSE wiki just got a full
re-implementation.  In the new version all edits go into a draft that
the author can see when logged in, but not others that are not logged
in.

Then members of the "wiki-team" come along and accept the edits into
the wiki for full publication.  The goal is not to avoid spambots.  It
is to ensure content ends up in the right place and that it is
properly formatted, etc.

They just launched it on July 12, so there is not much experience with it yet.

Possibly the wiki powers that be could join the opensuse-wiki
mailinglist and track its success and maybe even ask for help to
implement something similar on kernelnewbies.

fyi: It's not a very high-volume list, so it shouldn't be too hard to lurk.

http://lists.opensuse.org/opensuse-wiki/2010-07/date.html

Greg
