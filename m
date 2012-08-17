From: Super Groomers <supergroomers@gmail.com>
Subject: Question on shared memory across processes with Linux/x86_64
Date: Fri, 17 Aug 2012 02:34:11 -0400
Message-ID: <CADsebo=7JB2PK5HyBijzx2MbN=-jk0sm40zNQV=2x2HqWTXcnQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=wQo2HBq45Xa78kmzvlOuOxzwrye49K/3OQb8CFuL79Y=;
        b=ZnBR1y7f7nFyi6bUKdJbXNZp26trM4SYqB5oQkf6/oGq2HuZvoF7MrbUEaAMBMiJLK
         ad/2ZUWs07YQdEFDvJ2Q5sKTS1yxrdzifQFFMx2WZ+9Fh3cq7w+cfuQEFjALJ+I3R7v3
         +bv0F/cr2w+TU0Di7XajSXfy/eyBAJuooxJUEFixdqtoWGRBm5UDyTIF0e+0J2zMvENT
         hgWrDDo6Xlv2p0vqLc+gWWXTdeIHxBYveyvxz/PFRNLRqfF6vUXANDwsl4nIumBUo7Qw
         3FbAj0u5d4PG0fA/5j+ZwduIavysnhVBeyfw2Y9Jctr4/ikp9Sn+NKO8gDLSBLVKjN9o
         3Qsg==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, linux-c-programming@vger.kernel.org

Hi,

This is primarily a question on user code. I wasn't sure from reading
the FAQ if it was only inappropriate to post non-kernel-dev question
to the linux-kernel list or if this is this was the case for any
*.vger.kernel.org list. If inappropriate, lease excuse and if
possible, point me to an appropriate mailing list that I can look up.

I want to share a structure across processes (they need to be
processes, not threads for other reasons), and am currently using
shm_open + mmap for the purpose like below. I'm unsure of several
semantics about IPC shared memory and have been unable to find precise
answers from browsing archives.

1. In the code below, I don't need the memory to be backed by a file.
Yet, using MAP_ANONYMOUS does not work across the exec. Is the
'file-backup' overhead restricted to process termination time alone,
or is it a periodic I/O overhead? Note that I don't intend to call
msync() in the code.

2. In the example below, where does the shared object (i.e.,
'*g_shared') get allocated? Is it in a cacheable data segment (I'm
running 3.2.0-23 on an Intel i7-2600)? Are the performance and
correctness behaviors identical to sharing a global object across
pthreads?

3. Although one process forks the other, the child needs to exec. Can
I get rid of the shm_open and make just the mmap survive the exec in
some way and still have the processes share the object?

thanks,
/Doobs

Code:

#ifndef __SHMEM_H__
#define __SHMEM_H__

//includes

#define LEN 1000
#define ITERS 10

#define SHM_FNAME "/myshm"

typedef struct shmem_obj {
    int count;
    char buff[LEN];
    volatile int flag;
} shmem_t;

extern shmem_t* g_shared;
extern char proc_name[100];
extern int fd;

void cleanup_shared() {
    munmap(g_shared, sizeof(shmem_t));
    close(fd);
    shm_unlink(SHM_FNAME);
}

static inline
void init_shared() {
    int oflag;

    if (!strcmp(proc_name, "parent")) {
        oflag = O_CREAT | O_RDWR;
    } else {
        oflag = O_RDWR;
    }

    fd = shm_open(SHM_FNAME, oflag, (S_IREAD | S_IWRITE));
    if (fd == -1) {
        perror("shm_open");
        exit(EXIT_FAILURE);
    }

    if (ftruncate(fd, sizeof(shmem_t)) == -1) {
        perror("ftruncate");
        shm_unlink(SHM_FNAME);
        exit(EXIT_FAILURE);
    }

    g_shared = mmap(NULL, sizeof(shmem_t),
                    (PROT_WRITE | PROT_READ),
                    MAP_SHARED, fd, 0);
    if (g_shared == MAP_FAILED) {
        perror("mmap");
        cleanup_shared();
        exit(EXIT_FAILURE);
    }
}

static inline
void proc_write(const char* s) {
    fprintf(stderr, "[%s] %s\n", proc_name, s);
}

#endif // __SHMEM_H__

shmem1.c (parent process):

#include "shmem.h"

int fd;
shmem_t* g_shared;
char proc_name[100];

void work() {
    int i;
    for (i = 0; i &lt ITERS; ++i) {
        while (g_shared->flag);
        ++g_shared->count;
        sprintf(g_shared->buff, "%s: %d", proc_name, g_shared->count);
        proc_write(g_shared->buff);
        g_shared->flag = !g_shared->flag;
    }
}

int main(int argc, char* argv[], char* envp[]) {
    int status, child;
    strcpy(proc_name, "parent");
    init_shared(argv);
    fprintf(stderr, "Map address is: %p\n", g_shared);

    if (child = fork()) {
        work();
        waitpid(child, &status, 0);
        cleanup_shared();
        fprintf(stderr, "Parent finished!\n");
    } else { /* child executes shmem2 */
        execvpe("./shmem2", argv + 2, envp);
    }
}

shmem2.c (child process):

#include "shmem.h"

int fd;
shmem_t* g_shared;
char proc_name[100];

void work() {
    int i;
    for (i = 0; i &lt ITERS; ++i) {
        while (!g_shared->flag);
        ++g_shared->count;
        sprintf(g_shared->buff, "%s: %d", proc_name, g_shared->count);
        proc_write(g_shared->buff);
        g_shared->flag = !g_shared->flag;
    }
}

int main(int argc, char* argv[], char* envp[]) {
    int status;
    strcpy(proc_name, "child");
    init_shared(argv);
    fprintf(stderr, "Map address is: %p\n", g_shared);
    work();
    cleanup_shared();
    return 0;
}
