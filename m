From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Which two types signal cannot be produce in user program?
Date: Mon, 8 Nov 2004 07:16:23 +0000
Message-ID: <16783.7495.321101.11146@cerise.gclements.plus.com>
References: <cmmm0k$cqg$1@sea.gmane.org>
	<418EEDC9.7070406@hq.ntsp.nec.co.jp>
	<418EEE0F.9020400@hq.ntsp.nec.co.jp>
	<e1e1d5f40411072012714c0b05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <e1e1d5f40411072012714c0b05@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Souza <thehazard@gmail.com>
Cc: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>, linux-c-programming@vger.kernel.org


Daniel Souza wrote:

> well... I dont know if I got your question but... i believe that a
> signal like SIGCHLD cant be sent to another process via normal kill(),
> cuz the OS is responsible for deliver it...

You can send any signal via kill(), provided that you have sufficient
permission (the permission issue affects which processes you can
signal, but it affects all signals equally). There isn't anything
special about SIGCHLD.

-- 
Glynn Clements <glynn@gclements.plus.com>
