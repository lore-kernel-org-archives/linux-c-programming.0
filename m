From: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: Error in compiling a module
Date: Thu, 29 Jul 2010 12:10:23 -0600
Message-ID: <AANLkTinRJQM+Yky_ORVnf3i7Aq2CiUTvchQDxiR4D636@mail.gmail.com>
References: <AANLkTikcGVVaofeUZtvPs+jpA11uXs-baTZ8O8NvH94i@mail.gmail.com>
	<AANLkTikqZ5YWqgnHbB3Y03kZfC0OpJ7POYKSeU6JESVt@mail.gmail.com>
	<AANLkTimkzbse8B0_kUMbaP-DT8Zm1CnZxOnCA+S5CHnE@mail.gmail.com>
	<AANLkTimeJrRs4Bd1aw--FKPYyqcuu8_O-Xi5G0FOh0yd@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=jpLM9JdXnWWwQs0hQdvFDJhfUOrm0SNVcrjNvCq5MmE=;
        b=bE8xGELSNSvQsGyHms4slMQOkWwx1Aw4got2CEzzfnt581KhtKocDXutGXJjbQxJ9P
         0yAH+X3t+GepKp3dPh0b3hMBGDwtzPz4K45GPZk26ArDQwfGeAgkuuX8KcH2hv+DSIg6
         aM+xkU8tajMajGEMeHCsQz7PifU+lvZxR5pew=
In-Reply-To: <AANLkTimeJrRs4Bd1aw--FKPYyqcuu8_O-Xi5G0FOh0yd@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mulyadi Santosa <mulyadi.santosa@gmail.com>
Cc: Balachandar <bala1486@gmail.com>, kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

On Wed, Jul 28, 2010 at 10:51 PM, Mulyadi Santosa
<mulyadi.santosa@gmail.com> wrote:
> Hi...
>
> On Thu, Jul 29, 2010 at 00:28, Balachandar <bala1486@gmail.com> wrote:
>> Thank you for your help. I figured out the mistake. I missed a
>> semicolon in one of the header file that was included in the file that
>> showed the error.
>
> I think it would be great if you and some guys here write about
> "mistakes I ever did when I write kernel codes" in kernelnewbies
> wiki....so that others might learn about it.
>
> Just 2 cents suggestion...
>
> --
> regards,
>
> Mulyadi Santosa
> Freelance Linux trainer and consultant


Hi Mulyadi,

Youre a regular here, and would have some "authority" on making recommendations.

The trouble I have with "edit the wiki" suggestions is that people
get intimidated by questions of "where to put stuff ?".

I just looked at HelpforBeginners
http://kernelnewbies.org/HelpForBeginners

and encountered this:
You are encouraged to edit the WikiSandBox whichever way you like.
Please restrain yourself from editing other pages until you feel at
home with the ways a wiki works.

The unintended message I got from this is "dont touch the other stuff",
which doesnt set the bar low enough to encourage contributions -
it implies that "judges" might not like your content or its placement.

my $.02 - perhaps we need a CatchAll bucket for content that could be useful,
but contributor doesnt know where to put it.  Organization could come
afterwards.
You cant sort a deck of cards until youve got the cards, and once you
do, its trivial
to determine that the 10-of-Spades is missing.

The bit Id add, in response to the now solved problem, would be:

Try making the *.i file to trace down whats missing (or not missing)

make -C /home/jimc/lx/linux-2.6.git O=/home/jimc/lx/sk/. drivers/hwmon/pc87360.i
  Using /home/jimc/lx/linux-2.6.git as source for kernel
  ....
  CPP [M] drivers/hwmon/pc87360.i

wrt Victor's post, my impression was that the real error was not spaces/tabs
but lack of linkage to the src tree...

$> make O=../<mybuilddir> defconfig
will write a new Makefile into the build dir, so you can make further
from there,
ie copy in an old .config, then make oldconfig to update it per latest source.

[jimc@harpo sk]$ make
make -C /home/jimc/lx/linux-2.6.git O=/home/jimc/lx/sk/.
  Using /home/jimc/lx/linux-2.6.git as source for kernel
  GEN     /home/jimc/lx/sk/Makefile
  CHK     include/linux/version.h

His hint is useful and valuable in the right place, but I dont know
where that is
at this point, and I suspect many potential contributors would appreciate
more specific guidance, or a default place that can be organized once it
gets some content.

thanks
