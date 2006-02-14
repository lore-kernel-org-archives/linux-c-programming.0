From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Socket and STDIN pooling
Date: Tue, 14 Feb 2006 07:36:07 +0100
Message-ID: <6a00c8d50602132236l2c7e5337v471ca48c8b8a4f79@mail.gmail.com>
References: <43F16A09.8070807@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43F16A09.8070807@hq.ntsp.nec.co.jp>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 2/14/06, Lejanson C. Go <lejanson@ntsp.nec.co.jp> wrote:
> Hi,
>
> I have a question about pooling 2 sockets and stdin.

I suppose you mean "polling".

> I am currently making an application which accepts
> input from the stdin.
>
> It had a connection to a server connecting to 2ports.
> If for example the stdin is a blocking descriptor and
> the 2 other descriptors are to be checked real time
> how can it be done without using threads?

See (p)select(2) and poll(2) system calls.  Numerous examples on how
to utilize both functions can be found in the Net.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
