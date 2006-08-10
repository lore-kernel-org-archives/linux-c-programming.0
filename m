From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: Linux kernel file access monitoring
Date: Thu, 10 Aug 2006 19:59:47 +0200
Message-ID: <d9def9db0608101059i414c98bdv3326f34a47a49909@mail.gmail.com>
References: <Pine.LNX.4.64.0608101059140.29875@ns.isi.ulatina.ac.cr>
	 <d9def9db0608101032q68794243r92aae3e24f205a97@mail.gmail.com>
	 <Pine.LNX.4.64.0608101143320.5917@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0608101143320.5917@ns.isi.ulatina.ac.cr>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org

Another way that comes into mind would be to manipulate the filesystem driver..
Though I haven't seen any exported kernel function that does this...

Markus

On 8/10/06, Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr> wrote:
> Markus,
>
> lsof doesnt allow to keep showing file information forever, instead, it
> prints out the info and quit.
>
> Think of "tail -f" command that keep hooked showing lseek() output.
>
> Let me know another workaround,
>
> Thanks,
>
> ---
> Fabio Andres Miranda
> Ingenieria de sistemas informaticos
> Universidad Latina - Costa Rica
> http://ns.isi.ulatina.ac.cr/~fabmirha
>
>
>
>
>


-- 
Markus Rechberger
