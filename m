From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: "static const" attribute in C++ (How to ?)
Date: Mon, 28 Jun 2004 18:42:07 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40E090AF.6090300@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Sorry for this rookie question, but I'm not a experienced C++ programmer 
(I m a old C-ANSI programmer, not in C++)

How can us create a kind of "static const" attribute into a class ? I 
need to use it like as:
char myArray[MYCLASS::DEFSIZE];
Where "DEFSIZE" whould be a "static const" member (or another type) of 
MYCLASS.

What do I already tried ? Follow:
class MYCLASS {
    public:
       static const int DEFSIZE;
};
const int DEFSIZE = 100;

But, when the file "MYCLASS.h" is included more than one file ".cpp", 
the linker says that the member "MYCLASS::DEFZISE" "was already defined 
in 'filename'". And don't have occurrences of compiler errors, only on 
linking.

Thanks,

Luciano

-------------------------------------------
FOLLOW SOME COMPILER FULL ERROR MESSAGE (MSVC++ 6.0):
HMMessageProcessor_Canal.obj : error LNK2005: "public: static unsigned 
int const MMDadosCarteira::_OFFSET_CARTEIRA2B" 
(?_OFFSET_CARTEIRA2B@MMDadosCarteira@@2IB) already defined in HMApp.obj

HMMessageProcessor_Canal.obj : error LNK2005: "public: static unsigned 
int const MUDadosRecarga::_OFFSET_CARTEIRA2B" 
(?_OFFSET_CARTEIRA2B@MUDadosRecarga@@2IB) already defined in HMApp.obj

PS: I didn't code "static unsigned int const". In my source code I coded 
"static const unsigned" only. I don't know why MSVC "translated" my code.

