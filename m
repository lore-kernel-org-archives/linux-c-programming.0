From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: variable length function
Date: Wed, 15 Jun 2005 03:23:55 +0100
Message-ID: <17071.37179.269117.890201@gargle.gargle.HOWL>
References: <20050614174356.58804.qmail@web52910.mail.yahoo.com>
	<6a00c8d505061412142f93e234@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505061412142f93e234@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: Ankit Jain <ankitjain1580@yahoo.com>, linux-c-programming@vger.kernel.org


Steve Graegert wrote:

> > also, if what is the default return type and value of
> > main function in C in gcc, ansi C and turbo C?

> Question 4:
> ISO C99 suggests the return type of main() to be of type int.  There
> is a never ending debate among some professionals whether void is
> equally legal.  Some compilers behave like ANSI C that allows
> declaration of type void but return int implicitly.  In other words:
> stick to int.

The value returned from main is used as the process' exit code. If you
declare main() as returning void, and return from it, the process is
likely to have a random exit code (e.g. whatever happens to be in the
EAX register upon return from main()).

-- 
Glynn Clements <glynn@gclements.plus.com>
