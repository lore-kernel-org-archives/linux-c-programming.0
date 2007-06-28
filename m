From: "Ranjan Sinha" <rnjn.sinha@gmail.com>
Subject: Re: Confuse with big endian bitwise field
Date: Thu, 28 Jun 2007 20:55:00 +0530
Message-ID: <dcc12b140706280825k4ee188f8x651feeff549e1bf6@mail.gmail.com>
References: <1197ff4c0706260320t648dba53ga7e3eed745293e9a@mail.gmail.com>
	 <1183041556.14676.13.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=rwm0Sq4uFsh4St7M4zXeN/W+1D67YI3Ci8rVddNNA6r3ol/HH6lwIwoBJYzaWA9+H0s/AEFoGreLqF+4sn5Qr4Ddn3ZzWvsBmF9HbBZX0lYe+JQWqLrRrfzVgIHvK45HI5vZ4sIDWjasoIYvk8mwt6bBV697YJOb84kVXCqOj84=
In-Reply-To: <1183041556.14676.13.camel@laptopd505.fenrus.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arjan van de Ven <arjan@infradead.org>
Cc: Li YanBo <dreamfly281@gmail.com>, linux-c-programming@vger.kernel.org, kernelnewbies@nl.linux.org

Thanks for this discussion, since this really gets confusing at times.
> >
> > struct xxx {
> >         __be32 pdu_cnt:6;
> >         __be32 y:3;
> >         __be32 wep_key:2;
> >         __be32 uses_wep_key:1;
> >         __be32 keep_alive:1;
> >         __be32 buff_tail_addr:19;
> >
> >         __be32 cts_11g:1;
> >         __be32 rts_11g:1;
> >         __be32 x:2;
> >         __be32 frag_size:12;
> >         __be32 payload_len:12;
> >         __be32 frag_num:4;
> > }
>
> this isn't safe if you want to mimic hardware layout; the order of the
> bits in the struct is different for little endian and big endian
> machines...
>
What is the best way in such scenario? Should we then use an unsigned
char array and then keep separate mappings of each bit for little and
big endian machines ?
