From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: i18n questions
Date: Thu, 1 Apr 2004 15:58:55 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16492.11823.413933.164065@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.58L0.0404011331350.11046@ahriman.bucharest.roedu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58L0.0404011331350.11046@ahriman.bucharest.roedu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mihai RUSU <dizzy@roedu.net>
Cc: linux-c-programming@vger.kernel.org


Mihai RUSU wrote:

> I am developer on a TCP network server project where the server sends some
> text messages to clients which are displayed unmodified. I am curently
> trying to find out the best way to support different language types
> (please note that I have no control over the clients, they are binary only
> comercial applications made by organizations with absolutly no relation to
> me or my project) . I have read the man pages of gettext family functions.
> However they dont seem to me very flexible. Because I can have clients
> from different countries connecting to the same server (they send their
> "locale"  identification data in the initial packets) I want to be able to
> send korean messages to korean users, french messages to french users,
> english to english ones etc. As I see it gettext uses the language set
> with setlocale. I dont see it as a solution to call setlocale() before
> translating every message to send depending on the clients locale. Do I
> miss something about gettext ?

No; you have to call setlocale() before each locale-dependent
operation. This isn't restricted to gettext() etc; it also applies to
ANSI/POSIX functions which use the locale (e.g. printf, isalpha,
strcoll etc). There aren't any functions which accept a locale as an
argument.

One word of warning: be careful about setting locale categories other
than LC_MESSAGES, as they can affect the behaviour of ANSI/POSIX
functions. E.g. setting LC_NUMERIC may result in printf("%f",...) 
using a comma as the decimal separator. If existing code is using
printf() etc to generate machine-readable text, changing the format is
probably a bad idea.

> Anyone here has a 
> pointer to some detalied explanation of the .po and .gpo files (I see in 
> "gaim" that .gpo is some "compiled" form) ? Couse I might do some ".po to 
> CDB" compiler and go with this solution :)

See the "gettext" Info file. Also, the compiled form of a .po file
(the form which gettext uses) usually has a ".mo" suffix.

-- 
Glynn Clements <glynn.clements@virgin.net>
