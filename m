From: Helmut Djurkin <djh@tscheinig.com>
Subject: Re: good pthreads example?
Date: Wed, 24 Sep 2003 18:42:47 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F71C987.5020804@tscheinig.com>
References: <8EA11405E59BD611BA7100104B93C26002254BE0@exdel01.del.mgsl.com> <20030924142038.GA23791@nevernight.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030924142038.GA23791@nevernight.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Cooper <jcooper@nevernight.net>
Cc: linux-c-programming@vger.kernel.org

Hi,

the following (ugly) script lists all files (from /usr/bin) with
libpthread usage.

result looks like:
./tail               uses libpthread
./python2.2          uses libpthread
./python             uses libpthread
./rpm2cpio           uses libpthread
./dig                uses libpthread
./host               uses libpthread
./nslookup           uses libpthread
./nsupdate           uses libpthread
./diff               uses libpthread
<big-snip>


# ---------------------------------------------------------------------
#!/bin/bash

CMD_FILE=/usr/bin/file
CMD_LDD=/usr/bin/ldd
CMD_GREP=/bin/grep
CMD_PATH_TO_SEARCH=/usr/bin
LIB_STRING=libpthread

FILES=`find $PATH_TO_SEARCH -type f`
for file in $FILES; do
	$CMD_FILE $file | $CMD_GREP dynamic 1>&2>/dev/null
	if [ $? -eq 0 ]; then
		$CMD_LDD $file | $CMD_GREP $LIB_STRING 1>&2>/dev/null
		if [ $? -eq 0 ]; then
			printf "%-20s uses $LIB_STRING\n" $file
		fi
	fi
done
# ---------------------------------------------------------------------


hope this helps.
bye helmut


Jason Cooper wrote:
> Harmeet Uppal (Harmeet_Uppal@KeaneIndia.com) scribbled:
> 
>>Hi Jason,
>>
>>I would suggest you start with Thread Time a book from HP Press and do
>>chapter to chapter coding. It would be a great help.
>>
>>-Harmeet
>>
>>-----Original Message-----
>>From: Jason Cooper [mailto:jcooper@nevernight.net]
>>Sent: Monday, September 22, 2003 6:44 PM
>>To: linux-c-programming@vger.kernel.org
>>Subject: Re: good pthreads example?
>>
>>
>>Raghuveer (rvk@gsecone.com) scribbled:
> 
> [snip]
> 
>>>Jason Cooper wrote:
>>>
>>>
>>>>Hey all,
>>>>
>>>>I've been learning pthreads for the past week or so.  So far, I've read
>>>>through the man pages, "Pthreads Programming" from O'Reilly, an old
>>>>copy of POSIX 4, and other various google searches.
>>>>
>>>>What I'm looking for is a good example (open source, of course) of 
>>>>pthreads in practice.  It doesn't matter whether it's boss/worker,
>>>>peer/peer, or assembly line.  I'm looking for practical examples to
>>>>learn from.  
>>>>
>>>>The O'Reilly book has a good ATM (cash machine, client/server) example,
>>>>but it isn't implemented in the real world...
>>>>
>>>>TIA,
>>>>
>>>>Cooper.
>>>>
>>>>PS - I know grepping through source will provide plenty of examples of
>>>>pthreads in action, but I wouldn't know if they are sound
>>>>implementations or not.
>>
>>Thanks for the reply, unfortunately, what I'm looking for is a
>>recommendation of a good FS/OSS package to look at which implements
>>pthreads.  
>>
>>As usual, my long-windedness confused the issue :)
>>
>>Cooper.
> 
> 
> Thanks, I'll take a look at it.  
> 
> I had a chance to grep through /usr/bin for 'pthread', and found 
> that almost everything appears to implement pthreads.  Unfortunately,
> grepping through /usr/sbin revealed that sshd (nor ssh from previous
> search) does not implement pthreads.  I had hoped that a package like
> OpenSSH, which has a solid reputation, would have been a good example.
> Oh well, qmail doesn't appear to either...  Back to the books. *8v)
> 
> Perhaps apache or postfix?  I don't use either, so I'll have to d'l them
> later...
> 
> Cooper.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 



