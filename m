From: kaushal <kaushal@rocsys.com>
Subject: Re:buggy_double_use_of_scanf
Date: Wed, 03 Nov 2004 15:44:03 +0530
Message-ID: <1099476843.8716.26.camel@Kaushal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-C-programming <linux-c-programming@vger.kernel.org>

hi
  the following code should solve the scanf issue.

	char s;
	scanf("\n%c",&s);
cheers-
kaushal

