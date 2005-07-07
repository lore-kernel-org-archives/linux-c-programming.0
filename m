From: =?ISO-8859-1?Q?Mat=EDas_Aguirre?= <matiasaguirre@gmail.com>
Subject: Re: process information
Date: Thu, 7 Jul 2005 13:26:09 -0300
Message-ID: <a3c4234105070709267129a646@mail.gmail.com>
References: <a3c4234105070613154993e652@mail.gmail.com>
	 <42CD1B92.1070806@conectiva.com.br>
Reply-To: =?ISO-8859-1?Q?Mat=EDas_Aguirre?= <matiasaguirre@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42CD1B92.1070806@conectiva.com.br>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux prg <linux-c-programming@vger.kernel.org>, Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>

On 7/7/05, Luiz Fernando Capitulino <lcapitulino@conectiva.com.br> wrot=
e:
> Hi Mat=EDas,

Hi Luiz

>  Yes, there is. But I can only think in a 'brute force' way: you can =
scan the
> /proc file-system.
[...]

Yes, I was thinking in that solution, but it doesn't fix in my
situation, my problem is a bit complicated...

I lunch a little process that inicialize a shmem segment (libmm), then
it call a function that's in a library, this function makes a fork and
create a server as the son process (an abyss http server, i'm using
libxmlrpc-c3) and then do an exit(0) in the father, and this unmap the
shmem allocated, this because allocation and deallocation is made by
the next functions:

void __attributte__ ((constructor)) void _init_fn(){
    root_p=3Dgetpid();
    MM_create(MM_SIZE,MM_FILE);
    signal(SIGINT|SIGTERM|SIGSEGV|SIGABRT|SIGHUP,_sigint);
}

void __attribute__ ((destructor))  _uninit_fn(){
    if(getpid()=3D=3Droot_p)
        MM_destroy();
}

where root_p is the pid of the process that inicialize every thing, so
when it dies the shmem is deallocated, as you can see, it dies because
the function that lunch the server mekes an exit(0).

So, i'm traying to make a little trick, a first process that create
the shmem and makes a fork, this new son lunch the server, but now I
need to know when the server dies so my process can finish and
deallocate the shmem.

Sorry, but my english is very bad... :)

Thanks

--=20
Mat=EDas Aguirre
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
