From: Heinrich du Toit <hdutoit@tlabs.ac.za>
Subject: multi threaded file access
Date: Fri, 06 Dec 2002 13:39:29 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DF08C71.30605@tlabs.ac.za>
Reply-To: hdutoit@tlabs.ac.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-c-programming mailing list <linux-c-programming@vger.kernel.org>

Hello

I have a tcp/ip server which is offcourse multi threaded :-)

Is it safe to have to threads access the same file descriptor at the 
same time?
Or should I put a mutex over the file descriptor?

Thanks for your help
-Heinrich


