From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: [Fwd: Re: Implementing a file counter (like "ls | wc")]
Date: Wed, 7 Apr 2004 22:29:31 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0404072202460.31808@praktifix.dwd.de>
References: <4074313A.5090808@ig.com.br> <1081356842.18677.23.camel@Marx.fesnel.no-ip.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1081356842.18677.23.camel@Marx.fesnel.no-ip.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jowillia@vt.edu>
Cc: Luciano Moreira - igLnx <lucianolnx@ig.com.br>, linux-c-programming@vger.kernel.org

On Wed, 7 Apr 2004, John T. Williams wrote:

> You should read the GNU source code for ls, they actually filter out
> directories in a quite interesting maner. 
> 
> instead of using stat which is quite expensive, they try to open each
> file as a directory, which is expensive, but not as expensive as stat.  
> If a file opens as a directory, then it is, and they treat it as one,
> (in your case closing it and ignoring it); else if it fails to open as a
> directory, they then use stat to get information about it to print;
> 
Indeed this is a good idea, but even then I would only go through this
code path after the filtering. Any system call is always more expensive
then the filtering.

> a simple counter could look something like (my code is paraphrasing
> parts of the GNU code, but is not a copy)  Also treat it as Sudo code
> that just looks a lot like C as it is untested (not even compiled) and
> is only trying to make the point.
>  
Another minor improvement would be as stated earlier to put the strncpy()
outside the while loop:

> ___________________________________________________
> int count = 0; 
> struct dirent dir_entry;
> DIR* directory, test;
> char buff[512];
char *ptr
> 
> 
> directory = opendir('/etc');  
> /* check that it opened*/ 
> ... 
> 
strcpy(buff, '/etc/');
ptr = buff + 5;
> while( dir_entry = readdir(directory) ) {
         if (filter fits)
         {
         strcpy(ptr, dir_entry->d_name);
>         if( test = opendir( buff ) ) {
>                 /* gets here the its a directory */ 
>                 closedir(test);
>         } else {
>                 /* gets here not a directory */ 
>                 /* code to test if its a regular file */
>                 count++;
>         }
         }
> }
> 
> closedir(directory);
> 
If you have a directory with many files this might make a minor difference.
Also note that we now have a strcpy() and not a strcat() in the loop.
A strcat() will always have to find the end of the string first before
it can do its job.

But most important always try to avoid system calls!

Holger
