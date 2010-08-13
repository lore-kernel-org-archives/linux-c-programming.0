From: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: strcut casts unsigned long
Date: Fri, 13 Aug 2010 17:49:14 -0400
Message-ID: <AANLkTinGyk2y94XDtDL7cdnPZkwMWaT2MrkBWrtEQmxU@mail.gmail.com>
References: <AANLkTikAiKKtzMcpt14W3veeiOe1JV57RyfG3L1L=OPh@mail.gmail.com> <929805.17464.qm@web57903.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=EWrUbsxP9/2AN1kBscX1xdO74da3mXs10eK6SPmHywo=;
        b=S7IHZw2j9v0Q9HG7ejsvwjNkWcfNPY4jZV7V49UHOXXtbUs+1uPIcZ2JnWQM43UXe4
         c8eBtBAdF+JM6ng4BP7+3z69Cx8En6RGPm/Pi1lrNGj8N5OFi7XZRLgRaQougavS997E
         oRZHsmGpVflNhhnTE8p2POfTNSnPUKRHJuVnI=
In-Reply-To: <929805.17464.qm@web57903.mail.re3.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-c-programming@vger.kernel.org

>
> But does skb->_skb_dst allocate memory any where? It is unsigned long=
=2E This is hard part for me to understand. Any explain why unsigned lo=
ng
> _skb_dst can be that?
>

skb->_skb_dst is a pointer. A pointer is nothing else that a variable
that stores a memory value (i.e: 0x0012ff5C). This value represent a
memory address. Usually pointers are defined as * type, so the
compiler can make type checking when analizing language expressions.
But you could represent as a generic void * pointer. In the kernel,
memoryaddresses are usually represented as variables of types unsigned
long.

To make an analogy, char and int variables are integers, but you
usually use char variables to represent ASCII codes. You can cast a
char to an int, even when int is  meant to represent integers. The
same way you could store a memory address either in a void * or
unsigned long variable.

I don't know why it is use unsigned long, but I guess that the GNU C
standard says that unsigned long it is the same size that the cpu word
size in all architechtures.

Best regards,

-----------------------------------------
Javier Mart=C3=ADnez Canillas
+595 981 88 66 58
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
