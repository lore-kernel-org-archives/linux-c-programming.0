From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: sequence of steps that goes from compilation to execution
Date: Mon, 23 Aug 2004 11:50:45 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E3066113851F@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Sudheer Vutukuru' <sudheer.vutukuru@gmail.com>, linux-c-programming@vger.kernel.org

>    Why a program which is compiled on linux does not execute on windows.. 
>(though the machine architecture is same)..

Different file formats.  Windows uses PE (portable executable) as its file
format with the first two bytes being `MZ' (or possibly `ZM') that 
designates it as a windows executable.  Linux uses ELF (executible linkable 
format) as its file format with the second, third and fourth bytes of the 
file being `ELF'.

> Also   Can u please suggest me references or help me in knowing the
>details of what goes on, from compilation to execution (i.e how
>loading,linking libraries is done.. how addresses
>are known dynamically etc.. ).

One of the best (only?) books on the subject "Linkers and Loaders" by John 
Levine.  It covers various file formats (from simple (i.e. DOS) up through
complex (PE and ELF)) and uses these formats to address all of the questions
that you ask.  In addition, the book is availble from the authors website:

http://www.iecc.com/linker/

as well as in printed format.

> for string literals whether memory is allocated in heap or in code
>segment only..
>i.e char* ptr = "Hello World";
>  the ptr points into code segement or heap..

In this case, I beleive that the C standard specifies that the string
literal 
will be a constant, and as such space will be reserved in a read-only
section 
of memory.  This is why a statement such as:

ptr[5]='i';

will fail.  Note however, that some compiles do not enforce this while
others
have flags that make string literals mutable.

George 
