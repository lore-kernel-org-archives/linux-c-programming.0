From: Mateus Interciso <p.zarnick@gmail.com>
Subject: Re: programming using system calls
Date: Tue, 31 Jul 2007 12:00:14 +0000 (UTC)
Message-ID: <f8n88c$hsu$1@sea.gmane.org>
References: <11922382.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Tue, 31 Jul 2007 04:27:13 -0700, nisa wrote:

> hi,
> i am quite new to programming using system calls and would like a basic
> idea regarding the usage of system calls.
> i would like assistance in the following area of c programming in linux:
> 1.how to open a text file ,read data and print the data on console using
> system calls
> 2.create a text file and write some data 3.read data from a file and
> append that data to another file using lseek() 4.creation of a parent
> and child process using fork()

Well, just to not let you in blank, here is a VERY simple file that reads 
a text file, and output it to the screen

#include <stdio.h>  //standard IO
#include <stdlib.h> //for reading files
#include <string.h> //for memset
#include <errno.h>  //for errno
int main(int argc, char *argv[]){
  FILE *fp = NULL;
  char ch[1];

  if(argc!=2){
    fprintf(stderr,"Usage:%s <file>\n",argv[0]);
    return 1;
  }
  memset(ch,'\0',sizeof(char)*1);
  if((fp=fopen(argv[1],"r"))==NULL){
    perror("fopen");
    return errno;
  }
  while(feof(fp)==0){
    if( (fread(ch,sizeof(char),1,fp)==0) && (feof(fp)==0) ){
      perror("fread");
      fclose(fp);
      memset(ch,'\0',sizeof(char)*1);
      return errno;
    }
    fprintf(stdout,"%c",ch[0]);
  }
  fclose(fp);
  memset(ch,'\0',sizeof(char)*1);
  return 0;
}

Also, as it was stated before, use the man pages. If you don't have a 
Linux box, then google will be your friend for this.
In this example, you would need, the man pages for fopen(),fread() and 
feof().

Good luck.

