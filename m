From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Double values - what precision do I use for fprintf?
Date: Thu, 12 Jan 2006 18:00:19 +0530
Message-ID: <200601121800.19678.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Please observe the following printf output of eighteen double variables:

First I tried using "%20.15f" as the format string:

 268.229220252114942    1.018511211250181
  66.833038547989787   12.450505533056681
  20.512170161382819    0.334923179252419
 259.358845955701327    1.571934717666495
 201.111247720862963    0.139476171219810
 270.658029698352152   -0.612280599380678
 105.175902698424665   -0.076345132989225
 343.809699615507384   -0.219206370786681

Then I used "%30.25f":

 268.2297152740335377529845573    1.0185111507334088098986058
  66.8390907719954157073516399   12.4504269834231084956854829
  20.5123328842112115921736404    0.3349264346316725426966343
 259.3596100022817267927166540    1.5719383906021777708161835
 201.1113154335791932680876926    0.1394751696317115263745734
 270.6577319741974747557833325   -0.6122834912138217511312632
 105.1758654981413201312534511   -0.0763454696609412730712307
 343.8095929658045974974811543   -0.2192182978826520134418843

Ignoring the small differences in the two sets of data (longitude and speed of 
eight celestial bodies computer at two different instants) I wonder - if I 
keep increasing the number of decimal places where will it end?

-- 

Shriramana Sharma  http://samvit.org
Running SUSE Linux 10.0 with KDE 3.5

-- 

Penguin #395953 resides at http://samvit.org
subsisting on SUSE Linux 10.0 with KDE 3.5
