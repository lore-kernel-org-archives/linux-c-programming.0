From: Sapuglha <sapuglha@yahoo.com.br>
Subject: Re: Newbie Question -> writing Hexadecimal values
Date: Thu, 25 Sep 2003 18:35:10 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030925183510.239df26c.sapuglha@yahoo.com.br>
References: <20030925181117.256d0a31.sapuglha@yahoo.com.br>
	<3F735CC4.5030507@ig.com.br>
Reply-To: sapuglha@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F735CC4.5030507@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

Ok, here is what I did:

sapuglha@tiago assembler $ cat test.c 
#include<stdio.h>

int main(){

#define DecValFromHexaChar(c) ((c)>='A' && (c)<='F' ?'A'-(c)+10 :(c))

        int hexaVal=0;
        char szHexa[3]="3E";

        hexaVal=DecValFromHexaChar(szHexa[1])*1;
        hexaVal+=DecValFromHexaChar(szHexa[0])*16;

        FILE *fd;

        fd = fopen("exit", "w+");

        // This one is right, I really want it this way.
        fprintf(fd, "%s", "NIBA");

        // This is the thing that I know to work
        //fprintf(teste, "%c", 0x3e);

        fprintf(fd, "%c", hexaVal);

        fclose(fd);

        return 1;
}

sapuglha@tiago assembler $ gcc -o test -g test.c 
sapuglha@tiago assembler $ ./test
sapuglha@tiago assembler $ cat exit 
NIBA6sapuglha@tiago assembler $ hexdump -C exit 
00000000  4e 49 42 41 36                                    |NIBA6|
00000005
sapuglha@tiago assembler $ 

The hexa "36" in the file is supposed to be "3e"



Maybe on Thu, 25 Sep 2003 18:23:16 -0300
Luciano Moreira - igLnx wrote:

| You need to have a int value and then use it in fprintf().
| 
| Try to convert "HexaChar" to int like this:
| -------
| #define DecValFromHexaChar(c) ((c)>='A' && (c)<='F' ?'A'-(c)+10 :(c))
| int hexaVal=0;
| char szHexa[3]="3E";
| 
| hexaVal=DecValFromHexaChar(szHexa[1])*1;
| hexaVal+=DecValFromHexaChar(szHexa[0])*16;
| hexaVal+=DecValFromHexaChar(szHexa[-1])*32;  // and so on.....  WARNING: 
| -1 doesnt exist, I m only suggesting you to try create a loop, to 
| convert any size of HexaChar.
| // If you have difficulties, I can create it for you.
| --------
| 
| If my code has any mistake, I so sorry, I coded it now only for suggest  
| you a way to fix your problem,
| 
| Luciano
| 
| 
| Sapuglha wrote:
| 
| >Hello people,
| >
| >my problem is:
| >
| >I have an hexadecimal value. It's char, but correspond to an hexa value. Then
| I>want to write it to a file. But in the file, if viewed in hexa (ie. using
| >hexdump) I want to see "3e" and not the correspondig values in hexa to "3"
| and>to "e".
| >
| >An example that works:
| >
| >	fprintf(test, "%c", 0x3e);
| >
| >But in my case "3e" is stored in a variable, so I'd like to use something
| like:>
| >	strcmp(variable, "3e");
| >	fprintf(test, "%c", variable);
| >
| >Is it possible? Any light?
| >
| >Thanks 


-- 
 
=> Tiago Sant' Anna - UIN: 14252973 - Linux user #136940
	[.. ..]
