From: joy <gracecott@sancharnet.in>
Subject: problem in open sys call
Date: Wed, 21 Apr 2004 00:01:40 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40856C8C.9090003@sancharnet.in>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_MUzZrV0aja/CE1sPUNOqxQ)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_MUzZrV0aja/CE1sPUNOqxQ)
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT

Hi,
I have a small prblem i the open call. it fails every time and I dont 
know why.

thanx in advance,
Joy.M.M

--Boundary_(ID_MUzZrV0aja/CE1sPUNOqxQ)
Content-type: text/plain; name=opgen.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=opgen.c


#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>

const char opcode[]="opcode.sheet";
const char target[]="opcode.sheet";

main()
{
	char buff[8192],temp[10],bin=0,opcode[3];
	int fd,fd1,bytes_read=8192,count,i=0,inter_count=0;
	int offset=0,j=0,tempy;
	char head[]="OPCODE SHEET";
	
	if((fd=open(opcode, O_RDONLY))==-1)
		printf("oops");
	if((fd1=open(target, O_RDWR|O_CREAT))==-1)
		printf("O");
	while(bytes_read==8192)
	{
	bytes_read=read(fd,buff,8192);
	while(inter_count<bytes_read)
	{
		i=0;
		do
		{
			bin=buff[inter_count];
			temp[i]=buff[inter_count];
			inter_count++;
			i++;
		}while(bin!=10);
		temp[i++]=0;
		j=0;
	write(fd1,head,sizeof(head));
		for(j=0;j<i;j++)
		{
			tempy=(int)(temp[j]-0);
			offset+=tempy;
		}
		if(lseek(fd1,offset,SEEK_SET)==-1)
			printf("HI");
		
		printf("%s : ",temp);
		scanf("%s",opcode);
	      write(fd1,opcode,sizeof(opcode));
		printf("%s %d \n",temp ,offset);
	}
	}
	return(0);
}

--Boundary_(ID_MUzZrV0aja/CE1sPUNOqxQ)--
