From: Shriramana Sharma <samjnaa@gmail.com>
Subject: can't initialize a constant using another constant?
Date: Tue, 26 Feb 2008 20:02:06 +0530
Message-ID: <47C422E6.8050702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Dear list,

Quite some time since I wrote. I hope you are all keeping well. :)

A strange thing I ran across this evening. I was not allowed to do:

const double lunarSynodicMonth = 29.53059 ;
const double daysLunarPhaseAngleTakesPerDegree = lunarSynodicMonth / 360.0 ;

I got the following error:

wdf-karanas.c:17: error: initializer element is not constant
make: *** [wdf-karanas.o] Error 1

I would be grateful if anyone could shed some light. TIA.

Shriramana Sharma.

