From: Uday Karan <uday.karan@gmail.com>
Subject: Fwd: constant in C
Date: Fri, 24 Sep 2004 13:03:17 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4f2e7cd304092400333259f597@mail.gmail.com>
References: <20040924033646.62233.qmail@web52901.mail.yahoo.com>
	 <a7ed6e3304092400165ad53b8c@mail.gmail.com>
	 <4f2e7cd304092400315c83fd1e@mail.gmail.com>
Reply-To: Uday Karan <uday.karan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4f2e7cd304092400315c83fd1e@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Sorry didn't CC to list.

> Therefore you cannot use sizeof(const),  &const etc.

sizeof (CONST) can be done and would return the size of an integral
type that would be able to hold that value, could be 4 for ints or 8
for long ints, if none of these can take up the value (because you're
substitutive constant is insanely large), the compiler would usually
give out a warning (if truncating) or an error straightaway.

- Uday
