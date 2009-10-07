From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: Question about core files
Date: Wed, 7 Oct 2009 19:24:52 +0530
Message-ID: <ea11fea30910070654u2664e60kf4f0642edd7f024f@mail.gmail.com>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de> 
	<ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com> 
	<Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=LWqya9/WR3uKknQH+fFa6JFbXgpCpt2/eW0beL9MuvU=;
        b=mMX79Uiyobb8/7t6nBIXi8FnUrcn/IIpWpJJLsp6xC2B/dMNX28rxv+U6f3qPVw06V
         BKlN3rzUmZmtGPdN5W3VqVVMz0wTDsJKJlg+hp9NjHqU8uOv7KI0wDDFyyr6FOy1v/dV
         cWQdx5BvMvZHbuX4tqGrDMbz/iUTzn66HpViE=
In-Reply-To: <Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org

On Wed, Oct 7, 2009 at 6:58 PM, Holger Kiehl <Holger.Kiehl@dwd.de> wrot=
e:
> On Tue, 6 Oct 2009, Manish Katiyar wrote:
>
>> On Tue, Oct 6, 2009 at 7:34 PM, Holger Kiehl <Holger.Kiehl@dwd.de> w=
rote:
>>>
>>> Hello
>>>
>>> Most the time I compile my application without the -g option due to
>>> performance reasons. Problem is that when it hits some bug and dump=
s
>>> core, this is not very useful because there is hardly any informati=
on
>>> in it. Is there some way to get some useful information out of
>>> the core file.
>>
>> Is it possible to post your code ? Atleast the start_process()
>> function. Given that you have got a sigsegv it is probably an invali=
d
>> pointer access.
>>
> The code is GPL so that is no problem. However it is long so I just
> cut out start_process() which you will find below.
>
>> You can also try to print $eip (or rip since this is 64 bit machine)
>> and look around the assembly . Output of "disas start_process" from
>> gdb will also help.
>>
> I tried those but I am not familier with assembly:
>
> =A0 (gdb) print $eip
> =A0 $1 =3D void
> =A0 (gdb) print $rip
> =A0 $2 =3D (void (*)()) 0x404b5f <start_process+143>
> =A0 (gdb) where
> =A0 #0 =A00x000000304cc32215 in raise (sig=3D<value optimized out>)
> =A0 =A0 =A0 at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
> =A0 #1 =A00x000000304cc33d83 in abort () at abort.c:88
> =A0 #2 =A00x000000000040b174 in sig_segv ()
> =A0 #3 =A0<signal handler called>
> =A0 #4 =A00x0000000000404b5f in start_process ()
> =A0 #5 =A00x0000000000407b9a in main ()
> =A0 (gdb) disas start_process
> =A0 Dump of assembler code for function start_process:
> =A0 0x0000000000404ad0 <start_process+0>: =A0 movslq %esi,%rsi
> =A0 0x0000000000404ad3 <start_process+3>: =A0 mov =A0 =A0%rbx,-0x30(%=
rsp)
> =A0 0x0000000000404ad8 <start_process+8>: =A0 mov =A0 =A0%rbp,-0x28(%=
rsp)
> =A0 0x0000000000404add <start_process+13>: =A0mov =A0 =A0%rsi,%r11
> =A0 0x0000000000404ae0 <start_process+16>: =A0mov =A0 =A0$0x68,%esi
> =A0 0x0000000000404ae5 <start_process+21>: =A0mov =A0 =A0%r12,-0x20(%=
rsp)
> =A0 0x0000000000404aea <start_process+26>: =A0imul =A0 %rsi,%r11
> =A0 0x0000000000404aee <start_process+30>: =A0mov =A0 =A0%r13,-0x18(%=
rsp)
> =A0 0x0000000000404af3 <start_process+35>: =A0mov =A0 =A0%r14,-0x10(%=
rsp)
> =A0 0x0000000000404af8 <start_process+40>: =A0mov =A0 =A0%r15,-0x8(%r=
sp)
> =A0 0x0000000000404afd <start_process+45>: =A0sub =A0 =A0$0x568,%rsp
> =A0 0x0000000000404b04 <start_process+52>: =A0mov =A0 =A0%rdx,%rbx
> =A0 0x0000000000404b07 <start_process+55>: =A0mov =A0 =A0%edi,0x24(%r=
sp)
> =A0 0x0000000000404b0b <start_process+59>: =A0mov =A0 =A0%r11,%rdi
> =A0 0x0000000000404b0e <start_process+62>: =A0add =A0 =A00x225513(%ri=
p),%rdi
> =A0# 0x62a028 <qb>
> =A0 0x0000000000404b15 <start_process+69>: =A0cmpb =A0 $0x0,0x31(%rdi=
)
> =A0 0x0000000000404b19 <start_process+73>: =A0je =A0 =A0 0x404ed8
> <start_process+1032>
> =A0 0x0000000000404b1f <start_process+79>: =A0movslq 0x28(%rdi),%rax
> =A0 0x0000000000404b23 <start_process+83>: =A0lea =A0 =A00x0(,%rax,8)=
,%rdx
> =A0 0x0000000000404b2b <start_process+91>: =A0mov =A0 =A0%rax,%r8
> =A0 0x0000000000404b2e <start_process+94>: =A0shl =A0 =A0$0x6,%r8
> =A0 0x0000000000404b32 <start_process+98>: =A0sub =A0 =A0%rdx,%r8
> =A0 0x0000000000404b35 <start_process+101>: add =A0 =A00x2259cc(%rip)=
,%r8 =A0 =A0 =A0 =A0#
> 0x62a508 <mdb>
> =A0 0x0000000000404b3c <start_process+108>: mov =A0 =A00x2c(%r8),%r9d
> =A0 0x0000000000404b40 <start_process+112>: test =A0 %r9d,%r9d
> =A0 0x0000000000404b43 <start_process+115>: jne =A0 =A00x404d70
> <start_process+672>
> =A0 0x0000000000404b49 <start_process+121>: movslq 0x24(%rsp),%rax
> =A0 0x0000000000404b4e <start_process+126>: imul =A0 $0x8f8,%rax,%r14
> =A0 0x0000000000404b55 <start_process+133>: mov =A0 =A0%r14,%rax
> =A0 0x0000000000404b58 <start_process+136>: add =A0 =A00x225441(%rip)=
,%rax
> =A0# 0x629fa0 <fsa>
> =A0 0x0000000000404b5f <start_process+143>: mov =A0 =A00xec(%rax),%ed=
x
> =A0 0x0000000000404b65 <start_process+149>: test =A0 $0x1,%dl
> =A0 0x0000000000404b68 <start_process+152>: jne =A0 =A00x404d30
> <start_process+608>
> =A0 0x0000000000404b6e <start_process+158>: dec =A0 =A0%ecx
> =A0 0x0000000000404b70 <start_process+160>: je =A0 =A0 0x404bd0
> <start_process+256>
> =A0 0x0000000000404b72 <start_process+162>: mov =A0 =A00xf0(%rax),%ec=
x
> =A0 0x0000000000404b78 <start_process+168>: mov =A0 =A0$0x2,%esi
> =A0 0x0000000000404b7d <start_process+173>: test =A0 %ecx,%ecx
> =A0 0x0000000000404b7f <start_process+175>: jne =A0 =A00x404c88
> <start_process+440>
> =A0 0x0000000000404b85 <start_process+181>: test =A0 %dl,%dl
> =A0 0x0000000000404b87 <start_process+183>: jns =A0 =A00x404bd0
> <start_process+256>
> =A0 0x0000000000404b89 <start_process+185>: mov =A0 =A00x104(%rax),%e=
cx
> =A0 0x0000000000404b8f <start_process+191>: movslq 0x28(%rdi),%rax
> =A0 0x0000000000404b93 <start_process+195>: mov =A0 =A0$0xffffffff,%e=
si
> =A0 0x0000000000404b98 <start_process+200>: mov =A0 =A0%r11,(%rsp)
> =A0 0x0000000000404b9c <start_process+204>: lea =A0 =A00x0(,%rax,8),%=
rdx
> =A0 0x0000000000404ba4 <start_process+212>: shl =A0 =A0$0x6,%rax
> =A0 0x0000000000404ba8 <start_process+216>: sub =A0 =A0%rdx,%rax
> =A0 0x0000000000404bab <start_process+219>: mov =A0 =A00x225956(%rip)=
,%rdx
> =A0# 0x62a508 <mdb>
> =A0 0x0000000000404bb2 <start_process+226>: mov =A0 =A00x28(%rdx,%rax=
,1),%edi
> =A0 0x0000000000404bb6 <start_process+230>: mov =A0 =A0%rbx,%rdx
> =A0 0x0000000000404bb9 <start_process+233>: callq =A00x41ab00
> <check_error_queue>
> =A0 0x0000000000404bbe <start_process+238>: test =A0 %eax,%eax
> =A0 0x0000000000404bc0 <start_process+240>: mov =A0 =A0%eax,%esi
> =A0 0x0000000000404bc2 <start_process+242>: mov =A0 =A0(%rsp),%r11
> =A0 0x0000000000404bc6 <start_process+246>: jne =A0 =A00x404c88
> <start_process+440>
> =A0 0x0000000000404bcc <start_process+252>: nopl =A0 0x0(%rax)
> =A0 0x0000000000404bd0 <start_process+256>: mov =A0 =A0%r14,%rcx
> =A0 0x0000000000404bd3 <start_process+259>: add =A0 =A00x2253c6(%rip)=
,%rcx
> =A0# 0x629fa0 <fsa>
> =A0 0x0000000000404bda <start_process+266>: cmpb =A0 $0x5,0xba(%rcx)
> =A0 0x0000000000404be1 <start_process+273>: je =A0 =A0 0x404f88
> <start_process+1208>
> =A0 0x0000000000404be7 <start_process+279>: mov =A0 =A00x225462(%rip)=
,%rax
> =A0# 0x62a050 <p_afd_status>
> =A0 0x0000000000404bee <start_process+286>: mov =A0 =A00x225194(%rip)=
,%ecx
> =A0# 0x629d88 <max_connections>
> =A0 0x0000000000404bf4 <start_process+292>: cmp =A0 =A0%ecx,0x4f4(%ra=
x)
> =A0 0x0000000000404bfa <start_process+298>: jge =A0 =A00x404d30
> <start_process+608>
> =A0 0x0000000000404c00 <start_process+304>: mov =A0 =A0%r14,%r8
> =A0 0x0000000000404c03 <start_process+307>: add =A0 =A00x225396(%rip)=
,%r8 =A0 =A0 =A0 =A0#
> 0x629fa0 <fsa>
> =A0 0x0000000000404c0a <start_process+314>: mov =A0 =A00x174(%r8),%ed=
i
> =A0 0x0000000000404c11 <start_process+321>: cmp =A0 =A0%edi,0x170(%r8=
)
> =A0 0x0000000000404c18 <start_process+328>: jge =A0 =A00x404d30
> <start_process+608>
> =A0 0x0000000000404c1e <start_process+334>: test =A0 %ecx,%ecx
> =A0 0x0000000000404c20 <start_process+336>: jle =A0 =A00x404c5e
> <start_process+398>
> =A0 0x0000000000404c22 <start_process+338>: mov =A0 =A00x2251ff(%rip)=
,%rsi
> =A0# 0x62---Type <return> to continue, or q <return> to quit---q
>
> So all I now know is that it happened with the assembly instruction:
>
> =A0 mov =A0 =A00xec(%rax),%edx
>
> But what does it tell me. At what part of my code could this be?

