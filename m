From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Misc C question
Date: Thu, 20 Jun 2002 14:23:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15633.55133.760880.963357@cerise.nosuchdomain.co.uk>
References: <20020619214332.A299@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020619214332.A299@nietzsche>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xmp <xmp@multipasto.net.co>
Cc: linux-c-programming@vger.kernel.org


xmp wrote:

> hi, What is the correct unix-style way to check if a file exists ?
> create it ? and delete it ?.

There isn't a "correct" way.

1. You may not be able to tell whether or not the file exists, e.g. 
because the process has neither read nor execute permission for one or
more of the directories in the file's path (or paths; due to hard
links, a file may have multiple pathnames).

2. Unless you're using the existence of the file as some sort of
"flag", checking for existence is seldom useful. More likely you want
to know if it's readable/writable/executable in a particular context
(the process' euid/fsuid, egid/fsgid and supplementary gids all affect
the result).

3. Functions which return information about the filesystem (e.g. 
stat/lstat) return information about the past. Just because the file
existed (or did not exist) at the time of the check, there's no
guarantee that the file still exists (or doesn't exist).

> Maybe trying to fopen() it and if call != NULL it exist, else it
> doesnt?.

If the file doesn't exist, fopen() will return NULL, but there are
plenty of other reasons why fopen() may return NULL.

If you actually intend to read or write the file, the correct approach
is to attempt whatever you intend and to handle any failures. You
cannot predict in advance whether a given operation will succeed.

If you don't intend to read or write the file, then you shouldn't
attempt to open it, as that may have unintended consequences. For
files, directories etc it may update the last-accessed time; for
device files, the effects vary (e.g. open()ing /dev/st0 device may
rewind the tape).

-- 
Glynn Clements <glynn.clements@virgin.net>
