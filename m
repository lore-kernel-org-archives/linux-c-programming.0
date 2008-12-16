From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Trouble reading a character device.
Date: Tue, 16 Dec 2008 14:51:48 +0000
Message-ID: <18759.49284.737408.12661@cerise.gclements.plus.com>
References: <2e0180190812152308j64b827a2r21da6ff56e139f7e@mail.gmail.com>
	<2e0180190812152311l5d01e9aek6728832d5babbb14@mail.gmail.com>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <2e0180190812152311l5d01e9aek6728832d5babbb14@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: saravanaraj v <saravanaraj.v@gmail.com>
Cc: linux-c-programming@vger.kernel.org


saravanaraj v wrote:

>    I am facing few issues in reading from a character device.
>    I have created few character devices using 'mknod' and I am writing
> continuously to those devices using 'printk'. After some time I start
> another process to read from the device. The open/read is done using
> normal sys calls for file open/reading. I have pasted the code for
> your ref. When I run this program the read happens for some time and
> then there is no progress. I am suspecting that  everything written to
> the device before this program was started is read. The flags I tried
> for opening the file were RD, RDWR with/without NONBLOCK. The output
> was same in all the cases. I tried "cu -l /dev/virt_uart8". It was
> able to read continuosuly without any problem. Can someone tell where
> the problem is ?
> 
> int main(){
> 
> int fd,counter=0;
> fd = open("/dev/virt_uart8",O_RDONLY|O_NONBLOCK);
> if(fd<0) printf("\nError in opeining file");
> while(1){
> 
>     int nread = 0;
>     nread = read(fd,buffer,MAX_BUFFER_SIZE-1);
>     if(nread>0) {
>         buffer[nread]='\0';
>         printf("%s",buffer);
>     }

If you want to print data which doesn't necessarily have a trailing
newline, you need fflush(stdout) or setvbuf(stdout, NULL, _IONBF, 0).

If you make that change and still have problems, it's likely to be an
issue with the device. E.g. you may need to disable XON/XOFF
processing with tcsetattr(), or put the device into raw mode.

-- 
Glynn Clements <glynn@gclements.plus.com>
