From: joy <gracecott@sancharnet.in>
Subject: Re: Segmentation fault from free()
Date: Wed, 25 Aug 2004 08:35:45 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <412C0209.8070805@sancharnet.in>
References: <412BA650.6050305@nec-labs.com>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <412BA650.6050305@nec-labs.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Lei Yang <leiyang@nec-labs.com>
Cc: linux-c-programming@vger.kernel.org, linux-gcc@vger.kernel.org

As already said, not much to ay w/o the full source.
However, you have allocated  a 4Kb buffer. possibly
you are reading beyond that limit into some memory space
not belonging to your program and when you try to free it,
you get a segfault. A wild guess, but is possible since you say this is
happening only for large files.

regards,
Joy.M.Monteiro

Lei Yang wrote:

> Hi friends,
>
> I am writing a c code and have been bugged by this segmentation fault 
> for a while.
>
> What I did is simply like:
>
> ----------------------------------------------------------------------------------------------------- 
>
> .........
> unsigned long blocksize = 2048;
> char *in_buffer
> char *out_buffer;
> if(( in_buffer= malloc(blocksize)) == NULL)
> {
> fprintf(stderr, "*** Can't malloc(%ld) forbuffer.\n",blocksize);
> return NULL;
> }
>
> if(( out_buffer= malloc(2*blocksize)) == NULL)
> {
> fprintf(stderr, "*** Can't malloc(%ld) forbuffer.\n",blocksize);
> free(in_buffer);
> return NULL;
> }
>
> loop: until all the data are read from file
> {
> //read a block of data from a file to in_buffer
> // do some data processing with in_buffer
> //write the result to out_buffer
> //memcpy out_buffer to list
> }
>
> free(in_buffer);
> free(out_buffer);
>
> return list;
> ......
> ----------------------------------------------------------------------------------------------------------------- 
>
>
> I've debugged with gdb to see where the segmentation fault happens, it 
> is at free(in_buffer).
> I've verified that the value for in_buffer after malloc() and before 
> free() is the same. Or in other words, in_buffer is a valid pointer 
> allocated by malloc.
>
> And the SF only happens when the file is large, although block size 
> could be small.
> Means that for both small (2KB) and large(5MB) files, block size are 
> the same. However, only large files could cause SF.
>
> Could anyone please point me out what could possibly be the reason?
> BTW, pls cc me when you reply, since I am not able to receive emails 
> from this list. Thanks a lot!
>
> TIA!
> Lei
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

