From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: "strip"-ping Windows executables
Date: Thu, 23 Feb 2006 14:08:45 +0000
Message-ID: <17405.49645.378440.245634@cerise.gclements.plus.com>
References: <200602231904.56673.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602231904.56673.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> I have compiled a C program I wrote on Linux using MinGW 3.42 on Windows XP -- 
> I wonder if it is possible for me to strip that file using Linux command 
> strip -- is it safe?

You need a version of strip which was built to work on Windows
binaries (i.e. cross-binutils). An ELF version of strip won't work on
COFF/PE executables.

-- 
Glynn Clements <glynn@gclements.plus.com>
