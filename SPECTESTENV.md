# Especificações do Ambiente de Testes

Abaixo estão os detalhes do servidor (gentilmente concedido pelo Luiz Picanço) que rodará os testes. 


Docker
``` 
$ docker --version
Docker version 28.3.2, build 578ccf6
```

k6
``` 
$ k6 --version
k6 v1.1.0 (commit/0e3fb953be, go1.24.4, linux/amd64)
```

CPU
``` 
$ lscpu
Architecture:                x86_64
  CPU op-mode(s):            32-bit, 64-bit
  Address sizes:             39 bits physical, 48 bits virtual
  Byte Order:                Little Endian
CPU(s):                      6
  On-line CPU(s) list:       0-5
Vendor ID:                   GenuineIntel
  Model name:                Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz
    CPU family:              6
    Model:                   158
    Thread(s) per core:      1
    Core(s) per socket:      6
    Socket(s):               1
    Stepping:                9
    BogoMIPS:                7200.02
    Flags:                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl xtopology cpuid tsc_known_freq pni pclmulqdq vmx ssse3 fma cx16 pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_dead
                             line_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch cpuid_fault invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 xsaves ara
                             t umip md_clear flush_l1d arch_capabilities
Virtualization features:     
  Virtualization:            VT-x
  Hypervisor vendor:         KVM
  Virtualization type:       full
Caches (sum of all):         
  L1d:                       192 KiB (6 instances)
  L1i:                       192 KiB (6 instances)
  L2:                        24 MiB (6 instances)
  L3:                        16 MiB (1 instance)
NUMA:                        
  NUMA node(s):              1
  NUMA node0 CPU(s):         0-5
Vulnerabilities:             
  Gather data sampling:      Not affected
  Indirect target selection: Mitigation; Aligned branch/return thunks
  Itlb multihit:             Not affected
  L1tf:                      Mitigation; PTE Inversion; VMX flush not necessary, SMT disabled
  Mds:                       Mitigation; Clear CPU buffers; SMT Host state unknown
  Meltdown:                  Mitigation; PTI
  Mmio stale data:           Mitigation; Clear CPU buffers; SMT Host state unknown
  Reg file data sampling:    Not affected
  Retbleed:                  Mitigation; IBRS
  Spec rstack overflow:      Not affected
  Spec store bypass:         Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:                Mitigation; IBRS; IBPB conditional; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI SW loop, KVM SW loop
  Srbds:                     Unknown: Dependent on hypervisor status
  Tsx async abort:           Not affected
```

Memória
```
$ free -h
               total        used        free      shared  buff/cache   available
Mem:            15Gi       752Mi        13Gi        37Mi       1.7Gi        14Gi
Swap:          975Mi       524Ki       975Mi
```

SO (Debian 12.11)
```
$ uname -a
Linux rinha-server-01 6.1.0-37-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.140-1 (2025-05-22) x86_64 GNU/Linux
```