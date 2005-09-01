From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Shared Object
Date: Thu, 1 Sep 2005 07:57:37 +0200
Message-ID: <6a00c8d505083122576fa92808@mail.gmail.com>
References: <4316802D.4030309@effigent.net>
	 <6a00c8d5050831222433e20d63@mail.gmail.com>
	 <43168ED6.4060204@effigent.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43168ED6.4060204@effigent.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: raja <vnagaraju@effigent.net>
Cc: linux-c-programming@vger.kernel.org

On 9/1/05, raja <vnagaraju@effigent.net> wrote:
> Thank you so much,
> I need the list of files that in the shared object.I think it is not
> possible with nm or objdump.

I suppose you want to list object files that are imported by a certain
object file.  This is what ldd does.  Example:

        % ldd myapp
        libpthread.so.0 => (0x4002d000)
        libmysharedlib.so => (0x40042000)
        libc.so.6 => (0x4005b000)
        ld-linux.so.2 => (0x40000000)
        ...

An object file does not contain other object files, but references to
dependent libraries.  Hope this is what you're looking for.

Regards

        \Steve


> Steve Graegert wrote: 
> On 9/1/05, raja <vnagaraju@effigent.net> wrote:
 
> Hi,
 Can anyone help me how to see list of object files that are in a
shared
> object.(.so file)
 
> You probably mean listing all symbols exported by an object file. If
so, try
> nm, objdump and their friends.
