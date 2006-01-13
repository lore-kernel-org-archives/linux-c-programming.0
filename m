From: wwp <subscript@free.fr>
Subject: Re: argv[0]
Date: Fri, 13 Jan 2006 10:52:44 +0100
Message-ID: <20060113105244.53bda39b@localhost.localdomain>
References: <200601130016.23410.a.biardi@tiscali.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=MP_Z99b.vNZAsRg99KrtJ3lngU
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200601130016.23410.a.biardi@tiscali.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--MP_Z99b.vNZAsRg99KrtJ3lngU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Andrea,


On Fri, 13 Jan 2006 00:16:23 +0100 a.biardi@tiscali.it wrote:

> 
> Hi,
> 
> Is there any C function that can tell me what argv[0] is, outside 
> main()?
> 
> I thought to use getpid() and then look at /proc/<pid>/cmdline but 
> doesn't seem portable. Any hints?

For instance, in main(), you can store argc and argv into global const
pointers that you can use anywhere else.

Here's an example (see the attached files):

$ gcc main.c elsewhere.c
$ ./a.out

shows:
main: 1 0xbf8526f4 './a.out'
sample1: 1 0xbf8526f4 './a.out'
sample2: 1 0xbf8526f4 './a.out'


HTH,

-- 
wwp

--MP_Z99b.vNZAsRg99KrtJ3lngU
Content-Type: text/x-csrc; name=elsewhere.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=elsewhere.c

#include <stdio.h>

extern int prg_argc;
extern char** prg_argv;

void outside_from_main_2(void)
{
	printf("sample2: %d %p '%s'\n", prg_argc, prg_argv, prg_argv[0]);
}

--MP_Z99b.vNZAsRg99KrtJ3lngU
Content-Type: text/x-chdr; name=elsewhere.h
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=elsewhere.h

void outside_from_main_2(void);

--MP_Z99b.vNZAsRg99KrtJ3lngU
Content-Type: text/x-csrc; name=main.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=main.c

#include <stdio.h>

int prg_argc=0;
char** prg_argv=NULL;

void outside_from_main_1(void)
{
	printf("sample1: %d %p '%s'\n", prg_argc, prg_argv, prg_argv[0]);
}

int main(int argc, char** argv)
{
	printf("main: %d %p '%s'\n", argc, argv, argv[0]);
	prg_argc=argc;
	prg_argv=argv;
	outside_from_main_1();
	outside_from_main_2();

	exit(0);
}

--MP_Z99b.vNZAsRg99KrtJ3lngU--
