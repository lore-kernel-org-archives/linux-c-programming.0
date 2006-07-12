From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: n-dimension dynamic allocated array with malloc()
Date: Wed, 12 Jul 2006 15:58:59 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0607121556330.10434@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

What's wrong with the following code:

[fabio@localhost projects]$ cat poc.c ; gcc poc.c ; ./a.out
main()
{
         #define A 100
         #define B 100
         #define C 100
         #define D 100
         int i,j,k,l;
         double ****array;
         //srand( (unsigned) time(0x0));
         for(i=0;i< A; i++)
         {
                 array = malloc(A * sizeof(double));
         }
         for(i=0;i< B; i++)
         {
                 array[i]=malloc(B * sizeof(double));
         }
         for(i=0;i<C;i++)
         {
                 array[i][i]=malloc(C * sizeof(double));
         }
         for(i=0;i<D;i++)
         {
                 array[i][i][i]=malloc(D * sizeof(double));
         }

         for(i=0;i<A;i++)
                 for(j=0;j<B;j++)
                         for(k=0;k<C;k++)
                                 for(l=0;l<D;l++)
                                         array[i][j][k][l] = (double) 0;

}



Segmentation fault
[fabio@localhost projects]$


Thanks for any helpy,



---
Fabio Andres Miranda
Ingenieria de sistemas informaticos
Universidad Latina - Costa Rica

