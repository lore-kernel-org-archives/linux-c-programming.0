From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 15:01:18 +0200
Message-ID: <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>
References: <471B5276.9010800@gmail.com>
	 <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
	 <471C4849.2040409@purplelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Z8u9w0Fn14ZazYNhzDW60CAjYlohVdrmAnr8tpdqTr0=;
        b=Ha24Zc7EZEScI+ITff6TDwy5uooZ/INScnyenP82kAKvJh/bBB2fX/tgrMp4g5PSy7Ry8719AuUNZ+QUTeoEDxlfEBFbU2tJeVPJvBg8Ii/w0my6eXEc+Dmgr22mclAkdn+L7p8BHHGmHc65S8U9FYvCUGb6LgJQwijvAyAofd0=
In-Reply-To: <471C4849.2040409@purplelabs.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Benoit Fouet <benoit.fouet@purplelabs.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hi Benoit,

On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
> Hi,
>
> Steve Graegert wrote:
> > As a side note: you can safely use dlopen()  to load shared librari=
es,
> > whether or not they depend on libpthread.so, as long as the main
> > program was initially threaded.  The other way round is dangerous a=
nd
> > mostly not allowed.
> >
> >
>
> could you please elaborate a bit on that ? i cannot see why this is
> dangerous.

I was referring to making an application multithreaded at runtime.
Therefore you cannot use dlopen() to dynamically add libpthread.so to
a process when the main program is not __initially threaded__.  By
"initially threaded" I mean that the libpthread.so  library is
initialized at program start, either because the main program links
against libpthread.so directly, or because it links against some other
shared library that links against libpthread.so.

Dynamically changing the process environment from "nonthreaded" to
"threaded" is dangerous and rarely useful (I actually doubt that this
"feature" is useful at all).  Only a few systems implementing POSIX
threads allow the possibility (for example, libc.so on many systems
contains "stub" versions of the POSIX functions that are preempted by
linking with libpthread.so but will not be preempted by later loading
libpthread.so with dlopen()).  In other words, calls to
pthread_create() might fail with ENOSYS, and pthread_mutex_lock()
might continue to succeed without any memory references to the lock.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
