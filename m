From: joy <gracecott@sancharnet.in>
Subject: ioctl fails....
Date: Sun, 16 May 2004 10:43:26 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40A6F876.50405@sancharnet.in>
Reply-To: gracecott@sancharnet.in, gracecott@sancharnet.in
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_y7YkCutu09YCaxjQTlaxHw)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_y7YkCutu09YCaxjQTlaxHw)
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT

     Hi,

I'm trying to do some low level data transmission using the parallel
port .in Debian, it is /dev/par0
my source is attached .perror gives me "invalid argument". if I change
the file being
opened to say, lp0, it gives me "bad file descriptor".
should I use ioperm() even in this case?
and also,is it guaranteed that the parallel port is assigend par0(I have
only one P port)?

Thanx in advance,
Joy.M.Monteiro.




--Boundary_(ID_y7YkCutu09YCaxjQTlaxHw)
Content-type: text/plain; name=test.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=test.c

#include<linux/ppdev.h>
#include<stdlib.h>
#include<unistd.h>
#include<linux/parport.h>
#include<time.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<linux/ioctl.h>

main()
{
	int filedes;
	char data=0xff;
	struct timespec time;
	filedes=open("/dev/par0",O_RDWR);
	if(ioctl(filedes,PPCLAIM)==-1)
		perror("OPEN");
	
	if(ioctl(filedes, PPWDATA, &data)==-1)
		perror("Hi");
	time.tv_sec=1;
	time.tv_nsec=1000;
	nanosleep(&time,NULL);
	close(filedes);
	return;
}
	
	


--Boundary_(ID_y7YkCutu09YCaxjQTlaxHw)--
