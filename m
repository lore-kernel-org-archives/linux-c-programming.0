From: krzaq <krzakers@gmail.com>
Subject: open() and read() a file from sysfs
Date: Mon, 28 Feb 2005 15:18:44 +0100
Message-ID: <2ab8d39a050228061825dda7fe@mail.gmail.com>
Reply-To: krzaq <krzakers@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all!

I have a basic question with file opening.
I would like to make use of the data accessed from i2c sensors through sysfs.

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

-- 
Regards
Karol Krzak
