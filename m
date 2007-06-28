From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Confuse with big endian bitwise field
Date: Thu, 28 Jun 2007 07:39:15 -0700
Message-ID: <1183041556.14676.13.camel@laptopd505.fenrus.org>
References: <1197ff4c0706260320t648dba53ga7e3eed745293e9a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1197ff4c0706260320t648dba53ga7e3eed745293e9a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Li YanBo <dreamfly281@gmail.com>
Cc: linux-c-programming@vger.kernel.org, kernelnewbies@nl.linux.org

On Tue, 2007-06-26 at 18:20 +0800, Li YanBo wrote:
> hi all,
> 
> I am try  to define a hardware specific struct, it is like below:
> 
> struct xxx {
>         __be32 pdu_cnt:6;
>         __be32 y:3;
>         __be32 wep_key:2;
>         __be32 uses_wep_key:1;
>         __be32 keep_alive:1;
>         __be32 buff_tail_addr:19;
> 
>         __be32 cts_11g:1;
>         __be32 rts_11g:1;
>         __be32 x:2;
>         __be32 frag_size:12;
>         __be32 payload_len:12;
>         __be32 frag_num:4;
> }

this isn't safe if you want to mimic hardware layout; the order of the
bits in the struct is different for little endian and big endian
machines...

-- 
if you want to mail me at work (you don't), use arjan (at) linux.intel.com
Test the interaction between Linux and your BIOS via http://www.linuxfirmwarekit.org

