From: joy <gracecott@sancharnet.in>
Subject: Re: problem in open sys call
Date: Wed, 21 Apr 2004 14:30:00 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40863810.4000500@sancharnet.in>
References: <40856C8C.9090003@sancharnet.in>
 <16517.33454.650019.399163@cerise.nosuchdomain.co.uk>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

Glynn Clements wrote:

>joy wrote:
>
>  
>
>>I have a small prblem i the open call. it fails every time and I dont 
>>know why.
>>    
>>
>
>  
>
>>const char opcode[]="opcode.sheet";
>>    
>>
>
>  
>
>>	char buff[8192],temp[10],bin=0,opcode[3];
>>    
>>
>==>	                               ^^^^^^
>
>  
>
>>	if((fd=open(opcode, O_RDONLY))==-1)
>>		printf("oops");
>>    
>>
thanks a lot, Glynn. I seem to be learning so much but must have 
somehow  missed the commonsense classes!

>In the open() call, the variable "opcode" refers to the local variable
>of that name, which will be uninitialised, and not the global variable
>which actually contains your filename.
>
>Running your program under strace or a debugger would show that the
>filename which is passed to open() isn't what you are expecting.
>
>  
>



