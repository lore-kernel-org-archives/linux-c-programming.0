From: Llfrg@aol.com
Subject: Monitoring a program
Date: Mon, 01 Mar 2004 13:22:18 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4FEDBC17.643129B5.0000FADF@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I would like to monitor a program execution. I intend to have a program (or daemon) that, whenever the target program (whose name is to be passed as a paramenter) starts (i.e when ps -C progname returns any process), gets statistics like cpu usage and store them on a file, finishing when the target program finishes. What would be an efficient way to do that?

Thanks,
Leonardo.
