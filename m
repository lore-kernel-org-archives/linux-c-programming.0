From: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Subject: question on select.
Date: Thu, 18 Dec 2003 09:17:20 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3FE10020.6050200@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org


hello good day.
i have a question about the select()
function.

when should we set timeout parameter
into NULL? what is the difference of
putting timeout (0, 0) OR putting NULL
as parameter?

--
while(1) {
   tv.sec = 0;
   tv.usec = 0;
   sel = select(fd+1, &rdfd, NULL, NULL, &tv);
}
--
--
while(1) {
   sel = select(fd+1, &rdfd, NULL, NULL, NULL);
}
--

thanks a lot.


lejanson







