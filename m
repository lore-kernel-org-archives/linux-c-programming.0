From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Dylibs
Date: Mon, 15 Aug 2005 14:05:55 +0200
Message-ID: <6a00c8d505081505057c579fbf@mail.gmail.com>
References: <20050815_111719_052668.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050815_111719_052668.r_zaca@ig.com.br>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: r_zaca <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

On 8/15/05, r_zaca <r_zaca@ig.com.br> wrote:
>  Hello,

[snipped some code]

The use of _init() and _fini() is strongly discouraged.  Both are
obsolete and their use can lead to some strange behaviour.  Some even
consider them as dangerous.

Instead, you should rely on function attribute constructors and destructors:

        void __attribute__ ((constructor)) my_init(void);
        void __attribute__ ((destructor)) my_fini(void);

Please note: when compiling shared libs with gcc, you _must_ omit the
arguments -nostartfiles or -nostdlib, otherwise the declared routines
will not be executed.

Regards

        \Steve


> 
> >Hi,
> >     While loading Dylibs i want to write my own __init,__fini
> >functions.Would you please tell me how to write those functions >please.
> >
> >Raja
> 
> 

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
