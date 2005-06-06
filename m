From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: library routine wrappers and serious overkill
Date: Mon, 6 Jun 2005 02:13:03 +0100
Message-ID: <17059.41759.788362.757952@gargle.gargle.HOWL>
References: <Pine.LNX.4.61.0506051727540.5731@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0506051727540.5731@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   now, i'm as big a fan as the next guy of good debugging (the
> my_CONDITION macro is a local implementation of assert() with hooks to
> a logging library -- yeesh) but, seriously, there has to be a limit to
> just how much debugging you're going to apply to each and every
> string-related library routine.  it does get kind of absurd after a
> while:
> 
> ===============================
> 
> char
> my_str_ch2upper(char const ch)
> {
>     DBUG_ENTER(__FUNCTION__);
> 
>     if (isascii(ch) && islower(ch)) {
>         DBUG_RETURN(toupper(ch));
>     }
>     DBUG_RETURN(ch);
> }
> 
> 
> ===============================
> 
>   is this what you'd call best practice?

It may be that the code was written for a platform which lacked a
working debugger, so the program had to be able to generate its own
stack traces etc.

-- 
Glynn Clements <glynn@gclements.plus.com>
