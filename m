From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Problem with pthreads on socket
Date: Sat, 6 Nov 2004 22:15:22 +0100
Message-ID: <20041106211522.GJ2094@lug-owl.de>
References: <20041106104541.53959.qmail@web90004.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U5yJ31ax00IavOwq"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041106104541.53959.qmail@web90004.mail.scd.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--U5yJ31ax00IavOwq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-11-06 02:45:41 -0800, Linux Kernel <linuxkrnl@yahoo.com>
wrote in message <20041106104541.53959.qmail@web90004.mail.scd.yahoo.com>:
> int main()=09
> 	struct sockaddr_in my_addr;    /* my address
> information */
>         struct sockaddr_in their_addr; /* connector's
> address information */
>         =09
> 	static int sockfd;
> 	int th_res=3D0;
> 	pthread_t thread;
> 	pthread_attr_t attr;
> 	int sin_size,yes=3D1,new_fd=3D0;
> 	char* mPath=3DNULL;
> 	MyARGV* marg;
> 	fd_set fd_read;
> 	void* mRetTh=3DNULL;
> 	int tCount=3D0,res_lock;
> 	T_THREAD mThread[10000];
> =09
> 	=09
> 	mPath=3D(char*)malloc(256);
> 	marg=3D(MyARGV*)malloc(sizeof(MyARGV)+256);	   =20

Why do you allocate a magic number of bytes more than needed? A "MyARGV"
pointer should exactly point to such a struct, not to something that
looks a bit like it :-)

> 	mPath=3Dgetenv((const char*)"MY_PATH");=09

This is a plain memory leak. Two lines above, you've allocated 256 bytes
(by the way, there's some error checking missing). Here, you throw aray
your pointer to your allocated memory and substitute it for a pointer to
some environment variable. That is, you don't have any chance to ever
free() the first 256 bytes.

> =09
> 	if ((sockfd =3D socket(AF_INET, SOCK_STREAM, 0)) =3D=3D -1)
> {
>             perror("socket");
>             exit(1);
>         }
> =09
> 	if
> (setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR,&yes,sizeof(int))=3D=3D-1)
> 	{
> 	    perror("SET_SOCK_OPT : \n");
> 	}
> =09
>         my_addr.sin_family =3D AF_INET;         /* host
> byte order */
>         my_addr.sin_port =3D htons(MYPORT);     /*
> short, network byte order */
>         my_addr.sin_addr.s_addr =3D INADDR_ANY; /*
> auto-fill with my IP */
>         bzero(&(my_addr.sin_zero), 8);        /* zero
> the rest of the struct */

Don't ever depend on the order of elements in any structs. Just zero out
the whole struct before you assign any needed values.

>         if (bind(sockfd, (struct sockaddr *)&my_addr,
> sizeof(struct sockaddr)) \
>                                                      =20
>                =3D=3D -1) {
>             perror("bind");
>             exit(1);
>         }
>=20
>         if (listen(sockfd, 1) =3D=3D -1) {
>             perror("listen");
>             exit(1);
>         }
> =09
> 	=09
> 	FD_ZERO(&fd_read);
> 	FD_CLR(sockfd,&fd_read);
> 	FD_SET(sockfd,&fd_read);
> =09
>         while(1) {  /* main accept() loop */
>             sin_size =3D sizeof(struct sockaddr_in);
>           =20
> res_lock=3Dselect(sockfd+1,&fd_read,NULL,NULL,NULL);

This is another bug. You need to (re-)initialize fd_read each time
before you call select(). By the way -- why do you select() select here
at all? You seem to not use the result afterwards...

> 	    if ((new_fd =3D accept(sockfd, (struct sockaddr
> *)&their_addr,&sin_size)) =3D=3D -1) {
>             	perror("accept");
>                 continue;
>             }
>            =20
>             marg->s=3Dfcntl(new_fd,F_DUPFD,0);
> 	    marg->mPath=3DmPath;
> 	    marg->their_addr=3Dtheir_addr;

No need to dup the fd -- just give it to the thread in spe.

> 	   =20
> 	    pthread_attr_init(&attr);
> 	  =20
> pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_DETACHED);

This can be done easier: just call pthread_create() and pthread_detach()

> th_res=3Dpthread_create(&thread,&attr,(void*)MyProcess,(void*)marg);

You'd have _one_ "thread" per thread, not one for each attempt to create
one! Basic trick: have a struct per client, like this:

struct client {
	struct pthread_t me;
	int fd;
	struct client *next;
};

or something like that. Write two functions (one to alloc such a struct,
fill in "fd", create thread and put it into a linked list of clients;
one to clean-up a client struct) to handle it.

By the way -- if you have a thread function of correct type, you don't
need to cast it!

> 	    pthread_attr_destroy(&attr);

Not for on-stack attr's IIRC.

