From: Adam Dyga <adeon@tlen.pl>
Subject: Re: efficiency in passing a value to a function
Date: Wed, 11 Apr 2007 23:44:25 +0200
Message-ID: <200704112344.25098.adeon@tlen.pl>
References: <4613DCB8.8030007@gmail.com> <17939.60957.687289.154272@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17939.60957.687289.154272@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Wednesday, 4 April 2007 20:27, Glynn Clements wrote:

> Shriramana Sharma wrote:
> > Is providing an input to a function by constant reference more efficient
> > than passing it by value? In what way.
>
> Passing a reference doesn't copy the value. This can be significant if
> the value is large (i.e. a structure); for values which are no larger
> than a pointer, it is unlikely to make any difference.

For values which are not larger than a pointer, passing by reference can be 
even (slightly) slower, because the pointer must be dereferenced in the 
function in order to use the value:

void f1(const int v)
{
    printf("%d", v);
}

void f2(const int & v)
{
    printf("%d", v);
}


Compiled with -O2:

(gdb) disas f1
Dump of assembler code for function _Z2f1i:
0x08048460 <_Z2f1i+0>:  push   %ebp
0x08048461 <_Z2f1i+1>:  mov    %esp,%ebp
0x08048463 <_Z2f1i+3>:  sub    $0x10,%esp
0x08048466 <_Z2f1i+6>:  mov    0x8(%ebp),%eax
0x08048469 <_Z2f1i+9>:  push   %eax
0x0804846a <_Z2f1i+10>: push   $0x80485d4
0x0804846f <_Z2f1i+15>: call   0x8048358 <printf@plt>
0x08048474 <_Z2f1i+20>: leave
0x08048475 <_Z2f1i+21>: ret
End of assembler dump.
(gdb) disas f2
Dump of assembler code for function _Z2f2RKi:
0x08048480 <_Z2f2RKi+0>:        push   %ebp
0x08048481 <_Z2f2RKi+1>:        mov    %esp,%ebp
0x08048483 <_Z2f2RKi+3>:        sub    $0x10,%esp
0x08048486 <_Z2f2RKi+6>:        mov    0x8(%ebp),%eax
0x08048489 <_Z2f2RKi+9>:        mov    (%eax),%edx      //pointer dereference
0x0804848b <_Z2f2RKi+11>:       push   %edx
0x0804848c <_Z2f2RKi+12>:       push   $0x80485d4
0x08048491 <_Z2f2RKi+17>:       call   0x8048358 <printf@plt>
0x08048496 <_Z2f2RKi+22>:       leave
0x08048497 <_Z2f2RKi+23>:       ret
End of assembler dump.


Adam
