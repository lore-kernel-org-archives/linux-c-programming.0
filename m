From: "Ramanan, Venkat (MED)" <Venkat.ramanan@geind.ge.com>
Subject: RE: Debug flag for libraries.
Date: Thu, 3 Jul 2003 12:54:03 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <DD9E117A8BE9F34FA4130376EC9C1F6A049BDC67@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Thanks for the responses. I thought I could get away with not compiling
the libraries.

Thanks anyway,
Venkat.

-----Original Message-----
From: Glynn Clements [mailto:glynn.clements@virgin.net]
Sent: Tuesday, July 01, 2003 4:33 PM
To: Ramanan, Venkat (MED)
Cc: linux-c-programming@vger.kernel.org
Subject: Re: Debug flag for libraries.



Ramanan, Venkat (MED) wrote:

> I need to compile a program with the debug flag "-g". The program uses
> some (static) libraries which have already been compiled without the
> "-g" flag. So, if I need all the debugging information ( line numbers
> etc. ) even from the libraries, do I need to recompile the libraries?

Yes.

-- 
Glynn Clements <glynn.clements@virgin.net>
