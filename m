From: "Holy Aavu" <holyaavu@gmail.com>
Subject: Re: Virtual Serial Port
Date: Mon, 27 Mar 2006 16:55:22 +0530
Message-ID: <bd7767e40603270325g71d39837if3bca8a05be39ace@mail.gmail.com>
References: <442582B8.8040403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <442582B8.8040403@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mikado4vn@gmail.com
Cc: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/25/06, Mikado <mikado4vn@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> My machine has only one serial port. Now I want to add more *software*
> (virtual) serial ports. I also want to make a virtual serial cable
> between a real serial port and a virtual one OR between virtual ports.
> Is there any way to solve that problem in our universe?

I have a doubt... I am not sure if you can have a full working
solution to make all programs run using the virtual serial ports.
Because, there *might* be some programs which actually use the 'in'
and 'out' instructions of the processor directly from a user space
program. (After calling iopl/ioperm etc to elevate their I/O
privileges to directly use the IO ports) I dont think even a kernel
change can help in that case...

Is my understanding correct or am I missing something?

>
> Thanks,
> Mikado.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.2.2 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>
> iD8DBQFEJYK3NWc9T2Wr2JcRAro+AKCMMf5So3sPJ+gXzSN+eYk0RXBxsQCg2V6I
> UK2pvLjQIECVc3e1//7d0WE=
> =GroY
> -----END PGP SIGNATURE-----
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
