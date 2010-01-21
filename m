From: saravanaraj v <saravanaraj.v@gmail.com>
Subject: Re: Function pointers
Date: Thu, 21 Jan 2010 12:27:40 +0530
Message-ID: <2e0180191001202257j7d41f51cw86484aad228ff729@mail.gmail.com>
References: <27253432.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=T03M1uoUalqNNhRbZvaBvCxBfEKgndAHf4Hbvu/VkV8=;
        b=DlnBYEKbWJ35bHadocwYx6l20nrAw+kYDcjiVRVgOD0XB54jwgjxCdPSTe2VM7nlIW
         8MlkF63prz73gCYfOiHzH0kcNvC7EkwcmRPV1zxzaYDBhJRIwiR+7HP8nrLUUSufoBxe
         fVa37mscI1ODkLeI2S9Y7mJUzbToL9eVu+UeQ=
In-Reply-To: <27253432.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: kumar11 <ravikumar.chakram@gmail.com>
Cc: linux-c-programming@vger.kernel.org

[root@build ~]# cdecl
Type `help' or `?' for help
cdecl> explain char (*pa())[4];
declare pa as function returning pointer to array 4 of char
cdecl> explain char (*p)[4]
declare p as pointer to array 4 of char
cdecl>


Try the following code.

#include <stdio.h>

char (*pa())[4];
int main(){
        char(*p)[4]=3Dpa();
        /*printf("%d",**p);*/
        printf("%d %d %d %d\n",(*p)[0],(*p)[1],(*p)[2],(*p)[3]);
        return 0;
}
char (*pa())[4]{
        static char arr[]=3D{'\11','\12','\13','\14'};
        return &arr;
}


On Thu, Jan 21, 2010 at 12:03 PM, kumar11 <ravikumar.chakram@gmail.com>=
 wrote:
>
> Could you please explain the meaning of below declaration statement.
>
> char (*pa())[4];
>
>
> Please find the entire code below.
>
> char (*pa())[4];
> void main(){
> char(*p)[4]=3Dpa();
> printf("%d",**p);
> }
> char (*pa())[4]{
> static char arr[]=3D{'\11','\12','\13','\14'};
> return &arr;
> }
> --
> View this message in context: http://old.nabble.com/Function-pointers=
-tp27253432p27253432.html
> Sent from the linux-c-programming mailing list archive at Nabble.com.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
