From: Giulio Rossato <giulio.rossato@infocamere.it>
Subject: offsets of fields in a structure
Date: Fri, 19 Oct 2007 17:27:30 +0200
Message-ID: <4718CCE2.9060202@infocamere.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

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


