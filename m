From: Daniel Souza <thehazard@gmail.com>
Subject: Re: Which two types signal cannot be produce in user program?
Date: Mon, 8 Nov 2004 02:12:42 -0200
Message-ID: <e1e1d5f40411072012714c0b05@mail.gmail.com>
References: <cmmm0k$cqg$1@sea.gmane.org> <418EEDC9.7070406@hq.ntsp.nec.co.jp>
	 <418EEE0F.9020400@hq.ntsp.nec.co.jp>
Reply-To: Daniel Souza <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <418EEE0F.9020400@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org

well... I dont know if I got your question but... i believe that a
signal like SIGCHLD cant be sent to another process via normal kill(),
cuz the OS is responsible for deliver it...
