From: <cyon.john@wipro.com>
Subject: RE: unable to link to a static library present alongside a shared library
Date: Wed, 18 Apr 2007 17:49:16 +0530
Message-ID: <70661EB74D51BD4889EE03CC34E733F5A76677@blr-m2-msg.wipro.com>
References: <46260A74.90309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <46260A74.90309@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: samjnaa@gmail.com, linux-c-programming@vger.kernel.org

Hi,

You can use the '-static' option to gcc for forcing a static link even
if a shared library is present.
I think the default behaviour is set so as to take advantages of shared
library. For example, a dynamically linked executables has smaller size
than their corresponding statically linked files. While executing
multiple programs dynamically linked to a shared library, there will be
only one instance of that particular library in the memory for serving
all the programs that use it.

Hope that was helpful.

Regards,
Cyon P.J.

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
Shriramana Sharma
Sent: Wednesday, April 18, 2007 5:39 PM
To: linux-c-programming@vger.kernel.org
Subject: unable to link to a static library present alongside a shared
library

I read recently that someone was not able to link statically to a
library which was placed alongside a shared library. Having gained some
knowhow from the good people on this list I checked first the ld manpage
and found this:

ld will search a directory for a library with an extension of .so before
searching for one with an extension of .a.

Does anyone know of a way to subvert this behaviour and force linking to
the static library?

Also, why is this behaviour made this way? Is there a reason or is it
arbitrary?

Thanks as ever, for all your help.

Shriramana Sharma.
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to
majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html
