From: Daniel Souza <thehazard@gmail.com>
Subject: Re: monitoring code while executing.
Date: Mon, 22 Nov 2004 19:17:56 -0200
Message-ID: <e1e1d5f4041122131733b07e62@mail.gmail.com>
References: <20041122182459.60354.qmail@web51903.mail.yahoo.com>
	 <20041122193533.GP26791@lug-owl.de>
Reply-To: Daniel Souza <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041122193533.GP26791@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

you can either use ptrace to attach to the process pid and use
PTRACE_SINGLESTEP to "walk" through instructions. After every
PTRACE_SINGLESTEP, the process get stopped by a signal and waits for
the next PTRACE_SINGLESTEP 'delivered' by your monitoring application
.  Before you call PTRACE_SINGLESTEP again, you can do things with the
attached process like read words or write to its memory, view CPU
registers, etc. I wrote a little code (i dont remember if its the last
version, anyways, you can got the "ideia"), with some adaptations to
fit your needs. (it uses 2 ways to read the registers values, one is
fetching the word at the exact offset, other is filling up a "struct
user" that holds the values.

/*
 * procinfo.c
 * 2004 daniel souza <thehazard@gmail.com>
 *
 * small utility to dump registers from a running process
 *
 */
  
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/user.h>
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <linux/ptrace.h>

#define WORD_LEN sizeof(long)
#define S_USER_LEN sizeof(struct user)
	
extern int errno;

void fatalmsg(char *caller)
{
	fprintf(stderr, "[-] %s: %s\n", caller, strerror(errno));
	exit(-1);
}

void usage(char *progname)
{	
	fprintf(stderr, "procinfo.c - shows information about a running process\n");
	fprintf(stderr, "USAGE: %s <pid>\n", progname);
	exit(-1);
}

int show_task_info(pid_t process_pid)
{
	u_long ptracex = 0;
	u_long user_offset = 0;
	u_long got_user_data;
	u_int process_user_len;
	int child_status, user_idx, i;
	struct user process_user_data;
	struct user *buff;

	fprintf(stdout, "[+] dumping data from pid: %d\n", process_pid);
	fprintf(stdout, "[+] attaching to process...\n");
	if ((ptracex = ptrace( PTRACE_ATTACH, process_pid, NULL, NULL)) != 0)
		fatalmsg("ptrace");
	fprintf(stdout, "[+] atacched.\n");
	fprintf(stdout, "[+] S_USER_LEN = %d\n", S_USER_LEN);
	fprintf(stdout, "[+] WORD_LEN = %d\n", WORD_LEN);	
	fprintf(stdout, "[!] waiting for child...\n");

	waitpid( process_pid, &child_status, 0 );
	if (WIFSTOPPED(child_status))
	{
		fprintf(stdout, "[!] process got signal %d\n", WSTOPSIG(child_status));
		/* fetch the user structure */
		fprintf(stdout, "[+] fetching user structure. errno=%d\n", errno);			
		printf( "[+] [EAX=%d] regs.eax = [0x%08x]\n", EAX, ptrace(
PTRACE_PEEKUSR, process_pid, 4*EAX, NULL ) );
		printf( "[+] [EBX=%d] regs.ebx = [0x%08x]\n", EBX, ptrace(
PTRACE_PEEKUSR, process_pid, 4*EBX, NULL ) );
		printf( "[+] [ECX=%d] regs.ecx = [0x%08x]\n", ECX, ptrace(
PTRACE_PEEKUSR, process_pid, 4*ECX, NULL ) );
		printf( "[+] [EDX=%d] regs.edx = [0x%08x]\n", EDX, ptrace(
PTRACE_PEEKUSR, process_pid, 4*EDX, NULL ) );
		
		buff = &process_user_data;
		memset(buff, 0x41, sizeof(process_user_data));		
		//for (user_offset = 0; user_offset <= S_USER_LEN-WORD_LEN;
user_offset += WORD_LEN)
		for (user_idx = 0; user_idx <= (S_USER_LEN/WORD_LEN)-1; user_idx++)
		{
			printf("[!] process_user_data=[%08x], buff=[%08x]\n",
&process_user_data, &process_user_data+(user_idx*WORD_LEN));
			buff = &process_user_data+(user_idx*WORD_LEN);
			got_user_data = ptrace( PTRACE_PEEKUSR, process_pid,
user_idx*WORD_LEN, NULL );
			memcpy(&buff, &got_user_data, 4);
			printf("[!] IDX: %d = [0x%08x], at %p, errno=[%s]\n", user_idx,
got_user_data, &buff, strerror(errno));
		
			//*(u_long *)(((buff)+(user_idx*WORD_LEN))) = got_user_data;
			//*((u_long *) buff+(user_idx*WORD_LEN)) = got_user_data;			
			
		}
		//memcpy( &process_user_data, buff, S_USER_LEN );
		//free(buff);

		printf("[!] process_user_data at %p\n", &process_user_data);
		sleep(10);

		printf( "[+] regs.eax = [0x%08x]\n", process_user_data.regs.eax );
		printf( "[+] regs.ebx = [0x%08x]\n", process_user_data.regs.ebx );
		printf( "[+] regs.ecx = [0x%08x]\n", process_user_data.regs.ecx );
		printf( "[+] regs.edx = [0x%08x]\n", process_user_data.regs.edx );
		printf( "[+] magic=[0x%08x] u_comm=[%s]\n", process_user_data.magic,
process_user_data.u_comm );
		
		

	}



	/* unstop process */
	ptrace( PTRACE_CONT, process_pid, NULL, NULL );	
	
	/* detaches from process */
	ptrace( PTRACE_DETACH, process_pid, NULL, NULL );
	fprintf(stdout, "[+] detached.\n");
}

int main(int argc, char **argv)
{
	pid_t process_pid = 0;	
	
	if ((argc < 2) || !(process_pid = atol(argv[1])))
		usage(argv[0]);		
	
	show_task_info(process_pid);
}
