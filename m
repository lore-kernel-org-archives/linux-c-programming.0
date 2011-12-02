From: Randi Botse <nightdecoder@gmail.com>
Subject: Co-thread for parallel processing
Date: Fri, 2 Dec 2011 16:23:49 +0700
Message-ID: <CAA6iF_4z_MPpU8Eq+i+PT-+VgpX_ZXX5FwOwa2NpLxW_gyzTSg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ePSvhwBQ4T7dJV6ZAXzEKQ8vUnxyXckMqj7JuJ9AaxY=;
        b=xsT5H+U0k19+tYHIhpQhkZjdrx2MF51vRW+qVEQZbkbm1hzEKEKm8f4Gj1v54VIyEC
         oQD+XdCHZNvyGr+dIBAGysJuMoBXke/yicN/lE3xKFUZQObOocJhNyh0ofZBUCfGjyJv
         1FD3+anwnoxnEve0lCp4gjkW6YcdjwbYN93Mg=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

My program use co-threads, because creating and reinitialize thread is
expensive, it first create threads and reuse them. The main thread
will send each co-thread a event (through condition variable)
simultaneously to do task in parallel way. Each co-thread has variety
work-time, let say it can be (in miliseconds) 200ms, 130ms, 317ms,
90ms etc to get result to be consumed by main thread.

Here I did to wake-up all threads in the main thread:

.....
for (i = 0; i < nthread; i++)
    pthread_cond_broadcast(&cond);
wait_all_worker(); /* wait for all worker threads to finish */
get_all_worker_result(); /* get result from all worker thread */
...


And worker-thread routines:

...
for (;;) {
  pthread_mutex_lock();
  pthread_cond_wait();
  pthread_mutex_unlock();

  do_work();
  fill_result();
}
....

My dilema is:

1. What the proper way to the main thread to wait for all co-threads
until finished?
2. After calling pthread_cond_signal() or pthread_cond_broadcast()
followed by sleep()/nanosleep(),
    the condition variable looks like not signaled, (the co-thread
routine doesn't run). What make this?
