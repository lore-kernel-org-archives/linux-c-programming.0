From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Check if a process exists?
Date: Tue, 1 Mar 2005 08:35:44 +0000 (GMT)
Message-ID: <Pine.LNX.4.61.0503010832470.5662@praktifix.dwd.de>
References: <7728232c050301001710a2787@mail.gmail.com>
Mime-Version: 1.0
In-Reply-To: <7728232c050301001710a2787@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, 1 Mar 2005, Hareesh Nagarajan wrote:

> Hi,
>
> Can a process check if a given PID exists or not? In other words can a
> process check if an unrelated process is alive? Is there any system
> call that does this?
>
Use kill() with a second argument being zero.

     if (kill(pid, 0) == -1)
     {
        /* Process is not there. */
     }
     else
     {
        /* Process is alive. */
     }

Holger
