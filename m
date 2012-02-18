From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: c inline assembly
Date: Sat, 18 Feb 2012 11:31:12 +0530
Message-ID: <CAGZFCEH_NWJQid+DgOGrDp0nAS6odH2fLamT1k-vWP1ceAiMzQ@mail.gmail.com>
References: <CAGZFCEEaJ7ZsNAmWCF-nDtsjs70U7fqEVvTXEaCt9Tmk1dcemQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=+O4sZIiaxFl2fJDMcwNpAeC6k2c+yS6fDC2TKo39D1o=;
        b=T3CiTFDZ+mfGHDuHyvj0hyokPGEOthyiWN/2EGUqoFRVP2zDAdk4N2Pd+yDnGUcaAM
         e9aAj4lo89KYkFrAT1pvSzxs7JvuuleMb/SiCmMqT5bG04FmbambKvD4cKIrYOm9ZUsm
         dsIuZrk4c6SYYeiu3ciUUyo22wcNSa4nkv6kU=
In-Reply-To: <CAGZFCEEaJ7ZsNAmWCF-nDtsjs70U7fqEVvTXEaCt9Tmk1dcemQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org, gcc-help@gcc.gnu.org

I am using gcc on a 32bit=A0 intel machine.=A0 i have defined an inline=
 function.


This function is inline .=A0 what all registers needs to pushed and
poped in the inline assembly so that the functions wont
disturb the registers in=A0 the function ( in which it is C inlined=A0 =
).


inline unsigned long hello(unsigned long a)

{
 int b;
 asm ("movl %1, %%eax;
      " movl %1, %%ebx;
       "movl  %1, %%ecx;
       "movl  %1, %%esi;
       "movl  %1, %%edi;

     =A0 "movl %%eax, %0;"
       :"=3Dr"(b)        /* output */
       :"r"(a)         /* input */
 );
}
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
