From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Windows can use cpp in c code but in linux ?? I dont know how
	.
Date: Thu, 30 Sep 2004 13:12:16 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E3066113853D@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Suciu wrote:


>To solve this is easy, link with the c++ library: -lstdc++

>gcc a.c mylib.a -lstdc++

Or you could use g++ (the GNU C++ compiler)  It should handle
C files as well.

George
