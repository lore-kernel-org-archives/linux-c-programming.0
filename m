From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Question about core files
Date: Wed, 7 Oct 2009 13:28:49 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0910071319230.29237@diagnostix.dwd.de>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de>
 <ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <ea11fea30910060741i3538ca36hcf5ce9ee7cf78bff@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, 6 Oct 2009, Manish Katiyar wrote:

> On Tue, Oct 6, 2009 at 7:34 PM, Holger Kiehl <Holger.Kiehl@dwd.de> wrote:
>> Hello
>>
>> Most the time I compile my application without the -g option due to
>> performance reasons. Problem is that when it hits some bug and dumps
>> core, this is not very useful because there is hardly any information
>> in it. Is there some way to get some useful information out of
>> the core file.
>
> Is it possible to post your code ? Atleast the start_process()
> function. Given that you have got a sigsegv it is probably an invalid
> pointer access.
>
The code is GPL so that is no problem. However it is long so I just
cut out start_process() which you will find below.

> You can also try to print $eip (or rip since this is 64 bit machine)
> and look around the assembly . Output of "disas start_process" from
> gdb will also help.
>
I tried those but I am not familier with assembly:

    (gdb) print $eip
    $1 = void
    (gdb) print $rip
    $2 = (void (*)()) 0x404b5f <start_process+143>
    (gdb) where
    #0  0x000000304cc32215 in raise (sig=<value optimized out>)
        at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
    #1  0x000000304cc33d83 in abort () at abort.c:88
    #2  0x000000000040b174 in sig_segv ()
    #3  <signal handler called>
    #4  0x0000000000404b5f in start_process ()
    #5  0x0000000000407b9a in main ()
    (gdb) disas start_process
    Dump of assembler code for function start_process:
    0x0000000000404ad0 <start_process+0>:   movslq %esi,%rsi
    0x0000000000404ad3 <start_process+3>:   mov    %rbx,-0x30(%rsp)
    0x0000000000404ad8 <start_process+8>:   mov    %rbp,-0x28(%rsp)
    0x0000000000404add <start_process+13>:  mov    %rsi,%r11
    0x0000000000404ae0 <start_process+16>:  mov    $0x68,%esi
    0x0000000000404ae5 <start_process+21>:  mov    %r12,-0x20(%rsp)
    0x0000000000404aea <start_process+26>:  imul   %rsi,%r11
    0x0000000000404aee <start_process+30>:  mov    %r13,-0x18(%rsp)
    0x0000000000404af3 <start_process+35>:  mov    %r14,-0x10(%rsp)
    0x0000000000404af8 <start_process+40>:  mov    %r15,-0x8(%rsp)
    0x0000000000404afd <start_process+45>:  sub    $0x568,%rsp
    0x0000000000404b04 <start_process+52>:  mov    %rdx,%rbx
    0x0000000000404b07 <start_process+55>:  mov    %edi,0x24(%rsp)
    0x0000000000404b0b <start_process+59>:  mov    %r11,%rdi
    0x0000000000404b0e <start_process+62>:  add    0x225513(%rip),%rdi        # 0x62a028 <qb>
    0x0000000000404b15 <start_process+69>:  cmpb   $0x0,0x31(%rdi)
    0x0000000000404b19 <start_process+73>:  je     0x404ed8 <start_process+1032>
    0x0000000000404b1f <start_process+79>:  movslq 0x28(%rdi),%rax
    0x0000000000404b23 <start_process+83>:  lea    0x0(,%rax,8),%rdx
    0x0000000000404b2b <start_process+91>:  mov    %rax,%r8
    0x0000000000404b2e <start_process+94>:  shl    $0x6,%r8
    0x0000000000404b32 <start_process+98>:  sub    %rdx,%r8
    0x0000000000404b35 <start_process+101>: add    0x2259cc(%rip),%r8        # 0x62a508 <mdb>
    0x0000000000404b3c <start_process+108>: mov    0x2c(%r8),%r9d
    0x0000000000404b40 <start_process+112>: test   %r9d,%r9d
    0x0000000000404b43 <start_process+115>: jne    0x404d70 <start_process+672>
    0x0000000000404b49 <start_process+121>: movslq 0x24(%rsp),%rax
    0x0000000000404b4e <start_process+126>: imul   $0x8f8,%rax,%r14
    0x0000000000404b55 <start_process+133>: mov    %r14,%rax
    0x0000000000404b58 <start_process+136>: add    0x225441(%rip),%rax        # 0x629fa0 <fsa>
    0x0000000000404b5f <start_process+143>: mov    0xec(%rax),%edx
    0x0000000000404b65 <start_process+149>: test   $0x1,%dl
    0x0000000000404b68 <start_process+152>: jne    0x404d30 <start_process+608>
    0x0000000000404b6e <start_process+158>: dec    %ecx
    0x0000000000404b70 <start_process+160>: je     0x404bd0 <start_process+256>
    0x0000000000404b72 <start_process+162>: mov    0xf0(%rax),%ecx
    0x0000000000404b78 <start_process+168>: mov    $0x2,%esi
    0x0000000000404b7d <start_process+173>: test   %ecx,%ecx
    0x0000000000404b7f <start_process+175>: jne    0x404c88 <start_process+440>
    0x0000000000404b85 <start_process+181>: test   %dl,%dl
    0x0000000000404b87 <start_process+183>: jns    0x404bd0 <start_process+256>
    0x0000000000404b89 <start_process+185>: mov    0x104(%rax),%ecx
    0x0000000000404b8f <start_process+191>: movslq 0x28(%rdi),%rax
    0x0000000000404b93 <start_process+195>: mov    $0xffffffff,%esi
    0x0000000000404b98 <start_process+200>: mov    %r11,(%rsp)
    0x0000000000404b9c <start_process+204>: lea    0x0(,%rax,8),%rdx
    0x0000000000404ba4 <start_process+212>: shl    $0x6,%rax
    0x0000000000404ba8 <start_process+216>: sub    %rdx,%rax
    0x0000000000404bab <start_process+219>: mov    0x225956(%rip),%rdx        # 0x62a508 <mdb>
    0x0000000000404bb2 <start_process+226>: mov    0x28(%rdx,%rax,1),%edi
    0x0000000000404bb6 <start_process+230>: mov    %rbx,%rdx
    0x0000000000404bb9 <start_process+233>: callq  0x41ab00 <check_error_queue>
    0x0000000000404bbe <start_process+238>: test   %eax,%eax
    0x0000000000404bc0 <start_process+240>: mov    %eax,%esi
    0x0000000000404bc2 <start_process+242>: mov    (%rsp),%r11
    0x0000000000404bc6 <start_process+246>: jne    0x404c88 <start_process+440>
    0x0000000000404bcc <start_process+252>: nopl   0x0(%rax)
    0x0000000000404bd0 <start_process+256>: mov    %r14,%rcx
    0x0000000000404bd3 <start_process+259>: add    0x2253c6(%rip),%rcx        # 0x629fa0 <fsa>
    0x0000000000404bda <start_process+266>: cmpb   $0x5,0xba(%rcx)
    0x0000000000404be1 <start_process+273>: je     0x404f88 <start_process+1208>
    0x0000000000404be7 <start_process+279>: mov    0x225462(%rip),%rax        # 0x62a050 <p_afd_status>
    0x0000000000404bee <start_process+286>: mov    0x225194(%rip),%ecx        # 0x629d88 <max_connections>
    0x0000000000404bf4 <start_process+292>: cmp    %ecx,0x4f4(%rax)
    0x0000000000404bfa <start_process+298>: jge    0x404d30 <start_process+608>
    0x0000000000404c00 <start_process+304>: mov    %r14,%r8
    0x0000000000404c03 <start_process+307>: add    0x225396(%rip),%r8        # 0x629fa0 <fsa>
    0x0000000000404c0a <start_process+314>: mov    0x174(%r8),%edi
    0x0000000000404c11 <start_process+321>: cmp    %edi,0x170(%r8)
    0x0000000000404c18 <start_process+328>: jge    0x404d30 <start_process+608>
    0x0000000000404c1e <start_process+334>: test   %ecx,%ecx
    0x0000000000404c20 <start_process+336>: jle    0x404c5e <start_process+398>
    0x0000000000404c22 <start_process+338>: mov    0x2251ff(%rip),%rsi        # 0x62---Type <return> to continue, or q <return> to quit---q

