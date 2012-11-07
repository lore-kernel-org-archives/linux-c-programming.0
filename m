From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: How does atomic operation work on smp
Date: Wed, 7 Nov 2012 18:26:24 +0200
Message-ID: <CADtGFvkoVX-CCEPRE7swRFiTeBo2wFiQx_8S5woKp_ts8XsUUA@mail.gmail.com>
References: <20121108070121.GA7492@gmail.com>
Mime-Version: 1.0
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=5guGbuAcILwAa+RXbZ29FOVJnjlcP8jHHMEIm9a4Tj0=;
        b=VtRKZaOa9XltlpSAJ+mDlTNQx3uafftifj97elDsTJvWihPPTQON8lX1AE6GdsVMpY
         IFl+O/alx+E4AppWd62axroqhwkCsAb+yVMauadBHisxi2Z/XNda5AwodptOrtzN+qvW
         R5OQh3MyyZAD0oZ3PI4P/baGJUbA3FAtQta4c1q2Rjv01t67vV72E7v/NvncYDSxsXfB
         V0ElRVJnk1RZ+oyNuP5vKCCIa5L1bzV0cVptv55UKG/CjSp+E4mxzVaIZoONB4Ayj9XJ
         euGdopNwRkg5o8Mlbq0OkhEsQbt72sDENl0oy/DG/N3lrkKjUoyFeHsxcm9mC/rb8sJp
         eCeQ==
In-Reply-To: <20121108070121.GA7492@gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jimmy Pan <dspjmt@gmail.com>
Cc: linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org

On Thu, Nov 8, 2012 at 9:01 AM, Jimmy Pan <dspjmt@gmail.com> wrote:
> I understand how atomic operation work on unary core processors, I think it just disables the interrupt and dominate the cpu until it finished.
> While, how do we implement this on multi processor computers?
> Suppose cpu A is performing an atomic operation on variable a. At the same time, cpu B is also performing the operation on a. In such the result may be overwritten.
> Of course we can use spinlocks, but on the atomic operation's behalf, how does it gurantee to prevent such case?
> Can anyone explain the crux of it? Thanks.

Basically you make use of machine specific instructions that will  do
that for you.
In other words, get the datasheets of the specific system you intent
to code on/for (I assume here you are refering to assembler level
codes, as higher up you make use of the relevant libraries that does
that for you).

However, if you refer to the general case: You make use of critical
areas bounded by the necessary lock(s), like semaphores, mutex locks,
doors, message queues etc. that is described in details in several
text books on the subject of concurrency/parallelism/distributed
computing/etc.
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
