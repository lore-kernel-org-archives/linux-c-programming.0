From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: struct passwd usage
Date: Wed, 30 Apr 2003 14:49:13 -0600 (CST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0304301445001.29006-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

what is wrong with this code:

main(){
struct passwd *pwd;
char *user;
puts("username:");
pwd=getpwnam(user);
puts(pwd->pw_name);
}


---
Fabio Andres Miranda
Ingenieria de sistemas informaticos
Universidad Latina - Costa Rica



