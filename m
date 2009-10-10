From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: Question about core files
Date: Sat, 10 Oct 2009 14:38:00 +0530
Message-ID: <ea11fea30910100208g1f4b7713k29742d94f7540f46@mail.gmail.com>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de> 
	<ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com> 
	<Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de> <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com> 
	<Pine.LNX.4.64.0910071416310.29237@diagnostix.dwd.de> <ea11fea30910071036g154fcd81o1dde7e22cb070729@mail.gmail.com> 
	<Pine.LNX.4.64.0910091158400.12677@diagnostix.dwd.de> <ea11fea30910090515p5c21b577i96078f78b253f6f8@mail.gmail.com> 
	<Pine.LNX.4.64.0910091238000.12677@diagnostix.dwd.de> <19152.18236.807486.755513@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=c5n8zksJn1toeNthluUP8CdelbaKJmGaIWi8v975ISA=;
        b=sk/bIFwhTnHeFPxfOvBZdJSEZ5nwNJb+5lyUy/Yukq9FmdjEtsXQ6rAIU7mWrqvpjw
         T4ZNTFSrgkg1V02Xm9apTkTf8Adw4cesJj434uuRNCtDPyMyt7mqVOMz8ckyokS/NQ3X
         EwC0QAt+eWRHPFDeL9M1rbhxVsJz493adQPg8=
In-Reply-To: <19152.18236.807486.755513@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Holger Kiehl <Holger.Kiehl@dwd.de>, linux-c-programming@vger.kernel.org

On Sat, Oct 10, 2009 at 2:05 PM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> Holger Kiehl wrote:
>
>> How can I find which register is fsa_pos?
>
> fsa_pos is a parameter, and doesn't appear to be changed within the
> function, so I would expect "print fsa_pos" to give the correct value=
=2E
>
> AFAICT, the following portion of the disassembly:
>
> =A0 =A00x0000000000404b49 <start_process+121>: movslq 0x24(%rsp),%rax
> =A0 =A00x0000000000404b4e <start_process+126>: imul =A0 $0x8f8,%rax,%=
r14
> =A0 =A00x0000000000404b55 <start_process+133>: mov =A0 =A0%r14,%rax
> =A0 =A00x0000000000404b58 <start_process+136>: add =A0 =A00x225441(%r=
ip),%rax =A0 =A0 =A0 =A0# 0x629fa0 <fsa>
> =A0 =A00x0000000000404b5f <start_process+143>: mov =A0 =A00xec(%rax),=
%edx
> =A0 =A00x0000000000404b65 <start_process+149>: test =A0 $0x1,%dl
>
> corresponds to the expression
>
> =A0 =A0 =A0 =A0fsa[fsa_pos].host_status & DO_NOT_DELETE_DATA
>
> 0x24(%rsp) is fsa_pos, $0x8f8 (2296) is the size of each element of
> fsa[], 0x225441(%rip) is fsa, 0xec is the offset of the host_status
> field.
>
> So:
>
> =A0 =A0movslq 0x24(%rsp),%rax =A0 =A0 =A0# %rax =3D fsa_pos
> =A0 =A0imul =A0 $0x8f8,%rax,%r14 =A0 =A0 # %r14 =3D fsa_pos * sizeof(=
fsa[i]) =3D &fsa[fsa_pos] - &fsa[0]
> =A0 =A0mov =A0 =A0%r14,%rax =A0 =A0 =A0 =A0 =A0 =A0# %rax =3D &fsa[fs=
a_pos] - &fsa[0]
> =A0 =A0add =A0 =A00x225441(%rip),%rax =A0# %rax =3D &fsa[fsa_pos]
> =A0 =A0mov =A0 =A00xec(%rax),%edx =A0 =A0 =A0# %edx =3D fsa[fsa_pos].=
host_status
>
> Based upon this, %r14 should contain fsa_pos * 2296, so:
>
>> =A0 =A0 (gdb) info registers
>> =A0 =A0 r14 =A0 =A0 =A0 =A0 =A0 =A00xfffffffffffff708 =A0 =A0 =A0 -2=
296
>
> Which suggests that fsa_pos is -1.

Excellent Glynn .... thanks :-) . I was having trouble deciphering it .

>
> --
> Glynn Clements <glynn@gclements.plus.com>
>



--=20
Thanks -
Manish
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[$\*.^ -- I miss being one of them
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
