From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: RE: integrating c code and c++ code
Date: Thu, 26 Dec 2002 11:24:30 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000401c2ad03$a7940cc0$91271c43@joe>
References: <004601c2acf2$a442cea0$70ab88c1@ieeta.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <004601c2acf2$a442cea0$70ab88c1@ieeta.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'qhwang' <qhwang@ieeta.pt>, linux-c-programming@vger.kernel.org

Just combine the two.  C++ is a subset of C which means everything that
worked under C will continue to work under C++.

Sure, it will result in sloppy code, a weird mix of C and C++ syntax, but it
will compile and work fine.

Or at least it should 8-)

Joseph Wagner

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of qhwang
Sent: Thursday, December 26, 2002 9:23 AM
To: linux-c-programming@vger.kernel.org
Subject: integrating c code and c++ code

Hi folks,

Does anyone have experience of integrating c code together with c++ code? I
know it may be unusual but I need to do it. The case is, I need to integrate
some well defined c++ wavelet classes into my c application, but I don't
have enough time to rewrite the wavelet classes in plain c. So how can I do
it? Any help or further pointer will be greatly appreciated. Many thanks.

QingHua Wang

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

