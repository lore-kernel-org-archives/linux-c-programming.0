From: Jon Mayo <jon.mayo@gmail.com>
Subject: Re: How does one get the description of an errno value
Date: Sun, 15 Mar 2009 18:23:56 -0700
Message-ID: <e694f9e00903151823w1cb3fa01we7079b113d00568a@mail.gmail.com>
References: <gpim9l$dia$1@ger.gmane.org>
	 <6a00c8d50903150420ke10afcfs7c78a11355c5957a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=GFJQGliZbsd8dOewl1ZS9CEeNc7yUHaMeVOLIFRU3Eg=;
        b=BrK1zL1y1ZijqudAzDMkOMOMwwkaF/5kIILBfNhlK1YHpXrVu8LY5Y9WHxF0rtwbup
         0pLEV0vyiVY2tqUwcR4yFl/KsqvXNBgYGF9xdsn7Tm9+Oe2sjAlGyz3TkdX/p8MMf7DD
         UbClONNWf2jncqiGpcWiITvClEsAcKgYDNGJ4=
In-Reply-To: <6a00c8d50903150420ke10afcfs7c78a11355c5957a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Sun, Mar 15, 2009 at 4:20 AM, Steve Graegert <graegerts@gmail.com> wrote:
> Angel,
>
> The following code snippet should do it.  It basically sets errno
> manually and outputs the associated error message.
>
> --- BEGIN ---
>
> #define _ALL_SOURCE
>
> #include <stdio.h>
> #include <errno.h> /* for _MAX_ERRNO */
>
> int main(void) {
>        int i;
>        extern int errno;
>
>        for (i = 0; i < MAX_ERRNO; i++) {
>                fprintf(stderr, "%3d", i);
>                errno = i;
>                perror(" ");
>        }
>
>        return (0);
> }
>
> --- END ---
>
>        \Steve
>
> --
>
> Steve Graegert
> www.graegert.com
>
>
>
> On Sun, Mar 15, 2009 at 11:46 AM, Angel Tsankov
> <fn42551@fmi.uni-sofia.bg> wrote:
>> Hello,
>>
>> Is there a function which returns the description of an errno value and, if
>> so, which is it?
>>
>> Regards,
>> Angel Tsankov
>>

A little fancier snippet that I wrote years ago to deal with programs
that only output an errno number and no description is this:

/* error.c : utility for looking up errno error numbers */
/* original version: 2006 June 27
 * 2006 June 29 -- version 1.04
 * contributors: Jon Mayo <jon.mayo@acm.org>
 * No copyright claimed -- Public Domain */

/* TODO: convert error strings into error numbers/names */

#include <assert.h>
#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define T(x) if(e==(x)) return #x

static const char **id_lookup_table;
static unsigned id_max;

