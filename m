From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: A safe scanf function
Date: Mon, 27 Feb 2006 15:46:44 +0000
Message-ID: <17411.7908.386568.805492@cerise.gclements.plus.com>
References: <200602261347.20494.samjnaa@gmail.com>
	<17409.51844.97168.392901@cerise.gclements.plus.com>
	<200602272045.54327.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602272045.54327.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > Probably because its trivial to write it yourself if that's what you
> > really want.
> 
> But instead of forcing every author of a C program to implement such a 
> function, I still feel a safe version should be included in the library 
> itself.

Not every author of a C program needs such a function.

And scanf() isn't "unsafe"; it just doesn't do what you want in your
particular application. There are plenty of situations where scanf()
does the right thing and getline() + sscanf() doesn't; e.g.:

1. If you want to allow the data to be split over multiple lines.
scanf() treats all whitespace as equivalent, so you can use a newline
wherever you can use a space. This means that a data file will still
work if it has been wrapped, e.g. due to being sent via email.

2. If you don't want to parse a whole record in one step. You can read
the initial part of the data with one call to scanf() then, depending
upon that part, use different scanf() calls to read the rest of it.

You may be using "one line equals one record" for your data format,
but not everyone does. The main problem with that approach is that
your records can never be any larger than the maximum line length of
any program or communication channel through which the data has to
pass. Using a non-whitespace delimiter for records is safer.

-- 
Glynn Clements <glynn@gclements.plus.com>
