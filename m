From: Bubulac Tatiana <bubulac@unidec.ro>
Subject: SIGTERM
Date: Tue, 21 May 2002 13:51:09 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CEA269D.CF8569AE@unidec.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

    I want to terminate a parent process that attach several shared
memory segments
with kill(pid, SIGTERM) but it fails to terminate.
    Even if I give the command from command line it fails to terminate.
    If I give kill -9 pid it terminates but the shred memory segments
remains.
    Why I cannot terminate it with  SIGTERM signal?

    "....
    status = kill ((pid_t)pid, SIGTERM);
     printf("status = %d\n", status);
    ...."
The status is 0. The pid is correct.

TIA,
Bubulac Tatiana.

