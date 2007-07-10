From: "Li YanBo" <dreamfly281@gmail.com>
Subject: Re: Confuse with big endian bitwise field
Date: Tue, 10 Jul 2007 11:58:30 +0800
Message-ID: <1197ff4c0707092058y47efa3d7i3801f99c0b9ebd53@mail.gmail.com>
References: <1197ff4c0706260320t648dba53ga7e3eed745293e9a@mail.gmail.com>
	 <1183041556.14676.13.camel@laptopd505.fenrus.org>
	 <dcc12b140706280825k4ee188f8x651feeff549e1bf6@mail.gmail.com>
	 <1197ff4c0707022112hf42ba45y6fcb88a5d877a62c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=SzvmV2bA4yxNz3EoFokdzocXHDL8SCX/VYqE8V133/JBa/osfw0QZqMlkVf8/8+dESy83OH9jO/CQEGNIP4z9a9O+uDARGezo8nd7CiOIkIjbYb5XVkN4pI4l8FRCt0OnpvdQk4jnw4w7JrXWKlJ+oVpsz90jxg/3QxOdv2xjfc=
In-Reply-To: <1197ff4c0707022112hf42ba45y6fcb88a5d877a62c@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ranjan Sinha <rnjn.sinha@gmail.com>
Cc: Arjan van de Ven <arjan@infradead.org>, linux-c-programming@vger.kernel.org, kernelnewbies@nl.linux.org

On 7/3/07, Li YanBo <dreamfly281@gmail.com> wrote:
> On 6/28/07, Ranjan Sinha <rnjn.sinha@gmail.com> wrote:
> > Thanks for this discussion, since this really gets confusing at times.
> > > >
> > > > struct xxx {
> > > >         __be32 pdu_cnt:6;
> > > >         __be32 y:3;
> > > >         __be32 wep_key:2;
> > > >         __be32 uses_wep_key:1;
> > > >         __be32 keep_alive:1;
> > > >         __be32 buff_tail_addr:19;
> > > >
> > > >         __be32 cts_11g:1;
> > > >         __be32 rts_11g:1;
> > > >         __be32 x:2;situation
> > > >         __be32 frag_size:12;
> > > >         __be32 payload_len:12;
> > > >         __be32 frag_num:4;
> > > > }
> > >
> > > this isn't safe if you want to mimic hardware layout; the order of the
> > > bits in the struct is different for little endian and big endian
> > > machines...
> > >
> > What is the best way in such scenario? Should we then use an unsigned
> > char array and then keep separate mappings of each bit for little and
> > big endian machines ?
> >
>
> I am sorry I still can't figure out how to use bits shift and make it
> can be portability to any Be or Le endian machine. what I can tell you
> is if the bits fields was define for Be, and if the host is Le, so you
> just need reverse the order of bits field and it will work well. For
> example:
>
> That a specs define for Be:
> Descriptor(big endian)  size   offset
> RTS                            1        0
> multicast                     1        1
> x                                15       2
> y                                15       17
>
> If you want define it in Le host, we can define it like this
> struct desc {
>          y:15;
>          x:15;
>          muticast:1;
>          rts:1;
> } __attribute__ ((packed));
>
> That only my personal opinion, CMIIW. if anyone know better method,
> please share with us. thanks!
>

Define the bits field as follow can be portable to either  Le or Be host.
For the above sample, we can define it like that:

#define RTS         0x80000000
#define multicast  0x40000000
#define x              0x3FFF8000
#define y              0x00007FFF
I think that can make sure it can be portable in Be or Le host.

But there is another  situation confuse me, if the data are come from
net, ie the wireless 802.11 header, even we define the structure like
that, we also need to do cpu_to_le32 or le32_to_cpu() manual. I don't
know is it different for data that transport from CPU to IO device or
data that transport from CPU to net?

BR
lyb
