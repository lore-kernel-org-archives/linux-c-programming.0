From: joy <gracecott@sancharnet.in>
Subject: Re: various doubts part 2
Date: Wed, 11 Aug 2004 08:22:08 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <411989D8.1030000@sancharnet.in>
References: <41183899.9000203@sancharnet.in>
 <1092121443.1419.3.camel@linux.local>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <1092121443.1419.3.camel@linux.local>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: lantis@iqranet.info, linux-c-programming@vger.kernel.org

Sascha Retzki wrote:

>Am Di, 2004-08-10 um 04.53 schrieb joy:
>  
>
>>	outfile = open(filename,O_WRONLY|O_CREAT,S_IRWXU|S_IRWXO);
>>	while((bytes_read = read(STDIN_FILENO,buff,sizeof(buff))>0))
>>	{
>>		if((bytes_written = write(outfile , buff ,bytes_read))!=bytes_read)
>>		{
>>			fprintf(stderr,"write error");
>>			exit(1);
>>		}
>>	}
>>    
>>
>
>Why not reading from 'stdin' directly ? That FD is defined in stdio.h
>iirc... What is STDIN_FILENO anyway :) ?
>  
>
Also a defined contant,  and corresponds to the fd of stdin 
(0).(Stevens, adv., prog in unix env.,)
Anyways ,I used fread and fwrite and the fellow seems to work.
guess you have to treat stdin as streams only.

Joy.M.M
