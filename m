From: Francis Lau <fkwlau@utcc.utoronto.ca>
Subject: quotactl
Date: Wed, 2 Jul 2003 12:48:14 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307021245010.20193-100000@gpu.utcc>
References: <S265125AbTGBQaA/20030702163000Z+15659@vger.kernel.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <S265125AbTGBQaA/20030702163000Z+15659@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

For some reason, quotactl does not work for me even though I have QUOTA 
turned on in the kernel.

 struct mem_dqblk mydq;
 i = quotactl (QCMD(Q_GETQUOTA,USRQUOTA), "/dev/md5", 2099, &mydq);

i always returns -1 with errno = 22 (EINVAL The kernel has not 
been compiled with the QUOTA  option. cmd is invalid.)

Has anyone seen this before? Any suggestions are welcome.

Thanks,
Francis

