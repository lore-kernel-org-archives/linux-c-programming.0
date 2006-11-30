From: linux err <linux_err@yahoo.com>
Subject: Core file size?
Date: Thu, 30 Nov 2006 06:13:36 -0800 (PST)
Message-ID: <526654.3564.qm@web56508.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Does anyone know what determines the size of a core
dump? I have a process running out of memory (it
allocates about 3GB) - but the size of core varies
(between 2-3GB) depending on how much the process
wrote on the allocated memory.

Also, the time it takes to write the core (same size)
varies??

I briefly looked at elf_core_dump and get_user_pages()
in binfmt_elf.c. Is there any documentation on this?
Or anyone knows how it works?

TIA


 
____________________________________________________________________________________
Cheap talk?
Check out Yahoo! Messenger's low PC-to-Phone call rates.
http://voice.yahoo.com
