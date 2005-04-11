From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Check if a process exists? (EXTENDING THE QUESTION)
Date: Mon, 11 Apr 2005 09:59:58 +0800
Message-ID: <4259DA1E.9000409@hq.ntsp.nec.co.jp>
References: <20050409_015010_024210.lucianolnx@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050409_015010_024210.lucianolnx@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

is the daemon/application name unique? maybe u can use a  script that 
makes use of the top-command.
or maybe u can make use of the pstat_getproc() c function.(but im not 
sure if there's a pstat_getproc
func in linux... im using hpux on itanium)

the code below relies on the fact that at any given moment, there is 
only one instance of the
application running...  the code is just a simple-search-and-print.
------------------------------------------------------
  struct pst_status * psa = NULL;
  struct pst_status * prc = NULL;
  struct pst_dynamic  psd;
  long                nproc = 0;
  long                i;

  if ( pstat_getdynamic(&psd, sizeof(psd), 1, 0) == -1 )
    (void)perror("pstat_getdynamic failed");

  nproc  = psd.psd_activeprocs;
  psa    = (struct pst_status *)malloc(nproc * sizeof(struct pst_status));

  if ( pstat_getproc(psa, sizeof(struct pst_status), nproc, 0) == -1 )
    (void)perror("pstat_getproc failed");

  // Report the process info as required
  prc = (struct pst_status *)psa;
  for (i=0; i < nproc; i++)
  {
    if ( strcmp( prc->pst_cmd, "APPLICATION NAME" ) == 0 )
    {
       (void)printf("PID IS %d \n", prc->pst_pid);
       break;
     }
     ++prc;
  }
------------------------------------------------------


lucianolnx wrote:

>Today, what are the bests ways to know if a deamon is running without 
>knowing its PID ? 
>
>My old technique (used until now), is based on recovering the PID saved by 
>the own process in a special and known location (like a file), almost all 
>times persisted (PERSISTENCE IS A PROBLEM). 
>
>Luciano 
>
>
>
>On Tue, 1 Mar 2005, Hareesh Nagarajan wrote: 
>
>  
>
>>Hi, 
>>
>>Can a process check if a given PID exists or not? In other words can a 
>>process check if an unrelated process is alive? Is there any system 
>>call that does this? 
>>
>>    
>>
>Use kill() with a second argument being zero. 
>
>    if (kill(pid, 0) == -1) 
>    { 
>       /* Process is not there. */ 
>    } 
>    else 
>    { 
>       /* Process is alive. */ 
>    } 
>
>Holger 
>  
>


