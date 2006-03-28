From: "Holy Aavu" <holyaavu@gmail.com>
Subject: Re: Virtual Serial Port
Date: Tue, 28 Mar 2006 11:23:05 +0530
Message-ID: <bd7767e40603272153n7073ae1eyb76bcfdbda3ae276@mail.gmail.com>
References: <442582B8.8040403@gmail.com>
	 <bd7767e40603270325g71d39837if3bca8a05be39ace@mail.gmail.com>
	 <17448.8455.670409.748372@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17448.8455.670409.748372@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: mikado4vn@gmail.com, linux-c-programming@vger.kernel.org

On 3/27/06, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Holy Aavu wrote:
>
> > > My machine has only one serial port. Now I want to add more *software*
> > > (virtual) serial ports. I also want to make a virtual serial cable
> > > between a real serial port and a virtual one OR between virtual ports.
> > > Is there any way to solve that problem in our universe?
> >
> > I have a doubt... I am not sure if you can have a full working
> > solution to make all programs run using the virtual serial ports.
> > Because, there *might* be some programs which actually use the 'in'
> > and 'out' instructions of the processor directly from a user space
> > program. (After calling iopl/ioperm etc to elevate their I/O
> > privileges to directly use the IO ports) I dont think even a kernel
> > change can help in that case...
> >
> > Is my understanding correct or am I missing something?
>
> 1. Any such programs will only work with "PC-style" serial ports (8250
> and compatible UARTs); they won't work with other serial hardware
> (e.g. multi-port serial cards). Also, such programs would require root
> privilege. Consequently, most programs which use serial ports limit
> themselves to using the /dev/tty* devices and their associated ioctl()
> calls.
>
> 2. You could change the iopl() system call so that it doesn't affect
> the IOPL bits in the EFLAGS register. Instead, you would handle the
> resulting exceptions, trapping attempts to access the UARTs and
> redirecting them to the "virtual UART" driver. The ioperm() system
> call would need similar modifications.
>

Thanks Glynn, that explains a lot!

> --
> Glynn Clements <glynn@gclements.plus.com>
>
