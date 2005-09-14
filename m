From: kaushal <kaushal@rocsys.com>
Subject: Re: Distinction
Date: Wed, 14 Sep 2005 11:24:08 +0530
Message-ID: <1126677249.3338.138.camel@kaushal>
References: <1126528922.3338.45.camel@kaushal>
	 <6a00c8d50509121205642d9ca7@mail.gmail.com>
	 <1126587270.3338.59.camel@kaushal>
	 <6a00c8d5050913105778c957b7@mail.gmail.com>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d5050913105778c957b7@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: graegerts@gmail.com
Cc: linux-c-programming@vger.kernel.org

hi Steve,
         Thanks for the help.After some more research I think the
following could be the link:
            core:The processor
            Architecture:The processor specific issiues
	    Platform:If a micro controller/Integrated processor is built on the
basis of a processor the 'platform' corresponds to the
microcontroller/IP specific details.
	    Variants:Different boards made up of the microcontrollers/IP and
interfacing various devices.

This was my observation.Please correct me if Iam wrong.

cheers
-kaushal.

On Tue, 2005-09-13 at 19:57 +0200, Steve Graegert wrote:
> On 9/13/05, kaushal <kaushal@rocsys.com> wrote:
> > hi steve,
> > 
> >       The details are little confusing.If I consider the case of x86
> > ARCHITECTURE,as an example,can I say:
> >     Architecture  X86
> >     Platform       ?
> >     Variants       PI,PII,PIII,Athlon,...
> >     core           ?
> 
> Kaushal,
> 
> I have chosen not to describe the differences between these terms,
> because it is hard to differentiate between "platform" and
> "architecture".  One could argue that AMD64 is an architecture while
> others would say it is a platform.  The same is true for x86.  One
> example I can think of is the Alpha architecture that allows a quite
> clear distinction:
> 
> I would put it the following way:
> 
> Architecture: Alpha
> Platforms: EV5, EV6, EV67, EV7
> Variants: 61164a/b (EV5), 62164a/b (EV6),  61364 (EV67)
> Cores: 21172 (61164) and 21272 (62164) Core Logic
> 
> I am not that deep into this Intel/IA/AMD stuff and cannot say
> something useful about it.
> 
> Regards
> 
> 	\Steve
> 
> --
> 
> Steve Graegert <graegerts@gmail.com>
> Software Consultancy {C/C++ && Java && .NET}
> Mobile: +49 (176)  21248869
> Office: +49 (9131) 7126409
> 
> > cheers-
> > kaushal.
> > On Mon, 2005-09-12 at 21:05 +0200, Steve Graegert wrote:
> > > On 9/12/05, kaushal <kaushal@rocsys.com> wrote:
> > > > hello list,
> > > >            Iam unable to find the exact differences between the terms:
> > > >     1.architecture
> > > >     2.Platform
> > >
> > > In case of hardware, the HAL itself provides a platform for
> > > applications to run on a given architecture.  The HAL
> > > specifies/describes/is the platform.
> > >
> > > >     3.Variant
> > >
> > > Variants are different types of hardware devices of the same family.
> > > For example, microcontroller and embedded devices of the same family
> > > are often of different variant with different, sometimes unique, bus
> > > or memory systems, addressing schemes and the like.  In these cases,
> > > software build for one variant often needs to be rebuild for the
> > > other.  Software running such often devices lack an abstraction layer
> > > that eases portability.  An example is Infineon's C166 microcontroller
> > > family with the variants C167CS (supporting flash) and ST10F269
> > > (supporting RAM) being almost completely incompatible to each other on
> > > the binary level.  Nevertheless, they are compatible on the hardware
> > > level and are based on the same fundamental design.
> > >
> > > >     4.Core
> > >
> > > AFAIK a core is the smallest piece of hardware (call it a component)
> > > that can be incorporated into a larger component by adding more value,
> > > either by additional hardware or extensible firmware.  Sometimes a
> > > core is nothing more than a couple of gates allowing external sensors
> > > being attached.  Others are quite complex and designed for special
> > > applications, such as DSPs, and are driven by special oscillators.
> > >
> > > Hope this helps a bit.
> > >
> > > Regards
> > >
> > >       \Steve
> > >
> > > --
> > >
> > > Steve Graegert <graegerts@gmail.com>
> > > Software Consultancy {C/C++ && Java && .NET}
> > > Mobile: +49 (176)  21248869
> > > Office: +49 (9131) 7126409
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

