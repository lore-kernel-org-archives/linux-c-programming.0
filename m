From: Shriramana Sharma <samjnaa@gmail.com>
Subject: #define-s for clarity/convenience
Date: Sat, 23 Jun 2007 11:53:16 +0530
Message-ID: <467CBC54.1040302@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080805010507020803050502"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080805010507020803050502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

I enclose herewith some #define-s I created for clarity. They are in the 
public domain to be used if anyone finds them useful.

I also request the experienced programmers here to share any such 
#define-s they may have. I and others may benefit. Please also specify 
the terms for usage.

Shriramana Sharma.

--------------080805010507020803050502
Content-Type: text/x-chdr;
 name="jamadagni.h"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jamadagni.h"

// (c) Shriramana Sharma, 2007. Placed in the public domain by the author.
// version 2, 2007-06-23

//
// some replacements using # define for ambiguous/pitfall/unclear/related keywords/operators in C++ for convenience
// it would be nice if the following replacements (even with other replacers) were to be part of a future C++ standard
// the current usages can be supported with deprecated status
//

//
// in the following comments, "declaration" also means "implicitly declaring definition" unless stated otherwise
//

//--------
// static
//--------

// "local" for "static" in declarations of variables and functions at file scope which are desired to be visible only in the current translation unit
# define local static

// "sticky" for "static" in declarations of local variables inside a function which should retain their value between function calls
# define sticky static

// "classwide" for "static" in declarations of local variables inside a class which are common to all instances of that class
# define classwide static

// "nothis" for "static" in declarations of member functions inside a class which can be called without an instance of that class
# define nothis static

//--------
// extern
//--------

// "exists" for "extern" in pure declarations (no implictly declaring definitions) of variables, types and functions which are defined elsewhere
# define exists extern
// in a future standard if "exists" is used in an implicitly declaring definition it should be an error
// if there is no "exists" in a line declaring a variable then it means memory should be allocated for that variable; if there is "exists", then no memory is allocated

// "global" for "extern" in declarations of variables and functions which are desired to be visible across all translation units; complement to "local" above
# define global extern
// this may of course be omitted since it is the default
// in a future version of GCC implementing a future standard, when "global" is used in an implicitly declaring definition there should be no warning -- currently GCC warns when "extern" is used here

// "decorateas" for "extern" to enclose declarations of functions which must be decorated in a particular way - i.e. "C" or "C++"
# define decorateas extern

//
// other:
//

// "pure" for "= 0" for declarations of pure virtual functions in classes
// since pure virtual means no definition exists, the word declarations here above does not include implicitly declaring definitions
# define pure = 0
// in a future standard preferably the word "pure" can be written before "virtual" instead of at the end of the declaration as provided by this # define

//---
// &
//---

// "ref" for "&" in declarations of variables and functions to denote a reference
# define ref &

// "addr" for "&" for extracting the address of a variable or function
# define addr(X) & X

//---
// *
//---

// "ptr" for "*" in declarations of variables and functions to denote a pointer
# define ptr *

// "ptee()" for "*" for dereferencing pointers; ptee = pointee, just as ptr = pointer
# define ptee(X) * X

--------------080805010507020803050502--

