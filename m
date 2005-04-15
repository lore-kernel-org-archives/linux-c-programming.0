From: Steve Graegert <graegerts@gmail.com>
Subject: Re: how to the filename
Date: Fri, 15 Apr 2005 09:04:39 +0200
Message-ID: <6a00c8d505041500044f136659@mail.gmail.com>
References: <1113472539.5952.62.camel@localhost.localdomain>
	 <6a00c8d5050414033770f1ab96@mail.gmail.com>
	 <1113478791.5720.34.camel@localhost.localdomain>
	 <6a00c8d5050414233621e3bf5d@mail.gmail.com>
	 <1113547422.5720.94.camel@localhost.localdomain>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1113547422.5720.94.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal@rocsys.com
Cc: linux prg <linux-c-programming@vger.kernel.org>

On 4/15/05, kaushal <kaushal@rocsys.com> wrote:
> Hi Steve,
>        What I want is not the terminal name but to prove that fd 0 corresponds
> to /dev/tty3 (say).

If, say, ttyname(0) returns NULL then FD 0 is not connected to _any_
terminal, and if not, the name is returned for this particular FD
(that could be /dev/tty3 in your case).  Then you can easily prove
that FD 0 corresponds to /dev/tty3 or it does not.

Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9

> regards-
> kaushal.
> On Fri, 2005-04-15 at 12:06, Steve Graegert wrote:
> > On 4/14/05, kaushal <kaushal@rocsys.com> wrote:
> > > Hi Steve,
> > >        Thanks for the response.But how will lsof work for a particular PID.If
> > > lsof can print all the files by their names then why can't any c
> > > program?The idea was to prove that the file /dev/pts/9 or some no. is
> > > opened by the bash and to it are the stdin,stdout and stderr
> > > associated.For that ,the fds 0,1,and 2 are supposed to point to the same
> > > file /dev/pts/9 or say /dev/tty3 ....
> >
> > OK, I understand. Now I know your intention.  First of all, if you
> > know bash's PID you should be able to find open FDs by using the /proc
> > approach.  To prove that FD 0, 1 and 2 (or any FD) is associated to a
> > particular terminal you can use
> >
> >    #include <unistd.h>
> >    char *ttyname(int fildes);
> >
> > Hope this is what you want.
> >
> > Kind Regards
> >
> >     \Steve
> >
> > --
> >
> > Steve Graegert <graegerts@gmail.com>
> > Independent Software Consultant {C/C++ && Java && .NET}
> > Mobile: +49 (176)  21 24 88 69
> > Office: +49 (9131) 71 26 40 9
> >
> >
> > > This can be proved using lsof -p <PID OF THE BASH> .But how to prove
> > > that from within a c program?This lead to the sol if we can get the
> > > filename from the file descriptor and print it on the screen.
> > >
> > > regards-
> > > kaushal.
> > > On Thu, 2005-04-14 at 16:07, Steve Graegert wrote:
> > > > On 4/14/05, kaushal <kaushal@rocsys.com> wrote:
> > > > > Hello all,
> > > > >        How can I get the filename/pathname given the open file descriptor?Does
> > > > > fstat provide this feature internally?Can somebody give the code snippet
> > > > > for this.
> > > >
> > > > There is no such thing.  It is not possible to obtain a FD's filename
> > > > reliably.  Unless you are absolutely sure that this particular FD
> > > > points to a file (or directory)  and not to a socket, pipe or
> > > > something similar, you will not be able to use fstat reliably.  Which
> > > > of stat's fields are suggesting to be helpful reagarding to your
> > > > problem?  st_ino?  How would you locate a file based on its file ID?
> > > > This would require scanning the complete file system (and probably
> > > > more than one).  Another problem is, that an FD might be associated
> > > > with other files at the same time or files can be stored inside a
> > > > directory that you can't read due to lack of sufficient permissions.
> > > > What you are looking for is some kind of reverse lookup to unwind the
> > > > many-to-one relationship of files and inodes.
> > > >
> > > > A couple of years ago Floyd Davidson suggested some code that may
> > > > point you to the right direction (not tested):
> > > >
> > > > /* A demo program to locate file names related to an inode number */
> > > >
> > > > #include <stdio.h>
> > > > #include <stdlib.h>
> > > > #include <unistd.h>
> > > > #include <string.h>
> > > > #include <sys/stat.h>
> > > > #include <dirent.h>
> > > > #include <limits.h>
> > > >
> > > > void scan_list(char *curdir, struct dirent **ptr_nl, int dirs);
> > > > int file_select(const struct dirent *nl);
> > > >
> > > > ino_t inode;
> > > > char curdir[PATH_MAX] = ".";    /* default search directory */
> > > >
> > > > int
> > > > main(int argc, char **argv)
> > > > {
> > > >   struct dirent **namelist;
> > > >   struct stat st;
> > > >
> > > >   if (argc < 2 || argc > 3) {
> > > >     fprintf(stderr,"usage:  %s inode [directory]\n", argv[0]);
> > > >     exit(EXIT_FAILURE);
> > > >   }
> > > >   inode = strtoul(argv[1], NULL, 10);
> > > >   if (!inode) {
> > > >     fprintf(stderr,"Error:  invalid inode\n");
> > > >     exit(EXIT_FAILURE);
> > > >   }
> > > >   if (argc == 3 && !lstat(argv[2], &st) && S_ISDIR(st.st_mode)) {
> > > >       strcpy(curdir, argv[2]);
> > > >   }
> > > >
> > > >   scan_list(curdir, namelist,
> > > >       scandir(curdir, &namelist, file_select, alphasort));
> > > >   return EXIT_SUCCESS;
> > > > }
> > > >
> > > > /*
> > > >  * returns 1 for directories, otherwise 0
> > > >  *     and displays any filename which matches inode.
> > > >  */
> > > > int
> > > > file_select(const struct dirent *nl)
> > > > {
> > > >   struct stat st;
> > > >   char curfile[PATH_MAX];
> > > >
> > > >   sprintf(curfile, "%s/%s", curdir, nl->d_name);
> > > >   if (0 == lstat(curfile, &st)) {
> > > >     /* report a matching inode number */
> > > >     if (st.st_ino == inode) {
> > > >       printf("  %6lu %-20s \n", (unsigned long) st.st_ino, curfile);
> > > >     }
> > > >     /* skip these directories */
> > > >     if (!strcmp(nl->d_name, ".") || !strcmp(nl->d_name, "..")) {
> > > >       return 0;
> > > >     }
> > > >     /* otherwise list all directories */
> > > >     if (S_ISDIR(st.st_mode)) {
> > > >       return 1;
> > > >     }
> > > >   } return 0;
> > > > }
> > > >
> > > > /* descend through all directories */
> > > > void
> > > > scan_list(char *olddir, struct dirent **ptr_nl, int dirs)
> > > > {
> > > >   char   savedir[PATH_MAX];
> > > >   int    i;
> > > >   struct dirent **namelist;
> > > >
> > > >   if (dirs > 0) {
> > > >     for (i = 0; i < dirs; ++i) {
> > > >       strcpy(savedir, curdir);
> > > >       sprintf(curdir,"%s/%s", olddir, ptr_nl[i]->d_name);
> > > >       scan_list(curdir, namelist,
> > > >          scandir(curdir, &namelist, file_select, alphasort));
> > > >       strcpy(curdir, savedir);
> > > >     }
> > > >   }
> > > > }
> > > >
> > > > /* End of demo program */
> > > >
> > > > Kind Regards
> > > >
> > > >     \Steve
> > > >
> > > > --
> > > >
> > > > Steve Graegert <graegerts@gmail.com>
> > > > Independent Software Consultant {C/C++ && Java && .NET}
> > > > Mobile: +49 (176)  21 24 88 69
> > > > Office: +49 (9131) 71 26 40 9
> > >
> > >
>
