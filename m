From: Fabio <fabio@crearium.com>
Subject: Dinamic array allocation
Date: Mon, 25 Oct 2004 21:03:02 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <417DBE66.7050501@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi.

I am programming a C code that gets argv[1] as the lenght of an array 
that is the copy of an array plus more data.

So, the appication runs as: ./a.out 100

It create an array of 100 bytes and adds a static defined array plus 
more data, like:

char *foo[5]="bar"
main(int argc, char *argv[])
{
    char *Ptr[];
    Ptr = malloc( argv[1]+strlen(foo));
    ....
}

Makes sense? guess no.

Any suggestion is welcome.

thanks in advance
