From: Linux Kernel <linuxkrnl@yahoo.com>
Subject: Re: Problem with pthreads on socket
Date: Sun, 7 Nov 2004 01:15:17 -0800 (PST)
Message-ID: <20041107091517.63691.qmail@web90004.mail.scd.yahoo.com>
References: <20041106211522.GJ2094@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041106211522.GJ2094@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>, linux-c-programming@vger.kernel.org

Hi,
Thks for your answer,
First of all i must to tell that the code which was
shown by me, was dramatically cut.And i let only what
i consider that is importonat on my problem.
Why i use malloc for any bytes ? Because i'm verry
carefully with all pointers.
Is more practice(at least for me) to use
malloc(fix_size) instead of malloc(size_of_pointer)
because the compiler will consider the maximum size
from memory stack for this pointer. :)
I use MALLOC_CHECK_=1 and i don't have problems with
memory.free() is able to dealocate memory region => 4
bytes.This application , using fork(), consume max.
4-5% from memory with 100 clients on the same time.
Returning on my problem ... :)
is after accept(),accept the second client.
When accept() return the new_fd, the first
thread(which working and do a lot of I/O) is blocked.
I wish to know, like principle, why ?
From what i understand,in fact, this threads are
working asynchronus and by using mutex, to be a switch
between threads.
I wish to know how the threads can run synchronus or
totally independent.
If you know, some how, a sample source code which is
working, please tell me. 
Thks again,
Zazoo
 :)
P.S. I can send by e-mail the entire source code.

--- Jan-Benedict Glaw <jbglaw@lug-owl.de> wrote:

