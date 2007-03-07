From: Mathieu Dube <mujo@dubix.org>
Subject: Re: execv fails with EFAULT
Date: Wed, 7 Mar 2007 09:20:17 -0500
Message-ID: <20070307142017.GB22868@dubix.org>
References: <45EEA7F8.5080908@sun.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45EEA7F8.5080908@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: linux-c-programming@vger.kernel.org

On Wed, Mar 07, 2007 at 05:24:32PM +0530, Prasanta Sadhukhan wrote:
>    if(execv("/bin/ls", "-l") == -1)
>
hi

from man execv:

int execv(const char *path, char *const argv[]);

see the second argument here is an array of strings, not a string

so you cant just pass a string, you need to pass an array of pointers and it must be terminated by a NULL pointer

-M
