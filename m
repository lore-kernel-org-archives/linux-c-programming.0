From: "Colovic (ext_evosoft) Aleksandar" 
	<aleksandar.colovic.external@siemens.com>
Subject: RE: SIGFPE captured repeatedly..
Date: Thu, 2 Sep 2004 14:24:09 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <063A80A4DD54DB4D8547CD10A9DA3A0F5FAFD9@erlf440a.erlf.siemens.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,


here is slightly modified code:

#include <signal.h>
#include <stdio.h>

static int j;

void sig_s(int signo)
{
	j = 3;
 	printf("Hai Division by zero:Floation point exception\n");

}

#define BUFFER_SIZE 1024

int main()
{
 int i,z;
 char Buffer[BUFFER_SIZE];
 int x;
 FILE* fp = fdopen(0,"r");
 signal(SIGFPE,&sig_s);

 for(x=0;x<5;x++)
 {
  fflush(fp);
  i=0;j=0;
  printf("Accepted i = %d and j= %d \n",i,j);
  z = i/j;
  printf("Result = %d\n",z);
 }
 return 0;
}
/*********************************************/

Explanation: In case of 'divide error' system sends SIGFPE to your process.
Default action would be core dump and abortion of the
process, but since you installed an exception handler for this signal,
system expects that your signal handler somehow corrects invalid 
situation and transfers control again to problematic division. Since you
didn't corrected the problem, CPU raises again 'divide error' exception and
system's exception handler (divide_error()) sends again SIGFPE to your
signal handler ....

In the code above, I declared problematic j variable as static and corrected
its value in the signal handler ... so loop continues and everything's well.

I hope, this helps

Aleksandar Colovic,

