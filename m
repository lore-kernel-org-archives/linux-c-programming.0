From: "Huber, George K CECOM RDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Basic C encryption
Date: Tue, 8 Jul 2003 13:48:14 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <DDFD9B60F648D411AD670000F80822EA03FCAAB6@mail7.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Fabio Miranda Hamburger' <fabmirha@ns.isi.ulatina.ac.cr>, linux-c-programming@vger.kernel.org

Just add one.

For example, assume that there is a function (ReadByte()) that reads
a single byte from a file and returns it as a char.  Also assume that 
there is a function (WriteByte(char)) that writes a single character
to an output file.  With these two functions, you can write your
encryption routine as:

unsigned char  ch;

while(!EOF)
{
   ch = ReadByte();
   int    nVal = (int)ch + 1;
   if(nVal > 255) nVal = 0;
   WriteByte(char(nVal));
}

So, for example if we read the character 'Z' from the input file which
has the ACSII value of 90, after adding one we would have the value 
91, which is character [.

The reason for the test is that in reading a binary file it is possible 
to return 0xFF as a possible value, which on adding on would yield 0x100
which would not fit into a single-byte quanity.  The decryption routine
would be as simple,

unsigned char  ch;

while(!EOF)
{
    ch = ReadByte();
    int   nVal = (int)ch - 1;
    if(nVal < 0) nVal = 255;
    WriteByte(char(nVal));
}



As others have pointed out, a simple subsitituion cypher is very easy
to break.  With a few additional lines of code, you can get a stronger
encryption.  The following example assumes that the values in the 
input file are between 0 and 127 (i.e. the normal ASCII values).  It is
left as an exercise for the reader to figure out how to modify this 
for the case when the values are between 0 and 255.

char*    lpKey = "This is a key"
char     ch;
int      nIdx = 0;


while(!EOF)
{
    ch = ReadByte();
    if(nIdx >= strlen(lpKey)) nIdx = 0;
    ch = (int)ch + int(lpKey[nIdx++]);
    WriteByte(ch);
}

George Huber




-----Original Message-----
From: Fabio Miranda Hamburger [mailto:fabmirha@ns.isi.ulatina.ac.cr]
Sent: Tuesday, July 08, 2003 10:13 AM
To: linux-c-programming@vger.kernel.org
Subject: Basic C encryption


Hi, I need a small, basic way to encrypt a binary file saving a custom
class from a windoze 32 proyect.

For example, add +1 to each character that is about to be saved in the
disk. How would that be?

---
Fabio Andres Miranda
Ingenieria de sistemas informaticos
Universidad Latina - Costa Rica


-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
