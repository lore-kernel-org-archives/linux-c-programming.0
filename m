From: "Chris Nanakos" <nanakos@wired-net.gr>
Subject: Re: Value to subtract from ESP register?
Date: Wed, 24 Mar 2004 19:25:11 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001601c411c4$f6b02e20$8b1705d5@carlos>
References: <4061B5C4.7040907@easynet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Received: from carlos (ppp23-139-gw01.athens.access.acn.gr [213.5.23.139])
	by enigma.wired-net.gr (*.**.*/******) with SMTP id i2OHUVI2032463;
	Wed, 24 Mar 2004 19:30:32 +0200
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zavandi <zavandi@easynet.ro>, linux-c-programming@vger.kernel.org

This is the optimazation code that gcc uses.It differs from version to
version and you can discover it only if you work with different
arguments(values) in your arrays.After a step the subtraction of ESP is the
same e.g for 128 and so on.But i think that somewhere on the documentation
of gcc is already written.

