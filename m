From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: STL - creating std::map key higher than double
Date: Wed, 20 Oct 2004 16:42:06 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4176BF8E.5010107@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

THE PROBLEM:
I never created a map<> object that has a key different from embbeded 
types. When I need a different key type, I create a union joinning my 
type with a large enough embbed type. A sample:
urion {
      myObject X; // Its size is less or equal to double size;
      double real_key;
};

Well, now I need a key larger than 128 bits, because it ll have about 48 
bytes. I tryed to create a map like as:
typedef std::map<myKeyType, stItem, std::less< myKeyType > > tpList;

But, off course, the compiler advised me that "less<>" cannot compare 
"myKeyType", then I implemented a "operator<" into "myKeyType". And now 
the problem is with "iterator".

MY QUESTIONS:
Does exist a way to get a map<> with a customized key ? Should I fix the 
compiling erros, building my own objects ?

Thanks,
Luciano

