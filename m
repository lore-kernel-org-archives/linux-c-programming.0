From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: how to read a constantly changing file
Date: Wed, 5 Jun 2002 17:12:35 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15614.14451.263787.449323@cerise.nosuchdomain.co.uk>
References: <20020604095456.GA1012@cam.ac.uk>
	<Pine.LNX.4.33.0206051702360.1073-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0206051702360.1073-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> > > I want to know how can I read a file (through a C code) which is 
> > > constatnly changing, like a log file.(eg tail command)
> > 
> > As far as I can make out, tail does it by sitting in a loop
> > and calling sleep(1), and then fstat() to see if the file's grown.
> 
> That's ok but it is not feasible to open a file every time it changes, go 
> to the last bytes which appended to the file and print it (tail command) 
> especially when the filesize is bigger (eg log file). There must be some 
> other method.

Who said anything about repeatedly opening it? Just keep reading the
file; if you hit EOF, sleep for a while, then continue. E.g.

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv)
{
	int fd;

	if (argc != 2)
	{
		fprintf(stderr, "usage: %s <filename>\n", argv[0]);
		return 1;
	}

	fd = open(argv[1], O_RDONLY);
	if (fd < 0)
	{
		perror("open");
		return 1;
	}

	if (lseek(fd, 0, SEEK_END) < 0)
	{
		perror("lseek");
		return 1;
	}

	for (;;)
	{
		char buff[0x10000];
		int n = read(fd, buff, sizeof(buff));
		if (n < 0)
		{
			perror("read");
			break;
		}
		if (n == 0)
		{
			sleep(1);
			continue;
		}
		if (write(STDOUT_FILENO, buff, n) < 0)
		{
			perror("write");
			break;
		}
	}

	return 1;
}

-- 
Glynn Clements <glynn.clements@virgin.net>