> On Sat, 2004-11-06 02:45:41 -0800, Linux Kernel
> <linuxkrnl@yahoo.com>
> wrote in message
>
<20041106104541.53959.qmail@web90004.mail.scd.yahoo.com>:
> > int main()	
> > 	struct sockaddr_in my_addr;    /* my address
> > information */
> >         struct sockaddr_in their_addr; /*
> connector's
> > address information */
> >         	
> > 	static int sockfd;
> > 	int th_res=0;
> > 	pthread_t thread;
> > 	pthread_attr_t attr;
> > 	int sin_size,yes=1,new_fd=0;
> > 	char* mPath=NULL;
> > 	MyARGV* marg;
> > 	fd_set fd_read;
> > 	void* mRetTh=NULL;
> > 	int tCount=0,res_lock;
> > 	T_THREAD mThread[10000];
> > 	
> > 		
> > 	mPath=(char*)malloc(256);
> > 	marg=(MyARGV*)malloc(sizeof(MyARGV)+256);	    
> 
> Why do you allocate a magic number of bytes more
> than needed? A "MyARGV"
> pointer should exactly point to such a struct, not
> to something that
> looks a bit like it :-)
> 
> > 	mPath=getenv((const char*)"MY_PATH");	
> 
> This is a plain memory leak. Two lines above, you've
> allocated 256 bytes
> (by the way, there's some error checking missing).
> Here, you throw aray
> your pointer to your allocated memory and substitute
> it for a pointer to
> some environment variable. That is, you don't have
> any chance to ever
> free() the first 256 bytes.
> 
> > 	
> > 	if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) ==
> -1)
> > {
> >             perror("socket");
> >             exit(1);
> >         }
> > 	
> > 	if
> >
>
(setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR,&yes,sizeof(int))==-1)
> > 	{
> > 	    perror("SET_SOCK_OPT : \n");
> > 	}
> > 	
> >         my_addr.sin_family = AF_INET;         /*
> host
> > byte order */
> >         my_addr.sin_port = htons(MYPORT);     /*
> > short, network byte order */
> >         my_addr.sin_addr.s_addr = INADDR_ANY; /*
> > auto-fill with my IP */
> >         bzero(&(my_addr.sin_zero), 8);        /*
> zero
> > the rest of the struct */
> 
> Don't ever depend on the order of elements in any
> structs. Just zero out
> the whole struct before you assign any needed
> values.
> 
> >         if (bind(sockfd, (struct sockaddr
> *)&my_addr,
> > sizeof(struct sockaddr)) \
> >                                                   
>    
> >                == -1) {
> >             perror("bind");
> >             exit(1);
> >         }
> > 
> >         if (listen(sockfd, 1) == -1) {
> >             perror("listen");
> >             exit(1);
> >         }
> > 	
> > 		
> > 	FD_ZERO(&fd_read);
> > 	FD_CLR(sockfd,&fd_read);
> > 	FD_SET(sockfd,&fd_read);
> > 	
> >         while(1) {  /* main accept() loop */
> >             sin_size = sizeof(struct sockaddr_in);
> >            
> > res_lock=select(sockfd+1,&fd_read,NULL,NULL,NULL);
> 
> This is another bug. You need to (re-)initialize
> fd_read each time
> before you call select(). By the way -- why do you
> select() select here
> at all? You seem to not use the result afterwards...
> 
> > 	    if ((new_fd = accept(sockfd, (struct sockaddr
> > *)&their_addr,&sin_size)) == -1) {
> >             	perror("accept");
> >                 continue;
> >             }
> >             
> >             marg->s=fcntl(new_fd,F_DUPFD,0);
> > 	    marg->mPath=mPath;
> > 	    marg->their_addr=their_addr;
> 
> No need to dup the fd -- just give it to the thread
> in spe.
> 
> > 	    
> > 	    pthread_attr_init(&attr);
> > 	   
> >
>
pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_DETACHED);
> 
> This can be done easier: just call pthread_create()
> and pthread_detach()
> 
> >
>
th_res=pthread_create(&thread,&attr,(void*)MyProcess,(void*)marg);
> 
> You'd have _one_ "thread" per thread, not one for
> each attempt to create
> one! Basic trick: have a struct per client, like
> this:
> 
> struct client {
> 	struct pthread_t me;
> 	int fd;
> 	struct client *next;
> };
> 
> or something like that. Write two functions (one to
> alloc such a struct,
> fill in "fd", create thread and put it into a linked
> list of clients;
> one to clean-up a client struct) to handle it.
> 
> By the way -- if you have a thread function of
> correct type, you don't
> need to cast it!
> 
> > 	    pthread_attr_destroy(&attr);
> 
> Not for on-stack attr's IIRC.
> 
> > 	    if(th_res==0)
> > 	    {
> > 		tCount++;
> > 		printf("TH COUNT : %d\n",tCount);
> > 		mThread[tCount-1].tIDX=tCount;
> > 		mThread[tCount-1].tID=thread;		
> 
> Statically allocated array with no tCound overflow
> check. Will bomb out
> within 0.01sec if correctly hammered!
> 
> > 		pthread_join(thread,&mRetTh);
> 
> _Either_ detach, or join.
> 
> > 		//close(new_fd); if i close the socket , accept
> will
> > create the same hnd_new_sock like previous...bad
> > ideea.
> 
> Perfectly okay to get the same fd number a second
> time. If one
> connection to a client is closed, the fd may be
> re-used for the next
> client. This is why even an apache running for
> hundreds of days
> typically doesn't exceed 1000 fds ...
> 
> 
> > 	    	
> > 	    }
> > 	    else
> > 	    {
> > 	    	perror("CREATE_THREAD");	
> > 	    }
> > 	    
> >         }
> >     }
> > 
> > }
> > void MyProcess(MyARGV* MArg){	
> > 	int maxtry=0,mTime=0;
> > 	int lenrecv=0,lenwrite=0,mCount=1,dCnt=0;
> > 	int MyWait=0;
> 
=== message truncated ===

> ATTACHMENT part 2 application/pgp-signature
name=signature.asc




		
__________________________________ 
Do you Yahoo!? 
Check out the new Yahoo! Front Page. 
www.yahoo.com 
 

