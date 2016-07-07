From: Phil Sutter <phil@nwl.cc>
Subject: Re: How to check if char pointer is a constant!?
Date: Thu, 7 Jul 2016 22:26:21 +0200
Message-ID: <20160707202621.GP620@orbyte.nwl.cc>
References: <CAF3SDA6G32Kub4rK5BSmx7TkWoXnGWW2ESyHnM_+3t-naVPDww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAF3SDA6G32Kub4rK5BSmx7TkWoXnGWW2ESyHnM_+3t-naVPDww@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel." <danielhilst@gmail.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi,

On Thu, Jul 07, 2016 at 04:40:56PM -0300, Daniel. wrote:
> I have some function, say
> void empty(char *p) { p[0] = '\0'; }
> 
> If I call it like this empty("Hello") it will segfaults since "Hello"
> is put in readonly section of the program. Is there a way to check for
> this?! Maybe some nasty gcc extension!?

The problem here is upon calling the function, the const char *
parameter is implicitly casted to char *. So inside the function there
is no way to check this I'd say. You can call gcc with -Wwrite-strings
to have it generate a warning whenever a string constant is assigned to
a non-const char * variable.

HTH, Phil
