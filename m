From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Question about core files
Date: Sat, 10 Oct 2009 16:56:17 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0910101642350.11023@praktifix.dwd.de>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de>
 <ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com>
 <Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de>
 <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com>
 <Pine.LNX.4.64.0910071416310.29237@diagnostix.dwd.de>
 <ea11fea30910071036g154fcd81o1dde7e22cb070729@mail.gmail.com>
 <Pine.LNX.4.64.0910091158400.12677@diagnostix.dwd.de>
 <ea11fea30910090515p5c21b577i96078f78b253f6f8@mail.gmail.com>
 <Pine.LNX.4.64.0910091238000.12677@diagnostix.dwd.de>
 <19152.18236.807486.755513@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <19152.18236.807486.755513@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Manish Katiyar <mkatiyar@gmail.com>, linux-c-programming@vger.kernel.org

On Sat, 10 Oct 2009, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
>> How can I find which register is fsa_pos?
>
> fsa_pos is a parameter, and doesn't appear to be changed within the
> function, so I would expect "print fsa_pos" to give the correct value.
>
Unfortunately not:

    (gdb)
    #4  0x0000000000404b5f in start_process ()
    (gdb) print fsa_pos
    No symbol "fsa_pos" in current context.

> AFAICT, the following portion of the disassembly:
>
>    0x0000000000404b49 <start_process+121>: movslq 0x24(%rsp),%rax
>    0x0000000000404b4e <start_process+126>: imul   $0x8f8,%rax,%r14
>    0x0000000000404b55 <start_process+133>: mov    %r14,%rax
>    0x0000000000404b58 <start_process+136>: add    0x225441(%rip),%rax        # 0x629fa0 <fsa>
>    0x0000000000404b5f <start_process+143>: mov    0xec(%rax),%edx
>    0x0000000000404b65 <start_process+149>: test   $0x1,%dl
>
> corresponds to the expression
>
> 	fsa[fsa_pos].host_status & DO_NOT_DELETE_DATA
>
> 0x24(%rsp) is fsa_pos, $0x8f8 (2296) is the size of each element of
> fsa[], 0x225441(%rip) is fsa, 0xec is the offset of the host_status
> field.
>
> So:
>
>    movslq 0x24(%rsp),%rax	# %rax = fsa_pos
>    imul   $0x8f8,%rax,%r14	# %r14 = fsa_pos * sizeof(fsa[i]) = &fsa[fsa_pos] - &fsa[0]
>    mov    %r14,%rax		# %rax = &fsa[fsa_pos] - &fsa[0]
>    add    0x225441(%rip),%rax	# %rax = &fsa[fsa_pos]
>    mov    0xec(%rax),%edx      # %edx = fsa[fsa_pos].host_status
>
> Based upon this, %r14 should contain fsa_pos * 2296, so:
>
>>     (gdb) info registers
>>     r14            0xfffffffffffff708       -2296
>
> Which suggests that fsa_pos is -1.
>
Many thanks for this very detailed explanation and confirming that
fsa_pos was indeed -1. I would never have thought that one could find
so much information of a core from an optimized binary without debug
information.

Thanks to you and Manish Katiyar for this valuable help!

Regards,
Holger
