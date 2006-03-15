From: "Xueting Zhu" <zxt@mail.ndsc.com.cn>
Subject: a problem about send() on socket programming
Date: Wed, 15 Mar 2006 20:03:25 +0800
Message-ID: <MAILCIqtQvAauNjVuMh000006ab@mail.ndsc.com.cn>
Reply-To: zxt@mail.ndsc.com.cn
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi everyone,
I am studying socket programming. I have a problem about the function send(). Generally it is thought that the calls return the number of characters sent, or -1 if an error occurred. But when I practice programming about udp socket, the server return 0 when it actually sent data. I am really puzzled.  Can anyone help me ? The program I practice is as follows.

------------------------------------------------------------------------------------
/*Authors: zxt
 *problem left:
 *in line 38:count=sendto(sd,"test from server",sizeof("test from server"),0,(struct sockaddr *) &s_addr,sizeof(s_addr))<0)
 *when captured with etheral, it is found that the data has been sent, 
 *while the printed message shows that "0 byte send success!" 
 */
#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>


int port = 5678;
int sendingcount=3;
char *dest_ip="100.0.0.9";
char bufftosend[40]="test from server";

int main(void)
{
	int sd;
	int i;
	int count;
	struct sockaddr_in s_addr;
	sd=socket(AF_INET,SOCK_DGRAM,0);
	printf("sd==%d\n",sd);
	if(sd==-1)
		{printf("socket created error!\n");
		 exit(0);
		}
	
       memset(&s_addr,0,sizeof(s_addr));
       s_addr.sin_family=AF_INET;
	s_addr.sin_addr.s_addr=inet_addr(dest_ip);
	s_addr.sin_port=htons(port);
	
       for(i=0;i<sendingcount;i++)
		{
		if(count=sendto(sd,bufftosend,sizeof(bufftosend),0,(struct sockaddr *) &s_addr,sizeof(s_addr))<0)
			{
			printf("send error!\n");
			exit(0);
			}
		printf("%d byte send success!\n",count);
		sleep(3);
		}	
	
}

