From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: Some question about one method.
Date: Mon, 24 May 2004 10:06:51 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <c8sab1$biq$1@sea.gmane.org>
References: <1085135081.21344.21.camel@relay.localnet> <20040521211714.GP1912@lug-owl.de>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Fri, 2004-05-21 14:24:41 +0400, Alphex Kaanoken <alphex@crew.org.ru>
wrote in message <1085135081.21344.21.camel@relay.localnet>:
> Hi guys,
> I'm have a some question
> how I can change the:
> sprintf(tmp,"%s%c",tmp,sym);
> where - char *tmp;int sym;
> may I use strcat or another method.
> I need a fast and better method for do it.

Jan-Benedict Glaw commented:
> That's perfectly good in C. Why do you want to change that? It the
> length of ths ASCIIZ string pointed to by temp is known, there's a good
> chance to optimize it. However, that's against readability, so I'd
> advise against it...

I must disagree : this piece of code is NOT perfectly good in C.

1) sprintf is a nest of buffer overflow bugs waiting to bite.  The issue is
of course the size of the tmp buffer. If it is known, the code can be
optimized and that will not make it less readable, conversely, if it is not
known, then we have a real bug in front of us, as extending the string by
one character will likely overwrite whatever is next in memory.
Don't use sprintf !  use snprintf.  If you cannot use snprintf, then you are
in trouble.

2) assuming you can use the destination buffer as an argument to sprintf is
asking for trouble !  Obviously it would almost certainly fail if not used
as the first argument for a format string starting with %s : a very
restrictive case.  ISO-C is very clear about such an abuse: 7.19.6.6
Description "...If copying takes place between objects that overlap, the
behavior is undefined."  A C library that would not support it and modify
tmp before it is used as the source for %s would not be incorrect.  The
unsuspecting C newbie (and the vast majority of his elders) would not
understand why sprintf(tmp,"%s%c",tmp,sym); would "work" and
sprintf(tmp,"%c%s",sym,tmp); would "fail".
Do not encourage such ugly code.

If you know tmp will accomodate the extra character, why not use the
following code:

char *p = tmp + strlen(tmp);
p[0] = sym;
p[1] = '\0';

Or better, if you know tmp size:

int len = strlen(tmp);
if (len + 1 < tmp_size) {
    tmp[len++] = sym;
    tmp[len] = '\0';
}
// notice how len is still the length of the tmp string.

Lastly, if you do not understand the above code snipplets, you are lacking
some fundamental C concepts esp. pointers and should not undertake any
significant programming project in C.  This is just friendly advice, as
debugging it will be horribly frustrating.

JBG's concern about readability would be best addressed with a utility
function, possibly implemented inline such as:

char *strncat1(char *buf, int bufsize, int c);

Chqrlie.

PS: a few simple trick questions for C newbies :
- what is -1 ?
- what is wrong with : enum BOOL { FALSE=0, TRUE=1 };
- what is the difference between : i << 2  and i * 4
- same question for : i >> 2  and  i / 4









