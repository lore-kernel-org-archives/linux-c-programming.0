From: Jonas Appel <jonas.appel@jonas-appel.de>
Subject: Calculating 64-Bit Values
Date: Thu, 13 May 2004 15:49:41 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1084456108.802075@slbhw0>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I hope this is not a really stupid question, but Ive tried some ways
and I'm still not satisfied with my current solution. I have to 
calculate some 64 Bit values, like this:

typedef unsigned long long int64;

int64 val = 0x7c95674beb4000;

the only working way to perform calculation was this:

unsigned int timestamp[2];

timestamp[1] = (unsigned int)((int64)val+0x4324154));
timestamp[0] = (int64)((int64)val+0x4324154)) >> 32;

And printing the value works like this:

printf("Value: %8lx%8lx\n", timestamp[0], timestamp[1]);

Does anyone know a better way to get along with these 64Bit-values?

Thanks in advance,

Jonas

