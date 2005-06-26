From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: How to prototype functions that return pointers
Date: Sun, 26 Jun 2005 04:36:46 +0100
Message-ID: <17086.8910.710433.444595@gargle.gargle.HOWL>
References: <42BC7A4F.60304@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42BC7A4F.60304@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org


James Colannino wrote:

> Ok, so this is a very embarassing question.  I tried googling for the
> answer but haven't figured it out yet, and everything I've tried results
> in compilation errors. I want to prototype a function that takes nothing
> as an argument but returns a pointer to a character.

	char *myfunc(void);

> I've tried the following:
> 
> char * readline();
> char *readline();

Both of these declare a function taking unspecified arguments and
returning a char*. If the function takes no arguments, the argument
list should be declared as "void".

> These first two result in 4 errors, each one identical and each one
> telling me "error: two or more data types in declaration of 'readline' "

That error isn't related to your prototypes, but the context in which
they occur. In your follow-up, you note:

> I found
> out though that the "two or more data types" error was the result of a
> more difficult bug to find that had to do with something in another
> header file.

That seems likely.

-- 
Glynn Clements <glynn@gclements.plus.com>
