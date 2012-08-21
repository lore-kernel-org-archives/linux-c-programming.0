From: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>
Subject: UVCVideo - Webcam not stopping after opening and closing the device
 file /dev/video0
Date: Wed, 22 Aug 2012 02:32:25 +0530
Message-ID: <CAOXuEsyMr0BEMoOGDismRQyvs7fxX-JDjOEvnFeffDOgTewqxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:cc:content-type;
        bh=5EcY4iCfRwvRttlkPxhsBc76juHzDzS9YvjygFOf1pc=;
        b=0JB5EiC4bEfT5t1YqJLfejYMLaH8WmqBW5G4C0eJem/eT5CjimE6A22HcAybL7OlI6
         lFAtktkoiDo58r35+2FsrNFz60ky0eHX9aSy8wy1KxtcsYhuHaKjg0fSCUYdkjPA6trJ
         JvChNI93DuZBWM/PDgkqxPGVd/oeABJZn1XTZxpxA+M4zq0M7VzZSsIdbT9n5WwOm4uG
         qFR3s7LjJm3it5zl9JMfpaNgG9LAKcFKjJJ+UXUTjGAyrnc0Cyqu2gvg8aK7/ZPdu3T5
         5hwNBm+eLVOELGav456+61iJJJ/BS7pwdASrTmwAQyYDmpo5DJZwQJus+ncTn7CQdBCV
         BbVA==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>

Hi,


Sorry for interrupting.

I have a (174f:5a35) Syntek Sonix 1.3MPixel USB 2.0 Camera (Most
probably based on ov9655  chipset/sensor) on a Asus laptop (G1Sn).
The device is working fine when required.
But unfortunately, it automatically gets started (green light
indicator goes on) after each page refresh in web browsers having some
flash content.

As per my understanding,

1) The flash player tries to check for webcam existence. It opens
/dev/video0 device file and after doing it's probing it closes the
device.
  Opening the device switched it on and green light stays on.
2) Unfortunately the device is kept awake even after the flash player
closes the device handle.

Trace returns following output during this:
[116432.340419] uvcvideo: uvc_v4l2_open
[116432.388332] uvcvideo: Resuming interface 0
[116432.388338] uvcvideo: Resuming interface 1
[116432.723761] uvcvideo: uvc_v4l2_ioctl(VIDIOC_QUERYCAP)
[116432.723780] uvcvideo: uvc_v4l2_release
[116433.589880] uvcvideo: uvc_v4l2_open
[116433.589916] uvcvideo: uvc_v4l2_ioctl(VIDIOC_QUERYCAP)
[116433.589934] uvcvideo: uvc_v4l2_release
[116435.804067] uvcvideo: Suspending interface 1
[116435.804073] uvcvideo: Suspending interface 0

lsusb output:
Bus 001 Device 002: ID 174f:5a35 Syntek Sonix 1.3MPixel USB 2.0 Camera


So,I wrote a test program using v4l2,
What I did is, I opened the device (it switches on the usb cam) and I
never asked for starting the streaming.
Then, unless I did this before closing the device handle it'll keep
the device on :

    type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    xioctl(fd, VIDIOC_STREAMOFF, &type);




So the following code will switch on the device and keep it going
forever: (unless I do the above)
void test()
{
     char     *dev_name = "/dev/video0";
     int fd;
     enum v4l2_buf_type              type;


     fd = v4l2_open(dev_name,  O_RDWR | O_NONBLOCK , 0);
                        //switches on the device
     if (fd < 0) {
          perror("Cannot open device /dev/video0 : ");
          exit(EXIT_FAILURE);
     }

    //IMP: Only way to stop this behavior is to uncomment the following..
    // type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    // xioctl(fd, VIDIOC_STREAMOFF, &type);              //only way to

       switch it off

     v4l2_close(fd);      //never stops the device
}






My question is, is it the proper behavior? IMHO, It is switching on
the webcam unnecessarily,

What I can do to stop this ? Currently I had to write a daemon to do
this manually after 10-15 minutes.



[Kernel: Linux aniruddha-G1Sn 3.2.0-23-generic #36-Ubuntu SMP Tue Apr
10 20:39:51 UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
Linux Mint13]


Thanking you,
Aniruddha Bhattacharyya
