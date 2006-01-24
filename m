From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Code critique: checking for syntax errors
Date: Tue, 24 Jan 2006 09:34:19 +0000
Message-ID: <17365.62619.693499.239201@cerise.gclements.plus.com>
References: <43D2870C.3030505@colannino.org>
	<43D35194.4050206@ajp-services.net>
	<43D532D6.9050204@colannino.org>
	<43D55A90.7030501@ajp-services.net>
	<43D55FEB.2070909@colannino.org>
	<43D57873.10005@ajp-services.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43D57873.10005@ajp-services.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Jesse Ruffin wrote:

> If you want to see gcc do ANSI c, try:
> 
> gcc -Wall -ansi -pedantic
> 
> The pedantic is necessary to get some extra warnings about ANSI issues.

BTW, when using -ansi, you need to explicitly define some feature-test
macros (e.g. _GNU_SOURCE) to get any Unix-specific functions which are
declared in ANSI headers.

E.g. strdup() is declared in <string.h>, but isn't an ANSI function,
so it won't be declared if you use -ansi without defining a suitable
feature-test macro.

-- 
Glynn Clements <glynn@gclements.plus.com>
