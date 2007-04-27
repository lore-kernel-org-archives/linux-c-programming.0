From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Function pointers to inline functions
Date: Fri, 27 Apr 2007 22:31:43 +0530
Message-ID: <46322C77.8070803@gmail.com>
References: <4613DBC2.8060708@gmail.com> <6a00c8d50704041133u30d98daavec529753606fc7e9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080305080104080003050009"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50704041133u30d98daavec529753606fc7e9@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080305080104080003050009
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I did some experimentation with pointers to inline and static inline 
functions. Please unpack the attachment and run the build script.

You will observe that the nm files only differ in the last four lines, 
and that too in only three of them.

The difference is that the executable built from the source with just 
"inline" has the functions square, cube and fourthpower marked as "W" 
which according to man:nm means that "The symbol is a weak symbol that 
has not been specifically tagged as a weak object symbol".

In the same place, the executable built from the source with "static 
inline" has the same functions marked "t" which denotes a local symbol 
in the code section.

I actually expected static inline to make the entries for the functions 
disappear but OK, I'm calling pointers to those functions, so they won't 
disappear. But at least shouldn't they become weak objects, like they do 
for "inline"?

Though I do not profess to fully understand what a weak object is, (upon 
which matter I would like to learn more) it sounds like an object which 
does not have a full separate existence. If an inline function is such a 
weak object, how come a static inline one is not tagged as one?

Thanks.

Shriramana Sharma.

--------------080305080104080003050009
Content-Type: application/gzip;
 name="function-pointers-inline-staticinline.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="function-pointers-inline-staticinline.tar.gz"

H4sICK8pMkYAA0RWVUlZYS50YXIA7VfLctowFGWLv+KWTDshCcFgAwuSbPoB3XTXdiHbIlZq
S64sk2aS/nuvZJtXMDB5Tqc6kwFbOrrvq0tmBQ8VE7yXCcYVlXmP8YRx2ssVUSwsX/qtZ8FF
TEYj/T2YjNzV7xqtgTse+P7QH3vjljt0vaHbgtHz1B6GAh2VAK2cpDeckEbevv1/FLOD8h8U
LImerGNf/n3MeZ1/BOZ/4PmjFrgv6Gcj/vP8H32AfsB4P48d5/r0FHpfoCegqSoaN87DLHN4
Cr3PzWevmk/zdKfy1Vrcs73TkDU528xZk4RGvXd2Xh+H9f/+mO/SoXt8rPt6e/8P/Ul1/3vj
4WCo7//JYOLb/n8LHDEeJkVEoZOriInzuOM4ZW6h6pO5YBHkvwoiKRzjogICXbiHTOLzDJc6
X2NaE8QMPkbAcvz8zjtnQPAPTsyJKfzZJjksgl1yzXaj1J2SZ6KQKs7ELZU7FJQsKGk7FS2V
OUb+Ma7UjVH3BXwDD34grVSIdKd/4ijUQwIxp2Csi2iYYLByIByIlOQOQpIkNHosTcVEQUz0
g6Q6TB6KpAlNKVc53MYsjEGHHY/D4pC2qwtqeZHWTEV+IhVyxq8Tqu2j1+gzSs+IJClVizh1
0bIIJFWF5MCFivEEbhmvy71I6HVIRcRmd6D9CwXK01ZhDM17QvIcpSH97hZdPNaMHGU7J/0q
gPQ3DQtFazMr5fUrL9KAyjOzxnhWqJmQC2rXuXfaTCdxnQ4X4MLDw+bqFQzR8MqhqdNuSN3G
qTqPm7q1hH4fvcRCMQnV6cuN1wtSGXEklOKjZVaCuzVmqauHJVjltQ7gI/vKUlkIJpBSY2bF
F8ENDdVC31JTWEhp5K4SdKqNA2U+M0wW3XBBv8xJUtBaw5xIRgJTOhshIdqcRRU52CE6aylh
fFE2OmFbQu5ilC/hU31/TLeSBhXJXAbbKcOKstr0yMQiQUNCUeCnPiikKUT9egnutHq8AK9+
xF8hXafdflyaZvvM1NEUHXzve/ul8NT5f9jkL7F3/vsezv/RxHPx3z93gvN/NMGfBHb+vwG2
zf9XGPyvMPHtqLej3o56O+rtqLewsLCwsLCwsLCwsLCwsLCwsGjCX1rOHDIAKAAA
--------------080305080104080003050009--

