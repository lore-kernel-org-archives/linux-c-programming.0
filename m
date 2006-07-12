From: "Daniel Bonekeeper" <thehazard@gmail.com>
Subject: Re: link table
Date: Wed, 12 Jul 2006 17:15:02 -0400
Message-ID: <e1e1d5f40607121415p4e5a5c95h1011999ee27a8b57@mail.gmail.com>
References: <44AA7BCE.8050107@bitdefender.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44AA7BCE.8050107@bitdefender.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mihai Dontu <mdontu@bitdefender.com>
Cc: linux-c-programming@vger.kernel.org

On 7/4/06, Mihai Dontu <mdontu@bitdefender.com> wrote:
> Hi,
>
> Does anyone know a tool which I can use to dump the link table?
>
> Basically I want to know how symbols were resolved. Such a tool should
> display:
>   - the name of the symbol
>   - the type of the symbol (T,U - see man nm)
>   - the address of the symbol (as set by the dynamic linker)
>   - the module in which this the symbol's address is located
>
> Eg:
>
> myprocess
>    U strcmp 0x0040500f (/lib/libc.so)
>
> Why do I want such a tool?
>   - I have this program that loads several shared objects (plugins) and
> sometimes the linker resolves the syms in a wrong way making the program
> misbehave (i.e. some plugins have syms with the same name, but they do
> different things - I can not change this because the plugins are third
> party (and closed source)).
>
> Thanks in advance.
>
> M.D.
>
>
> --
> This message was scanned for spam and viruses by BitDefender.
> For more information please visit http://www.bitdefender.com/
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

You can find this on objdump(1) source codes.

Daniel
-- 
What this world needs is a good five-dollar plasma weapon.
