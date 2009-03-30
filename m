From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: Is it possible to use the FreeBSD libthr.a library file on a Redhat Linux box?
Date: Mon, 30 Mar 2009 22:59:20 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F213527D@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org, linux-apps@vger.kernel.org, linux-c-programming@vger.kernel.org

Dear All,

I have written an application where I have used the libpthread library
for creating the pthreads. However, to get the maximum optimization, I
want to use the libthr.a library instead of libpthread library. However,
when I tried to use on my Redhat box, I end up with following errors.

../lib/linux/libthr.a(thr_sem.o): In function `_sem_init':
thr_sem.c:(.text+0x100): undefined reference to `ksem_init'
thr_sem.c:(.text+0x115): undefined reference to `ksem_destroy'
../lib/linux/libthr.a(thr_sem.o): In function `_sem_destroy':
thr_sem.c:(.text+0x216): undefined reference to `ksem_destroy'
../lib/linux/libthr.a(thr_sem.o): In function `_sem_timedwait':
thr_sem.c:(.text+0x2ad): undefined reference to `ksem_timedwait'
../lib/linux/libthr.a(thr_sem.o): In function `_sem_wait':
....
....
....

collect2: ld returned 1 exit status
make: *** [target] Error 1

I understand that the "ksem_init" is not available on the Redhat box.
Then, I have tried to use the libc.so.7 from FreeBSD. I have included
the libc.so.7 in my application to getridof the above undefined
references. Even though, I end up with the following errors.

/usr/bin/ld: errno@@FBSD_1.0: TLS definition in /lib/libc.so.6 section 
.tbss mismatches non-TLS definition in ../lib/linux/libc.so section 
.bss
/lib/libc.so.6: could not read symbols: Bad value

Here, the lib/libc.so.6 is a Redhat libc library where as 
../lib/linux/libc.so is a FreeBSD library (libc.so.7). 

Is it possible to use the FreeBSD libthr.a library file on a Redhat
Linux box? 

Please let me know the whether it is possible to use the libthr.a
library on Redhat box or not.

Thanks in advance.

With Regards,
Srinivas G
