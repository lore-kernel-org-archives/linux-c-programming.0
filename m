From: "Joel M. Pareja" <jpareja@ntsp.nec.co.jp>
Subject: C coding convention
Date: Fri, 16 Dec 2005 10:12:43 +0800
Message-ID: <1134699163.5461.19.camel@silver.hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: C programming list <linux-c-programming@vger.kernel.org>

Hi!

I just would like to hear ideas about a convention that my boss is
insisting on being implemented which I personally disagree.

Putting opening/closing brackets for case statements:

  switch (type)
  {
    case 1:
=>  {
      /* do something */
      break;
=>  }

    ....

    default:
    {
      /* do something */
      break;
    }
  }

*I am aware that this is just a very small thing to argue. :-)

If you agree with my boss, could you point to me open source projects
that use this convention.

Thanks.


