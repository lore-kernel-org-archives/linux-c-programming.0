From: "=?gb2312?B?1uzRqebD?=" <zxt@mail.ndsc.com.cn>
Subject: what does sendto() return?
Date: Wed, 15 Mar 2006 16:25:11 +0800
Message-ID: <MAIL5aYY61LEdyt3cew00000688@mail.ndsc.com.cn>
Reply-To: zxt@mail.ndsc.com.cn
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=====001_Dragon868723446527_====="
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.

--=====001_Dragon868723446527_=====
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit

Hi everyone,
I've read manpage of send. It says"The calls return the number of characters sent, or -1 if an error occurred." But when I practice programming about udp socket, the server return 0 when it actually sent data. I am really puzzled. The attachment is a little code I wrote in the server port or you can see it as below. Can anyone help me ?
Thank you .
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
--=====001_Dragon868723446527_=====
Content-Type: application/octet-stream;
	name="server.c"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="server.c"

LypBdXRob3JzOiB6eHQNCiAqcHJvYmxlbSBsZWZ0Og0KICppbiBsaW5lIDM4OmNvdW50PXNlbmR0
byhzZCwidGVzdCBmcm9tIHNlcnZlciIsc2l6ZW9mKCJ0ZXN0IGZyb20gc2VydmVyIiksMCwoc3Ry
dWN0IHNvY2thZGRyICopICZzX2FkZHIsc2l6ZW9mKHNfYWRkcikpPDApDQogKndoZW4gY2FwdHVy
ZWQgd2l0aCBldGhlcmFsLCBpdCBpcyBmb3VuZCB0aGF0IHRoZSBkYXRhIGhhcyBiZWVuIHNlbnQs
IA0KICp3aGlsZSB0aGUgcHJpbnRlZCBtZXNzYWdlIHNob3dzIHRoYXQgIjAgYnl0ZSBzZW5kIHN1
Y2Nlc3MhIiANCiAqLw0KI2luY2x1ZGUgPHN0ZGlvLmg+DQojaW5jbHVkZSA8c3lzL3NvY2tldC5o
Pg0KI2luY2x1ZGUgPG5ldGluZXQvaW4uaD4NCiNpbmNsdWRlIDxzdGRsaWIuaD4NCg0KDQppbnQg
cG9ydCA9IDU2Nzg7DQppbnQgc2VuZGluZ2NvdW50PTM7DQpjaGFyICpkZXN0X2lwPSIxMDAuMC4w
LjkiOw0KY2hhciBidWZmdG9zZW5kWzQwXT0idGVzdCBmcm9tIHNlcnZlciI7DQoNCmludCBtYWlu
KHZvaWQpDQp7DQoJaW50IHNkOw0KCWludCBpOw0KCWludCBjb3VudDsNCglzdHJ1Y3Qgc29ja2Fk
ZHJfaW4gc19hZGRyOw0KCXNkPXNvY2tldChBRl9JTkVULFNPQ0tfREdSQU0sMCk7DQoJcHJpbnRm
KCJzZD09JWRcbiIsc2QpOw0KCWlmKHNkPT0tMSkNCgkJe3ByaW50Zigic29ja2V0IGNyZWF0ZWQg
ZXJyb3IhXG4iKTsNCgkJIGV4aXQoMCk7DQoJCX0NCgkNCiAgICAgICBtZW1zZXQoJnNfYWRkciww
LHNpemVvZihzX2FkZHIpKTsNCiAgICAgICBzX2FkZHIuc2luX2ZhbWlseT1BRl9JTkVUOw0KCXNf
YWRkci5zaW5fYWRkci5zX2FkZHI9aW5ldF9hZGRyKGRlc3RfaXApOw0KCXNfYWRkci5zaW5fcG9y
dD1odG9ucyhwb3J0KTsNCgkKICAgICAgIGZvcihpPTA7aTxzZW5kaW5nY291bnQ7aSsrKQ0KCQl7
DQoJCWlmKGNvdW50PXNlbmR0byhzZCxidWZmdG9zZW5kLHNpemVvZihidWZmdG9zZW5kKSwwLChz
dHJ1Y3Qgc29ja2FkZHIgKikgJnNfYWRkcixzaXplb2Yoc19hZGRyKSk8MCkNCgkJCXsNCgkJCXBy
aW50Zigic2VuZCBlcnJvciFcbiIpOw0KCQkJZXhpdCgwKTsNCgkJCX0NCgkJcHJpbnRmKCIlZCBi
eXRlIHNlbmQgc3VjY2VzcyFcbiIsY291bnQpOw0KCQlzbGVlcCgzKTsNCgkJfQkNCgkNCn0NCg==

--=====001_Dragon868723446527_=====--

