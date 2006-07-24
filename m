From: Mihai Dontu <mdontu@bitdefender.com>
Subject: Re: select() problem/feature
Date: Mon, 24 Jul 2006 17:15:25 +0300
Message-ID: <44C4D5FD.1040306@bitdefender.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Nikola wrote:
> Hi all,
> 
> i am writing small daemon.....and when i was seeing the end ......that 
> was just the beginning
> of my problems.
> 
> General idea was to monitor list of files that was given on start.
> 
> For this example i am using test1.txt and test2.txt because I've 
> succeeded to replicate my problem
> ,at least i think so....:)))))
> 
> so the files are....
> 
> test1.txt
> -----8<-----8<-----8<-----8<-----8<-----8<-----8<
> Testing from test1
> -----8<-----8<-----8<-----8<-----8<-----8<-----8<
> 
> 
> 
> test2.txt
> -----8<-----8<-----8<-----8<-----8<-----8<-----8<
> Testing from test1
> -----8<-----8<-----8<-----8<-----8<-----8<-----8<
> 
> and daemon.c
> 
> 
> Now the problem is following:
> 
> when i compile (gcc daemon.c => a.out) and run binary in this version 
> all works fine....and
> if I do
> #echo "some new line" >> test1.txt
> 
> i would see on my screen that select figured it out and i am having new 
> data for processing and it
> would print it out.
> 
> but when i uncomment last fprintf my while and select goes 
> ballistic.....it prints  numbers forever...not
> blocking......
> 
> So why is that this line "fprintf(stderr,"%d\n",i++);" causes this 
> behavior.
> 
> tnx for help.
> 
> 
> ------------------------------------------------------------------------
> 
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <sys/select.h>
> #include <stdio.h>
> #include <stdlib.h>
> 
> int main(void) {
> 
>  	FILE *fp1,*fp2;
> 	fd_set fdst;
> 	char buffer[100];
> 	int i;
> 	
> 	
> 	if((fp1 = fopen("test1.txt","r")) == NULL){
> 		return 0;
> 	}
> 	
> 	if((fp2 = fopen("test2.txt","r")) == NULL){
> 		return 0;
> 	}
> 	
> 	
> 	
>         /* Daemon-specific initialization goes here */
> 
>         /* The Big Loop */
>         while (1) {
>            /* Do some task here ... */
> 
> 		FD_ZERO(&fdst);
> 		FD_SET(fileno(fp1),&fdst);
> 		FD_SET(fileno(fp2),&fdst);
> 
> 		select(fileno(fp2)+1,&fdst,NULL,NULL,NULL);
> 
> 		
> 		if(FD_ISSET(fileno(fp1),&fdst)){
> 
> 			while(fgets(buffer,100,fp1) != NULL){
> 				puts(buffer);
> 
> 			}	
> 		}
> 		
> 
> 		if(FD_ISSET(fileno(fp2),&fdst)){
> 			
> 			while(fgets(buffer,100,fp2) != NULL){
> 				puts(buffer);
> 			}	
> 	
> 		}
> 
> 		//fprintf(stderr,"%d\n",i++);
> 	
>         }
> 	
> 	exit(EXIT_SUCCESS);
> }
> 
> 
> 
> ------------------------------------------------------------------------
> 
> 

1st: you can not use select on fd-s opened on regular files; use aio for
async. I/O;

2nd: leave the comment on. check the CPU - if I'm not mistaking, the
while(1){} goes nuts with or without fprintf();

M.D.


-- 
This message was scanned for spam and viruses by BitDefender.
For more information please visit http://www.bitdefender.com/

