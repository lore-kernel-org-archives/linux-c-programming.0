From: "Uday Karan" <uday.karan@gmail.com>
Subject: Re: Startup function before main.
Date: Mon, 27 Mar 2006 17:31:36 +0530
Message-ID: <4f2e7cd30603270401i51a6c167ncc3d74385b498a7c@mail.gmail.com>
References: <DC91351678E31E4FB24B551221F507EC028D5063@blr-itp-msg.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <DC91351678E31E4FB24B551221F507EC028D5063@blr-itp-msg.wipro.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "krishna.vamsi@wipro.com" <krishna.vamsi@wipro.com>
Cc: linux-c-programming@vger.kernel.org

I really don't understand what is the need to have a
initialization/start up routine before main().  Main is just like any
other function except that it works as a default entry point to which
the glibc start up code makes a call to.

You can have a function main() as your start up routine that calls
your application's main functions app_main() or something similar. 
You can do all your start up code in main itself and then call
app_main().

Simulating what you are trying to achieve here should not be very
difficult.  You can tweak your environment and stuff in main().

On 3/27/06, krishna.vamsi@wipro.com <krishna.vamsi@wipro.com> wrote:
> Hi List,
>
> Before Executing the main function, a startup routine will be executed
> which will set up the initial environment for the process.
>
> This Startup routine will be supplied by the kernel and linked by the
> Linker. My question is : Can we add one more startup routine before
> executing the main program, if yes how??
>
>
> -Vamsi
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
