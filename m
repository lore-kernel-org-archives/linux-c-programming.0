From: John de la Garza <john@jjdev.com>
Subject: Re: byte copy
Date: Sun, 19 Oct 2014 18:10:27 -0400
Message-ID: <20141019221027.GB14895@John-de-la-Garzas-Macbook-Pro.local>
References: <20141019213216.GA14500@John-de-la-Garzas-Macbook-Pro.local>
 <B8C734DB-DA5E-4FA3-8F0A-07C5F12A5368@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B8C734DB-DA5E-4FA3-8F0A-07C5F12A5368@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bogdan Cristea <cristeab@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Sun, Oct 19, 2014 at 11:42:26PM +0200, Bogdan Cristea wrote:
> 
> > On 19 Oct 2014, at 23:32, John de la Garza <john@jjdev.com> wrote:
> > 
> > Can anone see why these two pieces of code would behave differently?
> > They are used in a mergesort merge
> > 
> > the top one ends up with c (cp points to an offset in c)
> > 1 2 3 1
> > 
> > the bottom one (not commented out)
> > results in 1 2 3 4 (correct)
> > 
> >        /*
> >        if (alen == 0)
> >                memcpy(cp, bp, blen);
> >        else if (blen == 0){
> >                memcpy(cp, ap, alen);
> >        }
> >        */
> >        if (alen == 0)
> >                while (blen--)
> >                        *cp++ = *bp++;
> >        else
> >                while (alen--)
> >                        *cp++ = *ap++;
> > 
> > 
> > if you want to read it with more context see below
> > ---------------------------------------------------
> > 
> > #include <stdio.h>
> > #include <string.h>
> > #include <stdlib.h>
> > 
> > void pr_array(int *a, int len)
> > {
> > 	int i;
> > 	for (i = 0; i < len; i++)
> > 		printf("%d ", a[i]);
> > 	printf("\n");
> > }
> > void merge(int *a, int alen, int *b, int blen, int *c)
> > {
> > 	int *ap = a;
> > 	int *bp = b;
> > 	int *cp = c;
> > 
> > 	while (alen && blen) {
> > 		if (*ap <= *bp) {
> > 			*cp++ = *ap++;
> > 			alen--;
> > 		} else{
> > 			*cp++ = *bp++;
> > 			blen--;
> > 		}
> > 	}
> > 	if (alen == 0)
> > 		memcpy(cp, bp, blen);
> > 	else if (blen == 0){
> > 		memcpy(cp, ap, alen);
> > 	}
> > 	/*
> > 	if (alen == 0)
> > 		while (blen--)
> > 			*cp++ = *bp++;
> > 	else
> > 		while (alen--)
> > 			*cp++ = *ap++;
> > 	*/
> > }
> > 
> > void msort(int *arr, int len)
> > {
> > 	int mid = len / 2;
> > 	int llen = mid;
> > 	int rlen = len - mid;
> > 	int *l = malloc(llen);
> > 	int *r = malloc(rlen);
> > 	int i;
> > 
> > 	if (len <= 1)
> > 		return;	
> > 	for (i = 0; i < llen; i++)
> > 		l[i] = arr[i];
> > 	for (i = mid; i < mid + rlen; i++)
> > 		r[i-mid] = arr[i];
> > 	msort(l, llen);
> > 	msort(r, rlen);
> > 	merge(l, llen, r, rlen, arr);
> > 	free(l);
> > 	free(r);
> > }
> > int main()
> > {
> > 	int arr[] = {4,3, 2, 1};
> > 	int len = sizeof(arr) /sizeof(int);
> > 	int x[] = {1,3,5,7};
> > 	int y[] = {2,4,6,8};
> > 
> > 	msort(arr, len);
> > 	pr_array(arr, len);
> > 	return(0);
> > }
> 
> memcpy does not work for overlapping memory, use memmove instead
> 
Where does it overlap?  I found a big problem, I was passing in size
instead of size * sizeof(int).
