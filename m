From: David Wuertele <dave-gnus@bfnet.com>
Subject: Why doesn't UNIX/DGRAM socket allow sending more than 11 bytes w/o
 receiving?
Date: Fri, 07 Mar 2003 17:39:20 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <m3adg67i2f.fsf@bfnet.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Question:  Why does this program crap out after 11 bytes?
The UNIX/DGRAM receive buffer should be 64Kbytes.  I expect this
program to be able to use it all before blocking.  But it blocks
after only 11.

// dgramtest.c
// creates two unix/dgram sockets, connects them, sends a byte at a
// time without recv()ing anything.  demonstrates strange behavior on
// Linux 2.4.18 (RedHat 8.0)

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

///////////////////////////////////////////////////////////////////////////////
// module socktest #defines
#define INPUT_SOCKET_NAME   "/tmp/sockinput"
#define OUTPUT_SOCKET_NAME  "/tmp/sockoutput"
#define BUFF_SIZE           (1)

///////////////////////////////////////////////////////////////////////////////
// module socktest function Bail
static int Bail(const char * pString)
{
    perror(pString);
    return 1;
}

///////////////////////////////////////////////////////////////////////////////
// module socktest function main
int main(int argc, const char ** argv)
{
    sockaddr_un addressInput;
    addressInput.sun_family = AF_UNIX;
    strcpy(addressInput.sun_path, INPUT_SOCKET_NAME);

    sockaddr_un addressOutput;
    addressOutput.sun_family = AF_UNIX;
    strcpy(addressOutput.sun_path, OUTPUT_SOCKET_NAME);

    int sockInput = socket(PF_UNIX, SOCK_DGRAM, 0);
    if (-1 == sockInput) return Bail("Failed to create input socket");
    
    int sockOutput = socket(PF_UNIX, SOCK_DGRAM, 0);
    if (-1 == sockOutput) return Bail("Failed to create output socket");
    
    // name (bind) the 2 sockets
    unlink(INPUT_SOCKET_NAME);
    unlink(OUTPUT_SOCKET_NAME);
    if (-1 == bind(sockInput, (const sockaddr *)&addressInput, sizeof(sockaddr_un))) return Bail("Failed to bind input socket");
    if (-1 == bind(sockOutput, (const sockaddr *)&addressOutput, sizeof(sockaddr_un))) return Bail("Failed to bind output socket");
 
    // connect the output socket to the input address
    if (-1 == connect(sockOutput, (const sockaddr *)&addressInput, sizeof(sockaddr_un))) return Bail("Failed to connect output to input socket");

    // now see how many sends we can do before send blocks
    char buff[BUFF_SIZE];
    int nNumBytes = 0;
    int nNumSends = 0;
    while (1)
    {
        if (sizeof(buff) != send(sockOutput, buff, sizeof(buff), 0)) break;
        //DON'T RECEIVE!  This is the test.  We should crap out after
        //getting 64K bytes.
        //if (sizeof(buff) != recv(sockInput, buff, sizeof(buff), 0)) break;
        nNumSends++; nNumBytes+= sizeof(buff);
        printf("Send %d, %d total bytes\n", nNumSends, nNumBytes);  fflush(stdout);
    }

    printf("Exiting after %d sends with %d total bytes\n", nNumSends, nNumBytes);
    perror("Error");
    return 0;
}

