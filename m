From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Capturing output of a process.
Date: Fri, 19 Dec 2003 01:31:20 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16354.21736.871304.763744@cerise.nosuchdomain.co.uk>
References: <DD9E117A8BE9F34FA4130376EC9C1F6A08D3EE71@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <DD9E117A8BE9F34FA4130376EC9C1F6A08D3EE71@BANMLVEM01.e2k.ad.ge.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ramanan, Venkat (MED)" <Venkat.ramanan@geind.ge.com>
Cc: linux-c-programming@vger.kernel.org


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
