From: "qhwang" <qhwang@ieeta.pt>
Subject: Re: out of memory
Date: Wed, 8 Oct 2003 16:07:29 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <008901c38dad$e7ba22e0$70ab88c1@ieeta.pt>
References: <31E38B53D182D51195FA00508BE3A33402CE4C9B@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi, there

Below is the relevant piece of code. The main loop


 for(i=0;i<(rows-32);i++)
   for(j=0;j<(cols-32);j++) {
     GetSubWindow(image,win,i,j,cols,32,32);
     detectiontest(win, w, tol, nvar,MU,SI,PS,ES,MUT,SIT,PST,EST,32); //the
statistical learning algo
    ...
   }

in detectiontest
...
    do
    {
       /* EM algorithm */
       p1=1.0;
       p1*=emhht(w,P,MU,SI,PS,ES);

       /* check convergence */
       temp=computeerr(...);
       ...
      }
    while(temp > tol);
...

There are lot of memory allocation in function emhht but they are well
conducted. There should be no problem with it.

Any suggestion?


