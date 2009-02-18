From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: running out of file descriptors
Date: Wed, 18 Feb 2009 07:07:28 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0902180702590.32165@diagnostix.dwd.de>
References: <444391460902152148u11d4a973ka5a630898405d1c6@mail.gmail.com> 
 <3605561d0902152218t431d9edbuf87397bdc9af999@mail.gmail.com> 
 <444391460902152309h179bd75agdded10ca6af135d@mail.gmail.com> 
 <200902160701.14982.eric@cisu.net>  <444391460902160935t5b244463nec095fedc45f3707@mail.gmail.com>
  <18841.56827.356161.98320@cerise.gclements.plus.com>
 <444391460902171051x31c7a307mf5d8a088ecd4f9aa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <444391460902171051x31c7a307mf5d8a088ecd4f9aa@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bryan Christ <bryan.christ@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, 17 Feb 2009, Bryan Christ wrote:

> Thanks Glynn.
>
> Well according to these values I'm only using about 1500 file
> descriptors out of the 560178.
>
If I remember correctly you are using sockets. How many sockets does
your system have in TIME_WAIT? You can check this with 'netstat -nt|wc -l'.
If you open and close TCP sockets at a high rate you will soon find
that you hit a limit here as well.

Holger
