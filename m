From: Adam Dyga <adeon@tlen.pl>
Subject: Re: efficiency in passing a value to a function
Date: Sat, 14 Apr 2007 15:15:37 +0200
Message-ID: <200704141515.37060.adeon@tlen.pl>
References: <4613DCB8.8030007@gmail.com> <6a00c8d50704050602j1c7a7543le5ebeb3b19994977@mail.gmail.com> <46190779.3040508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46190779.3040508@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Sunday, 8 April 2007 17:17, Shriramana Sharma wrote:

> I agree of course that in case of tiny tidbits of parameters like a few
> int-s, double-s or even std::string-s, there is not much meaning in
> using const ref-s, and it is more intuitive to pass these by value. It
> is only practically useful to pass big classes / struct-s by reference.

Well, std::string should be passed by const reference. Depending on the 
implementation, passing std::string by value may involve heap 
allocation/deallocation and memory copy operations which are quite costly.

Adam

