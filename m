From: "qhwang" <qhwang@ieeta.pt>
Subject: help on memory problem
Date: Tue, 7 Oct 2003 23:43:04 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <004401c38d24$5f52b220$70ab88c1@ieeta.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi there,

Can anyone help me to get out of the mess, please? I am writing a program
which tries to detect faces inside an image. For further comparison, now I
use the "brutal force search" strategy which means there is a  window (here
32x32) scanning the input image (e.g., 160x120) pixel by pixel.  The problem
is, this "brutal forace search" uses quite a lot memory and it's always
killed by the system after running a while. At first I think there are some
memory leaks but I could not find any when I set the macro MALLOC_CHECK_=1.
I also modify the code to make sure all the data structure are only
allocated once, e.g., in the main program, but the problem is still there.
When I use "top" to monitor the memory infor when the program is running and
find that the option "SIZE" reaches more than 250 MB and "RSS" reaches 40
MB. My program is only about 110 KB. The memory of my computer is only 64 MB
but with my laptop (256 MB) the problem is same. Can anybody give me some
pointers about it?

Many thanks.

QingHua

