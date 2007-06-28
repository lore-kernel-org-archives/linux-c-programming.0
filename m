From: "Li YanBo" <dreamfly281@gmail.com>
Subject: Re: Confuse with big endian bitwise field
Date: Thu, 28 Jun 2007 22:59:47 +0800
Message-ID: <1197ff4c0706280759h3eb57b90k87fd985172695a24@mail.gmail.com>
References: <1197ff4c0706260320t648dba53ga7e3eed745293e9a@mail.gmail.com>
	 <1183041556.14676.13.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=nqKqc6KBYtnz7YrFUsqyI17ltbQsbAqWZCIcNC9GveKlTV03b1Nn8tw1Wk135KFJETs1k5Okd+qpxNuDtEIEdfh3Ms/5QV4/q1iENDTIJM/eCAmmrOVKqe06IrjOs1pDJd1P/zq0s+oEELknYoekZOZtNLzIVVFPZg7YY0M3JJs=
In-Reply-To: <1183041556.14676.13.camel@laptopd505.fenrus.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arjan van de Ven <arjan@infradead.org>
Cc: linux-c-programming@vger.kernel.org, kernelnewbies@nl.linux.org

On 6/28/07, Arjan van de Ven <arjan@infradead.org> wrote:
> On Tue, 2007-06-26 at 18:20 +0800, Li YanBo wrote:
> > hi all,
> >
> > I am try  to define a hardware specific struct, it is like below:
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

Yes, I realize it now, and maybe shifting bits is a more portability solution.

> Kristof wrote:
>You'll need to use cpu_to_be32, to make sure the values you assign
arebig endian too. >You'll need to do this for every field larger than
8 bits (as endianness is not an issue if >there's only one byte).

I have done many tests and it seemed by using cpu_to_be32 to the field
larger than 8 bits is not a correct solution. it will generate wrong
data too. Anywhere the switch between Be to Le or from Le to Be is a
complex thing, because it is not just the order of bytes but also the
order of bits, I found a good article to describe this problem
"http://www.linuxjournal.com/article/6788"

Thank for all your suggestion.

BR

LiYanBo
