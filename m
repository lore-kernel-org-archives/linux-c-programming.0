From: "Ruslan U. Zakirov" <cubic@wr.miee.ru>
Subject: Can't understand how to get needed pointer.
Date: Thu, 24 Oct 2002 19:35:27 +0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <14296984741.20021024193527@wr.miee.ru>
Reply-To: "Ruslan U. Zakirov" <cubic@wr.miee.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello.
I've wrote function that convert in_str from charset to UTF-8.
It uses libiconv.
int convert_str(char *in_str,const char *charset,char *out_str)
{
        char *wrptr = (char *) out_str;
        char inbuf[MAX_SIZE];
        char *inptr = inbuf;
        size_t insize = strlen(in_str)+1;
        size_t avail = MAX_SIZE;
        size_t nconv;

        iconv_t cd;
        sprintf (inbuf,"%s",in_str);
        cd=iconv_open ("UTF-8",charset);
        nconv = iconv (cd, &inptr, &insize, &wrptr, &avail);
        iconv (cd, NULL, NULL, &wrptr, &avail);
        iconv_close(cd);
        return 0;
}
But I'v not understood how to get "const char* * inbuf" without
manipulations that I've done in code above. This code works fine, but
when I was compiling it gcc prints warning:
       gd_ft_test.c: In function `convert_str':
       gd_ft_test.c:83: warning: passing arg 2 of `iconv' from incompatible pointer type
I don't understand what I have to do with "char *in_str" to pass it to
iconv?
Here is declaration of function iconv:
size_t iconv (iconv_t cd,
                     const char* * inbuf, size_t * inbytesleft,
                     char* * outbuf, size_t * outbytesleft);

Thanks beforehead.
_________________________________________________________________________
Sorry for my English.

