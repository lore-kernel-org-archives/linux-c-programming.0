From: "qhwang" <qhwang@ieeta.pt>
Subject: strange segmentation fault in malloc()
Date: Tue, 7 Jan 2003 23:43:32 -0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <012c01c2b6a6$9778d4e0$70ab88c1@ieeta.pt>
References: <Pine.LNX.4.33.0301071646230.5493-100000@soochak.ncst.ernet.in> <15899.2594.867274.281756@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi, there!

My app wants to read and then wavelet-transform image one by one. Now I got
a strange segmentation fault in malloc().  The situation is only the first
image can be processed successfully, but the second one fails due to the
same call of "malloc(160*120*sizeof(float))" used in the processing of the
first image. The return value of "malloc" is NULL . So how can I check the
size of heap used by the system? Or how can I set the environment varible
"MALLOC_CHECK_"? Someone said it can be set in the rc.sysinit, but I can't
find this file. Any suggestion will be greatly appreciated. Many Thanks!

qhwang

