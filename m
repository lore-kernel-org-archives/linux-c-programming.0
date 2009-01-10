From: Jason <lcprog@lakedaemon.net>
Subject: Re: command output to variables
Date: Sat, 10 Jan 2009 09:57:07 -0500
Message-ID: <4968B743.5080005@lakedaemon.net>
References: <1f714d50901070435h4b76e26brdb1eedddbdda4cc3@mail.gmail.com> <dbe330bd0901070533g4b49d451u12c70eed805e145b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020003090506010003090101"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dbe330bd0901070533g4b49d451u12c70eed805e145b@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Michele Mondelli <mithenks.ml@gmail.com>, jai.unix@gmail.com
Cc: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------020003090506010003090101
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Michele Mondelli wrote:
> A simple example of using pipe in Linux.
>
> /*
>  * Run the 'ls' command and print the output to stdout.
>  *
>  * Compile with
>  * 		gcc -Wall pipe.c -o pipe
>  *
>  *
>  * Mithenks <mithenks@siena.linux.it>
>  *
>  */
> #include <stdio.h>
> #include <stdlib.h>
>
> int main() {
> 	
> 	FILE *pipe;
> 	char buffer[1024];
> 	
>	if ( (pipe = popen("ls","r") ) < 0 ) {

This should be:
	if ( (pipe = popen("ls","r") ) == NULL ) {

> 		perror("popen(): ");
> 		exit(-1);
>	}
> 	
> 	

Don't forget to clear the buffer, printf requires NULL terminated strings.
	memset(buffer, 0, sizeof(buffer));

> 	fread(buffer,sizeof(buffer),1,pipe);

In a real implementation, you'll be looping on fread(), and you'll want
to check the return value, like so:

	int rlen=0;
	if ( (rlen = fread(buffer,sizeof(buffer),1,pipe) ) != 1 ) {
		/*we have a short read or error*/
		if( feof(pipe) != 0 ) {
			printf("Finished\n");
			exit(0);
		}
		else if ( ferror(pipe) != 0 ) {
			printf("Error reading from pipe.\n");
			exit(-1);
		}
	}

> 	printf("Output:\n%s\n",buffer);
> 	
> 	pclose(pipe);
> 	
> 	return 0;
> }

So, that got a little messy, I've attached a re-write.  It's not the
most efficient thing in the world, but it should get you started.

When in doubt, 'man function_name'.  For example, 'man popen' told me I
should be checking for a NULL return value, and 'man fread' told me I
should be checking the number of items returned, _not_ the number of
bytes.  'man brain' returned NULL for me, so any errors are solely my
responsibility.  ;-)

hth,

Jason.

--------------020003090506010003090101
Content-Type: text/plain;
 name="pipe.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pipe.c"

/*
 * Run the 'ls' command and print the output to stdout.
 * 
 * Compile with 
 * 		gcc -Wall pipe.c -o pipe
 * 
 * 
 * Mithenks <mithenks@siena.linux.it>
 * Changes added by Jason <lcprog@lakedaemon.net>
 * 
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	
	FILE *pipe=NULL;
	char buffer[1024];
	int  rlen=0;
	int  blen=0;
	
	if ( (pipe = popen("ls","r") ) == NULL ) {
		perror("popen(): ");
		exit(-1);
	}

	/*we subtract 1 so there is always a NULL terminator*/
	blen = sizeof(buffer) - 1;

	while (1) { 
		memset(buffer,0,sizeof(buffer));

		if ( (rlen = fread(buffer,blen,1,pipe) ) != 1 ) {
			/*we have a short read or an error*/
			if ( feof(pipe) != 0 ) {
				fprintf(stderr,"Finished");
				printf("%s",buffer);
				break;
			}
			else if ( ferror(pipe) != 0 ) {
				fprintf(stderr,"Error reading from pipe.\n");
				break;
			}
			else {
				/*short read*/
				printf("%s",buffer);
			}
		}
		else {
			/*we got a full buffer*/
			printf("%s",buffer);
		}
	}

	if(pipe != NULL) {	
		pclose(pipe);
	}
	
	exit(0);
}

--------------020003090506010003090101--
