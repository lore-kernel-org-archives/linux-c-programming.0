From: Drew Crawford <drew@sealedabstract.com>
Subject: So what does SO_RCVTIMEO actually do?
Date: Tue, 1 Mar 2016 19:04:09 -0600
Message-ID: <9677D924-6DDE-4D34-AFD6-CDE0D8859473@sealedabstract.com>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: multipart/mixed; boundary="Apple-Mail=_02B04E87-A574-472E-A3F7-440E4F0B44FC"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sealedabstract-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:message-id:date:to:mime-version;
        bh=W2vy55++Bxs+Ya0k+ZzQvyW+QWUVu5NE7sA2h7kHsTQ=;
        b=x0ZCipmg6joi319f0Az86/+2W6W31cTgYuyRbunCIQQo8SkI1J4wGgKpMgn7geBmk9
         hHnFJqH2lxgfkm6F6EbavIeVHpUfjrenm2vVBELeRc9XBo83OxwxvozVKtA7Hga6WWqK
         Znkh9ee5NgHJlQX86YCW6hjrH6tQbdgSAQdkzo5IRISP/7pmWuBPWHgghhwMhkDsn+XF
         9dg1mxz24jlM81H+XnMsRqRgb937y2ncgjzHMKvTjyGaUsrHxTDsVSdbOHGw6Mtan3io
         tk0cQFn+r+rMGSjdwvsPgwIzWeoUGSSSfRQHdYd2vuxJyZgpvO2gzZstdFdAh2hT6IUA
         QjkQ==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--Apple-Mail=_02B04E87-A574-472E-A3F7-440E4F0B44FC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

This may just be a stupid question, but I think it could be a bug.  =
Someone non-authoritative told me it isn't, but I didn't understand =
their explanation, so I turn to you.

Let's say I have a socket with SO_RCVTIMEO set to 500ms.  I call read.  =
There is no data available to be read from the socket.  Not at the time =
that I call read, or... *ever*.  But the socket's not in an error =
condition or anything, there's just nothing to be read.

Which behavior should I expect:

A) read blocks for slightly longer than 500ms, then gives up
B) read blocks for a time that may be significantly more or even =
significantly less than 500ms, then gives up
C) read does not have to block at all, the timeout is a lie

Most UNIXes I work with implement A.  Empirically, I've determined Linux =
does B.  My friend who tells me this isn't a bug believes the real =
answer is C.  Who's right?

Also, if I want to make sure to try a read for at least 500ms, what is =
the right way to do it?  Loops?  Adding a magic number to the timeout?

Now that I've framed the philosophical issue, here is the code:


--Apple-Mail=_02B04E87-A574-472E-A3F7-440E4F0B44FC
Content-Disposition: attachment;
	filename=test.c
Content-Type: application/octet-stream;
	name="test.c"
Content-Transfer-Encoding: 7bit

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <time.h>
#include <fcntl.h>

#ifdef __MACH__
#include <mach/clock.h>
#include <mach/mach.h>
#endif
void error(const char *msg)
{
    perror(msg);
    exit(1);
}

struct timespec os_time() {
    struct timespec ts;
    #ifdef __MACH__ // OS X does not have clock_gettime, use clock_get_time
    clock_serv_t cclock;
    mach_timespec_t mts;
    host_get_clock_service(mach_host_self(), CALENDAR_CLOCK, &cclock);
    clock_get_time(cclock, &mts);
    mach_port_deallocate(mach_task_self(), cclock);
    ts.tv_sec = mts.tv_sec;
    ts.tv_nsec = mts.tv_nsec;

    #else
    clock_gettime(CLOCK_REALTIME, &ts);
    #endif
    return ts;
}

int main(int argc, char *argv[])
{
     int sockfd, newsockfd, portno;
     socklen_t clilen;
     char buffer[256];
     struct sockaddr_in serv_addr, cli_addr;
     int n;
     if (argc < 2) {
         fprintf(stderr,"ERROR, no port provided\n");
         exit(1);
     }
     sockfd = socket(AF_INET, SOCK_STREAM, 0);
     if (sockfd < 0)
        error("ERROR opening socket");
     bzero((char *) &serv_addr, sizeof(serv_addr));
     portno = atoi(argv[1]);
     serv_addr.sin_family = AF_INET;
     serv_addr.sin_addr.s_addr = INADDR_ANY;
     serv_addr.sin_port = htons(portno);
     if (bind(sockfd, (struct sockaddr *) &serv_addr,
              sizeof(serv_addr)) < 0)
              error("ERROR on binding");
     listen(sockfd,5);
     clilen = sizeof(cli_addr);
     newsockfd = accept(sockfd,
                 (struct sockaddr *) &cli_addr,
                 &clilen);
     if (newsockfd < 0)
          error("ERROR on accept");
     for (int i = 0; i < 100; i++) {
         struct timeval tv;

         tv.tv_sec = 0;
         tv.tv_usec = 500000;
         char buf[1];
         if (setsockopt(newsockfd, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval)) != 0){
             error("setsockopt error");
         }
         struct timespec start = os_time();
         int result = recv(newsockfd,buf,1,0);
         struct timespec end = os_time();

         double end_time = (double)end.tv_sec + ((double)end.tv_nsec)/1.0E9;
         double start_time = (double)start.tv_sec + ((double)start.tv_nsec)/1.0E9;
         printf("time: %f result: %d\n",end_time-start_time, result);
     }
     return 0;
}
--Apple-Mail=_02B04E87-A574-472E-A3F7-440E4F0B44FC
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


 

To run:

clang test.c
./a.out 5551 &
telnet localhost 5551

Results on UNIX:

time: 0.500479 result: -1
time: 0.501013 result: -1
time: 0.500908 result: -1
time: 0.500487 result: -1
time: 0.500328 result: -1
time: 0.501100 result: -1

Results on Linux:

time: 0.499556 result: -1
time: 0.501964 result: -1
time: 0.496663 result: -1
time: 0.502346 result: -1
time: 0.499642 result: -1
time: 0.497158 result: -1
time: 0.498826 result: -1
time: 0.501630 result: -1
time: 0.497540 result: -1
--Apple-Mail=_02B04E87-A574-472E-A3F7-440E4F0B44FC--
