From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: File size events.
Date: Mon, 13 Sep 2010 17:52:35 +0000 (GMT)
Message-ID: <alpine.LRH.2.00.1009131750110.25981@praktifix.dwd.de>
References: <AANLkTin9vEu5ouV6Qopk7U_zG8=Z_gwHebZsZxxUzjXh@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTin9vEu5ouV6Qopk7U_zG8=Z_gwHebZsZxxUzjXh@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Mon, 13 Sep 2010, ratheesh k wrote:

> I have an application which keep on writing to one file /tmp/rat.txt.
> I would like to handle an event when the file size exceed 20kb . How
> to get this event ? Is there an event chain , i could register with ?
> is there any other easy mechanism ?
>
See inotify. This will not tell the size, just the event when someone
writes to the file. The size you can then get with stat() or fstat().

Holger
