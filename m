From: Progga <abulfazl@juniv.edu>
Subject: Re: pointer initialization of string constant
Date: Sun, 23 Jan 2005 18:45:50 +0600
Message-ID: <20050123184550.B330@Imrashi.net.bd>
References: <1106461572.1122.1.camel@KrishnaMohan>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1106461572.1122.1.camel@KrishnaMohan>; from gkmohan@rocsys.com on Sun, Jan 23, 2005 at 11:56:11AM +0530
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: gkmohan@rocsys.com

On Sun, Jan 23, 2005 at 11:56:11AM +0530, Krishna Mohan wrote:
> 
> main()
> {
>         char *ptr = "abc";
>         ptr[0] = 'p';

 Since ptr points to read-only mem, changing ptr[0] does not seem to be a very
wise idea.


