From: Sascha Retzki <lantis@iqranet.info>
Subject: Re: various doubts part 2
Date: Tue, 10 Aug 2004 09:04:03 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1092121443.1419.3.camel@linux.local>
References: <41183899.9000203@sancharnet.in>
Reply-To: lantis@iqranet.info
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <41183899.9000203@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Am Di, 2004-08-10 um 04.53 schrieb joy:
> 	outfile = open(filename,O_WRONLY|O_CREAT,S_IRWXU|S_IRWXO);
> 	while((bytes_read = read(STDIN_FILENO,buff,sizeof(buff))>0))
> 	{
> 		if((bytes_written = write(outfile , buff ,bytes_read))!=bytes_read)
> 		{
> 			fprintf(stderr,"write error");
> 			exit(1);
> 		}
> 	}

Why not reading from 'stdin' directly ? That FD is defined in stdio.h
iirc... What is STDIN_FILENO anyway :) ?

