From: Robert Lorentz <rlorentz@lucidsoft.org>
Subject: Re: how to implement tail -n
Date: Tue, 25 Jan 2005 09:10:23 -0500
Message-ID: <41F6534F.4030507@lucidsoft.org>
References: <1106461572.1122.1.camel@KrishnaMohan> <1106487378.1122.14.camel@KrishnaMohan> <009a01c501d8$6d504cf0$dc846840@apac.cisco.com> <200501240030.29947.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200501240030.29947.eric@cisu.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: eric@cisu.net
Cc: Venkatesh Joshi <joshiv@cisco.com>, linux-c-programming@vger.kernel.org

Eric Bambach wrote:

>On Sunday 23 January 2005 11:49 pm, you wrote:
>  
>
>>Hi,
>>
>>I would like to know how to implement "tail -n" in C.
>>
>>The "-n" option will be used to print the last n lines of a file -
>>rather than the default option of printing the last 10 lines of a file.
>>
>>I wish to do this in a single pass. I can use lseek() to go to the end
>>of the file. How to traverse backwards from there ? Is there any
>>function that does this ?
>>    
>>
>
>Not that I know of. There is no GOOD way to do this in a single pass since the 
>lines can be of varying length. If by single pass you meant you want 
>performace, then dont read a char at a time, rather just seek to the end of 
>the file,  read in about 4K( a reasonable buffer) or so and see if you can 
>find (n+1) newlines. If you dont, read in 4 more k and keep going backwards 
>till you find them.
>
>P.S. Please dont hi-jack subjects. Type in a new message instead of replying 
>to something and deleting the original message; it screws with threading.
>
>
>  
>
>>thanks,
>>venkatesh
>>-
>>To unsubscribe from this list: send the line "unsubscribe
>>linux-c-programming" in the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>    
>>
>
>  
>

What Eric describes is exactly how it IS implemented in GNU tail.  To 
see this implementation you can look at the source which can be found in 
this tarball -- http://ftp.gnu.org/gnu/coreutils/coreutils-5.2.0.tar.gz  
(src/tail.c)

Sometimes looking at source is enlightening, sometimes it is not.  In 
this particular case the code is extremely well commented and clear, so 
you should be able to get some good info fast.  The function you're 
interested in is 'file_lines(...'

Robert
