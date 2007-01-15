From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Autoloading modules after socket calls.
Date: Mon, 15 Jan 2007 16:43:07 +0100
Message-ID: <6a00c8d50701150743h8587b98keb34f64c078c6cf1@mail.gmail.com>
References: <45AB9746.3040503@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45AB9746.3040503@atl.lmco.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 1/15/07, Jonathan Walsh <jwalsh@atl.lmco.com> wrote:
> I am not sure how used this list is, but it seemed like a good place to
> ask this sort of question.  I was wondering if there is a way to have
> the kernel autoload a module on a failed call to something that requires
> it.  For example if I have sctp compiled as a module, but not inserted,
> and I make a call to socket() requesting a IPPROTO_SCTP socket it will
> fail with EPROTONOSUPPORT.  Is there a way in some sort of kernel
> configuration of specifying that the sctp module should be swapped in at
> this point?  I could write code to pick up this error and insert the
> module myself, but I was hoping for a way for the kernel to
> automatically do it for me.

Jonathan,

maybe "kmod" is what you're looking for.  kmod performs background
monitoring and makes sure the required modules are loaded by modprobe
as soon as the respective functionality is needed in the kernel, but
it is not designed to unload modules automatically.

Simply activate the option 'Kernel module loader'  (CONFIG_KMOD) in
the kernel configuration.  It is available for both Kernel versions
2.4 and 2.6, respectively.

       \Steve

--

Steve Graegert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
