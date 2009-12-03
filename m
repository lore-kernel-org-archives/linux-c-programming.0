From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Dynamic make target
Date: Thu, 3 Dec 2009 05:30:59 +0000
Message-ID: <19223.19731.226635.428929@cerise.gclements.plus.com>
References: <ffb2c0280912020949i3db06e02i118df36e13aaaf41@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <ffb2c0280912020949i3db06e02i118df36e13aaaf41@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toan Pham <tpham3783@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Toan Pham wrote:

> I do not know where to ask this question perhaps this mailing list is
> best because it had to do with c complilation.
> 
> I would like to set up a make target dynamicly.  for example
> 
> when one issue command:  make sda1
> it auto compile and install to a mount point @ /mnt/sda1
> 
> similiarly: make sda2 would compile and install to /mnt/sda2
> 
> 
> i know that in a makefile one can accomplish this by setting up two targets, ie.
> 
> sda1:
>        make all
>        mount /dev/sda1 /mnt/sda1
>        cp releases/* /mnt/sda1
>        umount /mnt/sda1
> 
> sda2:
>        make all
>        mount /dev/sda1 /mnt/sda2
>        cp releases/* /mnt/sda2
>        umount /mnt/sda2
> 
> 
> i am curious if we can simplify everything by having a make target
> like this when no matches found
> 
> $param1:
>        make all
>        mount /dev/sda1 /mnt/$param1
>        cp releases/* /mnt/$param1
>        umount /mnt/$param1

You could use a pattern rule, e.g.:

	sda%:
	       make all
	       mount /dev/$@ /mnt/$@
	       cp releases/* /mnt/$@
	       umount /mnt/$@

But that's really abusing make; it's better to use variables for this,
e.g.:

	DISC = sda1

	install:
	       make all
	       mount /dev/$(DISC) /mnt/$(DISC)
	       cp releases/* /mnt/$(DISC)
	       umount /mnt/$(DISC)

and use e.g.:

	make install DISC=sda1

Beyond that:

1. Don't use "make" in commands; use $(MAKE) instead. This will work
if your make program is actually called e.g. gmake, make-3.81, etc. 
Also, if you use "make -n", $(MAKE) will perform a recursive "make -n"
rather than just printing the "make" command.

1a. But only invoke $(MAKE) explicitly if you need to force a
particular sequence. It's usually preferable to list the target as a
prerequisite, e.g.:

	install: all

rather than:

	install:
		$(MAKE) all

2. Use $(INSTALL) rather than "cp". "install" will replace files
atomically, while "cp" overwrites the destination in-place. This fails
if the destination is an executable which is in-use, and can cause
problems due to parallel builds attempting to proceed with an
incomplete source file.

3. "phony" targets shouldn't be over-used. Their behaviour can be
non-intuitive with respect to parallel builds, and executing commands
unconditionally becomes a nuisance once a project gets large.

-- 
Glynn Clements <glynn@gclements.plus.com>
