From: Steve Graegert <graegerts@gmail.com>
Subject: Re: threads
Date: Sun, 6 Nov 2005 09:41:18 +0100
Message-ID: <6a00c8d50511060041o4ddfd20fj41a088ed1037922d@mail.gmail.com>
References: <436D9FF8.1000902@racsa.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <436D9FF8.1000902@racsa.co.cr>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Andres Miranda <fabiomiranda@racsa.co.cr>
Cc: linux-c-programming@vger.kernel.org

On 11/6/05, Fabio Andres Miranda <fabiomiranda@racsa.co.cr> wrote:
> Why these threads are not executed:
>
>
> main(){
>     pthread threads_array[25];
>     pthread_attr_init(&attr);
>     for (i=0;i<25;i++)
>         if ( pthread_create(threads_array[i],&attr,pthread_routine,(void
> *)i) ){
>             perror("pthread_create");
>         }
>     while(1);
> }
>
>
> void
> pthread_routine(void *arg){
>     printf("hello world\n");
> }

Fabio,

This code will not even compile.  I suppose you did not post the
complete program.  Anyway, there are at least two points (probably
more) broken in your code:

1.  You have to provide pthread_create a pointer to the thread_t object:

	pthread_create(&threads_array[i], ...);

2.  The thread function needs to be a pointer to a function:

	void *pthread_routine(void *arg);

3.  Omit the while statement, since the program will run forever,
although all threads have finished.

Try this:

#include <pthread.h>

void *pthread_routine(void *arg);
pthread_attr_t attr;

main(){
   pthread_t threads_array[25];
   pthread_attr_init(&attr);

   int i;
   for (i=0;i<25;i++)
       if ( pthread_create(&threads_array[i],&attr,pthread_routine,(void
*)i) ) {
           perror("pthread_create");
       }
   while(1);
}


void *pthread_routine(void *arg){
   printf("hello world\n");
}

	\Steve
