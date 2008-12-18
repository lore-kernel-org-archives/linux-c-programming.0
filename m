From: "saravanaraj v" <saravanaraj.v@gmail.com>
Subject: Re: Trouble reading a character device.
Date: Thu, 18 Dec 2008 17:47:52 +0530
Message-ID: <2e0180190812180417m4247871k1bc26ac26addf4a6@mail.gmail.com>
References: <2e0180190812152308j64b827a2r21da6ff56e139f7e@mail.gmail.com>
	 <2e0180190812152311l5d01e9aek6728832d5babbb14@mail.gmail.com>
	 <18759.49284.737408.12661@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=uEr5UYwuv5cunb1XRwkDyKRL/y/0yVhvR7a9K7whjcQ=;
        b=eYiO6BIolMxW30jkx4Ln159Wgi3wnEd2HOd0X5n8hraWqy7gTb94zrn0njumt+Dn1o
         q5q7juAw/nr+b/u5MHjlztXxQPoQyjp9v/tmp66V2fiXQcfY4+UsqchpGkuC7uydjUuF
         jWfKSnYD4i49JxHBL1z+u+le86v++Sz+V/r+c=
In-Reply-To: <18759.49284.737408.12661@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Thanks Glynn

On Tue, Dec 16, 2008 at 8:21 PM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> saravanaraj v wrote:
>
> >    I am facing few issues in reading from a character device.
> >    I have created few character devices using 'mknod' and I am writing
> > continuously to those devices using 'printk'. After some time I start
> > another process to read from the device. The open/read is done using
> > normal sys calls for file open/reading. I have pasted the code for
> > your ref. When I run this program the read happens for some time and
> > then there is no progress. I am suspecting that  everything written to
> > the device before this program was started is read. The flags I tried
> > for opening the file were RD, RDWR with/without NONBLOCK. The output
> > was same in all the cases. I tried "cu -l /dev/virt_uart8". It was
> > able to read continuosuly without any problem. Can someone tell where
> > the problem is ?
> >
> > int main(){
> >
> > int fd,counter=0;
> > fd = open("/dev/virt_uart8",O_RDONLY|O_NONBLOCK);
> > if(fd<0) printf("\nError in opeining file");
> > while(1){
> >
> >     int nread = 0;
> >     nread = read(fd,buffer,MAX_BUFFER_SIZE-1);
> >     if(nread>0) {
> >         buffer[nread]='\0';
> >         printf("%s",buffer);
> >     }
>
> If you want to print data which doesn't necessarily have a trailing
> newline, you need fflush(stdout) or setvbuf(stdout, NULL, _IONBF, 0).
>
> If you make that change and still have problems, it's likely to be an
> issue with the device. E.g. you may need to disable XON/XOFF
> processing with tcsetattr(), or put the device into raw mode.
>
> --
> Glynn Clements <glynn@gclements.plus.com>
