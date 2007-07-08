From: Shriramana Sharma <samjnaa@gmail.com>
Subject: handling timezone information on Linux/glibc
Date: Sun, 08 Jul 2007 15:28:53 +0530
Message-ID: <4690B55D.3040706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

I have been banging my head on timezone/UTC-offset implementation for my 
project. Does anyone know of an intelligent GPL-compatibly licensed 
implementation of a date-time class with time-zone and DST awareness?

Apparently glibc uses the Olson timezone database internally but it does 
not expose the API to the client programmer (this information from 
man:tzfile). So would it be helpful if I dig into glibc internals?

Shriramana Sharma.
