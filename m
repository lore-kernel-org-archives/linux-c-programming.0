From: TOMAZ <tomas.zajc@gmail.com>
Subject: NAN and complex.h
Date: Tue, 18 Sep 2007 14:52:08 -0700 (PDT)
Message-ID: <12766829.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi I made a program which basically averages data from a file. The data is
stored as complex float and I'm reading it with fread with no problem. Some
data are taged as NAN (at least ENVI, an image procesing soft read these
values as NAN). If I average the whole data adding a number with a NAN gives
me a NAN and my whole program fails.

What I did is the folowing which doesn't seems to work:

if(cabsf(zhhzhh)!= NAN)
{
    printf("%f\n", cabsf(zhhzhh));
}

For some reason the test seeams to be positive all the time, I keep printing
NAN's ("nan" actualy).

Any idea?

  Tomas

-- 
View this message in context: http://www.nabble.com/NAN-and-complex.h-tf4477349.html#a12766829
Sent from the linux-c-programming mailing list archive at Nabble.com.

