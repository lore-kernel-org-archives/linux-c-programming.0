From: "Li YanBo" <dreamfly281@gmail.com>
Subject: Re: Confuse with big endian bitwise field
Date: Tue, 3 Jul 2007 12:12:41 +0800
Message-ID: <1197ff4c0707022112hf42ba45y6fcb88a5d877a62c@mail.gmail.com>
References: <1197ff4c0706260320t648dba53ga7e3eed745293e9a@mail.gmail.com>
	 <1183041556.14676.13.camel@laptopd505.fenrus.org>
	 <dcc12b140706280825k4ee188f8x651feeff549e1bf6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=t2QDjb1YE6ueJVkkd57hZjG6QPmUIA1byown0w4Co3ohiWIHBtTxRR2KvnBCJy2GmLacPgjKqow9SMKyTOaQ5D1s696dAhRoytLO3kBJT+l2ShUY6oA9ZMP3s0OVJ5jbnpMhwH8wRqZmDhsSldhWEmDs/iQwMUHqXMV9r0Jd+gM=
In-Reply-To: <dcc12b140706280825k4ee188f8x651feeff549e1bf6@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ranjan Sinha <rnjn.sinha@gmail.com>
Cc: Arjan van de Ven <arjan@infradead.org>, linux-c-programming@vger.kernel.org, kernelnewbies@nl.linux.org

On 6/28/07, Ranjan Sinha <rnjn.sinha@gmail.com> wrote:
> Thanks for this discussion, since this really gets confusing at times.
> > >
> > > struct xxx {
> > >         __be32 pdu_cnt:6;
> > >         __be32 y:3;
> > >         __be32 wep_key:2;
> > >         __be32 uses_wep_key:1;
> > >         __be32 keep_alive:1;
> > >         __be32 buff_tail_addr:19;
> > >
> > >         __be32 cts_11g:1;
> > >         __be32 rts_11g:1;
> > >         __be32 x:2;
> > >         __be32 frag_size:12;
> > >         __be32 payload_len:12;
> > >         __be32 frag_num:4;
> > > }
> >
> > this isn't safe if you want to mimic hardware layout; the order of the
> > bits in the struct is different for little endian and big endian
> > machines...
> >
> What is the best way in such scenario? Should we then use an unsigned
> char array and then keep separate mappings of each bit for little and
> big endian machines ?
>

I am sorry I still can't figure out how to use bits shift and make it
can be portability to any Be or Le endian machine. what I can tell you
is if the bits fields was define for Be, and if the host is Le, so you
just need reverse the order of bits field and it will work well. For
example:

That a specs define for Be:
Descriptor(big endian)  size   offset
RTS                            1        0
multicast                     1        1
x                                15       2
y                                15       17

If you want define it in Le host, we can define it like this
struct desc {
         y:15;
         x:15;
         muticast:1;
         rts:1;
} __attribute__ ((packed));
	
That only my personal opinion, CMIIW. if anyone know better method,
please share with us. thanks!

BR

lyb
