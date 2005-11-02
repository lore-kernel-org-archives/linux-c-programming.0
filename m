From: Rajat Jain <rajat.noida.india@gmail.com>
Subject: Re: Detecting whether a Message Queue with a given qid exists?
Date: Wed, 2 Nov 2005 12:00:50 +0900
Message-ID: <b115cb5f0511011900w73d1f0bej4dc429286a734a76@mail.gmail.com>
References: <b115cb5f0510302311ma397fb1k65ec88a605f33adf@mail.gmail.com>
	 <6a00c8d50510302330m193cdc91v93b745be3b2f456f@mail.gmail.com>
	 <b115cb5f0510312222q14d4d717y5723a75f8848d4d9@mail.gmail.com>
	 <6a00c8d50511010111r23756139i92f675a3a865e69@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50511010111r23756139i92f675a3a865e69@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

>
> Try msgctl with the IPC_STAT command:
>
>        #include <sys/msg.h>
>        int msgctl(int msqid, int cmd, struct msqid_ds *buf);
>
> If the queue ID is not valid this call fails with EINVAL and buf is not filled.
>
>        \Steve
>

Thanks a lot. I think it would solve my problem

:-)
