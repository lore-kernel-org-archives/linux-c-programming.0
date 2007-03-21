From: Mathieu Dube <mujo@dubix.org>
Subject: Re: Getting output from another program.
Date: Wed, 21 Mar 2007 16:43:34 -0400
Message-ID: <20070321204334.GB23547@dubix.org>
References: <46018F0A.9010801@cs.byu.edu>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46018F0A.9010801@cs.byu.edu>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, Mar 21, 2007 at 02:01:14PM -0600, Topher Fischer wrote:
> 2. What's the best practice for getting output from an external command?
>  I've heard of it being done by forking, overwriting the child's file
> descriptors for stdin and stdout with pipes, and then exec'ing the
> command.
>
have you checked popen?

-M 
