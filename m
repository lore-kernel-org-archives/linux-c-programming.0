From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: 64 bits integer
Date: Tue, 09 Nov 2004 22:30:57 -0300
Message-ID: <41916F51.2060102@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

How can we do to manipulate integer higher than 32 bits in linux ?

Does exist some system call (or another library), that allow us to do 
something like as following ?

int64 x;
x = atoi64("12345678901234567890");

char x[21];
i64toa(x, sizeof(x));

Thanks,

Luciano

