From: Suriya Narayanan M S <mssnlayam@cs.annauniv.edu>
Subject: opening standard streams - who does that?
Date: Sat, 6 Jul 2002 21:00:55 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200207070223.g672NSH26418@cs.annauniv.edu>
Reply-To: mssnlayam@cs.annauniv.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,
	I want to know who opens the streams
stdin, stdout, stderr in file-descriptors 1, 2, 3
and calls the process. I know (right or wrong?)
that on a fork the filedescriptors are duplicated.
So bash or the shell can just forks a new process
without assinging the fds. Is it the kernel
which assigns 0 to the keyboard. How is this
done?

Thanks in advance,
Suriya Narayanan M S
-- 
Guru Brahma Gurur Vishnu
Gurur Dhevo Maheshwaraha
Gurur Saakshaath Parabramha
Thasmai Shree Gurave Namaha

Public key at www.keyserver.net

