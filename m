From: Nir Dremer <mailing@dremer.org>
Subject: Massive SendTo
Date: Mon, 20 Dec 2004 17:18:50 +0200
Message-ID: <1103555930.17886.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I'm looking for a way to perform several SendTo command from user-space
in one system call.. is there any way to do so?

The purpose is to avoid the system call overhead due to the massive use
of SendTo in my code.

any help will be appreciated... 



Cheers,
Nir Dremer
----------------------------------------------------------------------------------------
"Real leaders are ordinary people with extraordinary determinations."
-- John Seaman Garns	

