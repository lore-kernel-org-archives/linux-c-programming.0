From: "James Stevenson" <james@stev.org>
Subject: RE: strtod() and errno question.
Date: Tue, 10 Jan 2006 22:34:31 -0000
Message-ID: <000601c61636$065b2740$6a00ac0a@hughesit.local>
References: <Pine.LNX.4.21.0601102235490.1799-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0601102235490.1799-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

Try taking a copy of errno before calling fprintf.
See if that helps any.

	James

> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-
> programming-owner@vger.kernel.org] On Behalf Of J.
> Sent: 10 January 2006 21:43
> To: linux-c-programming@vger.kernel.org
> Subject: strtod() and errno question.
> 
> Tuesday, January 10 22:35:50
> 
> Hi people,
> 
> I have a question regarding errno and strtod() error checking. I have a
> function [listed below] that extracts a number from a string. In case of
> an error, strerror() in conjunction with errno is used to display a user
> friendly error message. However on a strtod() error; `Success' is
> returned.
> 
> Error - strtod(ca4)`c': Success
> 
> Since I am a bit confused by the strtod() manual page, what would be the
> correct way to handle this ?
> 
> Thankx !
> 
> J.
> 
> int extrnumber(char *str) {
>  int retv = 0;
>  char *nptr = NULL;
> 
>  retv = strtod(str, &nptr);
>  if(retv == 0 && nptr != NULL) {
>   fprintf(stderr, "%s: Error - strtod(%s)`%c': %s\n", PACKAGE,
>     str, *nptr, strerror(errno));
>   exit(EXIT_FAILURE);
>  }
> 
>  return retv;
> }
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


