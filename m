From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: complex variable
Date: Wed, 8 Sep 2004 14:40:35 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138526@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

First (for Charlie), I attempted to keep as much of Ankit's code consistent 
from his posting to my sample code - including unused variables,
non-portable 
constructs, use of N instead of a #define 

As both Charlie and Jan-Benedict both noted doing an declaration and
defination
of the pointers is not necessary - I plead old habits developed when working

with various microsoft compilers.  What can I say - old habits die hard.

Now for Ankits question:

>but sorry sir i could not understand one thing which u
>also clearly detected. it is "in" variable....its a
>complex variable. this is somewhat not correct

>complex x, *in = NULL;

>but i wanted to ask if i want to use in as a 2D array
>how to do that?

Assuming that you want to create a two dimensional array of complex types
(with
the added assumption that number of rows is not known at compile time), I
would
do something along these lines.  To create a dynamic two-dimensional array,
you 
allocate enough memory to hold all of the elements and manage the space
yourself.
For example, if you wanted to create a 3 rows by 2 column array you would
need 
to allocate space for six elements.  Because C lays out it arrays in
row-major
for, the space would be:

   +-----+-----+-----+-----+-----+-----+
   | 0,0 | 0,1 | 1,0 | 1,1 | 2,0 | 2,1 |
   +-----+-----+-----+-----+-----+-----+
      0     1     2     3     4     5

with the corresponding index shown below.  To make life easy, you need to
create
a function that will take the a two-dimensional index, i.e. (row, col), and
convert 
it to the corresponding one-dimensional index.  I tend to use a macro to do
this,

#define MakeIndex(r,c)  (r)*NUM_COLS + (y)

Now if I wanted to create the above two-dimensional array, I would allocate
space
for it like this (I have used fixed values for number of columns and number
of 
rows for demonstration purposes only.  If these values were set at compile
time it 
would be easier to do complex in[3][2])
	
   complex*   in;
   int        nRows = 3;
   int        nCols = 2;

   in = malloc(sizeof(complex)*3*2);

Now having created a region in memory to hold by two dimensional array we
can do things
like:

   complex    var1, var2;
   in[MakeIndex(0,0)] = var1;    // assign a value into the 2D array at row
0 column 0
   var2 = in[MakeIndex(1,1)];    // access a vlue in the 2D array at row 1
column 1

Note that error checking has not been performed.  It is up to the
application to insure 
that bounds are not overstepped.  For example, element (1,2) does not exist
as this would 
imply the array having three columns.

As I said earlier, if both the number of rows and number of columns are know
at compile 
time things become much easier.  You can use the normal square-bracket
notation to access
elements.

Hope this helps
George


   
