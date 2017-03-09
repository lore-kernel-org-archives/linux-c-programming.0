From: Celelibi <celelibi@gmail.com>
Subject: Re: Where to start C-programming open source?
Date: Thu, 9 Mar 2017 01:39:07 +0100
Message-ID: <CAJR2zJ9=i_o7sNVAeSwxEts9B=G3PjX=BsPpidVvbOUZbO+-Rw@mail.gmail.com>
References: <ba6df9f8-661a-e935-2e81-c998fe4a4aa6@cprasmussen.dk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=5pQDFySden4hLRhTE+rRgYTxysKLiHA70k8MicSN5tY=;
        b=PtUpSCedRl2uxsHKe1pZrOvThsnhcEeCiJP/TfFyuoRxl2Zg+AaGbPAxebwoJaalKd
         dCmqRMeHTtW+u+sjp+0dwuBw4+9anMWARTfXscUfpqH5QJ6lF0i335qIohvKVVH4uysH
         qV6R7Q4M7HaLQ8B/KSYRwiykHCPxO/8mnv+V/zji1mHqNykDjMLk7rWH/aUTcXGr8Kse
         3i7rihMnZ+2MrkxTN4Uk2OsoAJhvSGDNtMsg8tnsYK2seBONaDvNbfHVwWhhpS9CQOjz
         h2VzkQNJYYRRQ5NvI8dVXmEYNNXAzxebg41lOIjEvwCQq6IVIhPzx5ku5v3vDwQZ0SKm
         b/Qw==
In-Reply-To: <ba6df9f8-661a-e935-2e81-c998fe4a4aa6@cprasmussen.dk>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carsten Peter Rasmussen <mail@cprasmussen.dk>
Cc: linux-c-programming@vger.kernel.org

2017-03-03 17:05 UTC+01:00, Carsten Peter Rasmussen <mail@cprasmussen.dk>:
> Hi C-programming list
>
> It's awfully quite here, I wonder if I'm even in the right place!?
> I have been a programmer for many year, and dabbled in many different
> development areas, but I really want for participate in a open source
> project by developing C. I have looked over a number of mailing lists
> like Git, Samba, Vim etc. And every time I think "Wow, these guys are
> really smart, this is out of my league" - so how does one start?
>
> Any comments and advice on getting started in OS with C is greatly
> appreciated.
>
> - Carsten

It indeed is quiet. But there are still some readers. :)

I'll give an answer with a more top-down approach.

C is not the simplest language to use. It's a bit low level, so you
have to think about a lot details in addition to your main high-level
goal. (It's not as bad as C++ though.) You have for instance to always
keep in mind what variable is a struct, a pointer or an integer so
that you can use it correctly.

If you come from higher level languages, I'd advice against starting C
with OS development. OS dev is hard and mistakes can be a real hell to
track. Believe me, even when you have qemu + gdb, you'll miss the
times when you had a "segmentation fault" instead of a still running
program, you'll miss the time when the hard-to-get-right portions of
code were hidden inside syscalls.

Even if you're interested in low level stuff, I still think you should
first follow the rules, then understand the rules, to finally break
the rules.
So I'd say to start with a toy project, just to get used to the
syntax, like a tic-tac-toe for two players, and replace one of them
with a brut-force AI. Nothing fancy.
Then start playing with the facilities provided by the kernel, like
files (open, seek, read, write, close), processes (fork, execve,
shared memory), signals, memory allocation (mmap, malloc/sbrk), pipes,
sockets, threads.
In the meantime you can try to contribute more-or-less small stuff to
projects you use. You should make an habit of reporting the bugs you
find in the software you use if you're not doing it already. And when
it's not too complex for you, you could go all the way to propose a
patch. I learned a lot by reading other people's code.
And when you're pretty ok with those, you can finally take a leap of
faith into OS dev. But OS dev isn't only about rolling your own
kernel. You can contribute to existing kernel/OS projects or
contribute to side projects like bootloaders.

An answer wouldn't be complete if it didn't mention things like
arduino (or other boards) where you can write some code to drive the
hardware. Much like a kernel, except that the driven hardware is
usually pretty simple, and you usually don't provide high-level
abstractions like processes or file descriptors. That's the other end
of the spectrum.


Celelibi
