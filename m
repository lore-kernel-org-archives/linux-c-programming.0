From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: RE: strange behavious
Date: Tue, 24 Dec 2002 10:45:24 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212241011001.31854-100000@soochak.ncst.ernet.in>
References: <75B979779CA1D311808400508B6F40FF06B4354E@zes06exm01.madrid.ecid.cig.mot.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <75B979779CA1D311808400508B6F40FF06B4354E@zes06exm01.madrid.ecid.cig.mot.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alvarez Alberto-AALVARB1 <AALVARB1@motorola.com>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


On Mon, 23 Dec 2002, Alvarez Alberto-AALVARB1 wrote:

> Hi,
> 	i'll try to answer your question. This may be not be an accurate answer, but i think it'll do.
> 
> 	The way you've assigned values to 'words' is the reason of the failure. The allocation of memory takes place in program data space (the same place where code is), so you can't modify it.
> 	If you want to modify that array, you should dynamically allocate it. Something like this will work,

that means it should not work for the following code as the memory is 
allocated in program data space, but it works...

#######
#include <stdio.h>

int main()
{
	char	string[] = "mohammed";
	
	strcpy (string, "khalid");
	printf ("%s\n", string);
	
	return 0;
}
#######

> 
> 	char **words;
> 	words = calloc(3,sizeof(char **));
> 	words[0]=calloc( strlen("mohammed")+1,sizeof(char *));
> 	words[1]=calloc( strlen("khalid")+1,sizeof(char *));
> 	words[2]=calloc( strlen("ansari")+1,sizeof(char *));
> 
> 
> 
> 	Why does it work when debugging it? I suppose it's due to the debugger behaviour. It isn't a "normal" execution, since the debugger has to control everything in the program. I think that every memory position of the program is allocated at debugger's heap, so it's writable.
> 
> 
> Regards,
> 
> Alberto Alvarez Besada
> 
> Tlf.:        +34 914002155
> e-mail.:   aalvarb1@motorola.com
> 
> 
> 
> > -----Original Message-----
> > From: Mohammed Khalid Ansari [mailto:khalid@ncst.ernet.in]
> > Sent: sabado, 21 de diciembre de 2002 6:25
> > To: linux c programming mailing list
> > Subject: strange behavious
> >
> >
> >
> > Hi,
> >
> > I was running a simple program to test two dimensional
> > pointer. When I
> > compiled it and executed, it received segmentaion fault, but when I
> > checked it in debugger step by step, it went smoothly and
> > produced the
> > expected output. I did it many times and got the same
> > behavious. Following
> > is my program
> >
> > ###################
> >
> > #include <stdio.h>
> >
> > void parse (char **);
> > char	*words[] = {"mohammed", "khalid", "ansari"};
> > int main()
> > {
> > 	int	num_words, i;
> >
> > 	parse (words);
> > 	for (i=0; i<3; i++)
> > 		printf ("%s\n", *(words+i));
> > 	return 0;
> > }
> >
> > void
> > parse (char *word[])
> > {
> > 	char	*buf[] = {"abc", "bcd", "cde"};
> > 	int	i=0;
> >
> > 	for (i=0; i<3; i++)
> > 		strcpy (*word++, buf[i]);
> > }
> >
> > ##########
> >
> > Please try yourself and see. What could be the problem.
> >
> > with regards...
> >
> > --
> >
> > **************************************************************
> > ************
> >
> > Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
> > Assistant Manager II                          (off) : 0091-022-2024641
> > National Centre for Software Technology   Fax       :
> > 0091-022-2049573
> > 8th flr,Air India Build. Nariman Point,   E-Mail    :
> > khalid@ncst.ernet.in
> > Mumbai 400021.
> >
> > Homepage : http://soochak.ncst.ernet.in/~khalid
> >
> >
> > **************************************************************
> > ************
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 

