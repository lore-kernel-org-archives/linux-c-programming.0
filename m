From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: timer
Date: Thu, 30 Sep 2004 12:38:28 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040930113828.38966.qmail@web52906.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-195017930-1096544308=:38329"
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux prg <linux-c-programming@vger.kernel.org>

--0-195017930-1096544308=:38329
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Id: 
Content-Disposition: inline

 Note: forwarded message attached. 

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
--0-195017930-1096544308=:38329
Content-Type: message/rfc822

X-Apparently-To: ankitjain1580@yahoo.com via 206.190.39.181; Thu, 30 Sep 2004 03:40:00 -0700
X-Originating-IP: [206.190.39.181]
Return-Path: <>
Received: from 206.190.39.181  (HELO web52904.mail.yahoo.com) (206.190.39.181)
  by mta185.mail.dcn.yahoo.com with SMTP; Thu, 30 Sep 2004 03:40:00 -0700
Date: 30 Sep 2004 10:39:59 -0000
From: MAILER-DAEMON@yahoo.com
To: ankitjain1580@yahoo.com
Subject: failure delivery
Content-Length: 2044

Message from  yahoo.com.
Unable to deliver message to the following address(es).

<George.K.Huber@us.army.mil>:
143.69.243.33 does not like recipient.
Remote host said: 452 4.2.1 Mailbox temporarily disabled: George.K.Huber@us.army.mil
Giving up on 143.69.243.33.
I'm not going to try again; this message has been in the queue too long.

--- Original message follows.

Return-Path: <ankitjain1580@yahoo.com>
Message-ID: <20040929093959.70767.qmail@web52904.mail.yahoo.com>
Received: from [202.164.100.133] by web52904.mail.yahoo.com via HTTP; Wed, 29 Sep 2004 10:39:58 BST
Date: Wed, 29 Sep 2004 10:39:58 +0100 (BST)
From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: RE: timer->result
To: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
In-Reply-To: <E3E30069B061524E90BCEE4417E30661138539@monm207.monmouth.army.mil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

first of all thanks for help

 --- "Huber, George K RDECOM CERDEC STCD SRI"
<George.K.Huber@us.army.mil> wrote: 
> Ankit wrote:
> 
> > #include<stdio.h>
> > #include<sys/time.h>
> > #include<time.h>
> 
> > int main(void)
> > {
> >         struct timeval t1,t2,result;
> >         gettimeofday(&t1,NULL);
> >         usleep(500);
> >         gettimeofday(&t2,NULL);
> >         timersub(&t2,&t1,&result);
> >         printf("%ld",result.tv_usec);
> >}
> >now technically i feel it should display 500
> >microsecond even not accurate then also it should
> show
> >near by 500 or less than 600 microsecond atleast.
> 
> Why?
> 
> A quick glance at the man page for usleep reveals:
> 
> "BUGS
> 
>  Probably not acurate on many machines down to the 
>  microsecond.  Count on precision only to -4 or
> maybe
>  -3.
> "
> 
> You may want to try using  `nanosleep', but first
> read
> the man-page, paying close attention to the BUGS
> section.
> 
> Also the first sentence from the DESCRIPTION section
> is 
> particularly informative:
> 
> "nanosleep delays the exection of the program for at
> 
>  least the time specified in *req."
> 
> 
> Something else to consider.  Linux is a
> multi-tasking operating 
> system, meaning that while your process is sleeping
> it is swapped 
> out an another process executed.  As an example,
> consider the 
> following program:
> 
> #include <time.h>
> #include <stdio.h>
> #include <sys/time.h>
> #include <unistd.h>
> 
> /* this program must be linked with librt */

as u said to link it.... can u tell me the linker or
compiler options needed?


> 
> int main(int argc, char** argv)
> {
>    long              timediff;
>    struct timespec   tpstart;
>    struct timespec   tpend;
>    struct timeval    tpsleep;
> 
>    tpsleep.tv_sec = 0;
>    tpsleep.tv_usec = 100;
> 
>    clock_gettime(CLOCK_REALTIME, &tpstart);
> 
>    select(0, NULL, NULL, NULL, &tpsleep);
> 
>    clock_gettime(CLOCK_REALTIME, &tpend);
> 
>    timediff = MILLION*(tpend.tv_sec -
> tpstart.tv_sec) + 
>                       (tpend.tv_nsec -
> tpend.tv_nsec) / 1000;
> 
>    printf("Select took %ld micorseconds\n",
> timediff);
> }
> 
> On my system this returned the following values:
> 
> Select took 1444 micorseconds
> Select took 467 micorseconds
> Select took 15983 micorseconds
> Select took 14589 micorseconds
> Select took 8730 micorseconds
> Select took 21619 micorseconds
> Select took 13304 micorseconds
> Select took 8764 micorseconds
> Select took 21604 micorseconds
> Select took 7117 micorseconds
> 
> Look at the large differences in the reported time. 
> I would suspect that 
> for the large differences another process was
> swapped in and ran for its 
> alotted `quanta'.  Maybe if this process was
> switched to a higher priority
> the timing values would be different.
> 
> Just out of curosity? what are you trying to do?
> 
> George
> 
> 
>    
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
>  

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html

--0-195017930-1096544308=:38329--
