From: =?iso-8859-1?q?Ankit=20Jain?= <ankitjain1580@yahoo.com>
Subject: Floating point exception
Date: Sat, 11 Sep 2004 12:39:13 +0100 (BST)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20040911113913.86435.qmail@web52904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <gcc-help-return-17845-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gcc <gcc-help@gcc.gnu.org>, linux prg <linux-c-programming@vger.kernel.org>

#include<stdlib.h>
#include<string.h>
#include<complex.h>
#include<errno.h>
#include<time.h>
#include<stdio.h>
#define NX 4 	 	 
#define NY 4
#define N 2*NX*NY		//N is the size of 2 D DFT
#include <math.h>
#define num 2
#define SWAP(a,b) tempr=(a);(a)=(b);(b)=tempr

void fft(float data[], unsigned long nn[], int ndim,
int isign)
{
int idim;
unsigned long
i1,i2,i3,i2rev,i3rev,ip1,ip2,ip3,ifp1,ifp2;
unsigned long ibit,k1,k2,n,nprev,nrem,ntot;
float tempi,tempr;
double theta,wi,wpi,wpr,wr,wtemp; //Double precision
for trigonometric recur-rences.
for (ntot=1,idim=1;idim<=ndim;idim++)    //Compute
total number of complex val-ues.
	ntot *= nn[idim];
nprev=1;

for (idim=ndim;idim>=1;idim--) 
{					// Main loop over the dimensions.
	n=nn[idim];
	nrem=ntot/(n*nprev);
	ip1=nprev << 1;
	ip2=ip1*n;
	ip3=ip2*nrem;
	i2rev=1;
	for (i2=1;i2<=ip2;i2+=ip1) 
	{ 		//This is the bit-reversal section of the
routine. 
		if (i2 < i2rev)	
                  {
			for (i1=i2;i1<=i2+ip1-2;i1+=2) 
                        {
			 for (i3=i1;i3<=ip3;i3+=ip2) 
                            {
				i3rev=i2rev+i3-i2;
				SWAP(data[i3],data[i3rev]);
				SWAP(data[i3+1],data[i3rev+1]);
	                   }
			}
		  }
		ibit=ip2 >> 1;
		while (ibit >= ip1 && i2rev > ibit) 
                {
			i2rev -= ibit;
			ibit >>= 1;
		}
		i2rev += ibit;
	}

	//Here begins the Danielson-Lanczos sec-tion of the
routine. 
	ifp1=ip1;		
	while (ifp1 < ip2) 
               {
		ifp2=ifp1 << 1;
		theta=isign*6.28318530717959/(ifp2/ip1); 
		//Initialize for the trig. recur-rence.
		wtemp=sin(0.5*theta);
		wpr = -2.0*wtemp*wtemp;
		wpi=sin(theta);
		wr=1.0;
		wi=0.0;
		for (i3=1;i3<=ifp1;i3+=ip1) {
			for (i1=i3;i1<=i3+ip1-2;i1+=2) {
				for (i2=i1;i2<=ip3;i2+=ifp2) {
					k1=i2; 		//Danielson-Lanczos formula:
					k2=k1+ifp1;
					tempr=(float)wr*data[k2]-(float)wi*data[k2+1];
					tempi=(float)wr*data[k2+1]+(float)wi*data[k2];
					data[k2]=data[k1]-tempr;
					data[k2+1]=data[k1+1]-tempi;
					data[k1] += tempr;
					data[k1+1] += tempi;
				}
			}
			wr=(wtemp=wr)*wpr-wi*wpi+wr; //Trigonometric
recurrence.
			wi=wi*wpr+wtemp*wpi+wi;
		}
		ifp1=ifp2;
	}
	nprev *= n;
	}
}
int main()
{
        float rin[NX][NY],iin[NX][NY];
	float in[2*NX*NY];
	unsigned long nn[]={NX,NY};

	int i=0,j=0,k=0;

        k = 0;
        for (i = 0; i< NX; i++)
         {
          for (j = 0; j< NY; j++)
          {
           rin[i][j] = (float) (2*i*i);
           iin[i][j] = 0;
           in[k] = rin[i][j];
           k=k+1;
           in[k] = iin[i][j];
           k= k+1;
           
          }
         }
         //for (i = 0; i< 32; i++)
printf("%d\t%f\n",i,in[i]);

	fft(in,nn,2,1);		//Executes the plan
        
	k = 0;
        for (i = 0; i< NX; i++)
         {
          for (j = 0; j< NY; j++)
          {
           rin[i][j] = in[k];
           printf("real part is%f\n",in[k]);
           k=k+1;
           iin[i][j] = in[k];
           printf("imaginary part is%f\n",in[k]);
           k=k+1;
          }
         }

        printf("finished fft\n");
	return 0;
}


________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
