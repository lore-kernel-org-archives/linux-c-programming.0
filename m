From: Daniel Souza <thehazard@gmail.com>
Subject: Re: Defunct Processes
Date: Thu, 30 Dec 2004 11:14:54 -0200
Message-ID: <e1e1d5f4041230051468850cde@mail.gmail.com>
References: <BDE318F8.1618%dsessions@ionosphere.net>
	 <BDF77D14.1AE7%dsessions@ionosphere.net>
	 <20041229101658.GR2460@lug-owl.de>
Reply-To: Daniel Souza <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041229101658.GR2460@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

you can

signal(SIGCHLD, SIG_IGN);

to ignore childs termination notifications, so, the parent dont need
to wait() for childs, they just go without any parent notification,
and no zombies.
