From: xlp <xlp@emtel.net.co>
Subject: a 'wrapper'
Date: Sat, 29 Jun 2002 05:25:02 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020629052348.A50622@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hi, i have been trying to let certain process working on a remote machine in this way:
nohup ./a.out >> /dev/null &
but when i log off, the process dies.
Can i code a certain process that fork itself, call setsid() and run a.out with system() or exec() ?
How can i deal with this situation? I want that the executable object a.out forget about terminal control and do its work without care about sdtin/stdout/stderr.

bye Unix friends.


