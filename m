From: Linux Kernel <linuxkrnl@yahoo.com>
Subject: Problem with pthreads on socket
Date: Sat, 6 Nov 2004 02:45:41 -0800 (PST)
Message-ID: <20041106104541.53959.qmail@web90004.mail.scd.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi to everybody,
I'm not have too much exoerience eith pthread but i
try to use this insted of fork() to have independent
thread processes.
I write a server/client application using socket and
the main problem is that affter first client is
accepted by accept(), the second accepted client broke
the 1-st created thread an the socket remain blocked.
I'm stuck and i don't understand what happening.
A *slice* of my code :
int main()	
	struct sockaddr_in my_addr;    /* my address
information */
        struct sockaddr_in their_addr; /* connector's
address information */
        	
	static int sockfd;
	int th_res=0;
	pthread_t thread;
	pthread_attr_t attr;
	int sin_size,yes=1,new_fd=0;
	char* mPath=NULL;
	MyARGV* marg;
	fd_set fd_read;
	void* mRetTh=NULL;
	int tCount=0,res_lock;
	T_THREAD mThread[10000];
	
		
	mPath=(char*)malloc(256);
	marg=(MyARGV*)malloc(sizeof(MyARGV)+256);	    
	mPath=getenv((const char*)"MY_PATH");	
	
	
	if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
{
            perror("socket");
            exit(1);
        }
	
	if
(setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR,&yes,sizeof(int))==-1)
	{
	    perror("SET_SOCK_OPT : \n");
	}
	
        my_addr.sin_family = AF_INET;         /* host
byte order */
        my_addr.sin_port = htons(MYPORT);     /*
short, network byte order */
        my_addr.sin_addr.s_addr = INADDR_ANY; /*
auto-fill with my IP */
        bzero(&(my_addr.sin_zero), 8);        /* zero
the rest of the struct */

        if (bind(sockfd, (struct sockaddr *)&my_addr,
sizeof(struct sockaddr)) \
                                                      
               == -1) {
            perror("bind");
            exit(1);
        }

        if (listen(sockfd, 1) == -1) {
            perror("listen");
            exit(1);
        }
	
		
	FD_ZERO(&fd_read);
	FD_CLR(sockfd,&fd_read);
	FD_SET(sockfd,&fd_read);
	
        while(1) {  /* main accept() loop */
            sin_size = sizeof(struct sockaddr_in);
           
res_lock=select(sockfd+1,&fd_read,NULL,NULL,NULL);
	    
	    if ((new_fd = accept(sockfd, (struct sockaddr
*)&their_addr,&sin_size)) == -1) {
            	perror("accept");
                continue;
            }
            
            marg->s=fcntl(new_fd,F_DUPFD,0);
	    marg->mPath=mPath;
	    marg->their_addr=their_addr;

	    
	    pthread_attr_init(&attr);
	   
pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_DETACHED);
	   
th_res=pthread_create(&thread,&attr,(void*)MyProcess,(void*)marg);
	    pthread_attr_destroy(&attr);
	    
	    if(th_res==0)
	    {
		tCount++;
		printf("TH COUNT : %d\n",tCount);
		mThread[tCount-1].tIDX=tCount;
		mThread[tCount-1].tID=thread;		
		pthread_join(thread,&mRetTh);
		//close(new_fd); if i close the socket , accept will
create the same hnd_new_sock like previous...bad
ideea.
	    	
	    }
	    else
	    {
	    	perror("CREATE_THREAD");	
	    }
	    
        }
    }

}
void MyProcess(MyARGV* MArg){	
	int maxtry=0,mTime=0;
	int lenrecv=0,lenwrite=0,mCount=1,dCnt=0;
	int MyWait=0;
	char* mBuff=NULL;
	char* realPath=NULL;
	unsigned char *mcmd;
	fd_set fd_read;
	struct timeval tv;
	
	int msize=BUFF_SIZE,t;
	STR_RECV *ss;
	MYSQL *myDATA;
		
		pthread_detach(pthread_self());    
		
		t=setsockopt(MArg->s,SOL_SOCKET,SO_SNDBUF &&
SO_RCVBUF,&msize,sizeof(msize));
		mBuff=(char*)malloc(BUFF_SIZE);
		mcmd=(unsigned char*)malloc(4);	
		    ss=(STR_RECV*)malloc(sizeof(STR_RECV)+1);		
    		    
		    strcpy(ss->mSYS_PATH,MArg->mPath);
		    
		    for(;;)
		    {
			maxtry++;
			if(maxtry==MAX_TRY)
			{
			    exit(0);
			}
			
			    	pthread_mutex_lock(&mmutex);
			   
lenrecv=recv_data(MArg->s,mBuff,mTime,MArg->their_addr,MyWait);
			   	pthread_mutex_unlock(&mmutex);
				
				if(lenrecv>0)
			   	{
			   		
					PutDataInStruct(mBuff,lenrecv,ss);
			   	
			   	
					if(ss->isData==TRUE)
			   		{
						mCount++;
									
						lenwrite=mFile(ss->mfData,realPath,lenrecv-4);
						if(lenwrite>0)                       
						{
				    			
							ss->TYPE_CMD=CLI_CMD_NEXT_PACK;
							ss->USER_CMD=ss->PACKIDX+1;
							myAlignInt(ss->TYPE_CMD,ss->USER_CMD,mcmd);
							pthread_mutex_lock(&mmutex);
							send_cmd(MArg->s,0,mcmd);
							pthread_mutex_unlock(&mmutex);
				    				
						}	
				
		
		    
						//close(new_fd);
		    				//close(recvsock);	
    		    	    		}
					else
			    		{
						myAlignInt(ss->TYPE_CMD,ss->USER_CMD,mcmd);
						pthread_mutex_lock(&mmutex);
						send_cmd(MArg->s,10,mcmd);
						pthread_mutex_unlock(&mmutex);
					}
					memset(mBuff,0x0,BUFF_SIZE);
					memset(mcmd,0x0,4);
					ss->TYPE_CMD=0;
					ss->USER_CMD=0;
					memset(ss->mfData,0x0,lenrecv);
					mTime=0x0;
					lenwrite=0;
				    	maxtry=0;
				}
			   	else
			   	{
					mTime=0;
					
					FD_CLR(MArg->s,&fd_read);
					FD_ZERO(&fd_read);
					FD_SET(MArg->s,&fd_read);
					tv.tv_sec=60;
					tv.tv_usec=0;
					pthread_mutex_lock(&mmutex);
					select(MArg->s+1,&fd_read,NULL,NULL,&tv);
					pthread_mutex_unlock(&mmutex);
				}
			   	
			   	

		    }    

            mBuff=NULL;
	    mcmd=NULL;
	    free(realPath);
	    free(mBuff);
	    
	    close(MArg->s);
	    
	    free(MArg);
	      
	    pthread_exit((void*)1);
	   
}
Thks,

ZaZoo


		
__________________________________ 
Do you Yahoo!? 
Check out the new Yahoo! Front Page. 
www.yahoo.com 
 

