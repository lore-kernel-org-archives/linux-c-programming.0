From: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Subject: about Posix Threads
Date: Tue, 20 May 2003 14:51:51 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3EC9D087.3060804@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

hello everyone. i am new here. i just would like to ask some
questions regarding posix threads and i hope someone could help
me.

i made a pthread program and i am quite puzzled why my program
spawns 4 threads.. when i view it in linux console.

i used 'ps -ax | grep myprog' command to get the processes for
my application and to my surprise it spawns 4 threads.. when i
only expected 3.. one for main, one for event, and one for recvdata.

spawnXXXXXX functions create new threads..

i really need ur help. can anyone tell me why this occur?

thanks a lot...


lejanson


=============/* snipp */==================
int main(void)
{

     ................
     ................
     ................

     if (spawnEventThrd())
     {
         fprintf(stderr, "spawning event thread error\n");
         exit(0);
     }


     if (spawnRecvDataThread())
     {
         fprintf(stderr, "spawning response thread error\n");
         exit(0);
     }

     ................
     ................
     ................
     return 0;
}

