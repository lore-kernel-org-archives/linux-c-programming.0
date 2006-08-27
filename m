From: Kandan Venkataraman <kven709@cse.unsw.EDU.AU>
Subject: tracking shared dirty pages in a mmap file
Date: Sun, 27 Aug 2006 12:37:52 +1000 (EST)
Message-ID: <Pine.LNX.4.64.0608271236270.22672@williams.orchestra.cse.unsw.EDU.AU>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi
I want to track any pages that have been written to a mmap file using a
segv handler.

I have given an example program below to illustrate my idea.


What I want to know is whether the modifications to the mmap file will
be guaranteed to be unaffected by the interruption of the signal
handler, i.e. would the resultant changes in the mmap file be as if the
mmap file had write access set.


It can also be assumped that only the current process would be writing
to the mmap file.


Thanks
Kandan


#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <string.h>
#include <assert.h>
#include <signal.h>


typedef struct TwoInts_tag {
    int i;
    int j;



} TwoInts;


const int maxPages = 10;

char* start = 0;
int fd;
TwoInts *array = 0;
int pageSize;
int max;
int elemsPerPage;


void memory_fault(int signum, siginfo_t *info, void *ptr)
{
    char *faultAddr  = (char *)info->si_addr;


    /* we only handle the faults within our known range , anything else
is really an illegal access */
    if (faultAddr >= start && faultAddr < start + (pageSize * maxPages))
{


       int faultPageIdx = (faultAddr - start)/pageSize;


       fprintf(stderr, "fault at page index %d\n", faultPageIdx);


       if (mprotect(start + (faultPageIdx * pageSize), pageSize,
PROT_READ | PROT_WRITE)) {
          perror("mprotect failed");
          abort();
       }
    }
    else
       abort();



}


int main()
{
    struct sigaction act;

    act.sa_sigaction = memory_fault;
    act.sa_flags = SA_SIGINFO;
    sigemptyset (&act.sa_mask);


    int status = sigaction (SIGSEGV, &act, NULL);
    if (status) {
       perror ("sigaction");
       exit (1);
    }


    pageSize = getpagesize();


    elemsPerPage = pageSize/sizeof(TwoInts);


    max = elemsPerPage * maxPages;


    fprintf(stderr, "max elements is %d\n", max);


    assert(pageSize % sizeof(TwoInts) == 0);


    /* open/create the file */
    if ((fd = open ("kandan", O_RDWR | O_CREAT | O_TRUNC, S_IRWXU)) < 0)
{
       fprintf(stderr, "can't create file for writing");
       exit(1);
    }


    /* set the lenght of file */
    if (ftruncate(fd, maxPages * pageSize) == -1) {
       fprintf(stderr, "error on ftruncate\n");
       exit(1);
    }


    /* mmap the file with read access*/


    if ((start = mmap(0, maxPages * pageSize, PROT_READ, MAP_SHARED, fd,
0)) == MAP_FAILED) {


       perror("mmap error");
       exit(1);
    }


    array = (TwoInts *)start;


    array[0].i = 5;


    fprintf(stderr, "value = %d\n", array[0].i);


    array[0].i = 7;


    fprintf(stderr, "value = %d\n", array[0].i);


    array[1].i = 9;


    fprintf(stderr, "value = %d\n", array[1].i);


    array[elemsPerPage].i = 14;


    fprintf(stderr, "value = %d\n", array[elemsPerPage].i);


    close(fd);


    return 0;


}
