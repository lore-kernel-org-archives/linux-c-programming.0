From: Steve Graegert <graegerts@gmail.com>
Subject: Re: how to the filename
Date: Thu, 14 Apr 2005 12:37:41 +0200
Message-ID: <6a00c8d5050414033770f1ab96@mail.gmail.com>
References: <1113472539.5952.62.camel@localhost.localdomain>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1113472539.5952.62.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal@rocsys.com
Cc: linux prg <linux-c-programming@vger.kernel.org>

On 4/14/05, kaushal <kaushal@rocsys.com> wrote:
> Hello all,
>        How can I get the filename/pathname given the open file descriptor?Does
> fstat provide this feature internally?Can somebody give the code snippet
> for this.

There is no such thing.  It is not possible to obtain a FD's filename
reliably.  Unless you are absolutely sure that this particular FD
points to a file (or directory)  and not to a socket, pipe or
something similar, you will not be able to use fstat reliably.  Which
of stat's fields are suggesting to be helpful reagarding to your
problem?  st_ino?  How would you locate a file based on its file ID? 
This would require scanning the complete file system (and probably
more than one).  Another problem is, that an FD might be associated
with other files at the same time or files can be stored inside a
directory that you can't read due to lack of sufficient permissions. 
What you are looking for is some kind of reverse lookup to unwind the
many-to-one relationship of files and inodes.

A couple of years ago Floyd Davidson suggested some code that may
point you to the right direction (not tested):

/* A demo program to locate file names related to an inode number */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#include <dirent.h>
#include <limits.h>

void scan_list(char *curdir, struct dirent **ptr_nl, int dirs);
int file_select(const struct dirent *nl);

ino_t inode;
char curdir[PATH_MAX] = ".";    /* default search directory */

int
main(int argc, char **argv)
{
  struct dirent **namelist;
  struct stat st;

  if (argc < 2 || argc > 3) {
    fprintf(stderr,"usage:  %s inode [directory]\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  inode = strtoul(argv[1], NULL, 10);
  if (!inode) {
    fprintf(stderr,"Error:  invalid inode\n");
    exit(EXIT_FAILURE);
  }
  if (argc == 3 && !lstat(argv[2], &st) && S_ISDIR(st.st_mode)) {
      strcpy(curdir, argv[2]);
  }

  scan_list(curdir, namelist,
      scandir(curdir, &namelist, file_select, alphasort));
  return EXIT_SUCCESS;
}

/*
 * returns 1 for directories, otherwise 0
 *     and displays any filename which matches inode.
 */
int
file_select(const struct dirent *nl)
{
  struct stat st;
  char curfile[PATH_MAX];
  
  sprintf(curfile, "%s/%s", curdir, nl->d_name);
  if (0 == lstat(curfile, &st)) {
    /* report a matching inode number */
    if (st.st_ino == inode) {
      printf("  %6lu %-20s \n", (unsigned long) st.st_ino, curfile);
    }
    /* skip these directories */
    if (!strcmp(nl->d_name, ".") || !strcmp(nl->d_name, "..")) {
      return 0;
    }
    /* otherwise list all directories */
    if (S_ISDIR(st.st_mode)) {
      return 1;
    }
  } return 0;
}

/* descend through all directories */
void
scan_list(char *olddir, struct dirent **ptr_nl, int dirs)
{
  char   savedir[PATH_MAX];
  int    i;
  struct dirent **namelist;
  
  if (dirs > 0) {
    for (i = 0; i < dirs; ++i) {
      strcpy(savedir, curdir);
      sprintf(curdir,"%s/%s", olddir, ptr_nl[i]->d_name);
      scan_list(curdir, namelist,
         scandir(curdir, &namelist, file_select, alphasort));
      strcpy(curdir, savedir);
    }
  }
}

/* End of demo program */

Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
