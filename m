From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: x86 and linux stack layout
Date: Sun, 21 Nov 2004 21:00:11 +0000
Message-ID: <16801.475.290968.318682@cerise.gclements.plus.com>
References: <e1e1d5f40411210533b3d5ae4@mail.gmail.com>
	<16800.59320.31823.656094@cerise.gclements.plus.com>
	<e1e1d5f4041121120770c77ebd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <e1e1d5f4041121120770c77ebd@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Souza <thehazard@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Daniel Souza wrote:

> Do you know what other ELF sessions are for ? 

I'm not familiar with that term.

> What is the work of the ld.linux ? what does it do ?

ld-linux is the loader. It is responsible for loading
dynamically-linked executables and the shared libraries on which they
depend.

When you execve() a dynamically-linked executable, the kernel actually
runs "/lib/ld-linux.so.2 <program> <arguments>", and ld-linux does the
work of setting up the shared libraries.

-- 
Glynn Clements <glynn@gclements.plus.com>
