From: Nikola <root.admin1@zg.t-com.hr>
Subject: Pipes and passwd programm problem
Date: Thu, 29 Mar 2007 04:41:48 +0200
Message-ID: <460B276C.3090103@zg.t-com.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

I would like to interface with passwd program in Debian Linux using 
pipes to be able to change password from a C program.

Problem is in reading output from passwd program.

I have observed interesting behavior with passwd program.

---------------------------

[nikola@host][~]$ passwd
Changing password for zip
(current) UNIX password:
[ENTER]
passwd: Authentication failure
[nikola@host][~]$


[nikola@host][~]$ passwd 1> /dev/null
(current) UNIX password:
[ENTER]
passwd: Authentication failure
[nikola@host][~]$


[nikola@host][~]$ passwd 2> /dev/null
Changing password for zip
[ENTER]
[nikola@host][~]$


---------------------------

Program is using both STDOUT and STDERR for output.


program.c
---------------------------

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

#define BSIZE 500

int read_chars(FILE *rstream){
        char ch;

        while(!feof(rstream)){
                ch = fgetc(rstream);
                printf("%c",ch);
        }

        fflush(NULL);

        return 0;
}


int main(int argc, char **argv){


        int rfds[2];
        int stdout_wfds[2];
        int stderr_wfds[2];

        pid_t pid;


        if(argc < 3){
                fprintf(stderr,"Error: In argument count\n");
                exit(1);
        }


        pipe(rfds);
        pipe(stdout_wfds);
        pipe(stderr_wfds);


        pid = fork();
        if( pid == 0 ){ // child
                close(rfds[1]);
                close(stdout_wfds[0]);
                close(stderr_wfds[0]);


                dup2(rfds[0],STDIN_FILENO);
                dup2(stdout_wfds[1],STDOUT_FILENO);
                dup2(stderr_wfds[1],STDERR_FILENO);

                execlp("passwd","passwd",0);

        } else { // parent

                FILE *rstream_out,*rstream_err,*wstream;
                char buffer[BSIZE];

                wstream = fdopen(rfds[1],"w");
                rstream_out = fdopen(stdout_wfds[0],"r");
                rstream_err = fdopen(stderr_wfds[0],"r");


                // PROBLEM !!!!!!!!!!!!!!!!!!!
                // this is supposed to read 2 lines of passwd output
                // but seems it doesn't work
                read_chars(rstream_out);
                read_chars(rstream_err);


                close(rfds[1]);
                close(stdout_wfds[0]);
                close(stderr_wfds[0]);

                waitpid(pid,NULL,0);
        }

        return 0;
}

---------------------------


tnx in advance.
Nikola.


