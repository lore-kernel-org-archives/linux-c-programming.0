From: joy <gracecott@sancharnet.in>
Subject: various doubts part 2
Date: Tue, 10 Aug 2004 08:23:13 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <41183899.9000203@sancharnet.in>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_xERD/ozEuw/61uOSPJEDbg)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_xERD/ozEuw/61uOSPJEDbg)
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7BIT

Heres the next installment of  the great series (please keep this series 
alive by donating to the ABsolutely Crappy  tv company (ABC).)

1) I'm trying to simulate what sendmail does when it has a command as a 
user,
    so I run my program like this:  a.out<text
    However , When it read()s , only one character is copied into the 
buffer.
if  text =

 >From : .........

the only cahracter in buffer is F.
how do I work around this?



--Boundary_(ID_xERD/ozEuw/61uOSPJEDbg)
Content-type: text/plain; name=mailLDA.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=mailLDA.c

#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<unistd.h>
#include<sys/timeb.h>
#include<ctype.h>
#include<fcntl.h>

#define MAX_FILENAME 20
#define MAX_BUFF 1024
#define FIFO_NAME "/tmp/Vpim_messenger"
char filename[MAX_FILENAME];

int main()
{
	struct timeb tp;
	int  outfile , fifo ,bytes_read,bytes_written, locked=1;
	char buff[MAX_BUFF];
	char message[MAX_BUFF] ; 
	ftime( &tp);
	sprintf(filename,"/tmp/%d.%d",tp.time,getpid());
	sprintf(message,"INFILE: %s",filename);
	outfile = open(filename,O_WRONLY|O_CREAT,S_IRWXU|S_IRWXO);
	while((bytes_read = read(STDIN_FILENO,buff,sizeof(buff))>0))
	{
		if((bytes_written = write(outfile , buff ,bytes_read))!=bytes_read)
		{
			fprintf(stderr,"write error");
			exit(1);
		}
	}
	fifo = open(FIFO_NAME,O_WRONLY,S_IWUSR);
	while(locked)
	{
		if(!(lockf(fifo,F_TEST,0)))
		{
			lockf(fifo,F_LOCK,0);
			locked = 0;
		}
	}
	if(bytes_written = write(fifo , message , sizeof(message))!= sizeof(message))
	{
		fprintf(stderr,"write error");
		exit(1);
	}
	
	return 1;
}

--Boundary_(ID_xERD/ozEuw/61uOSPJEDbg)--
