From: "Chris Nanakos" <nanakos@wired-net.gr>
Subject: Re: stdio
Date: Wed, 18 Jun 2003 21:30:11 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <003c01c335c7$a7f437b0$3d6405d5@carlos>
References: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Received: from carlos (ppp100-61-gw04.athens.access.acn.gr [213.5.100.61])
	by enigma.wired-net.gr (******/******) with SMTP id h5IIbK4x006504;
	Wed, 18 Jun 2003 21:37:20 +0300
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John T. Williams" <jtwilliams@vt.edu>, linux-c-programming <linux-c-programming@vger.kernel.org>

Try this.....and make your own changes....if helps just send an e-mail!!!

#This is a progress bar with iterations
#A lot of implementations can exist.Try this one and tell me if its done or
else i will send another one.

#include <stdio.h>

main()
{
    int progress,j;
    progress=1;
    for(j=0;j<=100;j++)
{
    if(progress(!=101)
{int i;
printf("\33[1;34m");
    printf("\r|");
for(;i<50;i++)
    fprintf(stdout," ");
fprintf(stdout,"%6.2f %%",(float)2.5*progress);
fflush(stdout);
    progress++;
}
usleep(40000);
}
printf("\33[0m");
printf("\n");
return;
}