So all I now know is that it happened with the assembly instruction:

    mov    0xec(%rax),%edx

But what does it tell me. At what part of my code could this be?

Thanks,
Holger

--------- code of start_process() ----------
static pid_t
start_process(int fsa_pos, int qb_pos, time_t current_time, int retry)
{
    pid_t pid = PENDING;

    if ((qb[qb_pos].msg_name[0] != '\0') &&
        (mdb[qb[qb_pos].pos].age_limit > 0) &&
        ((fsa[fsa_pos].host_status & DO_NOT_DELETE_DATA) == 0) &&
        (current_time > qb[qb_pos].creation_time) &&
        ((current_time - qb[qb_pos].creation_time) > mdb[qb[qb_pos].pos].age_limit))
    {
       char del_dir[MAX_PATH_LENGTH];

       if (fsa[fsa_pos].host_status & ERROR_QUEUE_SET)
       {
          remove_from_error_queue(mdb[qb[qb_pos].pos].job_id, &fsa[fsa_pos],
                                  fsa_pos, fsa_fd);
       }
       (void)sprintf(del_dir, "%s%s%s/%s",
                     p_work_dir, AFD_FILE_DIR,
                     OUTGOING_DIR, qb[qb_pos].msg_name);
       extract_cus(qb[qb_pos].msg_name, dl.input_time, dl.split_job_counter,
                   dl.unique_number);
       remove_job_files(del_dir, fsa_pos, mdb[qb[qb_pos].pos].job_id,
                        FD, AGE_OUTPUT, -1);
       ABS_REDUCE(fsa_pos);
       pid = REMOVED;
    }
    else
    {
       int in_error_queue = NEITHER;

       if ((qb[qb_pos].msg_name[0] == '\0') &&
           (*(unsigned char *)((char *)fsa - AFD_FEATURE_FLAG_OFFSET_END) & DISABLE_RETRIEVE))
       {
          ABS_REDUCE(fsa_pos);

          return(REMOVED);
       }

       if (((fsa[fsa_pos].host_status & STOP_TRANSFER_STAT) == 0) &&
           ((retry == YES) ||
            ((fsa[fsa_pos].error_counter == 0) &&
             (((fsa[fsa_pos].host_status & ERROR_QUEUE_SET) == 0) ||
              ((fsa[fsa_pos].host_status & ERROR_QUEUE_SET) &&
               ((in_error_queue = check_error_queue(mdb[qb[qb_pos].pos].job_id,
                                                    -1, current_time,
                                                    fsa[fsa_pos].retry_interval)) == NO)))) ||
            ((fsa[fsa_pos].error_counter > 0) &&
             (fsa[fsa_pos].host_status & ERROR_QUEUE_SET) &&
             ((current_time - (fsa[fsa_pos].last_retry_time + fsa[fsa_pos].retry_interval)) >= 0) &&
             ((in_error_queue == NO) ||
              ((in_error_queue == NEITHER) &&
               (check_error_queue(mdb[qb[qb_pos].pos].job_id, -1, current_time,
                                  fsa[fsa_pos].retry_interval) == NO)))) ||
            ((fsa[fsa_pos].active_transfers == 0) &&
             ((current_time - (fsa[fsa_pos].last_retry_time + fsa[fsa_pos].retry_interval)) >= 0))))
       {
          /*
           * First lets try and take an existing process,
           * that is waiting for more data to come.
           */
          if ((fsa[fsa_pos].original_toggle_pos == NONE) &&
              ((fsa[fsa_pos].protocol_options & DISABLE_BURSTING) == 0) &&
              (fsa[fsa_pos].keep_connected > 0) &&
              (fsa[fsa_pos].active_transfers > 0) &&
              (fsa[fsa_pos].jobs_queued > 0) &&
              ((((fsa[fsa_pos].special_flag & KEEP_CON_NO_SEND) == 0) &&
                (qb[qb_pos].msg_name[0] != '\0')) ||
               (((fsa[fsa_pos].special_flag & KEEP_CON_NO_FETCH) == 0) &&
                (qb[qb_pos].msg_name[0] == '\0'))) &&
              ((qb[qb_pos].special_flag & HELPER_JOB) == 0))
          {
             int i,
                 other_job_wait_pos[MAX_NO_PARALLEL_JOBS],
                 other_qb_pos[MAX_NO_PARALLEL_JOBS],
                 wait_counter = 0;

             for (i = 0; i < fsa[fsa_pos].allowed_transfers; i++)
             {
                if ((fsa[fsa_pos].job_status[i].proc_id != -1) &&
                    (fsa[fsa_pos].job_status[i].unique_name[2] == 5))
                {
                   int exec_qb_pos;

                   qb_pos_pid(fsa[fsa_pos].job_status[i].proc_id, &exec_qb_pos);
                   if (exec_qb_pos != -1)
                   {
                      if ((qb[qb_pos].msg_name[0] != '\0') &&
                          (qb[exec_qb_pos].msg_name[0] != '\0') &&
                          (mdb[qb[qb_pos].pos].type == mdb[qb[exec_qb_pos].pos].type) &&
                          (mdb[qb[qb_pos].pos].port == mdb[qb[exec_qb_pos].pos].port))
                      {
                         if (qb[qb_pos].retries > 0)
                         {
                            fsa[fsa_pos].job_status[i].file_name_in_use[0] = '\0';
                            fsa[fsa_pos].job_status[i].file_name_in_use[1] = 1;
                            (void)sprintf(&fsa[fsa_pos].job_status[i].file_name_in_use[2],
                                          "%u", qb[qb_pos].retries);
                         }
                         fsa[fsa_pos].job_status[i].job_id = mdb[qb[qb_pos].pos].job_id;
                         mdb[qb[qb_pos].pos].last_transfer_time = mdb[qb[exec_qb_pos].pos].last_transfer_time = current_time;
                         (void)memcpy(fsa[fsa_pos].job_status[i].unique_name,
                                      qb[qb_pos].msg_name, MAX_MSG_NAME_LENGTH);
                         (void)memcpy(connection[qb[exec_qb_pos].connect_pos].msg_name,
                                      qb[qb_pos].msg_name, MAX_MSG_NAME_LENGTH);
                         qb[qb_pos].pid = qb[exec_qb_pos].pid;
                         qb[qb_pos].connect_pos = qb[exec_qb_pos].connect_pos;
                         qb[qb_pos].special_flag |= BURST_REQUEUE;
                         connection[qb[exec_qb_pos].connect_pos].job_no = i;
                         if (qb[exec_qb_pos].pid > 0)
                         {
                            if (kill(qb[exec_qb_pos].pid, SIGUSR1) == -1)
                            {
                               system_log(DEBUG_SIGN, __FILE__, __LINE__,
                                          "Failed to send SIGUSR1 to %lld : %s",
                                          (pri_pid_t)qb[exec_qb_pos].pid, strerror(errno));
                            }
                            p_afd_status->burst2_counter++;
                         }
                         else
                         {
                            system_log(DEBUG_SIGN, __FILE__, __LINE__,
                                       "Hmmm, pid = %lld!!!", (pri_pid_t)qb[exec_qb_pos].pid);
                         }
                         if ((fsa[fsa_pos].transfer_rate_limit > 0) ||
                             (no_of_trl_groups > 0))
                         {
                            calc_trl_per_process(fsa_pos);
                         }
                         ABS_REDUCE(fsa_pos);
                         remove_msg(exec_qb_pos);

                         return(qb[qb_pos].pid);
                      }
                      else
                      {
                         other_job_wait_pos[wait_counter] = i;
                         other_qb_pos[wait_counter] = exec_qb_pos;
                         wait_counter++;
                      }
                   }
                   else
                   {
                      system_log(DEBUG_SIGN, __FILE__, __LINE__,
                                 "Unable to locate qb_pos for %lld [fsa_pos=%d].",
                                 (pri_pid_t)fsa[fsa_pos].job_status[i].proc_id,
                                 fsa_pos);
                   }
                }
             }
             if ((fsa[fsa_pos].active_transfers == fsa[fsa_pos].allowed_transfers) &&
                 (wait_counter > 0))
             {
                for (i = 0; i < wait_counter; i++)
                {
                   if (fsa[fsa_pos].job_status[other_job_wait_pos[i]].unique_name[2] == 5)
                   {
                      if (qb[other_qb_pos[i]].pid > 0)
                      {
                         fsa[fsa_pos].job_status[other_job_wait_pos[i]].unique_name[2] = 6;
                         if (qb[other_qb_pos[i]].msg_name[0] == '\0')
                         {
                            return(PENDING);
                         }
                         else
                         {
                            if (kill(qb[other_qb_pos[i]].pid, SIGUSR1) == -1)
                            {
                               system_log(DEBUG_SIGN, __FILE__, __LINE__,
                                          "Failed to send SIGUSR1 to %lld : %s",
                                          (pri_pid_t)qb[other_qb_pos[i]].pid, strerror(errno));
                               fsa[fsa_pos].job_status[other_job_wait_pos[i]].unique_name[2] = 5;
                            }
                            else
                            {
                               return(PENDING);
                            }
                         }
                      }
                      else
                      {
                         system_log(DEBUG_SIGN, __FILE__, __LINE__,
                                    "Hmmm, pid = %lld!!!", (pri_pid_t)qb[other_qb_pos[i]].pid);
                      }
                   }
                }
             }
          }

          if ((p_afd_status->no_of_transfers < max_connections) &&
              (fsa[fsa_pos].active_transfers < fsa[fsa_pos].allowed_transfers))
          {
             int pos;

             if ((pos = get_free_connection()) == INCORRECT)
             {
                system_log(ERROR_SIGN, __FILE__, __LINE__,
                           "Failed to get free connection.");
             }
             else
             {
                if ((connection[pos].job_no = get_free_disp_pos(fsa_pos)) != INCORRECT)
                {
                   if (qb[qb_pos].msg_name[0] == '\0')
                   {
                      connection[pos].fra_pos = qb[qb_pos].pos;
                      connection[pos].protocol = fra[qb[qb_pos].pos].protocol;
                      connection[pos].msg_name[0] = '\0';
                      (void)memcpy(connection[pos].dir_alias,
                                   fra[qb[qb_pos].pos].dir_alias,
                                   MAX_DIR_ALIAS_LENGTH + 1);
                   }
                   else
                   {
                      connection[pos].fra_pos = -1;
                      connection[pos].protocol = mdb[qb[qb_pos].pos].type;
                      (void)memcpy(connection[pos].msg_name, qb[qb_pos].msg_name,
                                   MAX_MSG_NAME_LENGTH);
                      connection[pos].dir_alias[0] = '\0';
                   }
                   if (qb[qb_pos].special_flag & RESEND_JOB)
                   {
                      connection[pos].resend = YES;
                   }
                   else
                   {
                      connection[pos].resend = NO;
                   }
                   connection[pos].temp_toggle = OFF;
                   (void)memcpy(connection[pos].hostname, fsa[fsa_pos].host_alias,
                                MAX_HOSTNAME_LENGTH + 1);
                   connection[pos].host_id = fsa[fsa_pos].host_id;
                   connection[pos].fsa_pos = fsa_pos;
                   if (fd_check_fsa() == YES)
                   {
                      if (check_fra_fd() == YES)
                      {
                         init_fra_data();
                      }

                      /*
                       * We need to set the connection[pos].pid to a
                       * value higher then 0 so the function get_new_positions()
                       * also locates the new connection[pos].fsa_pos. Otherwise
                       * from here on we point to some completely different
                       * host and this can cause havoc when someone uses
                       * edit_hc and changes the alias order.
                       */
                      connection[pos].pid = 1;
                      get_new_positions();
                      connection[pos].pid = 0;
                      init_msg_buffer();
                      fsa_pos = connection[pos].fsa_pos;
                      last_pos_lookup = INCORRECT;
                   }
                   (void)strcpy(fsa[fsa_pos].job_status[connection[pos].job_no].unique_name,
                                qb[qb_pos].msg_name);
                   if ((fsa[fsa_pos].error_counter == 0) &&
                       (fsa[fsa_pos].auto_toggle == ON) &&
                       (fsa[fsa_pos].original_toggle_pos != NONE) &&
                       (fsa[fsa_pos].max_successful_retries > 0))
                   {
                      if ((fsa[fsa_pos].original_toggle_pos == fsa[fsa_pos].toggle_pos) &&
                          (fsa[fsa_pos].successful_retries > 0))
                      {
                         fsa[fsa_pos].original_toggle_pos = NONE;
                         fsa[fsa_pos].successful_retries = 0;
                      }
                      else if (fsa[fsa_pos].successful_retries >= fsa[fsa_pos].max_successful_retries)
                           {
                              connection[pos].temp_toggle = ON;
                              fsa[fsa_pos].successful_retries = 0;
                           }
                           else
                           {
                              fsa[fsa_pos].successful_retries++;
                           }
                   }

                   /* Create process to distribute file. */
                   if ((connection[pos].pid = make_process(&connection[pos],
                                                           qb_pos)) > 0)
                   {
                      pid = fsa[fsa_pos].job_status[connection[pos].job_no].proc_id = connection[pos].pid;
                      fsa[fsa_pos].active_transfers += 1;
                      if ((fsa[fsa_pos].transfer_rate_limit > 0) ||
                          (no_of_trl_groups > 0))
                      {
                         calc_trl_per_process(fsa_pos);
                      }
                      ABS_REDUCE(fsa_pos);
                      qb[qb_pos].connect_pos = pos;
                      p_afd_status->no_of_transfers++;
                   }
                   else
                   {
                      fsa[fsa_pos].job_status[connection[pos].job_no].connect_status = NOT_WORKING;
                      fsa[fsa_pos].job_status[connection[pos].job_no].no_of_files = 0;
                      fsa[fsa_pos].job_status[connection[pos].job_no].no_of_files_done = 0;
                      fsa[fsa_pos].job_status[connection[pos].job_no].file_size = 0;
                      fsa[fsa_pos].job_status[connection[pos].job_no].file_size_done = 0;
                      fsa[fsa_pos].job_status[connection[pos].job_no].file_size_in_use = 0;
                      fsa[fsa_pos].job_status[connection[pos].job_no].file_size_in_use_done = 0;
                      fsa[fsa_pos].job_status[connection[pos].job_no].file_name_in_use[0] = '\0';
                      fsa[fsa_pos].job_status[connection[pos].job_no].file_name_in_use[1] = 0;
                      fsa[fsa_pos].job_status[connection[pos].job_no].unique_name[0] = '\0';
                      connection[pos].hostname[0] = '\0';
                      connection[pos].msg_name[0] = '\0';
                      connection[pos].host_id = 0;
                      connection[pos].job_no = -1;
                      connection[pos].fsa_pos = -1;
                      connection[pos].fra_pos = -1;
                      connection[pos].pid = 0;
                   }
                }
             }
          }
       }
    }
    return(pid);
}
