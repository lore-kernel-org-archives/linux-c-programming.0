From: Hemant Mohan <hemantm@pune.tcs.co.in>
Subject: Read error
Date: Tue, 23 Apr 2002 14:17:03 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF98E48590.01E12378-ON65256BA4.00302010@pune.tcs.co.in>
Reply-To: hemantm@pune.tcs.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I am writing a program whereby I am opening a FIFO for reading. However the 
read is getting blocked though another process has already written to the 
FIFO and no other process is accesiing this FIFO.
the program is something like:

Process A
main()
{
    int fd;
    fd=open(FIFO, RD_ONLY );
    read(fd, ....)
}

Process B
main()
{
    mkfifo(FIFO, 0664);
    fd =open(FIFO, WR_ONLY);
    write(fd, ...);
    printf("data written to fifo\n");
}

Process B is run before process A, and the printf statement is desiplayed on 
the screen.
But I find that inspite of this process B is blocked on the read as if there 
is no data in the FIFO.

However if in process B, the open is done in non blocking mode 
fd = open(FIFO, RD_ONLY | O_NONBOCK)
then it doesn't block on read, but read returns a negative value and the 
errorno is set, with the message "Resource temporarily unavailable".

My question is that why does the read block initially, when there is some 
data for it to read. Under what conditions does the read normally block.


Thanks,
Hemant Mohan
