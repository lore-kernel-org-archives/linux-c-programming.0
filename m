From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: specifying process priority
Date: Mon, 25 Aug 2003 01:52:21 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000c01c36acd$0d5d15b0$ed64a8c0@descartes>
References: <Pine.GSO.4.56.0308242242470.24177@uni01du.unity.ncsu.edu>
Reply-To: "John T. Williams" <jtwilliams@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Palash Mohanlal Kasodhan <pmkasodh@unity.ncsu.edu>, linux-c-programming@vger.kernel.org

There are two functions you might want to look at

setpriority and nice
just read the man pages
man 2 nice  and man 2 setpriority








----- Original Message ----- 
From: "Palash Mohanlal Kasodhan" <pmkasodh@unity.ncsu.edu>
To: <linux-c-programming@vger.kernel.org>
Sent: Sunday, August 24, 2003 10:47 PM
Subject: specifying process priority


> Hi:
>     Is there a way to specify the priority of a process you are creating
> by fork() besides using the 'nice' command..more specifically an API call
> to specify the priority at the time of creating a process ..like an RTOS
>
>
> thanks
>
> palash
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

