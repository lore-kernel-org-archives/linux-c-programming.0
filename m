From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Message queue
Date: Wed, 20 Dec 2006 16:40:01 +0530
Message-ID: <45891A09.1060204@sun.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_BzeUuOdnyDP/IPzQDsZT0w)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_BzeUuOdnyDP/IPzQDsZT0w)
Content-type: text/plain; format=flowed; charset=us-ascii
Content-transfer-encoding: 7BIT

Hi,

I was trying to use the message queue implementation of linux through a 
simple client/server program.
The client will get text from stdin and send to server through message 
queue and server will convert to upper case and resend to back to client
Attached is the client and server program I used
However, while sending in client and receiving in server, I am getting 
errno as 13(EACCESS). Can anyone tell me what I need to do extra?

Regards
Prasanta

--Boundary_(ID_BzeUuOdnyDP/IPzQDsZT0w)
Content-type: text/x-csrc; name=client.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=client.c

#include <stdio.h>
#include <sys/types.h>
#include <sys/errno.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <signal.h>
                                                                                
#define key_in 1234
#define key_out 4321
#define size 1024

static int input_id;
static int output_id;
static int send_id;
static int receive_id;

void term()
{
	printf("Strg+c...sending quit to msq\n");
	msgsnd(output_id,"quit",strlen("quit"),0);
	msgctl(output_id,IPC_RMID,0);
	exit(0);
}

int main(int argc, char *argv[])
{
	int n;
	char outtext[size];
	char intext[size];

	signal(SIGINT,term);

	input_id=msgget(key_in,IPC_CREAT);
	output_id=msgget(key_out,IPC_CREAT);

	if (input_id == -1)
	{
		printf("input msgget failed ....%d\n",errno);
		return -1;
	}
	if (output_id == -1)
	{
		printf("output msgget failed ....\n");
		return -1;
	}
	while(1)
	{
		fgets(outtext, 10, stdin);	
		printf("output text %s\n", outtext);
		send_id=msgsnd(output_id,outtext,strlen(outtext),0);
	        if (send_id < 0)
        	{
                	printf("msg snd failed ...%d\n",errno);
	                return -1;
        	}

		if (strcmp(outtext,"quit") == 0)
		{
			printf("<<exiting>>\n");
			msgctl(output_id,IPC_RMID,0);
			return 0;
		}
		receive_id=msgrcv(input_id,intext,strlen(intext),0,0);
	        if(receive_id < 0)
        	{
                	printf("msgrcv failed ...\n");
	                return -1;
        	}

		fprintf("input text %s\n", intext);
	}
}

--Boundary_(ID_BzeUuOdnyDP/IPzQDsZT0w)
Content-type: text/x-csrc; name=server.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=server.c

#include <stdio.h>
#include <sys/types.h>
#include <sys/errno.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <signal.h>
                                                                                
#define key_in 1234
#define key_out 4321
#define size 1024
static int send_id;
static int receive_id;

int main()
{
	int n,tooutput_id,toinput_id,receive_id,send_id;
	char text[size];

	//key_out as input as this is the msgq where client will send its output
	toinput_id=msgget(key_out, IPC_CREAT);
	if (toinput_id == -1)
	{
		printf("input msgget failed ...\n");
		return -1;
	}

	tooutput_id=msgget(key_in, IPC_CREAT);
	if (tooutput_id == -1)
	{
		printf("output msgq failed ...\n");
		return -1;
	}

	printf("Server ...\n");
	while(1)
	{
		receive_id = msgrcv(toinput_id,text,strlen(text),0,0);
		if(receive_id < 0)
	        {
	                printf("msgrcv failed ...%d\n", errno);
        	        return -1;
	        }

		if(strcmp(text,"quit")==0)
		{
			msgsnd(tooutput_id,text,strlen(text),0);
			printf("<<exiting>>\n");
			msgctl(toinput_id,IPC_RMID,0);
			msgctl(tooutput_id,IPC_RMID,0);
			return 0;
		}
		
		puts(text);
		for (n=0;n<strlen(text);n++)
		{
			text[n]=toupper(text[n]);
		}
		printf("Changed to: ");
		puts(text);

		printf("Server output text %s\n", text);
		send_id = msgsnd(tooutput_id,text,strlen(text),0);
		if(send_id < 0)
	        {
	                printf("msgsend failed ...\n");
        	        return -1;
	        }
	}
	return 0;
}

--Boundary_(ID_BzeUuOdnyDP/IPzQDsZT0w)--
