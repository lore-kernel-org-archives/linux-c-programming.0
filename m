From: r_zaca <r_zaca@ig.com.br>
Subject: Re: open() and read() a file ...
Date: Tue, 1 Mar 2005 08:06:29 -0300
Message-ID: <20050301_110629_081591.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1109675189"
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1109675189
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

  Hello, 

  I think I can sugest something to you. 
  First you can set the value of buf to '0' and after that check all the 
return value of read. So this way you must be sure if it is really caching 
something. Like this: 

while(1) { 
  char[64] buf; 
  nread = 0; 
  memset(buf,'\0',sizeof(buf)); 
  nread = read(fd,buf,siezof(buf)); 

  if (nread) 
     do_something 
  ... 
  sleep(5); 
} 

  I think it is a nice thing to try to find the problem. 


Hi all! 

I have a basic question with file opening. 
I would like to make use of the data accessed from i2c sensors through 
sysfs. 

Here's the code: 

fd = open(/sys/bus/i2c/.../temp2_input,O_RDONLY); 

while(1) { 
  char[64] buf; 
  read(fd,buf,siezof(buf)); 
  ... 
  do_something 
  ... 
  sleep(5); 
} 

The thing is I always get the same reading in each read() :(. 
When I do: 
# cat /sys/bus/i2c.../temp2_input 
I see that the temperature is changing, but my code still displays the 
same reading. 

So what's the deal? Why is it cached? 
Am I supposed to open() and close() the file inside 'while' loop?? 
What's the proper way to do it? 

--Message-Boundary-by-Mail-Sender-1109675189--

