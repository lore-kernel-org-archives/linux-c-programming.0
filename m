From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: __asm__
Date: Sat, 2 Apr 2005 14:18:45 +0100
Message-ID: <16974.39861.142816.892982@gargle.gargle.HOWL>
References: <20050329064829.52787.qmail@web52908.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050329064829.52787.qmail@web52908.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>


Ankit Jain wrote:

> can anybody tell me when we write like this while
> writing asm construct then what does underscore mean?
> 
> __asm__("construct")

Underscores are treated just like letters in macro and symbol names.

By convention, the implementation (compiler, core libraries) puts
underscores at the beginning of any "private" names, so that they
don't conflict with any names which you might use in your code (you
wouldn't normally choose names beginning with underscores in your own
code).

According to the ANSI C99 specification:

       7.1.3  Reserved identifiers

       [#1] Each header declares or defines all identifiers  listed
       in  its  associated  subclause,  and  optionally declares or
       defines identifiers listed in its associated future  library
       directions   subclause  and  identifiers  which  are  always
       reserved either for  any  use  or  for  use  as  file  scope
       identifiers.

         -- All  identifiers  that  begin  with  an  underscore and
            either an uppercase letter or  another  underscore  are
            always reserved for any use.

         -- All  identifiers  that  begin  with  an  underscore are
            always reserved for use as identifiers with file  scope
            in both the ordinary and tag name spaces.

-- 
Glynn Clements <glynn@gclements.plus.com>
