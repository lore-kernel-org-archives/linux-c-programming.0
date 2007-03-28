From: Reggie Cushing <reggie.cushing@um.edu.mt>
Subject: Function stack reallocation
Date: Wed, 28 Mar 2007 09:21:30 +0200
Message-ID: <460A177A.4080506@um.edu.mt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi All - I wish some insight on the possibility of reallocating a 
function stack to a malloced regions in realtime ie I jump out of a 
function and the next time I jump in the stack would have moved along 
with its data. To me it seems unreliable cause the values in the stack 
have no type hence I would not know if the stack value is a data value 
or a pointer. If I mistakenly interpret a data value as a pointer I will 
update the data value resulting in data corruption. I would really wish 
some expert insight in this on this subject.

Regards
R.
