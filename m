From: "Ramanan, Venkat \(MED\)" <Venkat.ramanan@geind.ge.com>
Subject: RE: Capturing output of a process.
Date: Tue, 23 Dec 2003 04:54:49 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <DD9E117A8BE9F34FA4130376EC9C1F6A08E5CD94@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>, linux-c-programming@vger.kernel.org

Thanks Glynn for the clarification.

Thanks,
Venkat.

-----Original Message-----
From: Glynn Clements [mailto:glynn.clements@virgin.net]
Sent: Thursday, December 18, 2003 7:31 PM
To: Ramanan, Venkat (MED)
Cc: linux-c-programming@vger.kernel.org
Subject: Re: Capturing output of a process.



Ramanan, Venkat \(MED\) wrote:

> I have a newbie question which I am not sure whether it belongs here. 
> But any help will be gratefully appreciated.
> 
> I know the process id of a process and its tty. I want to capture all
> the process's output (stdout and stderr)in a file. Assuming that I
> have root access, how can this be done?

It can't be done. Well, not easily. 

You could modify the kernel (almost anything can be done if you are
willing to modify the kernel). Or you could ptrace() the process and
intercept any system calls which write to the tty.

But there isn't any standard mechanism for "stealing" the data which
is written to a descriptor. Primarily because the kernel would have to
buffer the data until such time that the reader got around to reading
it. In turn, that would require that the kernel could either:

a) buffer an unlimited amount of data, or
b) suspend the writer until the reader removes some of the data from
the buffer.

Most practical solutions involve allocating a pseudo-tty *before*
starting the process whose output is to be logged.

-- 
Glynn Clements <glynn.clements@virgin.net>
