From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Does GCC link only used functions?
Date: Sun, 29 Jan 2006 17:23:44 +0100
Message-ID: <6a00c8d50601290823g6f13fcdcw84f193881d735e4d@mail.gmail.com>
References: <200601291438.17093.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200601291438.17093.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 1/29/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Hello list. I am relative newbie to GCC.
>
> I have a C program which #includes a header file which in turn #includes many
> other header files. These header files are part of an open source library set
> I got from the net.
>
> Now I do not use all the functions in the various libraries, but the makefile
> which came with the library of course has compile instructions for all the
> libraries. I have modified the makefile to compile my program using those
> libraries, but I did not remove the references to the libraries I knew I did
> not use, for I feared that some error may be caused.
>
> But later I experimented removing some of the superfluous ones from the
> makefile and again "make"-d, and I got the same size executable as before.
>
> So does this mean that GCC links only those functions from a library which I
> call directly or indirectly through another called function in the course of
> my program?

Yes,  everything not needed for program execution is simply dropped in
the stage of linking.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
