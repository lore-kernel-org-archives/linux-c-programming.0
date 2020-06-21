From: Yuri Edward <yuri6037@yuristudio.net>
Subject: Re: Issue with fcntl FD_CLOEXEC and execve
Date: Sun, 21 Jun 2020 20:46:02 +0200
Message-ID: <d60e6a03-ca66-bc27-b92c-fe935da0d26f@yuristudio.net>
References: <000801d64679$d347bf10$79d73d30$@yuristudio.net>
 <87mu4yp6rt.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------79032C16541ECF094E5CD8FB"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <87mu4yp6rt.fsf@mid.deneb.enyo.de>
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------79032C16541ECF094E5CD8FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

[Please keep me in CC as I'm not subscribed to the mailing list]


Hello,

Thanks for your quick answer; sorry for the late response but I had 
meetings today (I'm in timezone UTC+2).

I tried to reproduce the bug in a small C app but couldn't, instead I 
got SIGPIPE from C program. However I could successfully reliably 
reproduce the bug on my C++ project (tested 10 times and it locked 10/10 
times) using both cat and a custom binary. I wonder if it is not part of 
a third party I'm using such as Google Test or ZLib (these are the only 
two third parties I'm using).

I can point you to the key parts of the C++ program that always 
reproduces the same bug. I even introduced a work-arround which does 
work but gets rid of the error testing for execve:

https://github.com/BlockProject3D/Framework/blob/ProcessManagement/Base/src/Framework/System/Process.cpp 
 > This is the main class that performs fork, pipe, read, write and 
execve, key lines are 198-262, 267-282 and 380-414. The code is already 
tested so you can assume the C++ String and Array parts do work as 
execve actually calls the correct executable with the correct 
environment and arguments (gdb + gtest tested). You don't need to look 
inside #ifdef WINDOWS as it's only for WinAPI. On line 57 you can switch 
the define OFF to cause the lock-forever read bug.

https://github.com/BlockProject3D/Framework/blob/ProcessManagement/Tests/src/System/Process.cpp 
 > This is the code that interfaces with Google Test in order to unit 
test the entire Framework. You can find the tests that reproduces the 
bug at line 163-182, 187-206 and 212-226.

The Framework can be compiled with help of CMake (sudo apt install 
cmake) and conan (sudo pip3 install conan). The compiler does not 
matter; use whatever compiler you prefer the most; architecture must be 
either x86, x86_64, arm & derived or arm64 & derived and system must be 
any distribution of Linux that has support for C++11 minimum.

I also join my attempt at reproducing the bug in a smaller C file. To 
compile the small file use whatever compiler you prefer the most.

PS: As you can probably noticed I fixed my email address (well actually 
just added one more email address on the private linux box)...

I hope you can help me,

Thank you,

Yuri Edward


On 6/20/20 8:53 AM, Florian Weimer wrote:
> * postmaster:
>
>> The pipe works fine and the process can correctly transmit data back to the
>> master. The only issue appears when trying to run input pump based
>> applications like cat, grep, etc. When running these applications the pipe
>> write end which is marked FC_CLOEXEC should be closed when execve is
>> triggered, however it is not, but execve still succeeded.
>> When the target process to execve is not an input pump (uname, ls, .) no
>> issue occurs and the pipe is correctly closed when execve is triggered and
>> succeeds.
>>
>> That is a problem as my master process expects the blocking read to return
>> with either cause of pipe file descriptor closed or some data written. In
>> this case when the target process is an input pump the master process never
>> gets notified of file descriptor closed and by extension locks forever.
> Do you have a minimal but complete example that shows the problem?
>
> You cannot really make standard input a CLOEXEC descriptor.  If you do
> not want subprocesses to use the original standard input, you need to
> replace the descriptor with /dev/null before the execve call (but
> already in the subprocess).

--------------79032C16541ECF094E5CD8FB
Content-Type: text/x-csrc; charset=UTF-8;
 name="main.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="main.c"

#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <wait.h>
#include <stdio.h>
#include <stdlib.h>

#define PIPE_WRITE 1
#define PIPE_READ 0

#define BP_IGNORE(v) if (v) {} //Required to workarround GCC bug

void CleanupHandles(int fdStdOut[2], int fdStdErr[2], int fdStdIn[2], int commonfd[2])
{
    for (int i = 0; i != 2; ++i)
    {
        if (fdStdOut[i] != -1)
            close(fdStdOut[i]);
    }
    for (int i = 0; i != 2; ++i)
    {
        if (fdStdErr[i] != -1)
            close(fdStdErr[i]);
    }
    for (int i = 0; i != 2; ++i)
    {
        if (fdStdIn[i] != -1)
            close(fdStdIn[i]);
    }
    for (int i = 0; i != 2; ++i)
    {
        if (commonfd[i] != -1)
            close(commonfd[i]);
    }
}

void ProcessWorker(int fdStdOut[2], int fdStdErr[2], int fdStdIn[2], int commonfd[2])
{
    char *argv[] = {NULL};
    char *envp[] = {NULL};

    for (int fd = 0; fd != 256; ++fd)
    {
        if (fd != 0 && fd != 1 && fd != 2 && fd != fdStdOut[PIPE_WRITE] && fd != fdStdErr[PIPE_WRITE] &&
            fd != fdStdIn[PIPE_READ] && fd != commonfd[PIPE_WRITE])
            close(fd);
    }
    if (fcntl(commonfd[PIPE_WRITE], FD_CLOEXEC, 1) != 0)
    {
        BP_IGNORE(write(commonfd[PIPE_WRITE], "fcntl failure", 14));
        close(commonfd[PIPE_WRITE]);
        exit(1);
    }
    if (dup2(fdStdOut[PIPE_WRITE], 1) == -1)
        goto redirecterr;
    if (dup2(fdStdErr[PIPE_WRITE], 2) == -1)
        goto redirecterr;
    if (dup2(fdStdIn[PIPE_READ], 0) == -1)
        goto redirecterr;
#ifdef CLOSE_BEFORE_EXEC
    close(commonfd[PIPE_WRITE]);
#endif
    if (execve("/usr/bin/cat", argv, envp) == -1)
    {
#ifndef CLOSE_BEFORE_EXEC
        BP_IGNORE(write(commonfd[PIPE_WRITE], "execve failure", 15));
        close(commonfd[PIPE_WRITE]);
#endif
        exit(1);
    }
redirecterr:
    BP_IGNORE(write(commonfd[PIPE_WRITE], "Could not create one or more redirection(s)", 44));
    close(commonfd[PIPE_WRITE]);
    exit(1);
}

void ProcessMaster(int pid, int fdStdOut[2], int fdStdErr[2], int fdStdIn[2], int commonfd[2])
{
    if (commonfd[PIPE_WRITE] != -1)
        close(commonfd[PIPE_WRITE]);
    if (fdStdOut[PIPE_WRITE] != -1)
        close(fdStdOut[PIPE_WRITE]);
    if (fdStdErr[PIPE_WRITE] != -1)
        close(fdStdErr[PIPE_WRITE]);
    if (fdStdIn[PIPE_READ] != -1)
        close(fdStdIn[PIPE_READ]);

    char buf[4096];
    int len = read(commonfd[PIPE_READ], buf, 4096);

    if (len > 0)
    {
        close(commonfd[PIPE_READ]);
        return; //We have got a system error
    }
    close(commonfd[PIPE_READ]);
}


int main()
{
    int fdStdOut[2] = {-1, -1};
    int fdStdIn[2] = {-1, -1};
    int fdStdErr[2] = {-1, -1};
    int commonfd[2];

    if (pipe(commonfd) != 0)
        return (1);
    if (pipe(fdStdOut) != 0)
    {
        CleanupHandles(fdStdOut, fdStdErr, fdStdIn, commonfd);
        return (2);
    }
    if (pipe(fdStdErr) != 0)
    {
        CleanupHandles(fdStdOut, fdStdErr, fdStdIn, commonfd);
        return (3);
    }
    if (pipe(fdStdIn) != 0)
    {
        CleanupHandles(fdStdOut, fdStdErr, fdStdIn, commonfd);
        return (4);
    }
    int pid = fork();
    if (pid == -1)
    {
        CleanupHandles(fdStdOut, fdStdErr, fdStdIn, commonfd);
        return (5);
    }
    if (pid == 0)
    {
        // Worker/Child
        ProcessWorker(fdStdOut, fdStdErr, fdStdIn, commonfd);
        return (0); // This will never trigger
    }
    else // Master
    {
        int status;
        char buf[128];
        ProcessMaster(pid, fdStdOut, fdStdErr, fdStdIn, commonfd);
        write(fdStdIn[PIPE_WRITE], "test\n", 5);
        close(fdStdIn[PIPE_WRITE]);
        waitpid(pid, &status, 0);
        printf("Status %d\n", WEXITSTATUS(status));
        int res = read(fdStdOut[PIPE_READ], buf, 128);
        buf[res] = 0;
        printf("Output = %s", buf);
        return (0);
    }
}

--------------79032C16541ECF094E5CD8FB--
