From: Steve Graegert <graegerts@gmail.com>
Subject: Re: hi
Date: Mon, 11 Jul 2005 10:20:51 +0200
Message-ID: <6a00c8d5050711012043748fd7@mail.gmail.com>
References: <42D20FC4.8090401@effigent.net>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42D20FC4.8090401@effigent.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: raja <vnagaraju@effigent.net>
Cc: linux-c-programming@vger.kernel.org

On 7/11/05, raja <vnagaraju@effigent.net> wrote:
> hi,
>    How can i get the list of the arguments in a function.Is there any
> possible way to get the list?

No, there is not.  At least there is no easy way.  What you are
looking for is the functionality provided by the nm and objdump
utilities (see binutils).  They examine certain sections of
executables and object files to obtain information about symbols and
the like.  Unfortunately, there is no API to make use of it.  Modern
"higher level" languages like Java and C# (and .NET in general)
provide mechanisms collectively known as reflection that allow users
to query type information, call methods and constructors dynamically,
etc. at run-time.  The C programming language does not know such
thing.


Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
