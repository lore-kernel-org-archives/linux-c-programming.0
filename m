From: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Subject: Socket and STDIN pooling
Date: Tue, 14 Feb 2006 14:26:33 +0900
Message-ID: <43F16A09.8070807@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

I have a question about pooling 2 sockets and stdin.
I am currently making an application which accepts
input from the stdin.

It had a connection to a server connecting to 2ports.
If for example the stdin is a blocking descriptor and
the 2 other descriptors are to be checked real time
how can it be done without using threads?


Lejanson

-- 
"The masses of people lead lives of quiet desperation,
           because they lack a sound plan
       through which to accumulate a fortune."
         -Napoleon Hill, Think and Grow Rich