static const char *err_id(int e) {
#ifdef EPERM
	T(EPERM);
#endif
#ifdef ENOENT
	T(ENOENT);
#endif
#ifdef ESRCH
	T(ESRCH);
#endif
#ifdef EINTR
	T(EINTR);
#endif
#ifdef EIO
	T(EIO);
#endif
#ifdef ENXIO
	T(ENXIO);
#endif
#ifdef E2BIG
	T(E2BIG);
#endif
#ifdef ENOEXEC
	T(ENOEXEC);
#endif
#ifdef EBADF
	T(EBADF);
#endif
#ifdef ECHILD
	T(ECHILD);
#endif
#ifdef EAGAIN
	T(EAGAIN);
#endif
#ifdef ENOMEM
	T(ENOMEM);
#endif
#ifdef EACCES
	T(EACCES);
#endif
#ifdef EFAULT
	T(EFAULT);
#endif
#ifdef ENOTBLK
	T(ENOTBLK);
#endif
#ifdef EBUSY
	T(EBUSY);
#endif
#ifdef EEXIST
	T(EEXIST);
#endif
#ifdef EXDEV
	T(EXDEV);
#endif
#ifdef ENODEV
	T(ENODEV);
#endif
#ifdef ENOTDIR
	T(ENOTDIR);
#endif
#ifdef EISDIR
	T(EISDIR);
#endif
#ifdef EINVAL
	T(EINVAL);
#endif
#ifdef ENFILE
	T(ENFILE);
#endif
#ifdef EMFILE
	T(EMFILE);
#endif
#ifdef ENOTTY
	T(ENOTTY);
#endif
#ifdef ETXTBSY
	T(ETXTBSY);
#endif
#ifdef EFBIG
	T(EFBIG);
#endif
#ifdef ENOSPC
	T(ENOSPC);
#endif
#ifdef ESPIPE
	T(ESPIPE);
#endif
#ifdef EROFS
	T(EROFS);
#endif
#ifdef EMLINK
	T(EMLINK);
#endif
#ifdef EPIPE
	T(EPIPE);
#endif
#ifdef EDOM
	T(EDOM);
#endif
#ifdef ERANGE
	T(ERANGE);
#endif
#ifdef EDEADLK
	T(EDEADLK);
#endif
#ifdef ENAMETOOLONG
	T(ENAMETOOLONG);
#endif
#ifdef ENOLCK
	T(ENOLCK);
#endif
#ifdef ENOSYS
	T(ENOSYS);
#endif
#ifdef ENOTEMPTY
	T(ENOTEMPTY);
#endif
#ifdef ELOOP
	T(ELOOP);
#endif
#ifdef EWOULDBLOCK
	T(EWOULDBLOCK);
#endif
#ifdef ENOMSG
	T(ENOMSG);
#endif
#ifdef EIDRM
	T(EIDRM);
#endif
#ifdef ECHRNG
	T(ECHRNG);
#endif
#ifdef EL2NSYNC
	T(EL2NSYNC);
#endif
#ifdef EL3HLT
	T(EL3HLT);
#endif
#ifdef EL3RST
	T(EL3RST);
#endif
#ifdef ELNRNG
	T(ELNRNG);
#endif
#ifdef EUNATCH
	T(EUNATCH);
#endif
#ifdef ENOCSI
	T(ENOCSI);
#endif
#ifdef EL2HLT
	T(EL2HLT);
#endif
#ifdef EBADE
	T(EBADE);
#endif
#ifdef EBADR
	T(EBADR);
#endif
#ifdef EXFULL
	T(EXFULL);
#endif
#ifdef ENOANO
	T(ENOANO);
#endif
#ifdef EBADRQC
	T(EBADRQC);
#endif
#ifdef EBADSLT
	T(EBADSLT);
#endif
#ifdef EDEADLOCK
	T(EDEADLOCK);
#endif
#ifdef EBFONT
	T(EBFONT);
#endif
#ifdef ENOSTR
	T(ENOSTR);
#endif
#ifdef ENODATA
	T(ENODATA);
#endif
#ifdef ETIME
	T(ETIME);
#endif
#ifdef ENOSR
	T(ENOSR);
#endif
#ifdef ENONET
	T(ENONET);
#endif
#ifdef ENOPKG
	T(ENOPKG);
#endif
#ifdef EREMOTE
	T(EREMOTE);
#endif
#ifdef ENOLINK
	T(ENOLINK);
#endif
#ifdef EADV
	T(EADV);
#endif
#ifdef ESRMNT
	T(ESRMNT);
#endif
#ifdef ECOMM
	T(ECOMM);
#endif
#ifdef EPROTO
	T(EPROTO);
#endif
#ifdef EMULTIHOP
	T(EMULTIHOP);
#endif
#ifdef EDOTDOT
	T(EDOTDOT);
#endif
#ifdef EBADMSG
	T(EBADMSG);
#endif
#ifdef EOVERFLOW
	T(EOVERFLOW);
#endif
#ifdef ENOTUNIQ
	T(ENOTUNIQ);
#endif
#ifdef EBADFD
	T(EBADFD);
#endif
#ifdef EREMCHG
	T(EREMCHG);
#endif
#ifdef ELIBACC
	T(ELIBACC);
#endif
#ifdef ELIBBAD
	T(ELIBBAD);
#endif
#ifdef ELIBSCN
	T(ELIBSCN);
#endif
#ifdef ELIBMAX
	T(ELIBMAX);
#endif
#ifdef ELIBEXEC
	T(ELIBEXEC);
#endif
#ifdef EILSEQ
	T(EILSEQ);
#endif
#ifdef ERESTART
	T(ERESTART);
#endif
#ifdef ESTRPIPE
	T(ESTRPIPE);
#endif
#ifdef EUSERS
	T(EUSERS);
#endif
#ifdef ENOTSOCK
	T(ENOTSOCK);
#endif
#ifdef ETOOMANYREF
	T(ETOOMANYREF);
#endif
#ifdef TADDRREQ
	T(TADDRREQ);
#endif
#ifdef EMSGSIZE
	T(EMSGSIZE);
#endif
#ifdef EPROTOTYPE
	T(EPROTOTYPE);
#endif
#ifdef ENOPROTOOPT
	T(ENOPROTOOPT);
#endif
#ifdef EPROTONOSUPPORT
	T(EPROTONOSUPPORT);
#endif
#ifdef ESOCKTNOSUPPORT
	T(ESOCKTNOSUPPORT);
#endif
#ifdef EOPNOTSUPP
	T(EOPNOTSUPP);
#endif
#ifdef EPFNOSUPPORT
	T(EPFNOSUPPORT);
#endif
#ifdef EAFNOSUPPORT
	T(EAFNOSUPPORT);
#endif
#ifdef EADDRINUSE
	T(EADDRINUSE);
#endif
#ifdef EADDRNOTAVAIL
	T(EADDRNOTAVAIL);
#endif
#ifdef ENETDOWN
	T(ENETDOWN);
#endif
#ifdef ENETUNREACH
	T(ENETUNREACH);
#endif
#ifdef ENETRESET
	T(ENETRESET);
#endif
#ifdef ECONNABORTED
	T(ECONNABORTED);
#endif
#ifdef ECONNRESET
	T(ECONNRESET);
#endif
#ifdef ENOBUFS
	T(ENOBUFS);
#endif
#ifdef EISCONN
	T(EISCONN);
#endif
#ifdef ENOTCONN
	T(ENOTCONN);
#endif
#ifdef ESHUTDOWN
	T(ESHUTDOWN);
#endif
#ifdef ETOOMANYREFS
	T(ETOOMANYREFS);
#endif
#ifdef ECONNREFUSED
	T(ECONNREFUSED);
#endif
#ifdef EHOSTDOWN
	T(EHOSTDOWN);
#endif
#ifdef EHOSTUNREACH
	T(EHOSTUNREACH);
#endif
#ifdef EALREADY
	T(EALREADY);
#endif
#ifdef EINPROGRESS
	T(EINPROGRESS);
#endif
#ifdef ESTALE
	T(ESTALE);
#endif
#ifdef EUCLEAN
	T(EUCLEAN);
#endif
#ifdef ENOTNAM
	T(ENOTNAM);
#endif
#ifdef ENAVAIL
	T(ENAVAIL);
#endif
#ifdef EISNAM
	T(EISNAM);
#endif
#ifdef EREMOTEIO
	T(EREMOTEIO);
#endif
#ifdef EDQUOT
	T(EDQUOT);
#endif
#ifdef ENOMEDIUM
	T(ENOMEDIUM);
#endif
#ifdef EMEDIUMTYPE
	T(EMEDIUMTYPE);
#endif
#ifdef ECANCELED
	T(ECANCELED);
#endif
#ifdef ENOKEY
	T(ENOKEY);
#endif
#ifdef EKEYEXPIRED
	T(EKEYEXPIRED);
#endif
#ifdef EKEYREVOKED
	T(EKEYREVOKED);
#endif
#ifdef EKEYREJECTED
	T(EKEYREJECTED);
#endif
	return 0;
}

