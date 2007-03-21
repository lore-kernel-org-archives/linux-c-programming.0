From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Running status of a process
Date: Wed, 21 Mar 2007 13:43:21 +0530
Message-ID: <4600E921.5010106@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

Can anyone point as to how can I obtain the information whether a 
non-child process is still running?

I tried waitpid(pid, &status, WNOHANG) but always receive return value 
as -1 with errno as ECHILD.
Since the processes I am waiting for is not the child of this process 
from where I am calling waitpid() (ie, they are independant processes), 
it might be a valid error but what is the other alternative?

Regards
Prasanta

