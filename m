From: simon <simon.guinot@laposte.net>
Subject: Re: open() and read() a file from sysfs
Date: Tue, 01 Mar 2005 02:17:54 +0100
Message-ID: <4223C2C2.9070101@laposte.net>
References: <2ab8d39a050228061825dda7fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <2ab8d39a050228061825dda7fe@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: krzaq <krzakers@gmail.com>, linux-C-programming <linux-c-programming@vger.kernel.org>

hello

krzaq wrote:
> Hi all!
> 
> I have a basic question with file opening.
> I would like to make use of the data accessed from i2c sensors through sysfs.
> 
> Here's the code:
> 
> fd = open(/sys/bus/i2c/.../temp2_input,O_RDONLY);
> 
> while(1) {
>   char[64] buf;
>   read(fd,buf,siezof(buf));
>   ...
>   do_something
>   ...
>   sleep(5);
> }
> 
> The thing is I always get the same reading in each read() :(.
> When I do:
> # cat /sys/bus/i2c.../temp2_input
> I see that the temperature is changing, but my code still displays the
> same reading.
ok... i suggest you to read the return value of read...
in your code, you can't see if an error append...
reinit your buffer with memset can be a good idea...
in your programm, we can imagine a first correct read, a second who 
return an error... you don't detect it... and you read an unchanged 
buffer...
ok that's not your only problem...

try something like that :

char buf[SIZE];
int fd;

if ((fd = open(/sys/bus/i2c/.../temp2_input,O_RDONLY)) == -1)
{
	perror ("open ()");
	return (-1);
}
while (1)
{
	memset (buf, 0, SIZE);
	if (read (fd, buf, SIZE) != SIZE)
	{
		fprintf (stderr, "bad read size... bla bla\n");
		return (-1);
	}
	...
	do what you want
	...
	lseek (buf, 0, SEEK_SET);
}

lseek is possible as files in /sys are specials... open, read and write 
methods are directly handle by drivers...
don't expect to do that with classic files

simon