/* attempt to guess the largest error value. assume gaps of 100 means
that's the end of the list of errors */
static int guess_max(void) {
	int i;
	int miss_count;
	for(i=0,miss_count=0;i<INT_MAX;i++) {
		if(err_id(i)) {
			miss_count=0;
		} else {
			miss_count++;
			if(miss_count>100) break;
		}
	}
	return i-miss_count;
}

static void init_id_lookup_table(void) {
	int i;
	id_max=guess_max();
	id_lookup_table=calloc(sizeof *id_lookup_table, id_max+1);
	for(i=0;i<=id_max;i++) {
		id_lookup_table[i]=err_id(i);
	}
}

static int lookup_id_str(const char *str) {
	int i;
	assert(id_lookup_table!=NULL);
	assert(id_max>0);
	for(i=0;i<=id_max;i++) {
		if(id_lookup_table[i] && !strcmp(str, id_lookup_table[i])) {
			return i;
		}
	}
	return -1;
}

static void show_error(int e) {
	const char *id;
	id=err_id(e);
	if(!id) id="???";
	printf("%d:%s:%s\n", e, id, strerror(e));
}

int main(int argc, char **argv) {
	if(argc==1) {
		int max;
		max=guess_max();
		printf("max error: %d\n", max);
	} else {
		int i;
		init_id_lookup_table();
		for(i=1;i<argc;i++) {
			int e;
			char *endptr;
			e=strtol(argv[i],&endptr,10);
			if(!endptr || *endptr) {
				e=lookup_id_str(argv[i]);
				if(e<0) {
					fprintf(stderr, "error '%s' unknown.\n", argv[i]);
					continue;
				}
			}
			if(e<0) e=-e;
			show_error(e);
		}
	}
	return 0;
}
/** END **/

-- 
Jon Mayo
<jon.mayo@gmail.com>
