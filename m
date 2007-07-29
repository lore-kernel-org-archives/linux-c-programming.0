From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: "noreturn"
Date: Sun, 29 Jul 2007 15:00:02 +0200
Message-ID: <6a00c8d50707290600n9f3285bs9b942de1d778d067@mail.gmail.com>
References: <46AC873C.3060908@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=t82Q4zKqd60mjQSwSc0+Qx/nhAwZSDlWmdcbYmUX4Ehiy4WEWM0T3BmzQpgNCMLI6S/F0ozq6U5h11+diyOc2+qoOgveF67g2tcMKS1ZbCqdeNtRn6BQpAGlgqB3J7VitO+v0PbvA9zWqVonKXA5j00PNpRJyk/xJeA0ahmIW5w=
In-Reply-To: <46AC873C.3060908@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Shriramana,

On 7/29/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> man:gcc at -Wunitialized says:
>
> Some spurious warnings can be avoided if you declare all the functions
> you use that never return as noreturn.
>
> Google says this term is used only in Microsoft C++. So what is it doing
> in GCC's page?

What do you mean by that?  There is no indication that
__attribute__((noreturn)) is _only_ used within the Microsoft
environment.

Some standard library functions, such as abort(3) and exit(3), cannot
return.  GCC is able to determine this fact automatically.  When you
define your own functions that never return you can declare them
noreturn to tell the compiler about it.  For example,

	void doesnotreturn(void) __attribute__ ((noreturn));
	
	void doesnotreturn (void) {
		/* do some work here */
		exit (1);
	}

Telling the compiler to assume that doesnotreturn() cannot return
allows for gcc to optimize code without regard to what would happen if
doesnotreturn actucally returns.

What exactly is not clear about the usage of noreturn?  The gcc manual
also makes clear that even semantically correct code can cause an
unitialized warning since

"GNU CC is not smart enough to see all the reasons why the code might
be correct despite appearing to have an error."

	\Steve

--

Steve Graegert <steve@graegert.com>
