From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: Re: how to read a constantly changing file
Date: Wed, 5 Jun 2002 17:09:55 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0206051702360.1073-100000@soochak.ncst.ernet.in>
References: <20020604095456.GA1012@cam.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020604095456.GA1012@cam.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Smith <sos22@cam.ac.uk>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>



That's ok but it is not feasible to open a file every time it changes, go 
to the last bytes which appended to the file and print it (tail command) 
especially when the filesize is bigger (eg log file). There must be some 
other method.

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************

On Tue, 4 Jun 2002, Steven Smith wrote:

> > I want to know how can I read a file (through a C code) which is 
> > constatnly changing, like a log file.(eg tail command)
> As far as I can make out, tail does it by sitting in a loop
> and calling sleep(1), and then fstat() to see if the file's grown.
> 
> You might be better off looking at directory change notifications
> for the parent directory. The closest thing this has to documentation
> is fs/dnotify.c in the kernel source, though.
> 
> Steven Smith,
> sos22@cam.ac.uk.
> 

