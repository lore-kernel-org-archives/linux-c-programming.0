From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: displaying time_t values
Date: Mon, 24 Oct 2005 12:11:55 +0100
Message-ID: <17244.49531.11868.354784@cerise.gclements.plus.com>
References: <435ACAD8.8090909@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <435ACAD8.8090909@crearium.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fabio <fabio@crearium.com>
Cc: linux-c-programming@vger.kernel.org


fabio wrote:

> I would like to know how to display the full seconds and miliseconds 
> transacurrent since 2 points in a program.
> 
> main()
> {
>     time_t t1_t2;
>     (void)time(&t1);
>     cpu_intensive_function();
>     (void)time(&t2);
>     printf("the full time spent in the process is:");
>     // how should i display it ? ej: 51,56745 seconds ot 1024,04546 seconds
> 
> }

time() only provides second resolution. You need to use gettimeofday()
to get better resolution.

-- 
Glynn Clements <glynn@gclements.plus.com>
