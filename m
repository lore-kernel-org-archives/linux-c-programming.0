From: "Wen Guangcheng" <wen.guangcheng@cnt.sp.qnes.nec.co.jp>
Subject: Question on memcpy()
Date: Wed, 15 Sep 2004 20:17:11 +0900
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <011b01c49b15$8bd3f980$de01a8c0@voip>
References: <20040915083340.19367.qmail@web52710.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello Gurus,

I am trying to fix a bug in a  code. I found something like this,

struct sample A, B;
...
...
memset(&A, 0, sizeof(sample));
memcpy(&A, (char *)&B, sizeof(sample));
...
I could not understand why the second argument is (char *)&B, but not &B.
I think it should be &B. 

Sometimes I found A is all zero. but B is not all zero in fact.  
Is it due to the second argument (char *)&B?

Any comment is appreciated and thanks in advance.

Best regards,

--Wen

