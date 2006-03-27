From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Startup function before main.
Date: Mon, 27 Mar 2006 14:20:09 +0200
Message-ID: <6a00c8d50603270420t472c3aa7ocb27a4af07bdfeed@mail.gmail.com>
References: <DC91351678E31E4FB24B551221F507EC028D5063@blr-itp-msg.wipro.com>
	 <4f2e7cd30603270401i51a6c167ncc3d74385b498a7c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4f2e7cd30603270401i51a6c167ncc3d74385b498a7c@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/27/06, Uday Karan <uday.karan@gmail.com> wrote:
> I really don't understand what is the need to have a
> initialization/start up routine before main().  Main is just like any
> other function except that it works as a default entry point to which
> the glibc start up code makes a call to.
>
> You can have a function main() as your start up routine that calls
> your application's main functions app_main() or something similar.
> You can do all your start up code in main itself and then call
> app_main().
>
> Simulating what you are trying to achieve here should not be very
> difficult.  You can tweak your environment and stuff in main().

init-like constructors can be very helpful in some situations, like
profiling.  It allows for preparation of the environment, loading of
libraries and the like.  Doing that when main() has already been
called is not sufficient in these cases.

	\Steve
