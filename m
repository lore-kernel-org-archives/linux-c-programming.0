From: Thomas Ackermann <Thomas.Ackermann@eWave.at>
Subject: having probs with files > 2G
Date: Fri, 24 May 2002 16:41:23 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CEE5113.1000702@eWave.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050600060602040907040400"
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------050600060602040907040400
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi!
i hope i'm not off topic with this, but, i'having problems with some 
split-like program i'm writing at the moment.

when opening files > 2GB the program freezes when data is read from the 
file the first time.
had it already working before with a buffer size of (char)1 before but 
that went really slow..

source code is attached, please help..

thx, thomas

--------------050600060602040907040400
Content-Type: text/plain;
 name="asplit.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="asplit.c"

#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

void usage (char *pn)
{
	printf("\
%s - split INPUT file into a piece of\n\
SIZE1 bytes and remaining pieces of SIZE2\n\n\
Usage: %s [SIZE1 SIZE2 INPUT]\n"
			,pn,pn);
	exit(0);
}

int main (int argc, char *argv[] )
{
	char *progname;

	int fdin, fdout;
	char *buf;

	char *file;
	char *fileout;

	int ac, bc;
	int fc = 0;

	int bsize, bread;
	int btotal = 0;

	struct stat stat_buf;
	struct stat64 *stat_buf64;

	progname = argv[0];
	if (argc < 4)
		usage(progname);

	file = argv[3];
	ac = atoi(argv[1]);
	bc = atoi(argv[2]);

	fileout = malloc (sizeof(char) * (strlen(file) + 24));
	sprintf(fileout, "%s.slice-%d", file, fc);

	// open input file
	fdin = open64(file, O_RDONLY);
	if (fdin == -1)
	{
		printf("error: %s\n", strerror(errno));
		exit(0);
	}

	// adjust read buffer to an optimal size
	if (fstat(fdin, &stat_buf) < 0)
	{
		if (errno == 75)
		{
			if (fstat64(fdin, stat_buf64) < 0)
			{
				printf("error 0: %s\n", strerror(errno));
				exit(0);
			} else 
				bsize = (int) stat_buf64->st_blksize;
		}
		else
		{
			printf("error 1: %s\n", strerror(errno));
			exit(0);
		}
	} else 
		bsize = (int) stat_buf.st_blksize;

	buf = (char *) malloc (bsize + 1);
	
	// read first bytes
	bread = read(fdin, buf, bsize);

	printf("read:%d\n", bread);
	if (bread == -1)
	{
		printf("error 2: %s\n", strerror(errno));
		close(fdin);
		exit(0);
	}
	
	// if successfilly read, open output file
	fdout = open64(fileout, O_WRONLY|O_CREAT|O_TRUNC, 0666);

	// while data can be read from file
	while (bread > 0)
	{
		btotal += bread;
		write(fdout, buf, bread);

		// cut off first slice
		if ((fc > 0 && btotal >= bc) || (fc == 0 && btotal >= ac ))
		{
			fc++;
			sprintf(fileout, "%s.slice-%d", file, fc);
			close(fdout);
			fdout = open64(fileout, O_CREAT|O_WRONLY|O_TRUNC, 0666);
			btotal = 0;
		}

		bread = read(fdin, buf, bsize);
	}
	
	close(fdout);
	close(fdin);
}

--------------050600060602040907040400--

