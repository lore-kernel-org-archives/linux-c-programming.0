From: James Colannino <james@colannino.org>
Subject: Using realloc()
Date: Fri, 10 Jun 2005 23:07:33 -0700
Message-ID: <42AA7FA5.4040806@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hey everyone.  I have a question about realloc().  I was hoping to use
realloc() to allocate more memory to an already existing string, but the
problem was, I didn't know if the original information would stay intact
or not after running realloc().  I wrote the following program to test this:

#include <stdio.h>

int main() {

    char *string;
    size_t size = sizeof(char);

    string = (char *)malloc(size);
    string[0] = 'a';
    string[1] = '\0';

    printf ("Before realloc(): %p: %s\nsize: %d\n", string, string, size);

    size = size * 5;
    string = (char *)realloc(string, size);

    printf ("After realloc(): %p: %s\nsize: %d\n", string, string, size);

    return 0;
}

The string data stays the same after running realloc(), so at least in
this circumstance it worked like I had hoped.  However, when printing
the pointer to the screen, I saw that it didn't change, and I know that
sometimes realloc() needs to start at a new address in memory which
means the pointer changes, so my question is, will the original data
stay intact if this happens?

Thanks in advance :)

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"A well regulated militia being necessary to the security of a free
state, THE RIGHT of the people to keep and bear arms SHALL NOT BE
INFRINGED." --United States Constitution, Second Ammendment

