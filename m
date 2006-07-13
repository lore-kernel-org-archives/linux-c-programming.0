From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: n-dimension dynamic allocated array with malloc()
Date: Thu, 13 Jul 2006 04:21:08 +0100
Message-ID: <17589.48164.448211.911294@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0607121556330.10434@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0607121556330.10434@ns.isi.ulatina.ac.cr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org


Fabio Miranda Hamburger wrote:

> What's wrong with the following code:

>          double ****array;

>          for(i=0;i< A; i++)
>          {
>                  array = malloc(A * sizeof(double));
>          }
>          for(i=0;i< B; i++)
>          {
>                  array[i]=malloc(B * sizeof(double));
>          }
>          for(i=0;i<C;i++)
>          {
>                  array[i][i]=malloc(C * sizeof(double));
>          }
>          for(i=0;i<D;i++)
>          {
>                  array[i][i][i]=malloc(D * sizeof(double));
>          }

You are only allocating the elements along the main diagonal.

Also, you are assuming that:

sizeof(double ***) == sizeof(double **) == sizeof(double *) == sizeof(double)

Fixed version:

	array = malloc(A * sizeof(double ***));
	for(i=0;i<A; i++)
	{
		array[i] = malloc(B * sizeof(double **));
		for(j=0;j<B;j++)
		{
			array[i][j] = malloc(C * sizeof(double *));
			for(k=0;k<C;k++)
				array[i][j][k] = malloc(D * sizeof(double));
		}
	}

In most cases, you would probably be better off without the pointers,
i.e.:

	array = malloc(A * B * C * D * sizeof(double));

	#define ARRAY(i,j,k,l) (array[(((i) * B + (j)) * C + (k)) * D + (l)])

If you access the array (or parts of it) in a linear fashion, the
compiler will optimise the multiplies away. Similarly, if any of the
constants are powers of two, the compiler will convert the multiplies
to shifts.

The only case where having 3 levels of pointers would be advantageous
is if you are accessing the array in a random (unpredictable) order
and the CPU is relatively slow at multiplication and relatively fast
at memory access. On a modern CPU with fast multiplication and slow
memory access (relative to the CPU speed), I would guess that the
version using pointers would probably be slower even for random
access.

-- 
Glynn Clements <glynn@gclements.plus.com>