Hi Holger,

I don't have the source code, so a bit hard to guess. But you can try
to find out which member of your fsa structure is at offset 236 (0xec)
and look around those lines in the function where you are accessing
that member.

I am trying to download the AFD source code, which looks like it will
take ages on my slow broadband. Hopefully I can help after that.


>
> Thanks,
> Holger
>
> --------- code of start_process() ----------
> static pid_t
> start_process(int fsa_pos, int qb_pos, time_t current_time, int retry=
)
> {
> =A0 pid_t pid =3D PENDING;
>
> =A0 if ((qb[qb_pos].msg_name[0] !=3D '\0') &&
> =A0 =A0 =A0 (mdb[qb[qb_pos].pos].age_limit > 0) &&
> =A0 =A0 =A0 ((fsa[fsa_pos].host_status & DO_NOT_DELETE_DATA) =3D=3D 0=
) &&
> =A0 =A0 =A0 (current_time > qb[qb_pos].creation_time) &&
> =A0 =A0 =A0 ((current_time - qb[qb_pos].creation_time) >
> mdb[qb[qb_pos].pos].age_limit))
> =A0 {
> =A0 =A0 =A0char del_dir[MAX_PATH_LENGTH];
>
> =A0 =A0 =A0if (fsa[fsa_pos].host_status & ERROR_QUEUE_SET)
> =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 remove_from_error_queue(mdb[qb[qb_pos].pos].job_id, &=
fsa[fsa_pos],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsa_p=
os, fsa_fd);
> =A0 =A0 =A0}
> =A0 =A0 =A0(void)sprintf(del_dir, "%s%s%s/%s",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p_work_dir, AFD_FILE_DIR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUTGOING_DIR, qb[qb_pos].msg_n=
ame);
> =A0 =A0 =A0extract_cus(qb[qb_pos].msg_name, dl.input_time, dl.split_j=
ob_counter,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dl.unique_number);
> =A0 =A0 =A0remove_job_files(del_dir, fsa_pos, mdb[qb[qb_pos].pos].job=
_id,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 FD, AGE_OUTPUT, -1);
> =A0 =A0 =A0ABS_REDUCE(fsa_pos);
> =A0 =A0 =A0pid =3D REMOVED;
> =A0 }
> =A0 else
> =A0 {
> =A0 =A0 =A0int in_error_queue =3D NEITHER;
>
> =A0 =A0 =A0if ((qb[qb_pos].msg_name[0] =3D=3D '\0') &&
> =A0 =A0 =A0 =A0 =A0(*(unsigned char *)((char *)fsa - AFD_FEATURE_FLAG=
_OFFSET_END) &
> DISABLE_RETRIEVE))
> =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 ABS_REDUCE(fsa_pos);
>
> =A0 =A0 =A0 =A0 return(REMOVED);
> =A0 =A0 =A0}
>
> =A0 =A0 =A0if (((fsa[fsa_pos].host_status & STOP_TRANSFER_STAT) =3D=3D=
 0) &&
> =A0 =A0 =A0 =A0 =A0((retry =3D=3D YES) ||
> =A0 =A0 =A0 =A0 =A0 ((fsa[fsa_pos].error_counter =3D=3D 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0(((fsa[fsa_pos].host_status & ERROR_QUEUE_SET)=
 =3D=3D 0) ||
> =A0 =A0 =A0 =A0 =A0 =A0 ((fsa[fsa_pos].host_status & ERROR_QUEUE_SET)=
 &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0((in_error_queue =3D
> check_error_queue(mdb[qb[qb_pos].pos].job_id,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -1, current_time,
>
> fsa[fsa_pos].retry_interval)) =3D=3D NO)))) ||
> =A0 =A0 =A0 =A0 =A0 ((fsa[fsa_pos].error_counter > 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0(fsa[fsa_pos].host_status & ERROR_QUEUE_SET) &=
&
> =A0 =A0 =A0 =A0 =A0 =A0((current_time - (fsa[fsa_pos].last_retry_time=
 +
> fsa[fsa_pos].retry_interval)) >=3D 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0((in_error_queue =3D=3D NO) ||
> =A0 =A0 =A0 =A0 =A0 =A0 ((in_error_queue =3D=3D NEITHER) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0(check_error_queue(mdb[qb[qb_pos].pos].job=
_id, -1,
> current_time,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsa[f=
sa_pos].retry_interval) =3D=3D NO)))) ||
> =A0 =A0 =A0 =A0 =A0 ((fsa[fsa_pos].active_transfers =3D=3D 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0((current_time - (fsa[fsa_pos].last_retry_time=
 +
> fsa[fsa_pos].retry_interval)) >=3D 0))))
> =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 /*
> =A0 =A0 =A0 =A0 =A0* First lets try and take an existing process,
> =A0 =A0 =A0 =A0 =A0* that is waiting for more data to come.
> =A0 =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0 if ((fsa[fsa_pos].original_toggle_pos =3D=3D NONE) &&
> =A0 =A0 =A0 =A0 =A0 =A0 ((fsa[fsa_pos].protocol_options & DISABLE_BUR=
STING) =3D=3D 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0 (fsa[fsa_pos].keep_connected > 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0 (fsa[fsa_pos].active_transfers > 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0 (fsa[fsa_pos].jobs_queued > 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0 ((((fsa[fsa_pos].special_flag & KEEP_CON_NO_S=
END) =3D=3D 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 (qb[qb_pos].msg_name[0] !=3D '\0')) ||
> =A0 =A0 =A0 =A0 =A0 =A0 =A0(((fsa[fsa_pos].special_flag & KEEP_CON_NO=
_FETCH) =3D=3D 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 (qb[qb_pos].msg_name[0] =3D=3D '\0'))) &&
> =A0 =A0 =A0 =A0 =A0 =A0 ((qb[qb_pos].special_flag & HELPER_JOB) =3D=3D=
 0))
> =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0int i,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0other_job_wait_pos[MAX_NO_PARALLEL_JOB=
S],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0other_qb_pos[MAX_NO_PARALLEL_JOBS],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wait_counter =3D 0;
>
> =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < fsa[fsa_pos].allowed_transfe=
rs; i++)
> =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((fsa[fsa_pos].job_status[i].proc_id !=
=3D -1) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fsa[fsa_pos].job_status[i].uniqu=
e_name[2] =3D=3D 5))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int exec_qb_pos;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0qb_pos_pid(fsa[fsa_pos].job_status=
[i].proc_id,
> &exec_qb_pos);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (exec_qb_pos !=3D -1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((qb[qb_pos].msg_name[0] !=
=3D '\0') &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (qb[exec_qb_pos].msg_=
name[0] !=3D '\0') &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (mdb[qb[qb_pos].pos].=
type =3D=3D
> mdb[qb[exec_qb_pos].pos].type) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (mdb[qb[qb_pos].pos].=
port =3D=3D
> mdb[qb[exec_qb_pos].pos].port))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (qb[qb_pos].retries=
 > 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsa[fsa_pos].job_=
status[i].file_name_in_use[0] =3D
> '\0';
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsa[fsa_pos].job_=
status[i].file_name_in_use[1] =3D
> 1;
>
> (void)sprintf(&fsa[fsa_pos].job_status[i].file_name_in_use[2],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "%u", qb[qb_pos].retries);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsa[fsa_pos].job_statu=
s[i].job_id =3D
> mdb[qb[qb_pos].pos].job_id;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mdb[qb[qb_pos].pos].la=
st_transfer_time =3D
> mdb[qb[exec_qb_pos].pos].last_transfer_time =3D current_time;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void)memcpy(fsa[fsa_p=
os].job_status[i].unique_name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 qb[qb_pos].msg_name,
> MAX_MSG_NAME_LENGTH);
>
> =A0(void)memcpy(connection[qb[exec_qb_pos].connect_pos].msg_name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 qb[qb_pos].msg_name,
> MAX_MSG_NAME_LENGTH);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0qb[qb_pos].pid =3D qb[=
exec_qb_pos].pid;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0qb[qb_pos].connect_pos=
 =3D qb[exec_qb_pos].connect_pos;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0qb[qb_pos].special_fla=
g |=3D BURST_REQUEUE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0connection[qb[exec_qb_=
pos].connect_pos].job_no =3D i;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (qb[exec_qb_pos].pi=
d > 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (kill(qb[exec_=
qb_pos].pid, SIGUSR1) =3D=3D -1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0system_log=
(DEBUG_SIGN, __FILE__, __LINE__,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "Failed to send SIGUSR1 to %lld :
> %s",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (pri_pid_t)qb[exec_qb_pos].pid,
> strerror(errno));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p_afd_status->bur=
st2_counter++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 system_log(DEBUG_=
SIGN, __FILE__, __LINE__,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0"Hmmm, pid =3D %lld!!!",
> (pri_pid_t)qb[exec_qb_pos].pid);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((fsa[fsa_pos].tran=
sfer_rate_limit > 0) ||
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(no_of_trl_gro=
ups > 0))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 calc_trl_per_proc=
ess(fsa_pos);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ABS_REDUCE(fsa_pos);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0remove_msg(exec_qb_pos=
);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return(qb[qb_pos].pid)=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0other_job_wait_pos[wai=
t_counter] =3D i;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0other_qb_pos[wait_coun=
ter] =3D exec_qb_pos;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wait_counter++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 system_log(DEBUG_SIGN, __FILE=
__, __LINE__,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Unabl=
e to locate qb_pos for %lld
> [fsa_pos=3D%d].",
>
> =A0(pri_pid_t)fsa[fsa_pos].job_status[i].proc_id,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsa_po=
s);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0if ((fsa[fsa_pos].active_transfers =3D=3D
> fsa[fsa_pos].allowed_transfers) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(wait_counter > 0))
> =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < wait_counter; i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if
> (fsa[fsa_pos].job_status[other_job_wait_pos[i]].unique_name[2] =3D=3D=
 5)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (qb[other_qb_pos[i]].pid >=
 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>
> =A0fsa[fsa_pos].job_status[other_job_wait_pos[i]].unique_name[2] =3D =
6;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (qb[other_qb_pos[i]=
].msg_name[0] =3D=3D '\0')
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return(PENDING);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (kill(qb[other=
_qb_pos[i]].pid, SIGUSR1) =3D=3D -1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0system_log=
(DEBUG_SIGN, __FILE__, __LINE__,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "Failed to send SIGUSR1 to %lld :
> %s",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (pri_pid_t)qb[other_qb_pos[i]].pid,
> strerror(errno));
>
> =A0fsa[fsa_pos].job_status[other_job_wait_pos[i]].unique_name[2] =3D =
5;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return(PEN=
DING);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0system_log(DEBUG_SIGN,=
 __FILE__, __LINE__,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "=
Hmmm, pid =3D %lld!!!",
> (pri_pid_t)qb[other_qb_pos[i]].pid);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0 if ((p_afd_status->no_of_transfers < max_connections)=
 &&
> =A0 =A0 =A0 =A0 =A0 =A0 (fsa[fsa_pos].active_transfers <
> fsa[fsa_pos].allowed_transfers))
> =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0int pos;
>
> =A0 =A0 =A0 =A0 =A0 =A0if ((pos =3D get_free_connection()) =3D=3D INC=
ORRECT)
> =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 system_log(ERROR_SIGN, __FILE__, __LINE__=
,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Failed to get fre=
e connection.");
> =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((connection[pos].job_no =3D get_free_=
disp_pos(fsa_pos)) !=3D
> INCORRECT)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (qb[qb_pos].msg_name[0] =3D=3D =
'\0')
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].fra_pos =3D q=
b[qb_pos].pos;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].protocol =3D =
fra[qb[qb_pos].pos].protocol;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].msg_name[0] =3D=
 '\0';
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (void)memcpy(connection[pos].=
dir_alias,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fr=
a[qb[qb_pos].pos].dir_alias,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MA=
X_DIR_ALIAS_LENGTH + 1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].fra_pos =3D -=
1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].protocol =3D =
mdb[qb[qb_pos].pos].type;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (void)memcpy(connection[pos].=
msg_name,
> qb[qb_pos].msg_name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MA=
X_MSG_NAME_LENGTH);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].dir_alias[0] =
=3D '\0';
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (qb[qb_pos].special_flag & RESE=
ND_JOB)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].resend =3D YE=
S;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].resend =3D NO=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0connection[pos].temp_toggle =3D OF=
=46;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void)memcpy(connection[pos].hostn=
ame,
> fsa[fsa_pos].host_alias,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 MAX_HOSTN=
AME_LENGTH + 1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0connection[pos].host_id =3D fsa[fs=
a_pos].host_id;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0connection[pos].fsa_pos =3D fsa_po=
s;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (fd_check_fsa() =3D=3D YES)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (check_fra_fd() =3D=3D YES=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0init_fra_data();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* We need to set the conne=
ction[pos].pid to a
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* value higher then 0 so t=
he function
> get_new_positions()
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* also locates the new con=
nection[pos].fsa_pos.
> Otherwise
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* from here on we point to=
 some completely different
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* host and this can cause =
havoc when someone uses
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* edit_hc and changes the =
alias order.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].pid =3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 get_new_positions();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].pid =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 init_msg_buffer();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsa_pos =3D connection[pos].f=
sa_pos;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 last_pos_lookup =3D INCORRECT=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0(void)strcpy(fsa[fsa_pos].job_status[connection[pos].job_no].uniqu=
e_name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 qb[qb_pos=
].msg_name);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((fsa[fsa_pos].error_counter =3D=
=3D 0) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(fsa[fsa_pos].auto_toggle =
=3D=3D ON) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(fsa[fsa_pos].original_tog=
gle_pos !=3D NONE) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(fsa[fsa_pos].max_successf=
ul_retries > 0))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((fsa[fsa_pos].original_to=
ggle_pos =3D=3D
> fsa[fsa_pos].toggle_pos) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fsa[fsa_pos].success=
ful_retries > 0))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsa[fsa_pos].original_=
toggle_pos =3D NONE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsa[fsa_pos].successfu=
l_retries =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (fsa[fsa_pos].success=
ful_retries >=3D
> fsa[fsa_pos].max_successful_retries)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[po=
s].temp_toggle =3D ON;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsa[fsa_pos].=
successful_retries =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsa[fsa_pos].=
successful_retries++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Create process to distribute fi=
le. */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((connection[pos].pid =3D make_=
process(&connection[pos],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0qb_pos)) > 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pid =3D
> fsa[fsa_pos].job_status[connection[pos].job_no].proc_id =3D
> connection[pos].pid;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsa[fsa_pos].active_transfers=
 +=3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((fsa[fsa_pos].transfer_ra=
te_limit > 0) ||
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (no_of_trl_groups > 0=
))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0calc_trl_per_process(f=
sa_pos);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ABS_REDUCE(fsa_pos);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 qb[qb_pos].connect_pos =3D po=
s;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p_afd_status->no_of_transfers=
++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
>
> fsa[fsa_pos].job_status[connection[pos].job_no].connect_status =3D
> NOT_WORKING;
>
> fsa[fsa_pos].job_status[connection[pos].job_no].no_of_files =3D 0;
>
> fsa[fsa_pos].job_status[connection[pos].job_no].no_of_files_done =3D =
0;
>
> fsa[fsa_pos].job_status[connection[pos].job_no].file_size =3D 0;
>
> fsa[fsa_pos].job_status[connection[pos].job_no].file_size_done =3D 0;
>
> fsa[fsa_pos].job_status[connection[pos].job_no].file_size_in_use =3D =
0;
>
> fsa[fsa_pos].job_status[connection[pos].job_no].file_size_in_use_done=
 =3D 0;
>
> fsa[fsa_pos].job_status[connection[pos].job_no].file_name_in_use[0] =3D=
 '\0';
>
> fsa[fsa_pos].job_status[connection[pos].job_no].file_name_in_use[1] =3D=
 0;
>
> fsa[fsa_pos].job_status[connection[pos].job_no].unique_name[0] =3D '\=
0';
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].hostname[0] =3D=
 '\0';
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].msg_name[0] =3D=
 '\0';
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].host_id =3D 0=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].job_no =3D -1=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].fsa_pos =3D -=
1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].fra_pos =3D -=
1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 connection[pos].pid =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0}
> =A0 }
> =A0 return(pid);
> }
>



--=20
Thanks -
Manish
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[$\*.^ -- I miss being one of them
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
