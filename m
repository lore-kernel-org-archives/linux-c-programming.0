From: Vadiraj C S <vadiraj@mail.cyberneme.com>
Subject: Re: problem in open sys call
Date: Wed, 21 Apr 2004 11:44:27 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040421114427.06d9f4b1.vadiraj@mail.cyberneme.com>
References: <40856C8C.9090003@sancharnet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40856C8C.9090003@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gracecott@sancharnet.in
Cc: linux-c-programming@vger.kernel.org


 Best way to avoid this problems, effecient use of printf's and yes GDB would 
have solved your prblem then.

> 
> 	if((fd=open(opcode, O_RDONLY))==-1)
> 		printf("oops");

 Instead of printf("oops") go with perror(3) will prints cause of the error of the function 
like this.


 if ( ( fd = open (opcode, O_RDONLY ) ) == -1 )
 	perror("open Failed:");

 this will print the error message prefixed with your message "open Failed" 

 man perror for manual.

Cheers,

-- 

With Best Regards
 Vadiraj C S    
