From: Steven Shaw <steven_shaw@iprimus.com.au>
Subject: Re: mixing C/C++
Date: Wed, 26 Nov 2003 02:32:04 +1000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200311260232.04247.steven_shaw@iprimus.com.au>
References: <20031124111050.GI1819@pcmag.gr> <200311251221.39488.steven_shaw@iprimus.com.au> <1069757381.3fc333c52bf2b@webmail.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1069757381.3fc333c52bf2b@webmail.uoa.gr>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: elathan@phys.uoa.gr
Cc: linux-c-programming@vger.kernel.org

On Tuesday 25 November 2003 20:49, you wrote:
> Also, I don't have main() in my project since it is a shared library.

Do make sure that you link with g++ (as Glynn did in his example). It will 
take care of a special linker script that collects all the static 
initialisations and I think there may be some magic functions that get 
collected for exception handling too.

If that fails why don't you post a complete minimal example that coredumps or 
just your original code that's coredumping if necessary.

Steve.

