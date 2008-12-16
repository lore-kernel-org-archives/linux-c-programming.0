From: "saravanaraj v" <saravanaraj.v@gmail.com>
Subject: Trouble reading a character device.
Date: Tue, 16 Dec 2008 12:41:38 +0530
Message-ID: <2e0180190812152311l5d01e9aek6728832d5babbb14@mail.gmail.com>
References: <2e0180190812152308j64b827a2r21da6ff56e139f7e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=jR6stFmXPO9eOywKxyjrqRV2ipsXFG7aMam6FmzuN70=;
        b=AoLtU3en6R3dqeTSVofp9Tee02pZ7wWVYMz/E/kVhRtihKoDfkoJVTvTvQiiksA5CI
         xi1J5zLBWaN/S+ioROSCV972gqUQ+MpER/VE9sORXUAcfdDwGj4XEw+0Pa/nZUwmKPBZ
         64nUcRZTx4Eq4feHz5CVKhExl1hnuFBDPuUkk=
In-Reply-To: <2e0180190812152308j64b827a2r21da6ff56e139f7e@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,
   I am facing few issues in reading from a character device.
   I have created few character devices using 'mknod' and I am writing
continuously to those devices using 'printk'. After some time I start
another process to read from the device. The open/read is done using
normal sys calls for file open/reading. I have pasted the code for
your ref. When I run this program the read happens for some time and
then there is no progress. I am suspecting that  everything written to
the device before this program was started is read. The flags I tried
for opening the file were RD, RDWR with/without NONBLOCK. The output
was same in all the cases. I tried "cu -l /dev/virt_uart8". It was
able to read continuosuly without any problem. Can someone tell where
the problem is ?


int main(){

int fd,counter=0;
fd = open("/dev/virt_uart8",O_RDONLY|O_NONBLOCK);
if(fd<0) printf("\nError in opeining file");
while(1){

                                        int nread = 0;
                                        nread =
read(fd,buffer,MAX_BUFFER_SIZE-1);
                                        if(nread>0) {
                                                buffer[nread]='\0';
                                                printf("%s",buffer);
                                        }

}
}



Thanks,
Saravanaraj
