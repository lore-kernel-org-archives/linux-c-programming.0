From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: c++ compiling problem. undefined reference to main
Date: Tue, 6 Apr 2004 18:09:05 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A334037D0DDD@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: srg <srgqwerty@telefonica.net>, linux-c-programming@vger.kernel.org


Where is the main() method? Your file cj_enteros.cpp does not define it.


-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of srg
Sent: Tuesday, April 06, 2004 5:44 PM
To: linux-c-programming@vger.kernel.org
Subject: c++ compiling problem. undefined reference to main


Hello:

We have a problem compiling c++ code.
At the bottom of this message you can see the compiler error.

Here are the details:

# gcc -v
Reading specs from /usr/lib/gcc-lib/i486-linux/3.3.3/specs
Configured with: ../src/configure -v 
--enable-languages=c,c++,java,f77,pascal,objc,ada,treelang --prefix=/usr 
--mandir=/usr/share/man --infodir=/usr/share/info 
--with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared 
--with-system-zlib --enable-nls --without-included-gettext 
--enable-__cxa_atexit --enable-clocale=gnu --enable-debug 
--enable-java-gc=boehm --enable-java-awt=xlib --enable-objc-gc i486-linux
Thread model: posix gcc version 3.3.3 (Debian)

# g++ -v
Reading specs from /usr/lib/gcc-lib/i486-linux/3.3.3/specs
Configured with: ../src/configure -v 
--enable-languages=c,c++,java,f77,pascal,objc,ada,treelang --prefix=/usr 
--mandir=/usr/share/man --infodir=/usr/share/info 
--with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared 
--with-system-zlib --enable-nls --without-included-gettext 
--enable-__cxa_atexit --enable-clocale=gnu --enable-debug 
--enable-java-gc=boehm --enable-java-awt=xlib --enable-objc-gc i486-linux
Thread model: posix gcc version 3.3.3 (Debian)

# cat hello.cpp
#include <iostream>

using namespace std;

int main(int argc,char** argv)
{
cout << "hello" << endl;
}
# g++ -o hello hello.cpp
# ./hello
hello

At this point all is OK, now comes the problem:

# cat cj_enteros.hpp

#ifndef _CJ_ENTEROS_HPP_
#define _CJ_ENTEROS_HPP_

#include <iostream>

class cj_enteros {

public:
cj_enteros(void);
cj_enteros(const cj_enteros& B);

~cj_enteros(void);

void inserta (int);

void unir (const cj_enteros& B);
void intersectar (const cj_enteros& B);
void restar (const cj_enteros& B);

bool contiene (int e) const;
int max (void) const;
int min (void) const;
int card (void) const;

cj_enteros& operator=(const cj_enteros& B);

bool operator== (const cj_enteros& B) const;
bool operator!= (const cj_enteros& B) const;

void print (ostream& os);

private:
struct node {
node* next;
int info;
};
node* pri;
node* copia_conj(node* p);
void esb_conj(node* p);
node* ordenar_creciente(node* p);
};


#endif

# cat cj_enteros.cpp
#include "cj_enteros.hpp"

cj_enteros::cj_enteros(void) {
pri = NULL;
}

cj_enteros::cj_enteros(const cj_enteros& B) {
pri = copia_conj(B.pri);
}

cj_enteros::node* cj_enteros::copia_conj(node* p) {
if(p == NULL) return NULL;
else {
node * n = new node;
n -> info = p -> info;
p = p -> next;
n -> next = copia_conj(p);
return n;
}
}

void cj_enteros::esb_conj(node* p) {
if(p == NULL) return ;
else {
esb_conj(p -> next);
delete p;
}
}

cj_enteros::~cj_enteros(void) {
esb_conj(pri);
}

bool cj_enteros::contiene(int e) const {
node* aux = pri;
while(aux != NULL && aux -> info != e) {
aux = aux -> next;
}
if(aux == NULL) return false;
else return true;
}

int cj_enteros::max (void) const {
if(pri == NULL) return 0;
else if(pri -> next == NULL) return pri -> info;
else {
node* n = pri -> next;
node* max = pri;
while(n != NULL) {
if(n -> info > max -> info) {
max = n;
}
n = n -> next;
}
return max -> info;
}
}

int cj_enteros::min (void) const {
if(pri == NULL) return 0;
else if(pri -> next == NULL) return pri -> info;
else {
node* n = pri -> next;
node* min = pri;
while(n != NULL) {
if(n -> info < min -> info) {
min = n;
}
n = n -> next;
}
return min -> info;
}
}

int cj_enteros::card (void) const {
node* n = pri;
int i = 0;
if(n == NULL) return 0;
else {
while(n != NULL) {
n = n -> next;
i++;
}
return i;
}
}


/*void cj_enteros::inserta(int e) {
if(!contiene(e)) {
if(pri == NULL) {
node* n = new node;
pri = n;
n -> info = e;
pri -> next = NULL;
}
else {
node* n = new node;
node* aux = pri -> next;
pri -> next = n;
n -> info = e;
n-> next = aux;
}
}
}*/

void cj_enteros::inserta(int e) {
if(!contiene(e)) {
if(pri == NULL) {
node* n = new node;
pri = n;
n -> info = e;
pri -> next = NULL;
}
else {
node* n = pri;
bool insertat = false;
while(n -> next != NULL && !insertat){
if((n -> info < e) && ((n -> next) -> info > e)) { // s'inserta al mig
node* aux = new node;
node* aux2 = n -> next;
n -> next = aux;
aux -> next = aux2;
aux -> info = e;
insertat = true;
}
else if(n -> info < e && (n -> next) -> info < e) { // avan? n n = n ->
next; } else if(n -> info > e) {
node* aux = new node;
aux -> next = n;
aux -> info = e;
pri = aux;
insertat = true;
}
}
if(!insertat) {
if(n -> info < e) {
node* aux = new node;
n -> next = aux;
aux -> info =e;
aux -> next = NULL;
}
else {
node* aux = new node;
pri = aux;
pri -> next = n;
aux -> info = e;
}
}
}
}
}

/*void cj_enteros::unir (const cj_enteros& B) {
node* n = pri;
while(n -> next != NULL) n = n -> next;
n -> next = B.pri;
}*/
void cj_enteros::unir (const cj_enteros& B) {
node* n = B.pri;
while(n != NULL) {
inserta(n -> info);
n = n -> next;
}
}

bool cj_enteros::operator== (const cj_enteros& B) const {
if(card() != B.card()) return false;
else {
node* aux = pri;
node* aux2 = B.pri;
while(aux != NULL && (aux -> info == aux2 -> info)) {
aux = aux -> next;
aux2 = aux2 -> next;
}
if(aux == NULL) return true;
else return false;
}
}

void cj_enteros::print (ostream& os) {
node* aux;
//aux = ordenar_creciente(pri);
aux = pri;
cout << "[";
while(aux != NULL) {
os << " " << aux -> info;
aux = aux -> next;
}
cout << "]" << endl;
}

// ----------------------------------------------------------

# g++ -o cj_enteros cj_enteros.cpp
/usr/lib/gcc-lib/i486-linux/3.3.3/../../../crt1.o(.text+0x18): In 
function `_start':
../sysdeps/i386/elf/start.S:98: undefined reference to `main'
collect2: ld returned 1 exit status

Any ideas?

Thanks and best regards

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
