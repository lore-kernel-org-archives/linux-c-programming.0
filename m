From: Mehmet Tek <mtek@ade.com>
Subject: Thread causing memory leaks...
Date: Fri, 19 Aug 2005 13:37:01 +0000 (UTC)
Message-ID: <loom.20050819T152650-168@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi all,

After debugging for a number of hours, I found out that the very basics of my 
thread usage is causing memory leaks. (I checked it with mtrace and valgrind, 
they both say that there is memory leak.)

I have a very simple program below that leaks memory. Can anyone tell me if I 
am doing sth wrong, or is it actually some bug in the native thread 
implementation?

Any feedback would be appreciated...

Thanks,
Mehmet

PS: I am using Linux 2.4.21 (SuSE 9.0) with gcc 3.3.1 on a AMD64 machine.

===========================================================================

#include <iostream>
#include <pthread.h>
#include <mcheck.h>

using namespace std;

void *thFunction(void *arg) {

  cout << " Thread started"  << endl;

  cout << " Thread ending"  << endl;

  return NULL;

}

int main() {

  pthread_t  th;

  //  mtrace();

  cout << " Spawning the thread" << endl;

  pthread_create(&th, NULL, thFunction, NULL);

  pthread_join(th, NULL);

  //  muntrace();

  return 0;
}


