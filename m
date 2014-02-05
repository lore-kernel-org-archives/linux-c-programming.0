From: Qu Wenruo <quwenruo@cn.fujitsu.com>
Subject: About the memory ordering and function call
Date: Wed, 05 Feb 2014 09:23:35 +0800
Message-ID: <52F19297.9070703@cn.fujitsu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

Notsure it's suitable to ask here,but a strange memory order related
problem happens.
Related codes are like below (somewhat simplified)

------
struct my_work {
/* someunrelated variants */
struct SOME_OTHER_STRUCT *my_pointer; <<< Attention here
struct work_struct normal_work;
};

void my_queue_work(struct workqueue_struct *wq, <<< wq is WQ_UNBOUND
workqueue
struct my_work *work)
{
/*
* the work->normal_work is initialized somewhere else,
* and the work job will use the work->my_pointer.
*/

work->my_pointer = something; <<< The problem
/* Do something else */
queue_work(wq, work->normal_work);
}
------

The codes runs fine on all my *INTEL* boxes but kernel panic on *AMD*
boxes(othertesters', so I can't reproduce it),
when the work is executed, a NULL pointer exception will happen.
After tracing the backtrace,it happens that the work->my_pointer is not
set to proper address and isstill NULL.

So I have some questionsabout the problem.
1) Should I add an smp_mb() behind "work->my_pointer = something"?

2) Why the smp_mb() in queue_work() function can't ensure
"work->my_pointer" is set?
More accuratly, will smp_mb() affect outside of a function call?
Forreference, the smp_mb() lies like below:
queue_work()
queue_work_on()
__queue_work()
insert_work()
smp_mb()

3) Why INTEL CPUs can't trigger the problem?
Wikipedia says that AMD CPUs has somewhat weak memory ordering than
Intel, may it be the problem?

Thanks,
Qu
