From: Steve Graegert <graegerts@gmail.com>
Subject: Re: argv[0]
Date: Fri, 13 Jan 2006 13:26:44 +0100
Message-ID: <6a00c8d50601130426u2a9640evc14ee8c3d61c7925@mail.gmail.com>
References: <200601130016.23410.a.biardi@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200601130016.23410.a.biardi@tiscali.it>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 1/13/06, a.biardi@tiscali.it <a.biardi@tiscali.it> wrote:
>
> Hi,
>
> Is there any C function that can tell me what argv[0] is, outside
> main()?
>
> I thought to use getpid() and then look at /proc/<pid>/cmdline but
> doesn't seem portable. Any hints?

The arguments are pushed on the stack upon process creation.  Once the
process is running there is little chance to get hands on them except
for the /proc approach.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