> 	    if(th_res=3D=3D0)
> 	    {
> 		tCount++;
> 		printf("TH COUNT : %d\n",tCount);
> 		mThread[tCount-1].tIDX=3DtCount;
> 		mThread[tCount-1].tID=3Dthread;	=09

Statically allocated array with no tCound overflow check. Will bomb out
within 0.01sec if correctly hammered!

> 		pthread_join(thread,&mRetTh);

_Either_ detach, or join.

> 		//close(new_fd); if i close the socket , accept will
> create the same hnd_new_sock like previous...bad
> ideea.

Perfectly okay to get the same fd number a second time. If one
connection to a client is closed, the fd may be re-used for the next
client. This is why even an apache running for hundreds of days
typically doesn't exceed 1000 fds ...


> 	    =09
> 	    }
> 	    else
> 	    {
> 	    	perror("CREATE_THREAD");=09
> 	    }
> 	   =20
>         }
>     }
>=20
> }
> void MyProcess(MyARGV* MArg){=09
> 	int maxtry=3D0,mTime=3D0;
> 	int lenrecv=3D0,lenwrite=3D0,mCount=3D1,dCnt=3D0;
> 	int MyWait=3D0;
> 	char* mBuff=3DNULL;
> 	char* realPath=3DNULL;
> 	unsigned char *mcmd;
> 	fd_set fd_read;
> 	struct timeval tv;
> =09
> 	int msize=3DBUFF_SIZE,t;
> 	STR_RECV *ss;
> 	MYSQL *myDATA;
> 	=09
> 		pthread_detach(pthread_self());   =20

Another detach? You already detached this thread in the main()
function...

> 		t=3Dsetsockopt(MArg->s,SOL_SOCKET,SO_SNDBUF &&
> SO_RCVBUF,&msize,sizeof(msize));
> 		mBuff=3D(char*)malloc(BUFF_SIZE);
> 		mcmd=3D(unsigned char*)malloc(4);=09

Magic constants tend to break:-)

> 		    ss=3D(STR_RECV*)malloc(sizeof(STR_RECV)+1);	=09

Why this extra byte?

> 		    strcpy(ss->mSYS_PATH,MArg->mPath);

Missing length check

> 		    for(;;)
> 		    {
> 			maxtry++;
> 			if(maxtry=3D=3DMAX_TRY)
> 			{
> 			    exit(0);

It's a thread -- just kill it.

> 			}
> 		=09
> 			    	pthread_mutex_lock(&mmutex);

Haven't seen it anywhere. Keep in mind that it needs initialization
prior first use.

> lenrecv=3Drecv_data(MArg->s,mBuff,mTime,MArg->their_addr,MyWait);
> 			   	pthread_mutex_unlock(&mmutex);
> 			=09
> 				if(lenrecv>0)
> 			   	{
> 			   	=09
> 					PutDataInStruct(mBuff,lenrecv,ss);
> 			   =09
> 			   =09
> 					if(ss->isData=3D=3DTRUE)
> 			   		{
> 						mCount++;
> 								=09
> 						lenwrite=3DmFile(ss->mfData,realPath,lenrecv-4);
> 						if(lenwrite>0)                      =20
> 						{
> 				    		=09
> 							ss->TYPE_CMD=3DCLI_CMD_NEXT_PACK;
> 							ss->USER_CMD=3Dss->PACKIDX+1;
> 							myAlignInt(ss->TYPE_CMD,ss->USER_CMD,mcmd);
> 							pthread_mutex_lock(&mmutex);
> 							send_cmd(MArg->s,0,mcmd);
> 							pthread_mutex_unlock(&mmutex);
> 				    			=09
> 						}=09
> 			=09
> 	=09
> 		   =20
> 						//close(new_fd);
> 		    				//close(recvsock);=09

Keep in mind that a network server typically deals with two types of
file descriptors (with regard to it's clients):

- The socket() file descriptor which basically is your start to work as
  a server at all
- The accept() file descriptors -- one for each client, for each
  connection. However, you may get a given number very ofter: they may
  be re-assigned if they were closed before.

>     		    	    		}
> 					else
> 			    		{
> 						myAlignInt(ss->TYPE_CMD,ss->USER_CMD,mcmd);
> 						pthread_mutex_lock(&mmutex);
> 						send_cmd(MArg->s,10,mcmd);
> 						pthread_mutex_unlock(&mmutex);
> 					}
> 					memset(mBuff,0x0,BUFF_SIZE);
> 					memset(mcmd,0x0,4);
> 					ss->TYPE_CMD=3D0;
> 					ss->USER_CMD=3D0;
> 					memset(ss->mfData,0x0,lenrecv);
> 					mTime=3D0x0;
> 					lenwrite=3D0;
> 				    	maxtry=3D0;
> 				}
> 			   	else
> 			   	{
> 					mTime=3D0;
> 				=09
> 					FD_CLR(MArg->s,&fd_read);
> 					FD_ZERO(&fd_read);
> 					FD_SET(MArg->s,&fd_read);
> 					tv.tv_sec=3D60;
> 					tv.tv_usec=3D0;
> 					pthread_mutex_lock(&mmutex);
> 					select(MArg->s+1,&fd_read,NULL,NULL,&tv);
> 					pthread_mutex_unlock(&mmutex);
> 				}
> 			   =09
> 			   =09
>=20
> 		    }   =20
>=20
>             mBuff=3DNULL;
> 	    mcmd=3DNULL;
> 	    free(realPath);
> 	    free(mBuff);
> 	   =20
> 	    close(MArg->s);
> 	   =20
> 	    free(MArg);
> 	     =20
> 	    pthread_exit((void*)1);
> 	  =20
> }

Since I don't know the rest of the application, I don't comment on the
malloc()/free() usage and the locking about resources...

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--U5yJ31ax00IavOwq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBjT7pHb1edYOZ4bsRAt8+AJ9vv7ijGw7Nb88dpYB7zLR+7ssxKACeOC3I
lOIDqZkMK1h9KIepHcmnXgc=
=zCbk
-----END PGP SIGNATURE-----

--U5yJ31ax00IavOwq--
