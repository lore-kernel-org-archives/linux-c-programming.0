From: Benoit Fouet <benoit.fouet@purplelabs.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 08:50:49 +0200
Message-ID: <471C4849.2040409@purplelabs.com>
References: <471B5276.9010800@gmail.com> <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>

Hi,

Steve Graegert wrote:
> As a side note: you can safely use dlopen()  to load shared libraries,
> whether or not they depend on libpthread.so, as long as the main
> program was initially threaded.  The other way round is dangerous and
> mostly not allowed.
>
>   

could you please elaborate a bit on that ? i cannot see why this is
dangerous.

Thanks,

Ben

