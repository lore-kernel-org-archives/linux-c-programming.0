From: kaushal <kaushal@rocsys.com>
Subject: Re: displaying time_t values
Date: Mon, 24 Oct 2005 12:36:54 +0530
Message-ID: <1130137614.3683.24.camel@kaushal>
References: <435ACAD8.8090909@crearium.com>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <435ACAD8.8090909@crearium.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fabio <fabio@crearium.com>
Cc: linux-c-programming@vger.kernel.org


In case u find the function is over in shorer time,simply run the same
function in a loop for n times and later divide the total time by n.Hope
that was useful.
On Sat, 2005-10-22 at 17:27 -0600, fabio wrote:
> hello,
> 
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
> 
> Thanks,
> 
> fabolo
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

