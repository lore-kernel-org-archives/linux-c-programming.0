From: Nikola <root.admin1@zg.t-com.hr>
Subject: select() problem/feature
Date: Mon, 24 Jul 2006 15:49:48 +0200
Message-ID: <44C4CFFC.8040909@zg.t-com.hr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040404090508050103030507"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------040404090508050103030507
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

i am writing small daemon.....and when i was seeing the end ......that 
was just the beginning
of my problems.

General idea was to monitor list of files that was given on start.

For this example i am using test1.txt and test2.txt because I've 
succeeded to replicate my problem
,at least i think so....:)))))

so the files are....

test1.txt
-----8<-----8<-----8<-----8<-----8<-----8<-----8<
Testing from test1
-----8<-----8<-----8<-----8<-----8<-----8<-----8<



test2.txt
-----8<-----8<-----8<-----8<-----8<-----8<-----8<
Testing from test1
-----8<-----8<-----8<-----8<-----8<-----8<-----8<

and daemon.c


Now the problem is following:

when i compile (gcc daemon.c => a.out) and run binary in this version 
all works fine....and
if I do
#echo "some new line" >> test1.txt

i would see on my screen that select figured it out and i am having new 
data for processing and it
would print it out.

but when i uncomment last fprintf my while and select goes 
ballistic.....it prints  numbers forever...not
blocking......

So why is that this line "fprintf(stderr,"%d\n",i++);" causes this behavior.

tnx for help.

--------------040404090508050103030507
Content-Type: text/x-csrc;
 name="daemon.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="daemon.c"

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/select.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {

 	FILE *fp1,*fp2;
	fd_set fdst;
	char buffer[100];
	int i;
	
	
	if((fp1 = fopen("test1.txt","r")) == NULL){
		return 0;
	}
	
	if((fp2 = fopen("test2.txt","r")) == NULL){
		return 0;
	}
	
	
	
        /* Daemon-specific initialization goes here */

        /* The Big Loop */
        while (1) {
           /* Do some task here ... */

		FD_ZERO(&fdst);
		FD_SET(fileno(fp1),&fdst);
		FD_SET(fileno(fp2),&fdst);

		select(fileno(fp2)+1,&fdst,NULL,NULL,NULL);

		
		if(FD_ISSET(fileno(fp1),&fdst)){

			while(fgets(buffer,100,fp1) != NULL){
				puts(buffer);

			}	
		}
		

		if(FD_ISSET(fileno(fp2),&fdst)){
			
			while(fgets(buffer,100,fp2) != NULL){
				puts(buffer);
			}	
	
		}

		//fprintf(stderr,"%d\n",i++);
	
        }
	
	exit(EXIT_SUCCESS);
}


--------------040404090508050103030507--
