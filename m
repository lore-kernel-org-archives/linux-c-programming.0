From: Gedare Bloom <gedare@rtems.org>
Subject: Re: c inline assembly
Date: Sun, 19 Feb 2012 11:46:46 -0500
Message-ID: <CAC82fA3Anm7LRzq8z0HoAeEvy_ck=U9rc49WDddBZHR9f==0XA@mail.gmail.com>
References: <CAGZFCEEaJ7ZsNAmWCF-nDtsjs70U7fqEVvTXEaCt9Tmk1dcemQ@mail.gmail.com>
	<CAGZFCEH_NWJQid+DgOGrDp0nAS6odH2fLamT1k-vWP1ceAiMzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAGZFCEH_NWJQid+DgOGrDp0nAS6odH2fLamT1k-vWP1ceAiMzQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org, gcc-help@gcc.gnu.org

On Sat, Feb 18, 2012 at 1:01 AM, ratheesh kannoth
<ratheesh.ksz@gmail.com> wrote:
> I am using gcc on a 32bit=A0 intel machine.=A0 i have defined an inli=
ne function.
>
>
> This function is inline .=A0 what all registers needs to pushed and
> poped in the inline assembly so that the functions wont
> disturb the registers in=A0 the function ( in which it is C inlined=A0=
 ).
>
Use the clobber list:
http://ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html#ss5.3

>
> inline unsigned long hello(unsigned long a)
>
> {
> =A0int b;
> =A0asm ("movl %1, %%eax;
> =A0 =A0 =A0" movl %1, %%ebx;
> =A0 =A0 =A0 "movl =A0%1, %%ecx;
> =A0 =A0 =A0 "movl =A0%1, %%esi;
> =A0 =A0 =A0 "movl =A0%1, %%edi;
>
> =A0 =A0 =A0 "movl %%eax, %0;"
> =A0 =A0 =A0 :"=3Dr"(b) =A0 =A0 =A0 =A0/* output */
> =A0 =A0 =A0 :"r"(a) =A0 =A0 =A0 =A0 /* input */
         : "eax","ecx","esi","edi" /* clobber */
> =A0);
> }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
