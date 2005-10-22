From: fabio <fabio@crearium.com>
Subject: displaying time_t values
Date: Sat, 22 Oct 2005 17:27:20 -0600
Message-ID: <435ACAD8.8090909@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

hello,

I would like to know how to display the full seconds and miliseconds 
transacurrent since 2 points in a program.

main()
{
    time_t t1_t2;
    (void)time(&t1);
    cpu_intensive_function();
    (void)time(&t2);
    printf("the full time spent in the process is:");
    // how should i display it ? ej: 51,56745 seconds ot 1024,04546 seconds

}

Thanks,

fabolo
