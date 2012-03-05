From: Andrej Gelenberg <andrej.gelenberg@udo.edu>
Subject: Re: Unicode or not?
Date: Mon, 05 Mar 2012 21:52:45 +0100
Message-ID: <4F55279D.6040702@udo.edu>
References: <jj2b8n$uka$1@dough.gmane.org> <4F54C7E2.3000307@udo.edu> <jj373v$aek$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <jj373v$aek$1@dough.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Krzysztof <kj@limes.com.pl>
Cc: linux-c-programming@vger.kernel.org

Hi,

no, you can't simply cast it to wchar. I recommend to read this article
about unicode under linux:
http://www.ibm.com/developerworks/linux/library/l-linuni/index.html

There are 2 possible ways to deal with utf8: keep it char* and use as
simple c-string. Pro: it's simple and you can keep using standard str*
functions and it often smaller as wchar string. Cons: some non latin
symbols may consume more then one bytes, so strlen will report bigger
number as characters there, which can lead to problems with displaying
or counting the characters. You can steel do it with mblen, but it's bit
pain.
Second option is to convert it to wchar with mbstowcs() function. Pro:
characters are always fixed bit-width. Cons: you need to convert between
utf8 and wchar and you need additional buffer to hold wchar string (you
can't do in in-place, because wchar string will be often bigger then
utf8 string).

For example, if you need or just wont wchar string, you can do something
like this:

int l = strlen(argv[i]);
wchar_t *nbuf = calloc(sizeof(*nbuf), l);
if ( !nbuf ) return 1;
l = mbstowcs(nbuf, argv[i], l); // mbstowcs may return smaller value as
                                // l
if ( l == -1 ) {
  /* invalid multibyte sequence was encountered */
  free(nbuf);
  return 2;
}

Regards,
Andrej Gelenberg

On 03/05/2012 09:19 PM, Krzysztof wrote:
> So how to read effectively UTF-8 characters from char* passed as an
> argument under Linux?
> Should one simply cast argv[n] to wchar_t*?
> 

