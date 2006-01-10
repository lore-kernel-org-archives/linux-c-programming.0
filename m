From: "Reuben D. Budiardja" <techlist@pathfinder.phys.utk.edu>
Subject: Passing pointer as member of struct to function
Date: Tue, 10 Jan 2006 09:05:08 -0500
Message-ID: <200601100905.08338.techlist@pathfinder.phys.utk.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hello,
I have the following problem, which probably best explained if I give the 
sample code first:

testNuclei.c:
---------------------
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

typedef struct nucleiType
    {
    char nucleiName[5];
    int protonNumber; 
    int neutronNumber;
    } nucleiType;

typedef struct reaclibType
    {
    int reactionType;           
    nucleiType * leftNuclei[2]; 
    nucleiType * rightNuclei[2];
    double QValue;
    } reaclibType;

int setNuclei(nucleiType * nuclei);
char * getNucleiName(nucleiType * nuclei);

int main(int argc, char ** argv)
  {
  reaclibType reactionRates[100];
  nucleiType * myNuclei;
  
  /* Let's set the leftNuclei using the setNuclei function.  
     We want leftNuclei to point to a valid nuclei (which is 
     set in the function) */   
  setNuclei(reactionRates[1].leftNuclei[0]);
  
    /* Now let's see if the leftNuclei has been set */
  myNuclei = reactionRates[1].leftNuclei[0];
  printf("reactionRate leftNuclei: %s\n", myNuclei->nucleiName);

  return 0;
  }

/* Function to set the nuclei in the reaclibType */

int setNuclei(nucleiType * nuclei)
  {
  nucleiType * newNuclei;
  
   /* Create new nuclei 
    (in the real program this is defined elsewhere 
     and read from data file 
  */ 
  newNuclei = (nucleiType *) malloc(sizeof(nucleiType));
  strcpy(newNuclei->nucleiName, "sc32");
  newNuclei->protonNumber = 21; 
  newNuclei->neutronNumber = 11;
  
  // Now trying to set the passed nuclei to this newNuclei 
  nuclei = newNuclei;
  
  return 0;
  }
------------------------------------------------------------------------------------

As you can probably guess already, my problem is that I want to be able to set 
the leftNuclei[i], which is a member of a struct reaclibType in the main 
program through a function. When I run this program, the output that I get 
is:
$ ./a.out 
reactionRate leftNuclei: (null)

What I really want is to get the following output:

$ ./a.out 
reactionRate leftNuclei: sc32

Any help on this ? Am I confusing something ? Help would be greatly 
appreciated. Thanks in advance.
RDB
-- 
Reuben D. Budiardja
