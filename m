From: "Wen Guangcheng" <wen.guangcheng@cnt.sp.qnes.nec.co.jp>
Subject: How to execute a process in background by exec functions?
Date: Thu, 8 Apr 2004 14:41:10 +0900
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <002001c41d2c$18e27f80$de01a8c0@qnessmphibiki>
References: <407316A0.1060708@telefonica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello All,
I am trying to execute a process in background by exec functions.
But it failed when I call the function of execv by
execv("/home/wen/daemon &", NULL);
The error is ENOENT(No such file or directory).  
Would anyone tell me how to do it?
Thanks in advance.

Best regards,

--Wen
