From: Florian Zimmermann <florian.zimmermann@gmx.net>
Subject: Re: Problem with the /proc filesystem
Date: Wed, 17 Mar 2004 19:57:21 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1079549840.3748.6.camel@mindfsck>
References: <4D794923.2864FFD1.0000FADF@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4D794923.2864FFD1.0000FADF@aol.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Llfrg@aol.com
Cc: linux-c-programming@vger.kernel.org

you can test the same by using 'watch', e.g.
# watch -n1 cat /proc/stat

if the errors occurs as well with 'watch' it is likely
that the proc kernel interface is buggy.
otherwise you should post your own code here to analyse 
whats wrong.

Florian

On Wed, 2004-03-17 at 19:02, Llfrg@aol.com wrote:
> Hello,
> 
> I am reading the first line of /proc/stat once per second. Sometimes a bug seems to occur, which is the value of the cpu idle time become lower than the cpu idle time collected one second earlier. Does anyone know what may be happening? Below is the output of my program. Idle means the last cpu idle time read from /proc/stat and old_id is the previous cpu idle time read.
> 
> Thanks
> 
> ###Program output:
> 
> Idle: 210097666 old_id: 210097666
> user: 100 nice: 0 system: 3 idle: 0 total: 103
>  
> Idle: 210097666 old_id: 210097666
> user: 101 nice: 0 system: 2 idle: 0 total: 103
>  
> Idle: 210097666 old_id: 210097666
> user: 78 nice: 0 system: 25 idle: 0 total: 103
>  
> Idle: 210097667 old_id: 210097666
> user: 97 nice: 0 system: 6 idle: 1 total: 104
>  
> Idle: 210097666 old_id: 210097667
> user: 102 nice: 0 system: 2 idle: 4294967295 total: 103
> BUUUUG
>  
> Idle: 210097666 old_id: 210097666
> user: 101 nice: 0 system: 2 idle: 0 total: 103
>  
> Idle: 210097667 old_id: 210097666
> user: 101 nice: 0 system: 2 idle: 1 total: 104
>  
> Idle: 210097666 old_id: 210097667
> user: 101 nice: 0 system: 3 idle: 4294967295 total: 103
> BUUUUG
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


