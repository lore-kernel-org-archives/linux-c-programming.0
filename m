From: Manas Garg <mls@chakpak.net>
Subject: Re: recv()
Date: Tue, 27 Aug 2002 09:51:58 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020827095158.A1505@chakpak.com>
References: <LFEIJFMKHCJIHBFOGINPCEIGCHAA.elapus@ntsp.nec.co.jp>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <LFEIJFMKHCJIHBFOGINPCEIGCHAA.elapus@ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-prog <linux-c-programming@vger.kernel.org>

On Tue Aug 27, 2002 at 10:41:01AM -0700, Earl R. Lapus wrote:
>      When calling recv() you specify the maximum data
>      size you want to receive, right? So if the actual data
>      sent at the other end is larger... what happens to the
>      rest of the data? Who manages the data? 

It depends on the type of socket.

In case of TCP, recv() acts on all the data that has been received on
the socket and if it can get all the available data to the user (because
of the size of the buffer supplied to recv()), the remaining data will
be kept in kernel receive buffer for that particular socket.

In case of UDP, recv() acts on the data received in one datagram. If the
kernel can't return all the data of a datagram because of buffer size
constraints, it will discard the rest of the data that came as a part of
that datagram.

All this is clearly mentioned in the man page of recv(2).

/manas
http://www.chakpak.com
