From: "Ardhan Madras" <ajhwb@knac.com>
Subject: Re: File size events.
Date: Thu, 16 Sep 2010 20:29:00 -0700
Message-ID: <20100916202900.DCECDBA@resin07.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: ratheesh.ksz@gmail.com, linux-c-programming@vger.kernel.org

        I think inotify kernel support will help if there is another app that watch for event and check the /tmp/rat.txt size each event occurred, additional synronization most likely needed between them. I guess you are talking about `log' like file on a limited disk space, You need to prevent the file's size get bigger than 20k maybe by make empty the file. I prefer the app that keep writing on that file also manage file size each write and do assigned work when file size hit it's limit.

        Ardhan


--- Holger.Kiehl@dwd.de wrote:

From:	Holger Kiehl <Holger.Kiehl@dwd.de>
To:	ratheesh k <ratheesh.ksz@gmail.com>
cc:	linux-c-programming@vger.kernel.org
Subject: Re: File size events.
Date:	Mon, 13 Sep 2010 17:52:35 +0000 (GMT)

On Mon, 13 Sep 2010, ratheesh k wrote:

> I have an application which keep on writing to one file /tmp/rat.txt.
> I would like to handle an event when the file size exceed 20kb . How
> to get this event ? Is there an event chain , i could register with ?
> is there any other easy mechanism ?
>
See inotify. This will not tell the size, just the event when someone
writes to the file. The size you can then get with stat() or fstat().

Holger
--
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html




_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
