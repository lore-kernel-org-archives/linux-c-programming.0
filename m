From: <cyon.john@wipro.com>
Subject: RE: Getting pid of exec'd process
Date: Thu, 22 Mar 2007 17:11:10 +0530
Message-ID: <70661EB74D51BD4889EE03CC34E733F59904D9@blr-m2-msg.wipro.com>
References: <4602646F.3040906@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <4602646F.3040906@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasanta.Sadhukhan@Sun.COM, linux-c-programming@vger.kernel.org

Hi,

If you are doing execv after creating a child process using fork, then
return value of fork will give you the pid of the process.

If you haven't done any fork, then the pid is same the calling process
(execv doesn't create any new process, it overwrites the process image
of calling one) and can be obtained using the getpid() system call.

Regards,
Cyon P.J.

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Prasanta
Sadhukhan
Sent: Thursday, March 22, 2007 4:42 PM
To: linux-c-programming@vger.kernel.org
Subject: Getting pid of exec'd process

Hi,

Can anyone suggest as to how can I get the pid of the process which I
have done execv()?
ie, if I do execv(path, cmd) a new process will be launched and now how
can I get the pid of this new process?

Regard
Prasanta

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to
majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html
