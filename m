From: krzaq <krzakers@gmail.com>
Subject: Re: open() and read() a file from sysfs
Date: Tue, 1 Mar 2005 09:58:20 +0100
Message-ID: <2ab8d39a05030100582e47df30@mail.gmail.com>
References: <2ab8d39a050228061825dda7fe@mail.gmail.com>
	 <4223C2C2.9070101@laposte.net>
Reply-To: krzaq <krzakers@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4223C2C2.9070101@laposte.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Tue, 01 Mar 2005 02:17:54 +0100, simon <simon.guinot@laposte.net> wrote:
> hello
> 
> krzaq wrote:
> > Hi all!
> >
> > I have a basic question with file opening.
> > I would like to make use of the data accessed from i2c sensors through sysfs.
> >
> > Here's the code:
> >
> > fd = open(/sys/bus/i2c/.../temp2_input,O_RDONLY);
> >
> > while(1) {
> >   char[64] buf;
> >   read(fd,buf,siezof(buf));
> >   ...
> >   do_something
> >   ...
> >   sleep(5);
> > }
> >
> > The thing is I always get the same reading in each read() :(.
> > When I do:
> > # cat /sys/bus/i2c.../temp2_input
> > I see that the temperature is changing, but my code still displays the
> > same reading.
> ok... i suggest you to read the return value of read...
> in your code, you can't see if an error append...
> reinit your buffer with memset can be a good idea...
> in your programm, we can imagine a first correct read, a second who
> return an error... you don't detect it... and you read an unchanged
> buffer...
> ok that's not your only problem...
This was kinda  'pseudo code'. The real program checks all errors
including what read()
returns and OFCOURSE it has lseek() (sorry about the confusion).
Anyway the code runs without errors, but still it doesn't get updated values.

Now for the fun part. 
There are two softwares displaying system information (including i2c reads):
- torsmo
- gkrellm

I looked at the code of both. Torsmo open()'s i2c devices and then
sequentially read()'s
them lseek()'ing to the begining (exaclty what I was trying to do). 
With linux - 2.6.10 it doesn't update the values!
It's been reported as a bug on sf homepage of this project.

Gkrellm, which is a much more advanced project, displays updated
readings. After poking around with source I saw, that they are
re-open()ing each file (sensor) they want to read() :).

Since I do not have 2.6.9 anymore, I will have to download it and
check if read()'ing and
lseek()'ing on one opened file is working there.

-- 
Regards
Karol Krzak
