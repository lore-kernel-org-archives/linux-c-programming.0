From: Shriramana Sharma <samjnaa@gmail.com>
Subject: unable to link to a static library present alongside a shared library
Date: Wed, 18 Apr 2007 17:39:24 +0530
Message-ID: <46260A74.90309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

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
