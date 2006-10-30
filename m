From: Steve McDaniel <steven@synapsenetwork.org>
Subject: customer getline function
Date: Mon, 30 Oct 2006 00:37:57 -0500
Message-ID: <ei4343$ks4$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I wrote a getBufferLine function that will read a line at a time from a
buffer. Just returns everything til it hits '\n', then will move to the
next.It works on small buffers, but seems to segfault on anything large.
Trying to figure out how pointers work in C, any pointers would help.

here is an example to use this function....
while ((c = getBufferLine(&ptr,buf,BufLen)) != NULL)
	printf("%s", c);

unsigned char* buffer_line_get(unsigned char** lineptr, unsigned char*
buffer, int size)
{
        static int index;
        unsigned char* c;

        if((size - index) == 0)
                return NULL;

        if (lineptr == NULL)
                *lineptr = c = buffer;
        else
                *lineptr = ((c = buffer) + index + 1);

        index = 0;
        while ((lineptr[index++] != '\n') && (index < size));

        lineptr+=index;
        *(buffer + index) = 0;
        return c;
}

