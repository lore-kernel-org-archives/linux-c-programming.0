From: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Subject: Re: various doubts part 2
Date: Wed, 11 Aug 2004 19:21:31 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040811192131.52ff2760.lcapitulino@terra.com.br>
References: <41183899.9000203@sancharnet.in>
	<1092121443.1419.3.camel@linux.local>
	<411989D8.1030000@sancharnet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <411989D8.1030000@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gracecott@sancharnet.in
Cc: lantis@iqranet.info, linux-c-programming@vger.kernel.org

Em Wed, 11 Aug 2004 08:22:08 +0530
joy <gracecott@sancharnet.in> screveu:

| Sascha Retzki wrote:
| 
| >Am Di, 2004-08-10 um 04.53 schrieb joy:
| >  
| >
| >>	outfile = open(filename,O_WRONLY|O_CREAT,S_IRWXU|S_IRWXO);
| >>	while((bytes_read = read(STDIN_FILENO,buff,sizeof(buff))>0))
| >>	{
| >>		if((bytes_written = write(outfile , buff ,bytes_read))!=bytes_read)
| >>		{
| >>			fprintf(stderr,"write error");
| >>			exit(1);
| >>		}
| >>	}
| >>    
| >>
| >
| >Why not reading from 'stdin' directly ? That FD is defined in stdio.h
| >iirc... What is STDIN_FILENO anyway :) ?
| >  
| >
| Also a defined contant,  and corresponds to the fd of stdin 
| (0).(Stevens, adv., prog in unix env.,)
| Anyways ,I used fread and fwrite and the fellow seems to work.
| guess you have to treat stdin as streams only.

 Don't, I found the bug:

while((bytes_read = read(STDIN_FILENO,buff,sizeof(buff))>0))

 look where ">0" is inside... If you change to:

while((bytes_read = read(STDIN_FILENO,buff,sizeof(buff)))>0)

 it will work... man, this bug needed about 20 min to be catch up...

 every time I did run the program I tought "it _must_ work, all is
right"... Only saw the bug when I started to write it again myself. :)

 and I didn't played with the second part of the code, because
I didn't understand very well what do you want.

PS(0): I'm not a C expert, but I advice you: *always* try to write
clean code.

PS(1): I worked in this because I can't sleep when something which
should work don't work.


-- 
Luiz Fernando
