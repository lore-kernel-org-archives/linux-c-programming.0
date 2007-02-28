From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Multiple declaration problem
Date: Wed, 28 Feb 2007 21:01:55 +0530
Message-ID: <45E5A06B.8050300@gmail.com>
References: <45E05E83.5010005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080504030600070707080507"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45E05E83.5010005@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------080504030600070707080507
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks to all who replied.

I found a different solution, which is by declaring the variables 
static. Find attached solutions.

But still the C parser (or what is it?) did throw up an error with the
const variable, which C++ did not.

@Andre: Is there any I should not declare a variable in a header file if
I want that variable to be visible to many cpp files? I can avoid
writing many "extern" lines by using static.

Thanks again,

Shriramana.

--------------080504030600070707080507
Content-Type: application/gzip;
 name="multiple-declaration-problem-solutions.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="multiple-declaration-problem-solutions.tar.gz"

H4sICHs75EUAAzh1SGJ5Yi50YXIA7Zjfb5swEMd5HX/FKd20Zi2JzY8gZdrDpFXqy172NinS
5oBpPAFGxlStpv3vswkENClLyDS6Lv48JObsYODyvTsuq1LJipQ6MY1SIohkPHcKwdcpzZyC
CMlI6pQ8rfTE3DoJpAiDQH/jMED97xYLoyDEyAsC37WQi0N/YUFw2nbDqEpJBIBVkuxbTsje
dYfmnynZIP9njxtKYipmUVEcv4d28ML39/rfRXjnf+Rq//uu51qA/t5td5y5/y+A5VFaxRQm
O+duJrbds5cyZrw23nMWQ/ZYCJZLuAT9GcHU/m6/qE2Jsk1WOQFWwqv4GtbtINoOVvkqn1wD
UTPaNoW39g/7qR/AmTNQ/4Tlw7SvOaR/FIat/v1A5wnX81Fg9D8G+/Svta29rSRdq75WeSd9
z6j3/+DE/L8Zssch/eO+/tVY6T/0sNH/GCj9J3lME/j4+fbm/YebT19uVe5XBpbTvs2OeF7K
OuUTeAdYqV89OMmi2rRWJleZ9lQIeuYCaB6zBObz/mmf+vbPnmH6p0Jw4fBKFpU8fo9D+g8C
b1f/+xjp+l+9CBr9j8FLuLu6AieCtrSzO0vvZa+18m1RUC/m3Qqu5md1dWjbdfmPm+rfbYp/
z1YrsvvdLs2gMfY26h2oSZHBm/rkd1HUXWTvuL+4tu29wG64vJwJHhNJrtADmi6hlcA26jH9
RweewFfy2t6e5tcfJEyoULiNkTFsqKAqOqYpjaS7hDQGQWUl9BQG+sAk6EBZlf9mrPut/v+w
79MyqP/j6vyPPBya/s8YHOf/0/o+LUP6P37d/3MXaGHi/xiY/s95c6T+T+r7tAzo/zT6x6Ef
Gv2Pgen/nDcD8/+gvk/L4fy/6PQf6PpPFQAm/4/C0f2fpttj2kAGg8FgMBgMz5ufpw75oAAo
AAA=
--------------080504030600070707080507--


