From: Fabio Andres Miranda <fabiomiranda@racsa.co.cr>
Subject: threads
Date: Sun, 06 Nov 2005 00:17:28 -0600
Message-ID: <436D9FF8.1000902@racsa.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Why these threads are not executed:


main(){
    pthread threads_array[25];
    pthread_attr_init(&attr);
    for (i=0;i<25;i++)
        if ( pthread_create(threads_array[i],&attr,pthread_routine,(void 
*)i) ){
            perror("pthread_create");
        }
    while(1);
}


void
pthread_routine(void *arg){
    printf("hello world\n");
}

$./a.out
$

I read somethg about the initial state is suspended, smthg like that, 
how to execute the thread as created then?

Thanks

fabiolini
