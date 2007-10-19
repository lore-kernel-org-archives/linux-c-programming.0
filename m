From: "LaPoint, Adam W" <Adam.W.LaPoint@usa-spaceops.com>
Subject: RE: offsets of fields in a structure
Date: Fri, 19 Oct 2007 13:35:16 -0400
Message-ID: <5599C9E027D65D4DB3CB4C0539533142050AF76E@usaflcms03.usa-spaceops.ksc.nasa.gov>
References: <4718CCE2.9060202@infocamere.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <4718CCE2.9060202@infocamere.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Giulio Rossato <giulio.rossato@infocamere.it>, linux-c-programming@vger.kernel.org

Maybe something like this?

#include <stdio.h>

struct astruct {
  int field1;
  float field2;
  char field3[10];
};

int main(void)
{
  struct astruct r, *s;
  int h,i,j,k;

  h = (long)s;
  i = (long)&(s->field1);
  j = (long)&(s->field2);
  k = (long)&(s->field3);

  printf("offset field1: %d\n", i-h);
  printf("offset field2: %d\n", j-h);
  printf("offset field3: %d\n", k-h);
  return(0);
}

You may have to change the casting based on your architecture.

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Giulio
Rossato
Sent: Friday, October 19, 2007 11:28 AM
To: linux-c-programming@vger.kernel.org
Subject: offsets of fields in a structure


Suppose that I define the following structure
struct astruct {
    int field1;
    float field2;
    char field3[10];
};

and declare the variable
struct astruct r;

The amount of memory specified by the structure is not the sum of the 
storage specified by each of its member types. This vary from one 
machine and C compiler to another. On most compuers, objects of certain 
types may not begin anywhere in memory but are constrained to start at 
certain boundaries. For example, an integer of length 4 bytes may have 
to start at an address divisible by 4, and a real number of length 8 may 
have to start at an address divisible by 8. Thus, in my example, if the 
starting address of r is 200, the integer occupies bytes 200 through 
203, but the real number cannot start at byte 204, since that location 
is not divisible by 8. Thus the real number must start at byte 208.
The C compiler associates to each member identifier of a structure an 
offset that specifies how far beyond the start of the structure the 
location of that field is. To calculate the location of a member in a 
structure, the offset of the member identifier is added to the base 
address of the structure variable.
Now the question.
I want write a function that receives as parameters a start address and 
a "description of a structure" and returns the offsets of the fields. 
The structure is not known at compile time. The offsets should be 
calculated at runtime and the code should be independent of the machine.
How should be written this function?


-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
