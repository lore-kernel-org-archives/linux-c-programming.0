From: Tim Walberg <twalberg@comcast.net>
Subject: Re: Division in loop
Date: Tue, 8 Sep 2009 09:58:38 -0500
Message-ID: <20090908145838.GF947@comcast.net>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Reply-To: Tim Walberg <twalberg@comcast.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

What are the typical values of bytes and size? Suspect
"(bytes / size)", being integer division, probably truncates
to 0 if size is relatively large...

Maybe you want "(bytes * 100) / size"? Or as another
alternative (arithmetically approximately equivalent,
but not quite as clear, however, it saves on multiply
operations):


size = size / 100;
...
...
...
printf(... bytes / size);



On 09/08/2009 21:40 +0700, Randi Botse wrote:
>>	hi all,
>>	
>>	....
>>	int fd, fdp;
>>	unsigned int size;
>>	int progress = 0;
>>	size_t bytes = 0;
>>	void *buffer;
>>	....
>>	
>>	/* open fd from a device then create fdp, allocate buffer,, etc. */
>>	
>>	while (bytes < size) {
>>	        ret = read(fd, buffer + bytes, size - bytes);
>>	        if (ret == -1) {
>>	            perror("read");
>>	            return -1;
>>	        }
>>	        ret = write(fdp, buffer + bytes, ret);
>>	        if (ret == -1) {
>>	            perror("write");
>>	            return -1;
>>	        }
>>	        bytes += ret;
>>	
>>	        progress = (int) ((bytes / size) * 100);
>>	        printf("\rcompleted: %i%%", progress);
>>	        fflush(stdout);
>>	    }
>>	
>>	....
>>	
>>	I run this loop to receive some data, the printf() seem not updated,
>>	the progress output is
>>	always in it's initial value until the loop was finished. but when i do...
>>	
>>	progress = (int) ((bytes / 2) * 100); /* change size to 2 (or random number) */
>>	
>>	then it's works... what's wrong here???
>>	--
>>	To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>>	the body of a message to majordomo@vger.kernel.org
>>	More majordomo info at  http://vger.kernel.org/majordomo-info.html
End of included message



-- 
+----------------------+
| Tim Walberg          |
| 830 Carriage Dr.     |
| Algonquin, IL 60102  |
| twalberg@comcast.net |
+----------------------+
