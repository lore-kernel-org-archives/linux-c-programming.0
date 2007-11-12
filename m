From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: reading elf section data
Date: Mon, 12 Nov 2007 10:55:38 +0000
Message-ID: <18232.12586.211596.82841@cerise.gclements.plus.com>
References: <473856E2.5050707@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <473856E2.5050707@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zaphod001@gmail.com
Cc: linux-c-programming@vger.kernel.org


Gery wrote:

> How to read in human format data from elf section?

Can you be more specific? What kind of data? What format?

objdump and readelf can provide a lot of information about ELF files,
but they can't decode every type of data which could conceivably be
stored in an ELF file.

-- 
Glynn Clements <glynn@gclements.plus.com>
