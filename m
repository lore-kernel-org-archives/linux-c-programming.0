From: elathan@phys.uoa.gr
Subject: Re: mixing C/C++
Date: Tue, 25 Nov 2003 12:49:41 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1069757381.3fc333c52bf2b@webmail.uoa.gr>
References: <20031124111050.GI1819@pcmag.gr> <200311242218.40158.steven_shaw@iprimus.com.au> <20031124175501.GA1022@velka.phys.uoa.gr> <200311251221.39488.steven_shaw@iprimus.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="-MOQ106975738198af4e6f7ab362d5fe4382bae4d9bfdd"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200311251221.39488.steven_shaw@iprimus.com.au>
List-Id: <linux-c-programming.vger.kernel.org>
To: Steven Shaw <steven_shaw@iprimus.com.au>
Cc: linux-c-programming@vger.kernel.org

This message is in MIME format.

---MOQ106975738198af4e6f7ab362d5fe4382bae4d9bfdd
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit

Quoting Steven Shaw <steven_shaw@iprimus.com.au>: 
 
> On Tuesday 25 November 2003 03:55, Elias Athanasopoulos wrote: 
> > Apparently it is fine. The problem occures when I am wrapping 
> > a class which inherits from multiple classes with virtual 
> > functions. 
>  
> That should be fine too. 
>  
> > Any workarounds? 
>  
> Maybe you have C++ code with static members. If so you need to compile 
main() 
>  
> with a C++ compiler. Here is an excellent resource: 
>  
> 	http://www.parashift.com/c++-faq-lite/mixing-c-and-cpp.html 
 
This is what I read and came to the above conclusion. 
 
It states (32.9): 
 
You can safely access a C++ object's data from a C function if the C++ class:  
 
Has no virtual functions (including inherited virtual functions) 
  
So I guess that is a problem. I verified that with the attached source file. Compile 
the lib.cxx as a shared libfoo.so file and then try to call f->dump3() (f is struct 
*Foo).   
 
Also, I don't have main() in my project since it is a shared library. 
 
Thanks for your help. 
 
Regards, 
Elias 
 
  

---MOQ106975738198af4e6f7ab362d5fe4382bae4d9bfdd
Content-Type: text/x-c++src; name="lib.cxx"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lib.cxx"

CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CgpjbGFzcyBUYXogewpwdWJs
aWM6CiAgVGF6KCk7CiAgflRheigpOwoKICB2aXJ0dWFsIHZvaWQgZHVtcDModm9pZCk7Cn07Cgpj
bGFzcyBCYXIgewpwdWJsaWM6CiAgQmFyKCk7CiAgfkJhcigpOwoKICB2aXJ0dWFsIHZvaWQgZHVt
cDIodm9pZCk7Cn07CgpjbGFzcyBGb28gOiBwdWJsaWMgQmFyLCBwdWJsaWMgVGF6ewpwdWJsaWM6
CglGb28oKTsKCX5Gb28oKTsKCgl2b2lkIGR1bXAodm9pZCk7Cn07CgpGb286OkZvbygpCnsKfQoK
dm9pZCBGb286OmR1bXAodm9pZCkKewoJcHJpbnRmKCJGb28gSGVsbG8hXG4iKTsKfQoKQmFyOjpC
YXIoKQp7Cn0KCkJhcjo6fkJhcigpCnsKfQoKdm9pZCBCYXI6OmR1bXAyKHZvaWQpCnsKCXByaW50
ZiAoIkJhciBIZWxsb1xuIik7Cn0KClRhejo6VGF6KCkKewp9Cgp2b2lkIFRhejo6ZHVtcDModm9p
ZCkKewoJcHJpbnRmICgiVGF6IEhlbGxvIVxuIik7Cn0KCmV4dGVybiAiQyIKRm9vICogd3JhcF9m
b29fY3RvcigpCnsKCXJldHVybiBuZXcgRm9vKCk7Cn0KCmV4dGVybiAiQyIKdm9pZCB3cmFwX2Zv
b19kdW1wKEZvbyAqZikKewoJZi0+ZHVtcCgpOwp9CgpleHRlcm4gIkMiCnZvaWQgd3JhcF9iYXJf
ZHVtcDIoQmFyICpiKQp7CgliLT5kdW1wMigpOwp9CgpleHRlcm4gIkMiCnZvaWQgd3JhcF90YXpf
ZHVtcDMoVGF6ICp0KQp7Cgl0LT5kdW1wMygpOwp9Cgo=

---MOQ106975738198af4e6f7ab362d5fe4382bae4d9bfdd--
