From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Debug flag for libraries.
Date: Tue, 1 Jul 2003 12:02:30 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16129.27206.195388.670340@cerise.nosuchdomain.co.uk>
References: <DD9E117A8BE9F34FA4130376EC9C1F6A048B48B7@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <DD9E117A8BE9F34FA4130376EC9C1F6A048B48B7@BANMLVEM01.e2k.ad.ge.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ramanan, Venkat (MED)" <Venkat.ramanan@geind.ge.com>
Cc: linux-c-programming@vger.kernel.org


Ramanan, Venkat (MED) wrote:

> I need to compile a program with the debug flag "-g". The program uses
> some (static) libraries which have already been compiled without the
> "-g" flag. So, if I need all the debugging information ( line numbers
> etc. ) even from the libraries, do I need to recompile the libraries?

Yes.

-- 
Glynn Clements <glynn.clements@virgin.net>
