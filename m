From: kumar11 <ravikumar.chakram@gmail.com>
Subject: Function pointers
Date: Wed, 20 Jan 2010 22:33:04 -0800 (PST)
Message-ID: <27253432.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Could you please explain the meaning of below declaration statement.

char (*pa())[4]; 


Please find the entire code below.

char (*pa())[4]; 
void main(){ 
char(*p)[4]=pa(); 
printf("%d",**p); 
} 
char (*pa())[4]{ 
static char arr[]={'\11','\12','\13','\14'}; 
return &arr; 
}
-- 
View this message in context: http://old.nabble.com/Function-pointers-tp27253432p27253432.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

