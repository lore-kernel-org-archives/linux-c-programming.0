From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: How to write apps dependent on external libraries?
Date: Thu, 13 Jul 2006 18:40:40 +0200
Message-ID: <6a00c8d50607130940s5db9d08agd27be1f6031f221@mail.gmail.com>
References: <200607132134.57378.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200607132134.57378.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 7/13/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Often I see apps which are dependent on this .so file or that. I don't know
> how apps can be written that depend on libraries that are not linked into the
> executable. So far I have been linking all needed libraries into the
> executable.
>
> A .so is a collection of what? An .a is a collection of .o-s, right? What is
> a .la? I am so very confused.

An .so file is a shared library, a collection of object files,
allowing executables to be linked against at __runtime__.  They are
called shared objects, because multiple processes can make use of them
without keeping a private copy in their process space.  Additionally,
shared libraries are normaly self contained, which means that they do
not contain references that cannot be resolved at runtime.  For
example, libpng makes use of routines from libz which is loaded at
runtime automatically.  If both libs were static (.a files, yes, a
collection .o files) all programs that depend on those libraries must
be linked against them at __compile time__.  Shared objects are loaded
into memory at runtime on behalf of another shared object ld.so and
ld-linux.so for ELF binaries.

The .la files are used for linking and versioning by libtool and are
created automatically.  It is a simple text file that contains some
important information for both static and shared libraries.

Hope that helped.

	\Steve
