From: Scott <drmemory@3rivers.net>
Subject: Re: Into the Void
Date: Wed, 26 Jan 2005 09:11:38 -0700
Message-ID: <20050126161137.GA954@drmemory.local>
References: <OFCBCF8B9A.C4F17DCE-ON85256F95.004B650B@teal.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <OFCBCF8B9A.C4F17DCE-ON85256F95.004B650B@teal.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, Jan 26, 2005 at 08:45:09AM -0500, Jeff.Fellin@rflelect.com wrote:
> 
> The reason you are getting the references to void is the function prototype
> for memcpy is:
> 
>       memcpy (void *dest, void *src, size_t n);
> 
> You are passing char* pointers which are not void * pointers. You have to
> correct your arguments
> to remove the error messages. Please use man memcpy() for more details.

So I should use

   memcpy ((void *) *data_buf, (void *) bp, len) [len] = '\0';

(len is already type size_t) 

Or, I guess, to follow Ron's suggestion too:

   ((char*) memcpy ((void *) *data_buf, (void *) bp, len)) [len] = '\0';

Just curious as to what evil all of this extra typing is supposed to
be protecting me from?
