From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Initializer element is not constant
Date: Mon, 24 Jan 2005 16:09:30 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3631@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Scott' <drmemory@3rivers.net>, linux-c-programming@vger.kernel.org

Scott wrote:

>Here are the relevant portions of indatax.c:

>char *namectrl = NULL;
>char *name1 = NULL;
>char *name2 = NULL;

>typedef struct {
>	char *var;	/* destination for storage of the data */
>	size_t len;	/* max len of the data */
>	char *(*xlat)();	/* translation routine */
>} DATUM;

>DATUM recip_data[] = {
>{  namectrl, NAMECTRL_LEN, make_upper },
>{  name1, NAME1_LEN, make_upper },
>{  name2, NAME2_LEN, make_upper },
>[...]

>And these are the errors...

>indatax.c:124: initializer element is not constant
>indatax.c:124: (near initialization for `recip_data[0].var')
>indatax.c:125: initializer element is not constant
>indatax.c:125: (near initialization for `recip_data[1].var')
>indatax.c:126: initializer element is not constant
>indatax.c:126: (near initialization for `recip_data[2].var')
>[...]

First, I would upgrade to a more modern version of gcc.  The 
current release is the 3.4 series.   

Secondly, I tried the following program,

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#include <stdio.h>
#include <stdlib.h>

#define NAMECTL_LEN   15
#define NAME_LEN       10

typedef struct tag_datum
{
    char*   var;
    size_t  len;
    char    *(*xlat)();
} datum;

char* make_upper()
{
    return NULL;
}

int main(int argc, char** argv)
{
    char*    namectrl = NULL;
    char*    name1 = NULL;
    char*    name2 = NULL;

    datum    data[] = {{namectrl, NAMECTL_LEN, make_upper},
                       {name1, NAME_LEN, make_upper},
                       {name2, NAME_LEN, make_upper}};

    return 0;
}

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

When I compiled this program using gcc 3.4.2 with the flags `-ansi
-pedantic -Wall' I get a number of warnings stating:
"Initializer element is not computable at load time" 
Two per each line of initializing data.  My guess is that the compiler
can-not figure out how to initialize the first element of the structure
at run time because namectrl has yet to "created".  


However, all is not lost, changing the program to:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#include <stdio.h>
#include <stdlib.h>

#define NAMECTL_LEN   15
#define NAME_LEN       10

typedef struct tag_datum
{
    char*   var;
    size_t  len;
    char    *(*xlat)();
} datum;

char* make_upper()
{
    return NULL;
}

int main(int argc, char** argv)
{
    datum    data[] = {{NULL, NAMECTL_LEN, make_upper},
                       {NULL, NAME_LEN, make_upper},
                       {NULL, NAME_LEN, make_upper}};

    return 0;
}

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

results in a clean compilation (except for a warning about
an unused variable).  To initialize the var member of datum, you
should be able to do something like:

  if(NULL != (data[0].var = malloc(NAMECTL_LEN*sizeof(char))))
  {
      strncpy(data[0].var, "test string", NAMECTL_LEN);
  }

and you should be able to use datum like this:

  int   i, num = sizeof(data)/sizeof(datum);
  for(i = 0; i < num; i++)
  {
      printf("data point %d, var %s\n", i, (data[i].var ? data[i].var : "N/A"));
  }

hope this helps,
George
