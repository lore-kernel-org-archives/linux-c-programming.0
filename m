From: Gyzmobro@aol.com
Subject: Re: Newbie Questions
Date: Tue, 9 Apr 2002 17:39:39 EDT
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <f7.19630fb1.29e4b99b@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Linux Free Mail has been down so I haven't had a chance to respond to this 
thread and am now forced to use a proprietary email system. I hope I haven't 
missed parts of this thread and I don't have the last email, but here I go:

From what you've said, I would have to write a while loop that goes through
the file one line at a time and checks to see if it's
at the EOF through an if statement. How would I make
the program go through the file line by line? Is this 
if statement right:?

char c_check_eof[10];

if(fgets(c_check_eof, 10, fp) == "EOF")
{
 break;
}

Serban Giuroiu
