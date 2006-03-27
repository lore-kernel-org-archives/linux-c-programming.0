From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Startup function before main.
Date: Mon, 27 Mar 2006 13:48:16 +0200
Message-ID: <6a00c8d50603270348j3966c663w3ff789c809e65228@mail.gmail.com>
References: <DC91351678E31E4FB24B551221F507EC028D5063@blr-itp-msg.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <DC91351678E31E4FB24B551221F507EC028D5063@blr-itp-msg.wipro.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/27/06, krishna.vamsi@wipro.com <krishna.vamsi@wipro.com> wrote:
> Hi List,
>
> Before Executing the main function, a startup routine will be executed
> which will set up the initial environment for the process.
>
> This Startup routine will be supplied by the kernel and linked by the
> Linker. My question is : Can we add one more startup routine before
> executing the main program, if yes how??

No, not programmatically, only by patching the executable or object file.
You can call other functions from within the constructor:

	void __attribute__ ((constructor)) my_ctor() {
		int i = my_func();
	}

You should not need a second constructor.  Who shall decide which one
comes first and how should it be done?

	\Steve
