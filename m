From: Balachandar <bala1486@gmail.com>
Subject: Use of double pointer in linux kernel Hash list implementation
Date: Wed, 16 Jun 2010 22:50:17 -0400
Message-ID: <AANLkTilGln3yZRl1muugML4Qg_1rcTXTf3UeAIzLTOJT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=00c09f9b0c6d0dccab048930e6c7
Return-path: <kernelnewbies-bounce@nl.linux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=Q9LDIPqXnCQv0msqGHOhzrDrzHkpSnWmeEMTVUsB1d0=;
        b=HN/ToyXYfJXojrYka6S2uC0Gd/WBaQ4Kt8TXqpblf7KD0LNxztP6B+cgjbGXD0HmE3
         ls5Vaw9NcDzMy3OJo1e92y8xVAGllXDBQn8osehowsD6t3W+FAFcUs8Evxrp+F4tqbDe
         /atq6Xb342XhNtEUMDbzPaIEQAJckW//NndEA=
Sender: kernelnewbies-bounce@nl.linux.org
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <linux-c-programming.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:ecartis-owner@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
To: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

--00c09f9b0c6d0dccab048930e6c7
Content-Type: text/plain; charset=ISO-8859-1

Hi,
  I am trying to understand Linux Kernel implementation of linked list and
hash table. A link to the implementation is
here<http://lxr.linux.no/linux+v2.6.34/include/linux/list.h>.
I understood the linked list implementation. But i am little confused of why
double pointers is being used in hlist (**pprev). Link for hlist is
here<http://lxr.linux.no/linux+v2.6.34/include/linux/list.h#L554>.
I understand that hlist is used in implementation of hash table since head
of the list requires only one pointer and it saves space. Why cant it be
done using single pointer (just *prev like the linked list)? Please help me.

Thanks,
Bala

--00c09f9b0c6d0dccab048930e6c7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div>=A0=A0I am trying to understand Linux Kernel implementat=
ion of linked list and hash table. A link to the implementation is <a href=
=3D"http://lxr.linux.no/linux+v2.6.34/include/linux/list.h">here</a>. I und=
erstood the linked list implementation. But i am little confused of why dou=
ble pointers is being used in hlist (**pprev). Link for hlist is <a href=3D=
"http://lxr.linux.no/linux+v2.6.34/include/linux/list.h#L554">here</a>. I u=
nderstand that hlist is used in implementation of hash table since head of =
the list requires only one pointer and it saves space. Why cant it be done =
using single pointer (just *prev like the linked list)? Please help me.</di=
v>
<div><br></div><div>Thanks,</div><div>Bala</div>

--00c09f9b0c6d0dccab048930e6c7--

--
To unsubscribe from this list: send an email with
"unsubscribe kernelnewbies" to ecartis@nl.linux.org
Please read the FAQ at http://kernelnewbies.org/FAQ

