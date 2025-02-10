
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000e117          	auipc	sp,0xe
    80000004:	f0013103          	ld	sp,-256(sp) # 8000df00 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1e4000ef          	jal	800001fa <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
#ifndef __ASSEMBLER__

// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec06                	sd	ra,24(sp)
    80000020:	e822                	sd	s0,16(sp)
    80000022:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000024:	f14027f3          	csrr	a5,mhartid
    80000028:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002c:	fe843783          	ld	a5,-24(s0)
}
    80000030:	853e                	mv	a0,a5
    80000032:	60e2                	ld	ra,24(sp)
    80000034:	6442                	ld	s0,16(sp)
    80000036:	6105                	addi	sp,sp,32
    80000038:	8082                	ret

000000008000003a <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    8000003a:	1101                	addi	sp,sp,-32
    8000003c:	ec06                	sd	ra,24(sp)
    8000003e:	e822                	sd	s0,16(sp)
    80000040:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    80000042:	300027f3          	csrr	a5,mstatus
    80000046:	fef43423          	sd	a5,-24(s0)
  return x;
    8000004a:	fe843783          	ld	a5,-24(s0)
}
    8000004e:	853e                	mv	a0,a5
    80000050:	60e2                	ld	ra,24(sp)
    80000052:	6442                	ld	s0,16(sp)
    80000054:	6105                	addi	sp,sp,32
    80000056:	8082                	ret

0000000080000058 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000058:	1101                	addi	sp,sp,-32
    8000005a:	ec06                	sd	ra,24(sp)
    8000005c:	e822                	sd	s0,16(sp)
    8000005e:	1000                	addi	s0,sp,32
    80000060:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    80000064:	fe843783          	ld	a5,-24(s0)
    80000068:	30079073          	csrw	mstatus,a5
}
    8000006c:	0001                	nop
    8000006e:	60e2                	ld	ra,24(sp)
    80000070:	6442                	ld	s0,16(sp)
    80000072:	6105                	addi	sp,sp,32
    80000074:	8082                	ret

0000000080000076 <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    80000076:	1101                	addi	sp,sp,-32
    80000078:	ec06                	sd	ra,24(sp)
    8000007a:	e822                	sd	s0,16(sp)
    8000007c:	1000                	addi	s0,sp,32
    8000007e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000082:	fe843783          	ld	a5,-24(s0)
    80000086:	34179073          	csrw	mepc,a5
}
    8000008a:	0001                	nop
    8000008c:	60e2                	ld	ra,24(sp)
    8000008e:	6442                	ld	s0,16(sp)
    80000090:	6105                	addi	sp,sp,32
    80000092:	8082                	ret

0000000080000094 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000094:	1101                	addi	sp,sp,-32
    80000096:	ec06                	sd	ra,24(sp)
    80000098:	e822                	sd	s0,16(sp)
    8000009a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000009c:	104027f3          	csrr	a5,sie
    800000a0:	fef43423          	sd	a5,-24(s0)
  return x;
    800000a4:	fe843783          	ld	a5,-24(s0)
}
    800000a8:	853e                	mv	a0,a5
    800000aa:	60e2                	ld	ra,24(sp)
    800000ac:	6442                	ld	s0,16(sp)
    800000ae:	6105                	addi	sp,sp,32
    800000b0:	8082                	ret

00000000800000b2 <w_sie>:

static inline void 
w_sie(uint64 x)
{
    800000b2:	1101                	addi	sp,sp,-32
    800000b4:	ec06                	sd	ra,24(sp)
    800000b6:	e822                	sd	s0,16(sp)
    800000b8:	1000                	addi	s0,sp,32
    800000ba:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000be:	fe843783          	ld	a5,-24(s0)
    800000c2:	10479073          	csrw	sie,a5
}
    800000c6:	0001                	nop
    800000c8:	60e2                	ld	ra,24(sp)
    800000ca:	6442                	ld	s0,16(sp)
    800000cc:	6105                	addi	sp,sp,32
    800000ce:	8082                	ret

00000000800000d0 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000d0:	1101                	addi	sp,sp,-32
    800000d2:	ec06                	sd	ra,24(sp)
    800000d4:	e822                	sd	s0,16(sp)
    800000d6:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000d8:	304027f3          	csrr	a5,mie
    800000dc:	fef43423          	sd	a5,-24(s0)
  return x;
    800000e0:	fe843783          	ld	a5,-24(s0)
}
    800000e4:	853e                	mv	a0,a5
    800000e6:	60e2                	ld	ra,24(sp)
    800000e8:	6442                	ld	s0,16(sp)
    800000ea:	6105                	addi	sp,sp,32
    800000ec:	8082                	ret

00000000800000ee <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000ee:	1101                	addi	sp,sp,-32
    800000f0:	ec06                	sd	ra,24(sp)
    800000f2:	e822                	sd	s0,16(sp)
    800000f4:	1000                	addi	s0,sp,32
    800000f6:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000fa:	fe843783          	ld	a5,-24(s0)
    800000fe:	30479073          	csrw	mie,a5
}
    80000102:	0001                	nop
    80000104:	60e2                	ld	ra,24(sp)
    80000106:	6442                	ld	s0,16(sp)
    80000108:	6105                	addi	sp,sp,32
    8000010a:	8082                	ret

000000008000010c <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    8000010c:	1101                	addi	sp,sp,-32
    8000010e:	ec06                	sd	ra,24(sp)
    80000110:	e822                	sd	s0,16(sp)
    80000112:	1000                	addi	s0,sp,32
    80000114:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    80000118:	fe843783          	ld	a5,-24(s0)
    8000011c:	30279073          	csrw	medeleg,a5
}
    80000120:	0001                	nop
    80000122:	60e2                	ld	ra,24(sp)
    80000124:	6442                	ld	s0,16(sp)
    80000126:	6105                	addi	sp,sp,32
    80000128:	8082                	ret

000000008000012a <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    8000012a:	1101                	addi	sp,sp,-32
    8000012c:	ec06                	sd	ra,24(sp)
    8000012e:	e822                	sd	s0,16(sp)
    80000130:	1000                	addi	s0,sp,32
    80000132:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000136:	fe843783          	ld	a5,-24(s0)
    8000013a:	30379073          	csrw	mideleg,a5
}
    8000013e:	0001                	nop
    80000140:	60e2                	ld	ra,24(sp)
    80000142:	6442                	ld	s0,16(sp)
    80000144:	6105                	addi	sp,sp,32
    80000146:	8082                	ret

0000000080000148 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000148:	1101                	addi	sp,sp,-32
    8000014a:	ec06                	sd	ra,24(sp)
    8000014c:	e822                	sd	s0,16(sp)
    8000014e:	1000                	addi	s0,sp,32
    80000150:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    80000154:	fe843783          	ld	a5,-24(s0)
    80000158:	30579073          	csrw	mtvec,a5
}
    8000015c:	0001                	nop
    8000015e:	60e2                	ld	ra,24(sp)
    80000160:	6442                	ld	s0,16(sp)
    80000162:	6105                	addi	sp,sp,32
    80000164:	8082                	ret

0000000080000166 <w_pmpcfg0>:

// Physical Memory Protection
static inline void
w_pmpcfg0(uint64 x)
{
    80000166:	1101                	addi	sp,sp,-32
    80000168:	ec06                	sd	ra,24(sp)
    8000016a:	e822                	sd	s0,16(sp)
    8000016c:	1000                	addi	s0,sp,32
    8000016e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000172:	fe843783          	ld	a5,-24(s0)
    80000176:	3a079073          	csrw	pmpcfg0,a5
}
    8000017a:	0001                	nop
    8000017c:	60e2                	ld	ra,24(sp)
    8000017e:	6442                	ld	s0,16(sp)
    80000180:	6105                	addi	sp,sp,32
    80000182:	8082                	ret

0000000080000184 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000184:	1101                	addi	sp,sp,-32
    80000186:	ec06                	sd	ra,24(sp)
    80000188:	e822                	sd	s0,16(sp)
    8000018a:	1000                	addi	s0,sp,32
    8000018c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    80000190:	fe843783          	ld	a5,-24(s0)
    80000194:	3b079073          	csrw	pmpaddr0,a5
}
    80000198:	0001                	nop
    8000019a:	60e2                	ld	ra,24(sp)
    8000019c:	6442                	ld	s0,16(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec06                	sd	ra,24(sp)
    800001a6:	e822                	sd	s0,16(sp)
    800001a8:	1000                	addi	s0,sp,32
    800001aa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    800001ae:	fe843783          	ld	a5,-24(s0)
    800001b2:	18079073          	csrw	satp,a5
}
    800001b6:	0001                	nop
    800001b8:	60e2                	ld	ra,24(sp)
    800001ba:	6442                	ld	s0,16(sp)
    800001bc:	6105                	addi	sp,sp,32
    800001be:	8082                	ret

00000000800001c0 <w_mscratch>:
  return x;
}

static inline void 
w_mscratch(uint64 x)
{
    800001c0:	1101                	addi	sp,sp,-32
    800001c2:	ec06                	sd	ra,24(sp)
    800001c4:	e822                	sd	s0,16(sp)
    800001c6:	1000                	addi	s0,sp,32
    800001c8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    800001cc:	fe843783          	ld	a5,-24(s0)
    800001d0:	34079073          	csrw	mscratch,a5
}
    800001d4:	0001                	nop
    800001d6:	60e2                	ld	ra,24(sp)
    800001d8:	6442                	ld	s0,16(sp)
    800001da:	6105                	addi	sp,sp,32
    800001dc:	8082                	ret

00000000800001de <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001de:	1101                	addi	sp,sp,-32
    800001e0:	ec06                	sd	ra,24(sp)
    800001e2:	e822                	sd	s0,16(sp)
    800001e4:	1000                	addi	s0,sp,32
    800001e6:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ea:	fe843783          	ld	a5,-24(s0)
    800001ee:	823e                	mv	tp,a5
}
    800001f0:	0001                	nop
    800001f2:	60e2                	ld	ra,24(sp)
    800001f4:	6442                	ld	s0,16(sp)
    800001f6:	6105                	addi	sp,sp,32
    800001f8:	8082                	ret

00000000800001fa <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001fa:	1101                	addi	sp,sp,-32
    800001fc:	ec06                	sd	ra,24(sp)
    800001fe:	e822                	sd	s0,16(sp)
    80000200:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    80000202:	00000097          	auipc	ra,0x0
    80000206:	e38080e7          	jalr	-456(ra) # 8000003a <r_mstatus>
    8000020a:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    8000020e:	fe843703          	ld	a4,-24(s0)
    80000212:	77f9                	lui	a5,0xffffe
    80000214:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd7437>
    80000218:	8ff9                	and	a5,a5,a4
    8000021a:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    8000021e:	fe843703          	ld	a4,-24(s0)
    80000222:	6785                	lui	a5,0x1
    80000224:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    80000228:	8fd9                	or	a5,a5,a4
    8000022a:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    8000022e:	fe843503          	ld	a0,-24(s0)
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e26080e7          	jalr	-474(ra) # 80000058 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    8000023a:	00001797          	auipc	a5,0x1
    8000023e:	63078793          	addi	a5,a5,1584 # 8000186a <main>
    80000242:	853e                	mv	a0,a5
    80000244:	00000097          	auipc	ra,0x0
    80000248:	e32080e7          	jalr	-462(ra) # 80000076 <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000024c:	4501                	li	a0,0
    8000024e:	00000097          	auipc	ra,0x0
    80000252:	f54080e7          	jalr	-172(ra) # 800001a2 <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000256:	67c1                	lui	a5,0x10
    80000258:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000025c:	00000097          	auipc	ra,0x0
    80000260:	eb0080e7          	jalr	-336(ra) # 8000010c <w_medeleg>
  w_mideleg(0xffff);
    80000264:	67c1                	lui	a5,0x10
    80000266:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	ec0080e7          	jalr	-320(ra) # 8000012a <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000272:	00000097          	auipc	ra,0x0
    80000276:	e22080e7          	jalr	-478(ra) # 80000094 <r_sie>
    8000027a:	87aa                	mv	a5,a0
    8000027c:	2227e793          	ori	a5,a5,546
    80000280:	853e                	mv	a0,a5
    80000282:	00000097          	auipc	ra,0x0
    80000286:	e30080e7          	jalr	-464(ra) # 800000b2 <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000028a:	57fd                	li	a5,-1
    8000028c:	00a7d513          	srli	a0,a5,0xa
    80000290:	00000097          	auipc	ra,0x0
    80000294:	ef4080e7          	jalr	-268(ra) # 80000184 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000298:	453d                	li	a0,15
    8000029a:	00000097          	auipc	ra,0x0
    8000029e:	ecc080e7          	jalr	-308(ra) # 80000166 <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    800002a2:	00000097          	auipc	ra,0x0
    800002a6:	032080e7          	jalr	50(ra) # 800002d4 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    800002aa:	00000097          	auipc	ra,0x0
    800002ae:	d72080e7          	jalr	-654(ra) # 8000001c <r_mhartid>
    800002b2:	87aa                	mv	a5,a0
    800002b4:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    800002b8:	fe442783          	lw	a5,-28(s0)
    800002bc:	853e                	mv	a0,a5
    800002be:	00000097          	auipc	ra,0x0
    800002c2:	f20080e7          	jalr	-224(ra) # 800001de <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    800002c6:	30200073          	mret
}
    800002ca:	0001                	nop
    800002cc:	60e2                	ld	ra,24(sp)
    800002ce:	6442                	ld	s0,16(sp)
    800002d0:	6105                	addi	sp,sp,32
    800002d2:	8082                	ret

00000000800002d4 <timerinit>:
// at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    800002d4:	1101                	addi	sp,sp,-32
    800002d6:	ec06                	sd	ra,24(sp)
    800002d8:	e822                	sd	s0,16(sp)
    800002da:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    800002dc:	00000097          	auipc	ra,0x0
    800002e0:	d40080e7          	jalr	-704(ra) # 8000001c <r_mhartid>
    800002e4:	87aa                	mv	a5,a0
    800002e6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
    800002ea:	000f47b7          	lui	a5,0xf4
    800002ee:	24078793          	addi	a5,a5,576 # f4240 <_entry-0x7ff0bdc0>
    800002f2:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002f6:	0200c7b7          	lui	a5,0x200c
    800002fa:	17e1                	addi	a5,a5,-8 # 200bff8 <_entry-0x7dff4008>
    800002fc:	6398                	ld	a4,0(a5)
    800002fe:	fe842783          	lw	a5,-24(s0)
    80000302:	fec42683          	lw	a3,-20(s0)
    80000306:	0036969b          	slliw	a3,a3,0x3
    8000030a:	2681                	sext.w	a3,a3
    8000030c:	8636                	mv	a2,a3
    8000030e:	020046b7          	lui	a3,0x2004
    80000312:	96b2                	add	a3,a3,a2
    80000314:	97ba                	add	a5,a5,a4
    80000316:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    80000318:	fec42703          	lw	a4,-20(s0)
    8000031c:	87ba                	mv	a5,a4
    8000031e:	078a                	slli	a5,a5,0x2
    80000320:	97ba                	add	a5,a5,a4
    80000322:	078e                	slli	a5,a5,0x3
    80000324:	00016717          	auipc	a4,0x16
    80000328:	c2c70713          	addi	a4,a4,-980 # 80015f50 <timer_scratch>
    8000032c:	97ba                	add	a5,a5,a4
    8000032e:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    80000332:	fec42783          	lw	a5,-20(s0)
    80000336:	0037979b          	slliw	a5,a5,0x3
    8000033a:	2781                	sext.w	a5,a5
    8000033c:	873e                	mv	a4,a5
    8000033e:	020047b7          	lui	a5,0x2004
    80000342:	973e                	add	a4,a4,a5
    80000344:	fe043783          	ld	a5,-32(s0)
    80000348:	07e1                	addi	a5,a5,24 # 2004018 <_entry-0x7dffbfe8>
    8000034a:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000034c:	fe043783          	ld	a5,-32(s0)
    80000350:	02078793          	addi	a5,a5,32
    80000354:	fe842703          	lw	a4,-24(s0)
    80000358:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    8000035a:	fe043783          	ld	a5,-32(s0)
    8000035e:	853e                	mv	a0,a5
    80000360:	00000097          	auipc	ra,0x0
    80000364:	e60080e7          	jalr	-416(ra) # 800001c0 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000368:	00008797          	auipc	a5,0x8
    8000036c:	5a878793          	addi	a5,a5,1448 # 80008910 <timervec>
    80000370:	853e                	mv	a0,a5
    80000372:	00000097          	auipc	ra,0x0
    80000376:	dd6080e7          	jalr	-554(ra) # 80000148 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    8000037a:	00000097          	auipc	ra,0x0
    8000037e:	cc0080e7          	jalr	-832(ra) # 8000003a <r_mstatus>
    80000382:	87aa                	mv	a5,a0
    80000384:	0087e793          	ori	a5,a5,8
    80000388:	853e                	mv	a0,a5
    8000038a:	00000097          	auipc	ra,0x0
    8000038e:	cce080e7          	jalr	-818(ra) # 80000058 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000392:	00000097          	auipc	ra,0x0
    80000396:	d3e080e7          	jalr	-706(ra) # 800000d0 <r_mie>
    8000039a:	87aa                	mv	a5,a0
    8000039c:	0807e793          	ori	a5,a5,128
    800003a0:	853e                	mv	a0,a5
    800003a2:	00000097          	auipc	ra,0x0
    800003a6:	d4c080e7          	jalr	-692(ra) # 800000ee <w_mie>
}
    800003aa:	0001                	nop
    800003ac:	60e2                	ld	ra,24(sp)
    800003ae:	6442                	ld	s0,16(sp)
    800003b0:	6105                	addi	sp,sp,32
    800003b2:	8082                	ret

00000000800003b4 <consputc>:
// called by printf(), and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    800003b4:	1101                	addi	sp,sp,-32
    800003b6:	ec06                	sd	ra,24(sp)
    800003b8:	e822                	sd	s0,16(sp)
    800003ba:	1000                	addi	s0,sp,32
    800003bc:	87aa                	mv	a5,a0
    800003be:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    800003c2:	fec42783          	lw	a5,-20(s0)
    800003c6:	0007871b          	sext.w	a4,a5
    800003ca:	10000793          	li	a5,256
    800003ce:	02f71363          	bne	a4,a5,800003f4 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    800003d2:	4521                	li	a0,8
    800003d4:	00001097          	auipc	ra,0x1
    800003d8:	ab0080e7          	jalr	-1360(ra) # 80000e84 <uartputc_sync>
    800003dc:	02000513          	li	a0,32
    800003e0:	00001097          	auipc	ra,0x1
    800003e4:	aa4080e7          	jalr	-1372(ra) # 80000e84 <uartputc_sync>
    800003e8:	4521                	li	a0,8
    800003ea:	00001097          	auipc	ra,0x1
    800003ee:	a9a080e7          	jalr	-1382(ra) # 80000e84 <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003f2:	a801                	j	80000402 <consputc+0x4e>
    uartputc_sync(c);
    800003f4:	fec42783          	lw	a5,-20(s0)
    800003f8:	853e                	mv	a0,a5
    800003fa:	00001097          	auipc	ra,0x1
    800003fe:	a8a080e7          	jalr	-1398(ra) # 80000e84 <uartputc_sync>
}
    80000402:	0001                	nop
    80000404:	60e2                	ld	ra,24(sp)
    80000406:	6442                	ld	s0,16(sp)
    80000408:	6105                	addi	sp,sp,32
    8000040a:	8082                	ret

000000008000040c <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    8000040c:	7179                	addi	sp,sp,-48
    8000040e:	f406                	sd	ra,40(sp)
    80000410:	f022                	sd	s0,32(sp)
    80000412:	1800                	addi	s0,sp,48
    80000414:	87aa                	mv	a5,a0
    80000416:	fcb43823          	sd	a1,-48(s0)
    8000041a:	8732                	mv	a4,a2
    8000041c:	fcf42e23          	sw	a5,-36(s0)
    80000420:	87ba                	mv	a5,a4
    80000422:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    80000426:	fe042623          	sw	zero,-20(s0)
    8000042a:	a0a1                	j	80000472 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    8000042c:	fec42703          	lw	a4,-20(s0)
    80000430:	fd043783          	ld	a5,-48(s0)
    80000434:	00f70633          	add	a2,a4,a5
    80000438:	fdc42703          	lw	a4,-36(s0)
    8000043c:	feb40793          	addi	a5,s0,-21
    80000440:	4685                	li	a3,1
    80000442:	85ba                	mv	a1,a4
    80000444:	853e                	mv	a0,a5
    80000446:	00003097          	auipc	ra,0x3
    8000044a:	2ca080e7          	jalr	714(ra) # 80003710 <either_copyin>
    8000044e:	87aa                	mv	a5,a0
    80000450:	873e                	mv	a4,a5
    80000452:	57fd                	li	a5,-1
    80000454:	02f70963          	beq	a4,a5,80000486 <consolewrite+0x7a>
      break;
    uartputc(c);
    80000458:	feb44783          	lbu	a5,-21(s0)
    8000045c:	2781                	sext.w	a5,a5
    8000045e:	853e                	mv	a0,a5
    80000460:	00001097          	auipc	ra,0x1
    80000464:	964080e7          	jalr	-1692(ra) # 80000dc4 <uartputc>
  for(i = 0; i < n; i++){
    80000468:	fec42783          	lw	a5,-20(s0)
    8000046c:	2785                	addiw	a5,a5,1
    8000046e:	fef42623          	sw	a5,-20(s0)
    80000472:	fec42783          	lw	a5,-20(s0)
    80000476:	873e                	mv	a4,a5
    80000478:	fd842783          	lw	a5,-40(s0)
    8000047c:	2701                	sext.w	a4,a4
    8000047e:	2781                	sext.w	a5,a5
    80000480:	faf746e3          	blt	a4,a5,8000042c <consolewrite+0x20>
    80000484:	a011                	j	80000488 <consolewrite+0x7c>
      break;
    80000486:	0001                	nop
  }

  return i;
    80000488:	fec42783          	lw	a5,-20(s0)
}
    8000048c:	853e                	mv	a0,a5
    8000048e:	70a2                	ld	ra,40(sp)
    80000490:	7402                	ld	s0,32(sp)
    80000492:	6145                	addi	sp,sp,48
    80000494:	8082                	ret

0000000080000496 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000496:	7179                	addi	sp,sp,-48
    80000498:	f406                	sd	ra,40(sp)
    8000049a:	f022                	sd	s0,32(sp)
    8000049c:	1800                	addi	s0,sp,48
    8000049e:	87aa                	mv	a5,a0
    800004a0:	fcb43823          	sd	a1,-48(s0)
    800004a4:	8732                	mv	a4,a2
    800004a6:	fcf42e23          	sw	a5,-36(s0)
    800004aa:	87ba                	mv	a5,a4
    800004ac:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    800004b0:	fd842783          	lw	a5,-40(s0)
    800004b4:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    800004b8:	00016517          	auipc	a0,0x16
    800004bc:	bd850513          	addi	a0,a0,-1064 # 80016090 <cons>
    800004c0:	00001097          	auipc	ra,0x1
    800004c4:	e04080e7          	jalr	-508(ra) # 800012c4 <acquire>
  while(n > 0){
    800004c8:	a235                	j	800005f4 <consoleread+0x15e>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(killed(myproc())){
    800004ca:	00002097          	auipc	ra,0x2
    800004ce:	3f2080e7          	jalr	1010(ra) # 800028bc <myproc>
    800004d2:	87aa                	mv	a5,a0
    800004d4:	853e                	mv	a0,a5
    800004d6:	00003097          	auipc	ra,0x3
    800004da:	186080e7          	jalr	390(ra) # 8000365c <killed>
    800004de:	87aa                	mv	a5,a0
    800004e0:	cb99                	beqz	a5,800004f6 <consoleread+0x60>
        release(&cons.lock);
    800004e2:	00016517          	auipc	a0,0x16
    800004e6:	bae50513          	addi	a0,a0,-1106 # 80016090 <cons>
    800004ea:	00001097          	auipc	ra,0x1
    800004ee:	e3e080e7          	jalr	-450(ra) # 80001328 <release>
        return -1;
    800004f2:	57fd                	li	a5,-1
    800004f4:	aa15                	j	80000628 <consoleread+0x192>
      }
      sleep(&cons.r, &cons.lock);
    800004f6:	00016597          	auipc	a1,0x16
    800004fa:	b9a58593          	addi	a1,a1,-1126 # 80016090 <cons>
    800004fe:	00016517          	auipc	a0,0x16
    80000502:	c2a50513          	addi	a0,a0,-982 # 80016128 <cons+0x98>
    80000506:	00003097          	auipc	ra,0x3
    8000050a:	f70080e7          	jalr	-144(ra) # 80003476 <sleep>
    while(cons.r == cons.w){
    8000050e:	00016797          	auipc	a5,0x16
    80000512:	b8278793          	addi	a5,a5,-1150 # 80016090 <cons>
    80000516:	0987a703          	lw	a4,152(a5)
    8000051a:	00016797          	auipc	a5,0x16
    8000051e:	b7678793          	addi	a5,a5,-1162 # 80016090 <cons>
    80000522:	09c7a783          	lw	a5,156(a5)
    80000526:	faf702e3          	beq	a4,a5,800004ca <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];
    8000052a:	00016797          	auipc	a5,0x16
    8000052e:	b6678793          	addi	a5,a5,-1178 # 80016090 <cons>
    80000532:	0987a783          	lw	a5,152(a5)
    80000536:	0017871b          	addiw	a4,a5,1
    8000053a:	0007069b          	sext.w	a3,a4
    8000053e:	00016717          	auipc	a4,0x16
    80000542:	b5270713          	addi	a4,a4,-1198 # 80016090 <cons>
    80000546:	08d72c23          	sw	a3,152(a4)
    8000054a:	07f7f793          	andi	a5,a5,127
    8000054e:	2781                	sext.w	a5,a5
    80000550:	00016717          	auipc	a4,0x16
    80000554:	b4070713          	addi	a4,a4,-1216 # 80016090 <cons>
    80000558:	1782                	slli	a5,a5,0x20
    8000055a:	9381                	srli	a5,a5,0x20
    8000055c:	97ba                	add	a5,a5,a4
    8000055e:	0187c783          	lbu	a5,24(a5)
    80000562:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    80000566:	fe842783          	lw	a5,-24(s0)
    8000056a:	0007871b          	sext.w	a4,a5
    8000056e:	4791                	li	a5,4
    80000570:	02f71963          	bne	a4,a5,800005a2 <consoleread+0x10c>
      if(n < target){
    80000574:	fd842783          	lw	a5,-40(s0)
    80000578:	fec42703          	lw	a4,-20(s0)
    8000057c:	2701                	sext.w	a4,a4
    8000057e:	08e7f163          	bgeu	a5,a4,80000600 <consoleread+0x16a>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000582:	00016797          	auipc	a5,0x16
    80000586:	b0e78793          	addi	a5,a5,-1266 # 80016090 <cons>
    8000058a:	0987a783          	lw	a5,152(a5)
    8000058e:	37fd                	addiw	a5,a5,-1
    80000590:	0007871b          	sext.w	a4,a5
    80000594:	00016797          	auipc	a5,0x16
    80000598:	afc78793          	addi	a5,a5,-1284 # 80016090 <cons>
    8000059c:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    800005a0:	a085                	j	80000600 <consoleread+0x16a>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    800005a2:	fe842783          	lw	a5,-24(s0)
    800005a6:	0ff7f793          	zext.b	a5,a5
    800005aa:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    800005ae:	fe740713          	addi	a4,s0,-25
    800005b2:	fdc42783          	lw	a5,-36(s0)
    800005b6:	4685                	li	a3,1
    800005b8:	863a                	mv	a2,a4
    800005ba:	fd043583          	ld	a1,-48(s0)
    800005be:	853e                	mv	a0,a5
    800005c0:	00003097          	auipc	ra,0x3
    800005c4:	0dc080e7          	jalr	220(ra) # 8000369c <either_copyout>
    800005c8:	87aa                	mv	a5,a0
    800005ca:	873e                	mv	a4,a5
    800005cc:	57fd                	li	a5,-1
    800005ce:	02f70b63          	beq	a4,a5,80000604 <consoleread+0x16e>
      break;

    dst++;
    800005d2:	fd043783          	ld	a5,-48(s0)
    800005d6:	0785                	addi	a5,a5,1
    800005d8:	fcf43823          	sd	a5,-48(s0)
    --n;
    800005dc:	fd842783          	lw	a5,-40(s0)
    800005e0:	37fd                	addiw	a5,a5,-1
    800005e2:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    800005e6:	fe842783          	lw	a5,-24(s0)
    800005ea:	0007871b          	sext.w	a4,a5
    800005ee:	47a9                	li	a5,10
    800005f0:	00f70c63          	beq	a4,a5,80000608 <consoleread+0x172>
  while(n > 0){
    800005f4:	fd842783          	lw	a5,-40(s0)
    800005f8:	2781                	sext.w	a5,a5
    800005fa:	f0f04ae3          	bgtz	a5,8000050e <consoleread+0x78>
    800005fe:	a031                	j	8000060a <consoleread+0x174>
      break;
    80000600:	0001                	nop
    80000602:	a021                	j	8000060a <consoleread+0x174>
      break;
    80000604:	0001                	nop
    80000606:	a011                	j	8000060a <consoleread+0x174>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    80000608:	0001                	nop
    }
  }
  release(&cons.lock);
    8000060a:	00016517          	auipc	a0,0x16
    8000060e:	a8650513          	addi	a0,a0,-1402 # 80016090 <cons>
    80000612:	00001097          	auipc	ra,0x1
    80000616:	d16080e7          	jalr	-746(ra) # 80001328 <release>

  return target - n;
    8000061a:	fd842783          	lw	a5,-40(s0)
    8000061e:	fec42703          	lw	a4,-20(s0)
    80000622:	40f707bb          	subw	a5,a4,a5
    80000626:	2781                	sext.w	a5,a5
}
    80000628:	853e                	mv	a0,a5
    8000062a:	70a2                	ld	ra,40(sp)
    8000062c:	7402                	ld	s0,32(sp)
    8000062e:	6145                	addi	sp,sp,48
    80000630:	8082                	ret

0000000080000632 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80000632:	1101                	addi	sp,sp,-32
    80000634:	ec06                	sd	ra,24(sp)
    80000636:	e822                	sd	s0,16(sp)
    80000638:	1000                	addi	s0,sp,32
    8000063a:	87aa                	mv	a5,a0
    8000063c:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000640:	00016517          	auipc	a0,0x16
    80000644:	a5050513          	addi	a0,a0,-1456 # 80016090 <cons>
    80000648:	00001097          	auipc	ra,0x1
    8000064c:	c7c080e7          	jalr	-900(ra) # 800012c4 <acquire>

  switch(c){
    80000650:	fec42783          	lw	a5,-20(s0)
    80000654:	0007871b          	sext.w	a4,a5
    80000658:	07f00793          	li	a5,127
    8000065c:	0cf70763          	beq	a4,a5,8000072a <consoleintr+0xf8>
    80000660:	fec42783          	lw	a5,-20(s0)
    80000664:	0007871b          	sext.w	a4,a5
    80000668:	07f00793          	li	a5,127
    8000066c:	10e7c363          	blt	a5,a4,80000772 <consoleintr+0x140>
    80000670:	fec42783          	lw	a5,-20(s0)
    80000674:	0007871b          	sext.w	a4,a5
    80000678:	47d5                	li	a5,21
    8000067a:	06f70163          	beq	a4,a5,800006dc <consoleintr+0xaa>
    8000067e:	fec42783          	lw	a5,-20(s0)
    80000682:	0007871b          	sext.w	a4,a5
    80000686:	47d5                	li	a5,21
    80000688:	0ee7c563          	blt	a5,a4,80000772 <consoleintr+0x140>
    8000068c:	fec42783          	lw	a5,-20(s0)
    80000690:	0007871b          	sext.w	a4,a5
    80000694:	47a1                	li	a5,8
    80000696:	08f70a63          	beq	a4,a5,8000072a <consoleintr+0xf8>
    8000069a:	fec42783          	lw	a5,-20(s0)
    8000069e:	0007871b          	sext.w	a4,a5
    800006a2:	47c1                	li	a5,16
    800006a4:	0cf71763          	bne	a4,a5,80000772 <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    800006a8:	00003097          	auipc	ra,0x3
    800006ac:	0dc080e7          	jalr	220(ra) # 80003784 <procdump>
    break;
    800006b0:	aad1                	j	80000884 <consoleintr+0x252>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
      cons.e--;
    800006b2:	00016797          	auipc	a5,0x16
    800006b6:	9de78793          	addi	a5,a5,-1570 # 80016090 <cons>
    800006ba:	0a07a783          	lw	a5,160(a5)
    800006be:	37fd                	addiw	a5,a5,-1
    800006c0:	0007871b          	sext.w	a4,a5
    800006c4:	00016797          	auipc	a5,0x16
    800006c8:	9cc78793          	addi	a5,a5,-1588 # 80016090 <cons>
    800006cc:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    800006d0:	10000513          	li	a0,256
    800006d4:	00000097          	auipc	ra,0x0
    800006d8:	ce0080e7          	jalr	-800(ra) # 800003b4 <consputc>
    while(cons.e != cons.w &&
    800006dc:	00016797          	auipc	a5,0x16
    800006e0:	9b478793          	addi	a5,a5,-1612 # 80016090 <cons>
    800006e4:	0a07a703          	lw	a4,160(a5)
    800006e8:	00016797          	auipc	a5,0x16
    800006ec:	9a878793          	addi	a5,a5,-1624 # 80016090 <cons>
    800006f0:	09c7a783          	lw	a5,156(a5)
    800006f4:	18f70363          	beq	a4,a5,8000087a <consoleintr+0x248>
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
    800006f8:	00016797          	auipc	a5,0x16
    800006fc:	99878793          	addi	a5,a5,-1640 # 80016090 <cons>
    80000700:	0a07a783          	lw	a5,160(a5)
    80000704:	37fd                	addiw	a5,a5,-1
    80000706:	2781                	sext.w	a5,a5
    80000708:	07f7f793          	andi	a5,a5,127
    8000070c:	2781                	sext.w	a5,a5
    8000070e:	00016717          	auipc	a4,0x16
    80000712:	98270713          	addi	a4,a4,-1662 # 80016090 <cons>
    80000716:	1782                	slli	a5,a5,0x20
    80000718:	9381                	srli	a5,a5,0x20
    8000071a:	97ba                	add	a5,a5,a4
    8000071c:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    80000720:	873e                	mv	a4,a5
    80000722:	47a9                	li	a5,10
    80000724:	f8f717e3          	bne	a4,a5,800006b2 <consoleintr+0x80>
    }
    break;
    80000728:	aa89                	j	8000087a <consoleintr+0x248>
  case C('H'): // Backspace
  case '\x7f': // Delete key
    if(cons.e != cons.w){
    8000072a:	00016797          	auipc	a5,0x16
    8000072e:	96678793          	addi	a5,a5,-1690 # 80016090 <cons>
    80000732:	0a07a703          	lw	a4,160(a5)
    80000736:	00016797          	auipc	a5,0x16
    8000073a:	95a78793          	addi	a5,a5,-1702 # 80016090 <cons>
    8000073e:	09c7a783          	lw	a5,156(a5)
    80000742:	12f70e63          	beq	a4,a5,8000087e <consoleintr+0x24c>
      cons.e--;
    80000746:	00016797          	auipc	a5,0x16
    8000074a:	94a78793          	addi	a5,a5,-1718 # 80016090 <cons>
    8000074e:	0a07a783          	lw	a5,160(a5)
    80000752:	37fd                	addiw	a5,a5,-1
    80000754:	0007871b          	sext.w	a4,a5
    80000758:	00016797          	auipc	a5,0x16
    8000075c:	93878793          	addi	a5,a5,-1736 # 80016090 <cons>
    80000760:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000764:	10000513          	li	a0,256
    80000768:	00000097          	auipc	ra,0x0
    8000076c:	c4c080e7          	jalr	-948(ra) # 800003b4 <consputc>
    }
    break;
    80000770:	a239                	j	8000087e <consoleintr+0x24c>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF_SIZE){
    80000772:	fec42783          	lw	a5,-20(s0)
    80000776:	2781                	sext.w	a5,a5
    80000778:	10078563          	beqz	a5,80000882 <consoleintr+0x250>
    8000077c:	00016797          	auipc	a5,0x16
    80000780:	91478793          	addi	a5,a5,-1772 # 80016090 <cons>
    80000784:	0a07a703          	lw	a4,160(a5)
    80000788:	00016797          	auipc	a5,0x16
    8000078c:	90878793          	addi	a5,a5,-1784 # 80016090 <cons>
    80000790:	0987a783          	lw	a5,152(a5)
    80000794:	40f707bb          	subw	a5,a4,a5
    80000798:	0007871b          	sext.w	a4,a5
    8000079c:	07f00793          	li	a5,127
    800007a0:	0ee7e163          	bltu	a5,a4,80000882 <consoleintr+0x250>
      c = (c == '\r') ? '\n' : c;
    800007a4:	fec42783          	lw	a5,-20(s0)
    800007a8:	0007871b          	sext.w	a4,a5
    800007ac:	47b5                	li	a5,13
    800007ae:	00f70563          	beq	a4,a5,800007b8 <consoleintr+0x186>
    800007b2:	fec42783          	lw	a5,-20(s0)
    800007b6:	a011                	j	800007ba <consoleintr+0x188>
    800007b8:	47a9                	li	a5,10
    800007ba:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    800007be:	fec42783          	lw	a5,-20(s0)
    800007c2:	853e                	mv	a0,a5
    800007c4:	00000097          	auipc	ra,0x0
    800007c8:	bf0080e7          	jalr	-1040(ra) # 800003b4 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF_SIZE] = c;
    800007cc:	00016797          	auipc	a5,0x16
    800007d0:	8c478793          	addi	a5,a5,-1852 # 80016090 <cons>
    800007d4:	0a07a783          	lw	a5,160(a5)
    800007d8:	0017871b          	addiw	a4,a5,1
    800007dc:	0007069b          	sext.w	a3,a4
    800007e0:	00016717          	auipc	a4,0x16
    800007e4:	8b070713          	addi	a4,a4,-1872 # 80016090 <cons>
    800007e8:	0ad72023          	sw	a3,160(a4)
    800007ec:	07f7f793          	andi	a5,a5,127
    800007f0:	2781                	sext.w	a5,a5
    800007f2:	fec42703          	lw	a4,-20(s0)
    800007f6:	0ff77713          	zext.b	a4,a4
    800007fa:	00016697          	auipc	a3,0x16
    800007fe:	89668693          	addi	a3,a3,-1898 # 80016090 <cons>
    80000802:	1782                	slli	a5,a5,0x20
    80000804:	9381                	srli	a5,a5,0x20
    80000806:	97b6                	add	a5,a5,a3
    80000808:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e-cons.r == INPUT_BUF_SIZE){
    8000080c:	fec42783          	lw	a5,-20(s0)
    80000810:	0007871b          	sext.w	a4,a5
    80000814:	47a9                	li	a5,10
    80000816:	02f70d63          	beq	a4,a5,80000850 <consoleintr+0x21e>
    8000081a:	fec42783          	lw	a5,-20(s0)
    8000081e:	0007871b          	sext.w	a4,a5
    80000822:	4791                	li	a5,4
    80000824:	02f70663          	beq	a4,a5,80000850 <consoleintr+0x21e>
    80000828:	00016797          	auipc	a5,0x16
    8000082c:	86878793          	addi	a5,a5,-1944 # 80016090 <cons>
    80000830:	0a07a703          	lw	a4,160(a5)
    80000834:	00016797          	auipc	a5,0x16
    80000838:	85c78793          	addi	a5,a5,-1956 # 80016090 <cons>
    8000083c:	0987a783          	lw	a5,152(a5)
    80000840:	40f707bb          	subw	a5,a4,a5
    80000844:	0007871b          	sext.w	a4,a5
    80000848:	08000793          	li	a5,128
    8000084c:	02f71b63          	bne	a4,a5,80000882 <consoleintr+0x250>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000850:	00016797          	auipc	a5,0x16
    80000854:	84078793          	addi	a5,a5,-1984 # 80016090 <cons>
    80000858:	0a07a703          	lw	a4,160(a5)
    8000085c:	00016797          	auipc	a5,0x16
    80000860:	83478793          	addi	a5,a5,-1996 # 80016090 <cons>
    80000864:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    80000868:	00016517          	auipc	a0,0x16
    8000086c:	8c050513          	addi	a0,a0,-1856 # 80016128 <cons+0x98>
    80000870:	00003097          	auipc	ra,0x3
    80000874:	c82080e7          	jalr	-894(ra) # 800034f2 <wakeup>
      }
    }
    break;
    80000878:	a029                	j	80000882 <consoleintr+0x250>
    break;
    8000087a:	0001                	nop
    8000087c:	a021                	j	80000884 <consoleintr+0x252>
    break;
    8000087e:	0001                	nop
    80000880:	a011                	j	80000884 <consoleintr+0x252>
    break;
    80000882:	0001                	nop
  }
  
  release(&cons.lock);
    80000884:	00016517          	auipc	a0,0x16
    80000888:	80c50513          	addi	a0,a0,-2036 # 80016090 <cons>
    8000088c:	00001097          	auipc	ra,0x1
    80000890:	a9c080e7          	jalr	-1380(ra) # 80001328 <release>
}
    80000894:	0001                	nop
    80000896:	60e2                	ld	ra,24(sp)
    80000898:	6442                	ld	s0,16(sp)
    8000089a:	6105                	addi	sp,sp,32
    8000089c:	8082                	ret

000000008000089e <consoleinit>:

void
consoleinit(void)
{
    8000089e:	1141                	addi	sp,sp,-16
    800008a0:	e406                	sd	ra,8(sp)
    800008a2:	e022                	sd	s0,0(sp)
    800008a4:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    800008a6:	0000a597          	auipc	a1,0xa
    800008aa:	75a58593          	addi	a1,a1,1882 # 8000b000 <etext>
    800008ae:	00015517          	auipc	a0,0x15
    800008b2:	7e250513          	addi	a0,a0,2018 # 80016090 <cons>
    800008b6:	00001097          	auipc	ra,0x1
    800008ba:	9da080e7          	jalr	-1574(ra) # 80001290 <initlock>

  uartinit();
    800008be:	00000097          	auipc	ra,0x0
    800008c2:	48c080e7          	jalr	1164(ra) # 80000d4a <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    800008c6:	00026797          	auipc	a5,0x26
    800008ca:	96a78793          	addi	a5,a5,-1686 # 80026230 <devsw>
    800008ce:	00000717          	auipc	a4,0x0
    800008d2:	bc870713          	addi	a4,a4,-1080 # 80000496 <consoleread>
    800008d6:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    800008d8:	00026797          	auipc	a5,0x26
    800008dc:	95878793          	addi	a5,a5,-1704 # 80026230 <devsw>
    800008e0:	00000717          	auipc	a4,0x0
    800008e4:	b2c70713          	addi	a4,a4,-1236 # 8000040c <consolewrite>
    800008e8:	ef98                	sd	a4,24(a5)
}
    800008ea:	0001                	nop
    800008ec:	60a2                	ld	ra,8(sp)
    800008ee:	6402                	ld	s0,0(sp)
    800008f0:	0141                	addi	sp,sp,16
    800008f2:	8082                	ret

00000000800008f4 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008f4:	7139                	addi	sp,sp,-64
    800008f6:	fc06                	sd	ra,56(sp)
    800008f8:	f822                	sd	s0,48(sp)
    800008fa:	0080                	addi	s0,sp,64
    800008fc:	87aa                	mv	a5,a0
    800008fe:	86ae                	mv	a3,a1
    80000900:	8732                	mv	a4,a2
    80000902:	fcf42623          	sw	a5,-52(s0)
    80000906:	87b6                	mv	a5,a3
    80000908:	fcf42423          	sw	a5,-56(s0)
    8000090c:	87ba                	mv	a5,a4
    8000090e:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    80000912:	fc442783          	lw	a5,-60(s0)
    80000916:	2781                	sext.w	a5,a5
    80000918:	c78d                	beqz	a5,80000942 <printint+0x4e>
    8000091a:	fcc42783          	lw	a5,-52(s0)
    8000091e:	01f7d79b          	srliw	a5,a5,0x1f
    80000922:	0ff7f793          	zext.b	a5,a5
    80000926:	fcf42223          	sw	a5,-60(s0)
    8000092a:	fc442783          	lw	a5,-60(s0)
    8000092e:	2781                	sext.w	a5,a5
    80000930:	cb89                	beqz	a5,80000942 <printint+0x4e>
    x = -xx;
    80000932:	fcc42783          	lw	a5,-52(s0)
    80000936:	40f007bb          	negw	a5,a5
    8000093a:	2781                	sext.w	a5,a5
    8000093c:	fef42423          	sw	a5,-24(s0)
    80000940:	a029                	j	8000094a <printint+0x56>
  else
    x = xx;
    80000942:	fcc42783          	lw	a5,-52(s0)
    80000946:	fef42423          	sw	a5,-24(s0)

  i = 0;
    8000094a:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    8000094e:	fc842783          	lw	a5,-56(s0)
    80000952:	fe842703          	lw	a4,-24(s0)
    80000956:	02f777bb          	remuw	a5,a4,a5
    8000095a:	0007871b          	sext.w	a4,a5
    8000095e:	fec42783          	lw	a5,-20(s0)
    80000962:	0017869b          	addiw	a3,a5,1
    80000966:	fed42623          	sw	a3,-20(s0)
    8000096a:	0000d697          	auipc	a3,0xd
    8000096e:	45668693          	addi	a3,a3,1110 # 8000ddc0 <digits>
    80000972:	1702                	slli	a4,a4,0x20
    80000974:	9301                	srli	a4,a4,0x20
    80000976:	9736                	add	a4,a4,a3
    80000978:	00074703          	lbu	a4,0(a4)
    8000097c:	17c1                	addi	a5,a5,-16
    8000097e:	97a2                	add	a5,a5,s0
    80000980:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    80000984:	fc842783          	lw	a5,-56(s0)
    80000988:	fe842703          	lw	a4,-24(s0)
    8000098c:	02f757bb          	divuw	a5,a4,a5
    80000990:	fef42423          	sw	a5,-24(s0)
    80000994:	fe842783          	lw	a5,-24(s0)
    80000998:	2781                	sext.w	a5,a5
    8000099a:	fbd5                	bnez	a5,8000094e <printint+0x5a>

  if(sign)
    8000099c:	fc442783          	lw	a5,-60(s0)
    800009a0:	2781                	sext.w	a5,a5
    800009a2:	cb95                	beqz	a5,800009d6 <printint+0xe2>
    buf[i++] = '-';
    800009a4:	fec42783          	lw	a5,-20(s0)
    800009a8:	0017871b          	addiw	a4,a5,1
    800009ac:	fee42623          	sw	a4,-20(s0)
    800009b0:	17c1                	addi	a5,a5,-16
    800009b2:	97a2                	add	a5,a5,s0
    800009b4:	02d00713          	li	a4,45
    800009b8:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    800009bc:	a829                	j	800009d6 <printint+0xe2>
    consputc(buf[i]);
    800009be:	fec42783          	lw	a5,-20(s0)
    800009c2:	17c1                	addi	a5,a5,-16
    800009c4:	97a2                	add	a5,a5,s0
    800009c6:	fe87c783          	lbu	a5,-24(a5)
    800009ca:	2781                	sext.w	a5,a5
    800009cc:	853e                	mv	a0,a5
    800009ce:	00000097          	auipc	ra,0x0
    800009d2:	9e6080e7          	jalr	-1562(ra) # 800003b4 <consputc>
  while(--i >= 0)
    800009d6:	fec42783          	lw	a5,-20(s0)
    800009da:	37fd                	addiw	a5,a5,-1
    800009dc:	fef42623          	sw	a5,-20(s0)
    800009e0:	fec42783          	lw	a5,-20(s0)
    800009e4:	2781                	sext.w	a5,a5
    800009e6:	fc07dce3          	bgez	a5,800009be <printint+0xca>
}
    800009ea:	0001                	nop
    800009ec:	0001                	nop
    800009ee:	70e2                	ld	ra,56(sp)
    800009f0:	7442                	ld	s0,48(sp)
    800009f2:	6121                	addi	sp,sp,64
    800009f4:	8082                	ret

00000000800009f6 <printptr>:

static void
printptr(uint64 x)
{
    800009f6:	7179                	addi	sp,sp,-48
    800009f8:	f406                	sd	ra,40(sp)
    800009fa:	f022                	sd	s0,32(sp)
    800009fc:	1800                	addi	s0,sp,48
    800009fe:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    80000a02:	03000513          	li	a0,48
    80000a06:	00000097          	auipc	ra,0x0
    80000a0a:	9ae080e7          	jalr	-1618(ra) # 800003b4 <consputc>
  consputc('x');
    80000a0e:	07800513          	li	a0,120
    80000a12:	00000097          	auipc	ra,0x0
    80000a16:	9a2080e7          	jalr	-1630(ra) # 800003b4 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    80000a1a:	fe042623          	sw	zero,-20(s0)
    80000a1e:	a81d                	j	80000a54 <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    80000a20:	fd843783          	ld	a5,-40(s0)
    80000a24:	93f1                	srli	a5,a5,0x3c
    80000a26:	0000d717          	auipc	a4,0xd
    80000a2a:	39a70713          	addi	a4,a4,922 # 8000ddc0 <digits>
    80000a2e:	97ba                	add	a5,a5,a4
    80000a30:	0007c783          	lbu	a5,0(a5)
    80000a34:	2781                	sext.w	a5,a5
    80000a36:	853e                	mv	a0,a5
    80000a38:	00000097          	auipc	ra,0x0
    80000a3c:	97c080e7          	jalr	-1668(ra) # 800003b4 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    80000a40:	fec42783          	lw	a5,-20(s0)
    80000a44:	2785                	addiw	a5,a5,1
    80000a46:	fef42623          	sw	a5,-20(s0)
    80000a4a:	fd843783          	ld	a5,-40(s0)
    80000a4e:	0792                	slli	a5,a5,0x4
    80000a50:	fcf43c23          	sd	a5,-40(s0)
    80000a54:	fec42703          	lw	a4,-20(s0)
    80000a58:	47bd                	li	a5,15
    80000a5a:	fce7f3e3          	bgeu	a5,a4,80000a20 <printptr+0x2a>
}
    80000a5e:	0001                	nop
    80000a60:	0001                	nop
    80000a62:	70a2                	ld	ra,40(sp)
    80000a64:	7402                	ld	s0,32(sp)
    80000a66:	6145                	addi	sp,sp,48
    80000a68:	8082                	ret

0000000080000a6a <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a6a:	7119                	addi	sp,sp,-128
    80000a6c:	fc06                	sd	ra,56(sp)
    80000a6e:	f822                	sd	s0,48(sp)
    80000a70:	0080                	addi	s0,sp,64
    80000a72:	fca43423          	sd	a0,-56(s0)
    80000a76:	e40c                	sd	a1,8(s0)
    80000a78:	e810                	sd	a2,16(s0)
    80000a7a:	ec14                	sd	a3,24(s0)
    80000a7c:	f018                	sd	a4,32(s0)
    80000a7e:	f41c                	sd	a5,40(s0)
    80000a80:	03043823          	sd	a6,48(s0)
    80000a84:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a88:	00015797          	auipc	a5,0x15
    80000a8c:	6b078793          	addi	a5,a5,1712 # 80016138 <pr>
    80000a90:	4f9c                	lw	a5,24(a5)
    80000a92:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a96:	fdc42783          	lw	a5,-36(s0)
    80000a9a:	2781                	sext.w	a5,a5
    80000a9c:	cb89                	beqz	a5,80000aae <printf+0x44>
    acquire(&pr.lock);
    80000a9e:	00015517          	auipc	a0,0x15
    80000aa2:	69a50513          	addi	a0,a0,1690 # 80016138 <pr>
    80000aa6:	00001097          	auipc	ra,0x1
    80000aaa:	81e080e7          	jalr	-2018(ra) # 800012c4 <acquire>

  if (fmt == 0)
    80000aae:	fc843783          	ld	a5,-56(s0)
    80000ab2:	eb89                	bnez	a5,80000ac4 <printf+0x5a>
    panic("null fmt");
    80000ab4:	0000a517          	auipc	a0,0xa
    80000ab8:	55450513          	addi	a0,a0,1364 # 8000b008 <etext+0x8>
    80000abc:	00000097          	auipc	ra,0x0
    80000ac0:	204080e7          	jalr	516(ra) # 80000cc0 <panic>

  va_start(ap, fmt);
    80000ac4:	04040793          	addi	a5,s0,64
    80000ac8:	fcf43023          	sd	a5,-64(s0)
    80000acc:	fc043783          	ld	a5,-64(s0)
    80000ad0:	fc878793          	addi	a5,a5,-56
    80000ad4:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000ad8:	fe042623          	sw	zero,-20(s0)
    80000adc:	a24d                	j	80000c7e <printf+0x214>
    if(c != '%'){
    80000ade:	fd842783          	lw	a5,-40(s0)
    80000ae2:	0007871b          	sext.w	a4,a5
    80000ae6:	02500793          	li	a5,37
    80000aea:	00f70a63          	beq	a4,a5,80000afe <printf+0x94>
      consputc(c);
    80000aee:	fd842783          	lw	a5,-40(s0)
    80000af2:	853e                	mv	a0,a5
    80000af4:	00000097          	auipc	ra,0x0
    80000af8:	8c0080e7          	jalr	-1856(ra) # 800003b4 <consputc>
      continue;
    80000afc:	aaa5                	j	80000c74 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000afe:	fec42783          	lw	a5,-20(s0)
    80000b02:	2785                	addiw	a5,a5,1
    80000b04:	fef42623          	sw	a5,-20(s0)
    80000b08:	fec42783          	lw	a5,-20(s0)
    80000b0c:	fc843703          	ld	a4,-56(s0)
    80000b10:	97ba                	add	a5,a5,a4
    80000b12:	0007c783          	lbu	a5,0(a5)
    80000b16:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000b1a:	fd842783          	lw	a5,-40(s0)
    80000b1e:	2781                	sext.w	a5,a5
    80000b20:	16078e63          	beqz	a5,80000c9c <printf+0x232>
      break;
    switch(c){
    80000b24:	fd842783          	lw	a5,-40(s0)
    80000b28:	0007871b          	sext.w	a4,a5
    80000b2c:	07800793          	li	a5,120
    80000b30:	08f70963          	beq	a4,a5,80000bc2 <printf+0x158>
    80000b34:	fd842783          	lw	a5,-40(s0)
    80000b38:	0007871b          	sext.w	a4,a5
    80000b3c:	07800793          	li	a5,120
    80000b40:	10e7cc63          	blt	a5,a4,80000c58 <printf+0x1ee>
    80000b44:	fd842783          	lw	a5,-40(s0)
    80000b48:	0007871b          	sext.w	a4,a5
    80000b4c:	07300793          	li	a5,115
    80000b50:	0af70563          	beq	a4,a5,80000bfa <printf+0x190>
    80000b54:	fd842783          	lw	a5,-40(s0)
    80000b58:	0007871b          	sext.w	a4,a5
    80000b5c:	07300793          	li	a5,115
    80000b60:	0ee7cc63          	blt	a5,a4,80000c58 <printf+0x1ee>
    80000b64:	fd842783          	lw	a5,-40(s0)
    80000b68:	0007871b          	sext.w	a4,a5
    80000b6c:	07000793          	li	a5,112
    80000b70:	06f70863          	beq	a4,a5,80000be0 <printf+0x176>
    80000b74:	fd842783          	lw	a5,-40(s0)
    80000b78:	0007871b          	sext.w	a4,a5
    80000b7c:	07000793          	li	a5,112
    80000b80:	0ce7cc63          	blt	a5,a4,80000c58 <printf+0x1ee>
    80000b84:	fd842783          	lw	a5,-40(s0)
    80000b88:	0007871b          	sext.w	a4,a5
    80000b8c:	02500793          	li	a5,37
    80000b90:	0af70d63          	beq	a4,a5,80000c4a <printf+0x1e0>
    80000b94:	fd842783          	lw	a5,-40(s0)
    80000b98:	0007871b          	sext.w	a4,a5
    80000b9c:	06400793          	li	a5,100
    80000ba0:	0af71c63          	bne	a4,a5,80000c58 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000ba4:	fd043783          	ld	a5,-48(s0)
    80000ba8:	00878713          	addi	a4,a5,8
    80000bac:	fce43823          	sd	a4,-48(s0)
    80000bb0:	439c                	lw	a5,0(a5)
    80000bb2:	4605                	li	a2,1
    80000bb4:	45a9                	li	a1,10
    80000bb6:	853e                	mv	a0,a5
    80000bb8:	00000097          	auipc	ra,0x0
    80000bbc:	d3c080e7          	jalr	-708(ra) # 800008f4 <printint>
      break;
    80000bc0:	a855                	j	80000c74 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000bc2:	fd043783          	ld	a5,-48(s0)
    80000bc6:	00878713          	addi	a4,a5,8
    80000bca:	fce43823          	sd	a4,-48(s0)
    80000bce:	439c                	lw	a5,0(a5)
    80000bd0:	4605                	li	a2,1
    80000bd2:	45c1                	li	a1,16
    80000bd4:	853e                	mv	a0,a5
    80000bd6:	00000097          	auipc	ra,0x0
    80000bda:	d1e080e7          	jalr	-738(ra) # 800008f4 <printint>
      break;
    80000bde:	a859                	j	80000c74 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000be0:	fd043783          	ld	a5,-48(s0)
    80000be4:	00878713          	addi	a4,a5,8
    80000be8:	fce43823          	sd	a4,-48(s0)
    80000bec:	639c                	ld	a5,0(a5)
    80000bee:	853e                	mv	a0,a5
    80000bf0:	00000097          	auipc	ra,0x0
    80000bf4:	e06080e7          	jalr	-506(ra) # 800009f6 <printptr>
      break;
    80000bf8:	a8b5                	j	80000c74 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bfa:	fd043783          	ld	a5,-48(s0)
    80000bfe:	00878713          	addi	a4,a5,8
    80000c02:	fce43823          	sd	a4,-48(s0)
    80000c06:	639c                	ld	a5,0(a5)
    80000c08:	fef43023          	sd	a5,-32(s0)
    80000c0c:	fe043783          	ld	a5,-32(s0)
    80000c10:	e79d                	bnez	a5,80000c3e <printf+0x1d4>
        s = "(null)";
    80000c12:	0000a797          	auipc	a5,0xa
    80000c16:	40678793          	addi	a5,a5,1030 # 8000b018 <etext+0x18>
    80000c1a:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000c1e:	a005                	j	80000c3e <printf+0x1d4>
        consputc(*s);
    80000c20:	fe043783          	ld	a5,-32(s0)
    80000c24:	0007c783          	lbu	a5,0(a5)
    80000c28:	2781                	sext.w	a5,a5
    80000c2a:	853e                	mv	a0,a5
    80000c2c:	fffff097          	auipc	ra,0xfffff
    80000c30:	788080e7          	jalr	1928(ra) # 800003b4 <consputc>
      for(; *s; s++)
    80000c34:	fe043783          	ld	a5,-32(s0)
    80000c38:	0785                	addi	a5,a5,1
    80000c3a:	fef43023          	sd	a5,-32(s0)
    80000c3e:	fe043783          	ld	a5,-32(s0)
    80000c42:	0007c783          	lbu	a5,0(a5)
    80000c46:	ffe9                	bnez	a5,80000c20 <printf+0x1b6>
      break;
    80000c48:	a035                	j	80000c74 <printf+0x20a>
    case '%':
      consputc('%');
    80000c4a:	02500513          	li	a0,37
    80000c4e:	fffff097          	auipc	ra,0xfffff
    80000c52:	766080e7          	jalr	1894(ra) # 800003b4 <consputc>
      break;
    80000c56:	a839                	j	80000c74 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c58:	02500513          	li	a0,37
    80000c5c:	fffff097          	auipc	ra,0xfffff
    80000c60:	758080e7          	jalr	1880(ra) # 800003b4 <consputc>
      consputc(c);
    80000c64:	fd842783          	lw	a5,-40(s0)
    80000c68:	853e                	mv	a0,a5
    80000c6a:	fffff097          	auipc	ra,0xfffff
    80000c6e:	74a080e7          	jalr	1866(ra) # 800003b4 <consputc>
      break;
    80000c72:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c74:	fec42783          	lw	a5,-20(s0)
    80000c78:	2785                	addiw	a5,a5,1
    80000c7a:	fef42623          	sw	a5,-20(s0)
    80000c7e:	fec42783          	lw	a5,-20(s0)
    80000c82:	fc843703          	ld	a4,-56(s0)
    80000c86:	97ba                	add	a5,a5,a4
    80000c88:	0007c783          	lbu	a5,0(a5)
    80000c8c:	fcf42c23          	sw	a5,-40(s0)
    80000c90:	fd842783          	lw	a5,-40(s0)
    80000c94:	2781                	sext.w	a5,a5
    80000c96:	e40794e3          	bnez	a5,80000ade <printf+0x74>
    80000c9a:	a011                	j	80000c9e <printf+0x234>
      break;
    80000c9c:	0001                	nop
    }
  }
  va_end(ap);

  if(locking)
    80000c9e:	fdc42783          	lw	a5,-36(s0)
    80000ca2:	2781                	sext.w	a5,a5
    80000ca4:	cb89                	beqz	a5,80000cb6 <printf+0x24c>
    release(&pr.lock);
    80000ca6:	00015517          	auipc	a0,0x15
    80000caa:	49250513          	addi	a0,a0,1170 # 80016138 <pr>
    80000cae:	00000097          	auipc	ra,0x0
    80000cb2:	67a080e7          	jalr	1658(ra) # 80001328 <release>
}
    80000cb6:	0001                	nop
    80000cb8:	70e2                	ld	ra,56(sp)
    80000cba:	7442                	ld	s0,48(sp)
    80000cbc:	6109                	addi	sp,sp,128
    80000cbe:	8082                	ret

0000000080000cc0 <panic>:

void
panic(char *s)
{
    80000cc0:	1101                	addi	sp,sp,-32
    80000cc2:	ec06                	sd	ra,24(sp)
    80000cc4:	e822                	sd	s0,16(sp)
    80000cc6:	1000                	addi	s0,sp,32
    80000cc8:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000ccc:	00015797          	auipc	a5,0x15
    80000cd0:	46c78793          	addi	a5,a5,1132 # 80016138 <pr>
    80000cd4:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000cd8:	0000a517          	auipc	a0,0xa
    80000cdc:	34850513          	addi	a0,a0,840 # 8000b020 <etext+0x20>
    80000ce0:	00000097          	auipc	ra,0x0
    80000ce4:	d8a080e7          	jalr	-630(ra) # 80000a6a <printf>
  printf(s);
    80000ce8:	fe843503          	ld	a0,-24(s0)
    80000cec:	00000097          	auipc	ra,0x0
    80000cf0:	d7e080e7          	jalr	-642(ra) # 80000a6a <printf>
  printf("\n");
    80000cf4:	0000a517          	auipc	a0,0xa
    80000cf8:	33450513          	addi	a0,a0,820 # 8000b028 <etext+0x28>
    80000cfc:	00000097          	auipc	ra,0x0
    80000d00:	d6e080e7          	jalr	-658(ra) # 80000a6a <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000d04:	0000d797          	auipc	a5,0xd
    80000d08:	21c78793          	addi	a5,a5,540 # 8000df20 <panicked>
    80000d0c:	4705                	li	a4,1
    80000d0e:	c398                	sw	a4,0(a5)
  for(;;)
    80000d10:	0001                	nop
    80000d12:	bffd                	j	80000d10 <panic+0x50>

0000000080000d14 <printfinit>:
    ;
}

void
printfinit(void)
{
    80000d14:	1141                	addi	sp,sp,-16
    80000d16:	e406                	sd	ra,8(sp)
    80000d18:	e022                	sd	s0,0(sp)
    80000d1a:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000d1c:	0000a597          	auipc	a1,0xa
    80000d20:	31458593          	addi	a1,a1,788 # 8000b030 <etext+0x30>
    80000d24:	00015517          	auipc	a0,0x15
    80000d28:	41450513          	addi	a0,a0,1044 # 80016138 <pr>
    80000d2c:	00000097          	auipc	ra,0x0
    80000d30:	564080e7          	jalr	1380(ra) # 80001290 <initlock>
  pr.locking = 1;
    80000d34:	00015797          	auipc	a5,0x15
    80000d38:	40478793          	addi	a5,a5,1028 # 80016138 <pr>
    80000d3c:	4705                	li	a4,1
    80000d3e:	cf98                	sw	a4,24(a5)
}
    80000d40:	0001                	nop
    80000d42:	60a2                	ld	ra,8(sp)
    80000d44:	6402                	ld	s0,0(sp)
    80000d46:	0141                	addi	sp,sp,16
    80000d48:	8082                	ret

0000000080000d4a <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000d4a:	1141                	addi	sp,sp,-16
    80000d4c:	e406                	sd	ra,8(sp)
    80000d4e:	e022                	sd	s0,0(sp)
    80000d50:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000d52:	100007b7          	lui	a5,0x10000
    80000d56:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000d58:	00078023          	sb	zero,0(a5)

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000d5c:	100007b7          	lui	a5,0x10000
    80000d60:	078d                	addi	a5,a5,3 # 10000003 <_entry-0x6ffffffd>
    80000d62:	f8000713          	li	a4,-128
    80000d66:	00e78023          	sb	a4,0(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000d6a:	100007b7          	lui	a5,0x10000
    80000d6e:	470d                	li	a4,3
    80000d70:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d74:	100007b7          	lui	a5,0x10000
    80000d78:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000d7a:	00078023          	sb	zero,0(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d7e:	100007b7          	lui	a5,0x10000
    80000d82:	078d                	addi	a5,a5,3 # 10000003 <_entry-0x6ffffffd>
    80000d84:	470d                	li	a4,3
    80000d86:	00e78023          	sb	a4,0(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d8a:	100007b7          	lui	a5,0x10000
    80000d8e:	0789                	addi	a5,a5,2 # 10000002 <_entry-0x6ffffffe>
    80000d90:	471d                	li	a4,7
    80000d92:	00e78023          	sb	a4,0(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d96:	100007b7          	lui	a5,0x10000
    80000d9a:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000d9c:	470d                	li	a4,3
    80000d9e:	00e78023          	sb	a4,0(a5)

  initlock(&uart_tx_lock, "uart");
    80000da2:	0000a597          	auipc	a1,0xa
    80000da6:	29658593          	addi	a1,a1,662 # 8000b038 <etext+0x38>
    80000daa:	00015517          	auipc	a0,0x15
    80000dae:	3ae50513          	addi	a0,a0,942 # 80016158 <uart_tx_lock>
    80000db2:	00000097          	auipc	ra,0x0
    80000db6:	4de080e7          	jalr	1246(ra) # 80001290 <initlock>
}
    80000dba:	0001                	nop
    80000dbc:	60a2                	ld	ra,8(sp)
    80000dbe:	6402                	ld	s0,0(sp)
    80000dc0:	0141                	addi	sp,sp,16
    80000dc2:	8082                	ret

0000000080000dc4 <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000dc4:	1101                	addi	sp,sp,-32
    80000dc6:	ec06                	sd	ra,24(sp)
    80000dc8:	e822                	sd	s0,16(sp)
    80000dca:	1000                	addi	s0,sp,32
    80000dcc:	87aa                	mv	a5,a0
    80000dce:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000dd2:	00015517          	auipc	a0,0x15
    80000dd6:	38650513          	addi	a0,a0,902 # 80016158 <uart_tx_lock>
    80000dda:	00000097          	auipc	ra,0x0
    80000dde:	4ea080e7          	jalr	1258(ra) # 800012c4 <acquire>

  if(panicked){
    80000de2:	0000d797          	auipc	a5,0xd
    80000de6:	13e78793          	addi	a5,a5,318 # 8000df20 <panicked>
    80000dea:	439c                	lw	a5,0(a5)
    80000dec:	2781                	sext.w	a5,a5
    80000dee:	cf99                	beqz	a5,80000e0c <uartputc+0x48>
    for(;;)
    80000df0:	0001                	nop
    80000df2:	bffd                	j	80000df0 <uartputc+0x2c>
      ;
  }
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    // buffer is full.
    // wait for uartstart() to open up space in the buffer.
    sleep(&uart_tx_r, &uart_tx_lock);
    80000df4:	00015597          	auipc	a1,0x15
    80000df8:	36458593          	addi	a1,a1,868 # 80016158 <uart_tx_lock>
    80000dfc:	0000d517          	auipc	a0,0xd
    80000e00:	13450513          	addi	a0,a0,308 # 8000df30 <uart_tx_r>
    80000e04:	00002097          	auipc	ra,0x2
    80000e08:	672080e7          	jalr	1650(ra) # 80003476 <sleep>
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000e0c:	0000d797          	auipc	a5,0xd
    80000e10:	12478793          	addi	a5,a5,292 # 8000df30 <uart_tx_r>
    80000e14:	639c                	ld	a5,0(a5)
    80000e16:	02078713          	addi	a4,a5,32
    80000e1a:	0000d797          	auipc	a5,0xd
    80000e1e:	10e78793          	addi	a5,a5,270 # 8000df28 <uart_tx_w>
    80000e22:	639c                	ld	a5,0(a5)
    80000e24:	fcf708e3          	beq	a4,a5,80000df4 <uartputc+0x30>
  }
  uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000e28:	0000d797          	auipc	a5,0xd
    80000e2c:	10078793          	addi	a5,a5,256 # 8000df28 <uart_tx_w>
    80000e30:	639c                	ld	a5,0(a5)
    80000e32:	8bfd                	andi	a5,a5,31
    80000e34:	fec42703          	lw	a4,-20(s0)
    80000e38:	0ff77713          	zext.b	a4,a4
    80000e3c:	00015697          	auipc	a3,0x15
    80000e40:	33468693          	addi	a3,a3,820 # 80016170 <uart_tx_buf>
    80000e44:	97b6                	add	a5,a5,a3
    80000e46:	00e78023          	sb	a4,0(a5)
  uart_tx_w += 1;
    80000e4a:	0000d797          	auipc	a5,0xd
    80000e4e:	0de78793          	addi	a5,a5,222 # 8000df28 <uart_tx_w>
    80000e52:	639c                	ld	a5,0(a5)
    80000e54:	00178713          	addi	a4,a5,1
    80000e58:	0000d797          	auipc	a5,0xd
    80000e5c:	0d078793          	addi	a5,a5,208 # 8000df28 <uart_tx_w>
    80000e60:	e398                	sd	a4,0(a5)
  uartstart();
    80000e62:	00000097          	auipc	ra,0x0
    80000e66:	086080e7          	jalr	134(ra) # 80000ee8 <uartstart>
  release(&uart_tx_lock);
    80000e6a:	00015517          	auipc	a0,0x15
    80000e6e:	2ee50513          	addi	a0,a0,750 # 80016158 <uart_tx_lock>
    80000e72:	00000097          	auipc	ra,0x0
    80000e76:	4b6080e7          	jalr	1206(ra) # 80001328 <release>
}
    80000e7a:	0001                	nop
    80000e7c:	60e2                	ld	ra,24(sp)
    80000e7e:	6442                	ld	s0,16(sp)
    80000e80:	6105                	addi	sp,sp,32
    80000e82:	8082                	ret

0000000080000e84 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e84:	1101                	addi	sp,sp,-32
    80000e86:	ec06                	sd	ra,24(sp)
    80000e88:	e822                	sd	s0,16(sp)
    80000e8a:	1000                	addi	s0,sp,32
    80000e8c:	87aa                	mv	a5,a0
    80000e8e:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e92:	00000097          	auipc	ra,0x0
    80000e96:	530080e7          	jalr	1328(ra) # 800013c2 <push_off>

  if(panicked){
    80000e9a:	0000d797          	auipc	a5,0xd
    80000e9e:	08678793          	addi	a5,a5,134 # 8000df20 <panicked>
    80000ea2:	439c                	lw	a5,0(a5)
    80000ea4:	2781                	sext.w	a5,a5
    80000ea6:	c399                	beqz	a5,80000eac <uartputc_sync+0x28>
    for(;;)
    80000ea8:	0001                	nop
    80000eaa:	bffd                	j	80000ea8 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000eac:	0001                	nop
    80000eae:	100007b7          	lui	a5,0x10000
    80000eb2:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    80000eb4:	0007c783          	lbu	a5,0(a5)
    80000eb8:	0ff7f793          	zext.b	a5,a5
    80000ebc:	2781                	sext.w	a5,a5
    80000ebe:	0207f793          	andi	a5,a5,32
    80000ec2:	2781                	sext.w	a5,a5
    80000ec4:	d7ed                	beqz	a5,80000eae <uartputc_sync+0x2a>
    ;
  WriteReg(THR, c);
    80000ec6:	100007b7          	lui	a5,0x10000
    80000eca:	fec42703          	lw	a4,-20(s0)
    80000ece:	0ff77713          	zext.b	a4,a4
    80000ed2:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000ed6:	00000097          	auipc	ra,0x0
    80000eda:	544080e7          	jalr	1348(ra) # 8000141a <pop_off>
}
    80000ede:	0001                	nop
    80000ee0:	60e2                	ld	ra,24(sp)
    80000ee2:	6442                	ld	s0,16(sp)
    80000ee4:	6105                	addi	sp,sp,32
    80000ee6:	8082                	ret

0000000080000ee8 <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000ee8:	1101                	addi	sp,sp,-32
    80000eea:	ec06                	sd	ra,24(sp)
    80000eec:	e822                	sd	s0,16(sp)
    80000eee:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000ef0:	0000d797          	auipc	a5,0xd
    80000ef4:	03878793          	addi	a5,a5,56 # 8000df28 <uart_tx_w>
    80000ef8:	6398                	ld	a4,0(a5)
    80000efa:	0000d797          	auipc	a5,0xd
    80000efe:	03678793          	addi	a5,a5,54 # 8000df30 <uart_tx_r>
    80000f02:	639c                	ld	a5,0(a5)
    80000f04:	06f70a63          	beq	a4,a5,80000f78 <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000f08:	100007b7          	lui	a5,0x10000
    80000f0c:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    80000f0e:	0007c783          	lbu	a5,0(a5)
    80000f12:	0ff7f793          	zext.b	a5,a5
    80000f16:	2781                	sext.w	a5,a5
    80000f18:	0207f793          	andi	a5,a5,32
    80000f1c:	2781                	sext.w	a5,a5
    80000f1e:	cfb9                	beqz	a5,80000f7c <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000f20:	0000d797          	auipc	a5,0xd
    80000f24:	01078793          	addi	a5,a5,16 # 8000df30 <uart_tx_r>
    80000f28:	639c                	ld	a5,0(a5)
    80000f2a:	8bfd                	andi	a5,a5,31
    80000f2c:	00015717          	auipc	a4,0x15
    80000f30:	24470713          	addi	a4,a4,580 # 80016170 <uart_tx_buf>
    80000f34:	97ba                	add	a5,a5,a4
    80000f36:	0007c783          	lbu	a5,0(a5)
    80000f3a:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000f3e:	0000d797          	auipc	a5,0xd
    80000f42:	ff278793          	addi	a5,a5,-14 # 8000df30 <uart_tx_r>
    80000f46:	639c                	ld	a5,0(a5)
    80000f48:	00178713          	addi	a4,a5,1
    80000f4c:	0000d797          	auipc	a5,0xd
    80000f50:	fe478793          	addi	a5,a5,-28 # 8000df30 <uart_tx_r>
    80000f54:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f56:	0000d517          	auipc	a0,0xd
    80000f5a:	fda50513          	addi	a0,a0,-38 # 8000df30 <uart_tx_r>
    80000f5e:	00002097          	auipc	ra,0x2
    80000f62:	594080e7          	jalr	1428(ra) # 800034f2 <wakeup>
    
    WriteReg(THR, c);
    80000f66:	100007b7          	lui	a5,0x10000
    80000f6a:	fec42703          	lw	a4,-20(s0)
    80000f6e:	0ff77713          	zext.b	a4,a4
    80000f72:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f76:	bfad                	j	80000ef0 <uartstart+0x8>
      return;
    80000f78:	0001                	nop
    80000f7a:	a011                	j	80000f7e <uartstart+0x96>
      return;
    80000f7c:	0001                	nop
  }
}
    80000f7e:	60e2                	ld	ra,24(sp)
    80000f80:	6442                	ld	s0,16(sp)
    80000f82:	6105                	addi	sp,sp,32
    80000f84:	8082                	ret

0000000080000f86 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f86:	1141                	addi	sp,sp,-16
    80000f88:	e406                	sd	ra,8(sp)
    80000f8a:	e022                	sd	s0,0(sp)
    80000f8c:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f8e:	100007b7          	lui	a5,0x10000
    80000f92:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    80000f94:	0007c783          	lbu	a5,0(a5)
    80000f98:	0ff7f793          	zext.b	a5,a5
    80000f9c:	2781                	sext.w	a5,a5
    80000f9e:	8b85                	andi	a5,a5,1
    80000fa0:	2781                	sext.w	a5,a5
    80000fa2:	cb89                	beqz	a5,80000fb4 <uartgetc+0x2e>
    // input data is ready.
    return ReadReg(RHR);
    80000fa4:	100007b7          	lui	a5,0x10000
    80000fa8:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000fac:	0ff7f793          	zext.b	a5,a5
    80000fb0:	2781                	sext.w	a5,a5
    80000fb2:	a011                	j	80000fb6 <uartgetc+0x30>
  } else {
    return -1;
    80000fb4:	57fd                	li	a5,-1
  }
}
    80000fb6:	853e                	mv	a0,a5
    80000fb8:	60a2                	ld	ra,8(sp)
    80000fba:	6402                	ld	s0,0(sp)
    80000fbc:	0141                	addi	sp,sp,16
    80000fbe:	8082                	ret

0000000080000fc0 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from devintr().
void
uartintr(void)
{
    80000fc0:	1101                	addi	sp,sp,-32
    80000fc2:	ec06                	sd	ra,24(sp)
    80000fc4:	e822                	sd	s0,16(sp)
    80000fc6:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000fc8:	00000097          	auipc	ra,0x0
    80000fcc:	fbe080e7          	jalr	-66(ra) # 80000f86 <uartgetc>
    80000fd0:	87aa                	mv	a5,a0
    80000fd2:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000fd6:	fec42783          	lw	a5,-20(s0)
    80000fda:	0007871b          	sext.w	a4,a5
    80000fde:	57fd                	li	a5,-1
    80000fe0:	00f70a63          	beq	a4,a5,80000ff4 <uartintr+0x34>
      break;
    consoleintr(c);
    80000fe4:	fec42783          	lw	a5,-20(s0)
    80000fe8:	853e                	mv	a0,a5
    80000fea:	fffff097          	auipc	ra,0xfffff
    80000fee:	648080e7          	jalr	1608(ra) # 80000632 <consoleintr>
  while(1){
    80000ff2:	bfd9                	j	80000fc8 <uartintr+0x8>
      break;
    80000ff4:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000ff6:	00015517          	auipc	a0,0x15
    80000ffa:	16250513          	addi	a0,a0,354 # 80016158 <uart_tx_lock>
    80000ffe:	00000097          	auipc	ra,0x0
    80001002:	2c6080e7          	jalr	710(ra) # 800012c4 <acquire>
  uartstart();
    80001006:	00000097          	auipc	ra,0x0
    8000100a:	ee2080e7          	jalr	-286(ra) # 80000ee8 <uartstart>
  release(&uart_tx_lock);
    8000100e:	00015517          	auipc	a0,0x15
    80001012:	14a50513          	addi	a0,a0,330 # 80016158 <uart_tx_lock>
    80001016:	00000097          	auipc	ra,0x0
    8000101a:	312080e7          	jalr	786(ra) # 80001328 <release>
}
    8000101e:	0001                	nop
    80001020:	60e2                	ld	ra,24(sp)
    80001022:	6442                	ld	s0,16(sp)
    80001024:	6105                	addi	sp,sp,32
    80001026:	8082                	ret

0000000080001028 <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80001028:	1141                	addi	sp,sp,-16
    8000102a:	e406                	sd	ra,8(sp)
    8000102c:	e022                	sd	s0,0(sp)
    8000102e:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80001030:	0000a597          	auipc	a1,0xa
    80001034:	01058593          	addi	a1,a1,16 # 8000b040 <etext+0x40>
    80001038:	00015517          	auipc	a0,0x15
    8000103c:	15850513          	addi	a0,a0,344 # 80016190 <kmem>
    80001040:	00000097          	auipc	ra,0x0
    80001044:	250080e7          	jalr	592(ra) # 80001290 <initlock>
  freerange(end, (void*)PHYSTOP);
    80001048:	47c5                	li	a5,17
    8000104a:	01b79593          	slli	a1,a5,0x1b
    8000104e:	00026517          	auipc	a0,0x26
    80001052:	37a50513          	addi	a0,a0,890 # 800273c8 <end>
    80001056:	00000097          	auipc	ra,0x0
    8000105a:	012080e7          	jalr	18(ra) # 80001068 <freerange>
}
    8000105e:	0001                	nop
    80001060:	60a2                	ld	ra,8(sp)
    80001062:	6402                	ld	s0,0(sp)
    80001064:	0141                	addi	sp,sp,16
    80001066:	8082                	ret

0000000080001068 <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    80001068:	7179                	addi	sp,sp,-48
    8000106a:	f406                	sd	ra,40(sp)
    8000106c:	f022                	sd	s0,32(sp)
    8000106e:	1800                	addi	s0,sp,48
    80001070:	fca43c23          	sd	a0,-40(s0)
    80001074:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    80001078:	fd843703          	ld	a4,-40(s0)
    8000107c:	6785                	lui	a5,0x1
    8000107e:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001080:	973e                	add	a4,a4,a5
    80001082:	77fd                	lui	a5,0xfffff
    80001084:	8ff9                	and	a5,a5,a4
    80001086:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000108a:	a829                	j	800010a4 <freerange+0x3c>
    kfree(p);
    8000108c:	fe843503          	ld	a0,-24(s0)
    80001090:	00000097          	auipc	ra,0x0
    80001094:	030080e7          	jalr	48(ra) # 800010c0 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001098:	fe843703          	ld	a4,-24(s0)
    8000109c:	6785                	lui	a5,0x1
    8000109e:	97ba                	add	a5,a5,a4
    800010a0:	fef43423          	sd	a5,-24(s0)
    800010a4:	fe843703          	ld	a4,-24(s0)
    800010a8:	6785                	lui	a5,0x1
    800010aa:	97ba                	add	a5,a5,a4
    800010ac:	fd043703          	ld	a4,-48(s0)
    800010b0:	fcf77ee3          	bgeu	a4,a5,8000108c <freerange+0x24>
}
    800010b4:	0001                	nop
    800010b6:	0001                	nop
    800010b8:	70a2                	ld	ra,40(sp)
    800010ba:	7402                	ld	s0,32(sp)
    800010bc:	6145                	addi	sp,sp,48
    800010be:	8082                	ret

00000000800010c0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    800010c0:	7179                	addi	sp,sp,-48
    800010c2:	f406                	sd	ra,40(sp)
    800010c4:	f022                	sd	s0,32(sp)
    800010c6:	1800                	addi	s0,sp,48
    800010c8:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    800010cc:	fd843703          	ld	a4,-40(s0)
    800010d0:	6785                	lui	a5,0x1
    800010d2:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800010d4:	8ff9                	and	a5,a5,a4
    800010d6:	ef99                	bnez	a5,800010f4 <kfree+0x34>
    800010d8:	fd843703          	ld	a4,-40(s0)
    800010dc:	00026797          	auipc	a5,0x26
    800010e0:	2ec78793          	addi	a5,a5,748 # 800273c8 <end>
    800010e4:	00f76863          	bltu	a4,a5,800010f4 <kfree+0x34>
    800010e8:	fd843703          	ld	a4,-40(s0)
    800010ec:	47c5                	li	a5,17
    800010ee:	07ee                	slli	a5,a5,0x1b
    800010f0:	00f76a63          	bltu	a4,a5,80001104 <kfree+0x44>
    panic("kfree");
    800010f4:	0000a517          	auipc	a0,0xa
    800010f8:	f5450513          	addi	a0,a0,-172 # 8000b048 <etext+0x48>
    800010fc:	00000097          	auipc	ra,0x0
    80001100:	bc4080e7          	jalr	-1084(ra) # 80000cc0 <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    80001104:	6605                	lui	a2,0x1
    80001106:	4585                	li	a1,1
    80001108:	fd843503          	ld	a0,-40(s0)
    8000110c:	00000097          	auipc	ra,0x0
    80001110:	38c080e7          	jalr	908(ra) # 80001498 <memset>

  r = (struct run*)pa;
    80001114:	fd843783          	ld	a5,-40(s0)
    80001118:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    8000111c:	00015517          	auipc	a0,0x15
    80001120:	07450513          	addi	a0,a0,116 # 80016190 <kmem>
    80001124:	00000097          	auipc	ra,0x0
    80001128:	1a0080e7          	jalr	416(ra) # 800012c4 <acquire>
  r->next = kmem.freelist;
    8000112c:	00015797          	auipc	a5,0x15
    80001130:	06478793          	addi	a5,a5,100 # 80016190 <kmem>
    80001134:	6f98                	ld	a4,24(a5)
    80001136:	fe843783          	ld	a5,-24(s0)
    8000113a:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    8000113c:	00015797          	auipc	a5,0x15
    80001140:	05478793          	addi	a5,a5,84 # 80016190 <kmem>
    80001144:	fe843703          	ld	a4,-24(s0)
    80001148:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    8000114a:	00015517          	auipc	a0,0x15
    8000114e:	04650513          	addi	a0,a0,70 # 80016190 <kmem>
    80001152:	00000097          	auipc	ra,0x0
    80001156:	1d6080e7          	jalr	470(ra) # 80001328 <release>
}
    8000115a:	0001                	nop
    8000115c:	70a2                	ld	ra,40(sp)
    8000115e:	7402                	ld	s0,32(sp)
    80001160:	6145                	addi	sp,sp,48
    80001162:	8082                	ret

0000000080001164 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    80001164:	1101                	addi	sp,sp,-32
    80001166:	ec06                	sd	ra,24(sp)
    80001168:	e822                	sd	s0,16(sp)
    8000116a:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    8000116c:	00015517          	auipc	a0,0x15
    80001170:	02450513          	addi	a0,a0,36 # 80016190 <kmem>
    80001174:	00000097          	auipc	ra,0x0
    80001178:	150080e7          	jalr	336(ra) # 800012c4 <acquire>
  r = kmem.freelist;
    8000117c:	00015797          	auipc	a5,0x15
    80001180:	01478793          	addi	a5,a5,20 # 80016190 <kmem>
    80001184:	6f9c                	ld	a5,24(a5)
    80001186:	fef43423          	sd	a5,-24(s0)
  if(r)
    8000118a:	fe843783          	ld	a5,-24(s0)
    8000118e:	cb89                	beqz	a5,800011a0 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001190:	fe843783          	ld	a5,-24(s0)
    80001194:	6398                	ld	a4,0(a5)
    80001196:	00015797          	auipc	a5,0x15
    8000119a:	ffa78793          	addi	a5,a5,-6 # 80016190 <kmem>
    8000119e:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    800011a0:	00015517          	auipc	a0,0x15
    800011a4:	ff050513          	addi	a0,a0,-16 # 80016190 <kmem>
    800011a8:	00000097          	auipc	ra,0x0
    800011ac:	180080e7          	jalr	384(ra) # 80001328 <release>

  if(r)
    800011b0:	fe843783          	ld	a5,-24(s0)
    800011b4:	cb89                	beqz	a5,800011c6 <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    800011b6:	6605                	lui	a2,0x1
    800011b8:	4595                	li	a1,5
    800011ba:	fe843503          	ld	a0,-24(s0)
    800011be:	00000097          	auipc	ra,0x0
    800011c2:	2da080e7          	jalr	730(ra) # 80001498 <memset>
  return (void*)r;
    800011c6:	fe843783          	ld	a5,-24(s0)
}
    800011ca:	853e                	mv	a0,a5
    800011cc:	60e2                	ld	ra,24(sp)
    800011ce:	6442                	ld	s0,16(sp)
    800011d0:	6105                	addi	sp,sp,32
    800011d2:	8082                	ret

00000000800011d4 <r_sstatus>:
{
    800011d4:	1101                	addi	sp,sp,-32
    800011d6:	ec06                	sd	ra,24(sp)
    800011d8:	e822                	sd	s0,16(sp)
    800011da:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800011dc:	100027f3          	csrr	a5,sstatus
    800011e0:	fef43423          	sd	a5,-24(s0)
  return x;
    800011e4:	fe843783          	ld	a5,-24(s0)
}
    800011e8:	853e                	mv	a0,a5
    800011ea:	60e2                	ld	ra,24(sp)
    800011ec:	6442                	ld	s0,16(sp)
    800011ee:	6105                	addi	sp,sp,32
    800011f0:	8082                	ret

00000000800011f2 <w_sstatus>:
{
    800011f2:	1101                	addi	sp,sp,-32
    800011f4:	ec06                	sd	ra,24(sp)
    800011f6:	e822                	sd	s0,16(sp)
    800011f8:	1000                	addi	s0,sp,32
    800011fa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011fe:	fe843783          	ld	a5,-24(s0)
    80001202:	10079073          	csrw	sstatus,a5
}
    80001206:	0001                	nop
    80001208:	60e2                	ld	ra,24(sp)
    8000120a:	6442                	ld	s0,16(sp)
    8000120c:	6105                	addi	sp,sp,32
    8000120e:	8082                	ret

0000000080001210 <intr_on>:
{
    80001210:	1141                	addi	sp,sp,-16
    80001212:	e406                	sd	ra,8(sp)
    80001214:	e022                	sd	s0,0(sp)
    80001216:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80001218:	00000097          	auipc	ra,0x0
    8000121c:	fbc080e7          	jalr	-68(ra) # 800011d4 <r_sstatus>
    80001220:	87aa                	mv	a5,a0
    80001222:	0027e793          	ori	a5,a5,2
    80001226:	853e                	mv	a0,a5
    80001228:	00000097          	auipc	ra,0x0
    8000122c:	fca080e7          	jalr	-54(ra) # 800011f2 <w_sstatus>
}
    80001230:	0001                	nop
    80001232:	60a2                	ld	ra,8(sp)
    80001234:	6402                	ld	s0,0(sp)
    80001236:	0141                	addi	sp,sp,16
    80001238:	8082                	ret

000000008000123a <intr_off>:
{
    8000123a:	1141                	addi	sp,sp,-16
    8000123c:	e406                	sd	ra,8(sp)
    8000123e:	e022                	sd	s0,0(sp)
    80001240:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80001242:	00000097          	auipc	ra,0x0
    80001246:	f92080e7          	jalr	-110(ra) # 800011d4 <r_sstatus>
    8000124a:	87aa                	mv	a5,a0
    8000124c:	9bf5                	andi	a5,a5,-3
    8000124e:	853e                	mv	a0,a5
    80001250:	00000097          	auipc	ra,0x0
    80001254:	fa2080e7          	jalr	-94(ra) # 800011f2 <w_sstatus>
}
    80001258:	0001                	nop
    8000125a:	60a2                	ld	ra,8(sp)
    8000125c:	6402                	ld	s0,0(sp)
    8000125e:	0141                	addi	sp,sp,16
    80001260:	8082                	ret

0000000080001262 <intr_get>:
{
    80001262:	1101                	addi	sp,sp,-32
    80001264:	ec06                	sd	ra,24(sp)
    80001266:	e822                	sd	s0,16(sp)
    80001268:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    8000126a:	00000097          	auipc	ra,0x0
    8000126e:	f6a080e7          	jalr	-150(ra) # 800011d4 <r_sstatus>
    80001272:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80001276:	fe843783          	ld	a5,-24(s0)
    8000127a:	8b89                	andi	a5,a5,2
    8000127c:	00f037b3          	snez	a5,a5
    80001280:	0ff7f793          	zext.b	a5,a5
    80001284:	2781                	sext.w	a5,a5
}
    80001286:	853e                	mv	a0,a5
    80001288:	60e2                	ld	ra,24(sp)
    8000128a:	6442                	ld	s0,16(sp)
    8000128c:	6105                	addi	sp,sp,32
    8000128e:	8082                	ret

0000000080001290 <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    80001290:	1101                	addi	sp,sp,-32
    80001292:	ec06                	sd	ra,24(sp)
    80001294:	e822                	sd	s0,16(sp)
    80001296:	1000                	addi	s0,sp,32
    80001298:	fea43423          	sd	a0,-24(s0)
    8000129c:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    800012a0:	fe843783          	ld	a5,-24(s0)
    800012a4:	fe043703          	ld	a4,-32(s0)
    800012a8:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    800012aa:	fe843783          	ld	a5,-24(s0)
    800012ae:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    800012b2:	fe843783          	ld	a5,-24(s0)
    800012b6:	0007b823          	sd	zero,16(a5)
}
    800012ba:	0001                	nop
    800012bc:	60e2                	ld	ra,24(sp)
    800012be:	6442                	ld	s0,16(sp)
    800012c0:	6105                	addi	sp,sp,32
    800012c2:	8082                	ret

00000000800012c4 <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    800012c4:	1101                	addi	sp,sp,-32
    800012c6:	ec06                	sd	ra,24(sp)
    800012c8:	e822                	sd	s0,16(sp)
    800012ca:	1000                	addi	s0,sp,32
    800012cc:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    800012d0:	00000097          	auipc	ra,0x0
    800012d4:	0f2080e7          	jalr	242(ra) # 800013c2 <push_off>
  if(holding(lk))
    800012d8:	fe843503          	ld	a0,-24(s0)
    800012dc:	00000097          	auipc	ra,0x0
    800012e0:	0a2080e7          	jalr	162(ra) # 8000137e <holding>
    800012e4:	87aa                	mv	a5,a0
    800012e6:	cb89                	beqz	a5,800012f8 <acquire+0x34>
    panic("acquire");
    800012e8:	0000a517          	auipc	a0,0xa
    800012ec:	d6850513          	addi	a0,a0,-664 # 8000b050 <etext+0x50>
    800012f0:	00000097          	auipc	ra,0x0
    800012f4:	9d0080e7          	jalr	-1584(ra) # 80000cc0 <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012f8:	0001                	nop
    800012fa:	fe843783          	ld	a5,-24(s0)
    800012fe:	4705                	li	a4,1
    80001300:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    80001304:	0007079b          	sext.w	a5,a4
    80001308:	fbed                	bnez	a5,800012fa <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    8000130a:	0330000f          	fence	rw,rw

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    8000130e:	00001097          	auipc	ra,0x1
    80001312:	574080e7          	jalr	1396(ra) # 80002882 <mycpu>
    80001316:	872a                	mv	a4,a0
    80001318:	fe843783          	ld	a5,-24(s0)
    8000131c:	eb98                	sd	a4,16(a5)
}
    8000131e:	0001                	nop
    80001320:	60e2                	ld	ra,24(sp)
    80001322:	6442                	ld	s0,16(sp)
    80001324:	6105                	addi	sp,sp,32
    80001326:	8082                	ret

0000000080001328 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    80001328:	1101                	addi	sp,sp,-32
    8000132a:	ec06                	sd	ra,24(sp)
    8000132c:	e822                	sd	s0,16(sp)
    8000132e:	1000                	addi	s0,sp,32
    80001330:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    80001334:	fe843503          	ld	a0,-24(s0)
    80001338:	00000097          	auipc	ra,0x0
    8000133c:	046080e7          	jalr	70(ra) # 8000137e <holding>
    80001340:	87aa                	mv	a5,a0
    80001342:	eb89                	bnez	a5,80001354 <release+0x2c>
    panic("release");
    80001344:	0000a517          	auipc	a0,0xa
    80001348:	d1450513          	addi	a0,a0,-748 # 8000b058 <etext+0x58>
    8000134c:	00000097          	auipc	ra,0x0
    80001350:	974080e7          	jalr	-1676(ra) # 80000cc0 <panic>

  lk->cpu = 0;
    80001354:	fe843783          	ld	a5,-24(s0)
    80001358:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    8000135c:	0330000f          	fence	rw,rw
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    80001360:	fe843783          	ld	a5,-24(s0)
    80001364:	0310000f          	fence	rw,w
    80001368:	0007a023          	sw	zero,0(a5)

  pop_off();
    8000136c:	00000097          	auipc	ra,0x0
    80001370:	0ae080e7          	jalr	174(ra) # 8000141a <pop_off>
}
    80001374:	0001                	nop
    80001376:	60e2                	ld	ra,24(sp)
    80001378:	6442                	ld	s0,16(sp)
    8000137a:	6105                	addi	sp,sp,32
    8000137c:	8082                	ret

000000008000137e <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    8000137e:	7139                	addi	sp,sp,-64
    80001380:	fc06                	sd	ra,56(sp)
    80001382:	f822                	sd	s0,48(sp)
    80001384:	f426                	sd	s1,40(sp)
    80001386:	0080                	addi	s0,sp,64
    80001388:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    8000138c:	fc843783          	ld	a5,-56(s0)
    80001390:	439c                	lw	a5,0(a5)
    80001392:	cf89                	beqz	a5,800013ac <holding+0x2e>
    80001394:	fc843783          	ld	a5,-56(s0)
    80001398:	6b84                	ld	s1,16(a5)
    8000139a:	00001097          	auipc	ra,0x1
    8000139e:	4e8080e7          	jalr	1256(ra) # 80002882 <mycpu>
    800013a2:	87aa                	mv	a5,a0
    800013a4:	00f49463          	bne	s1,a5,800013ac <holding+0x2e>
    800013a8:	4785                	li	a5,1
    800013aa:	a011                	j	800013ae <holding+0x30>
    800013ac:	4781                	li	a5,0
    800013ae:	fcf42e23          	sw	a5,-36(s0)
  return r;
    800013b2:	fdc42783          	lw	a5,-36(s0)
}
    800013b6:	853e                	mv	a0,a5
    800013b8:	70e2                	ld	ra,56(sp)
    800013ba:	7442                	ld	s0,48(sp)
    800013bc:	74a2                	ld	s1,40(sp)
    800013be:	6121                	addi	sp,sp,64
    800013c0:	8082                	ret

00000000800013c2 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    800013c2:	1101                	addi	sp,sp,-32
    800013c4:	ec06                	sd	ra,24(sp)
    800013c6:	e822                	sd	s0,16(sp)
    800013c8:	1000                	addi	s0,sp,32
  int old = intr_get();
    800013ca:	00000097          	auipc	ra,0x0
    800013ce:	e98080e7          	jalr	-360(ra) # 80001262 <intr_get>
    800013d2:	87aa                	mv	a5,a0
    800013d4:	fef42623          	sw	a5,-20(s0)

  intr_off();
    800013d8:	00000097          	auipc	ra,0x0
    800013dc:	e62080e7          	jalr	-414(ra) # 8000123a <intr_off>
  if(mycpu()->noff == 0)
    800013e0:	00001097          	auipc	ra,0x1
    800013e4:	4a2080e7          	jalr	1186(ra) # 80002882 <mycpu>
    800013e8:	87aa                	mv	a5,a0
    800013ea:	5fbc                	lw	a5,120(a5)
    800013ec:	eb89                	bnez	a5,800013fe <push_off+0x3c>
    mycpu()->intena = old;
    800013ee:	00001097          	auipc	ra,0x1
    800013f2:	494080e7          	jalr	1172(ra) # 80002882 <mycpu>
    800013f6:	872a                	mv	a4,a0
    800013f8:	fec42783          	lw	a5,-20(s0)
    800013fc:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013fe:	00001097          	auipc	ra,0x1
    80001402:	484080e7          	jalr	1156(ra) # 80002882 <mycpu>
    80001406:	87aa                	mv	a5,a0
    80001408:	5fb8                	lw	a4,120(a5)
    8000140a:	2705                	addiw	a4,a4,1
    8000140c:	2701                	sext.w	a4,a4
    8000140e:	dfb8                	sw	a4,120(a5)
}
    80001410:	0001                	nop
    80001412:	60e2                	ld	ra,24(sp)
    80001414:	6442                	ld	s0,16(sp)
    80001416:	6105                	addi	sp,sp,32
    80001418:	8082                	ret

000000008000141a <pop_off>:

void
pop_off(void)
{
    8000141a:	1101                	addi	sp,sp,-32
    8000141c:	ec06                	sd	ra,24(sp)
    8000141e:	e822                	sd	s0,16(sp)
    80001420:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    80001422:	00001097          	auipc	ra,0x1
    80001426:	460080e7          	jalr	1120(ra) # 80002882 <mycpu>
    8000142a:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    8000142e:	00000097          	auipc	ra,0x0
    80001432:	e34080e7          	jalr	-460(ra) # 80001262 <intr_get>
    80001436:	87aa                	mv	a5,a0
    80001438:	cb89                	beqz	a5,8000144a <pop_off+0x30>
    panic("pop_off - interruptible");
    8000143a:	0000a517          	auipc	a0,0xa
    8000143e:	c2650513          	addi	a0,a0,-986 # 8000b060 <etext+0x60>
    80001442:	00000097          	auipc	ra,0x0
    80001446:	87e080e7          	jalr	-1922(ra) # 80000cc0 <panic>
  if(c->noff < 1)
    8000144a:	fe843783          	ld	a5,-24(s0)
    8000144e:	5fbc                	lw	a5,120(a5)
    80001450:	00f04a63          	bgtz	a5,80001464 <pop_off+0x4a>
    panic("pop_off");
    80001454:	0000a517          	auipc	a0,0xa
    80001458:	c2450513          	addi	a0,a0,-988 # 8000b078 <etext+0x78>
    8000145c:	00000097          	auipc	ra,0x0
    80001460:	864080e7          	jalr	-1948(ra) # 80000cc0 <panic>
  c->noff -= 1;
    80001464:	fe843783          	ld	a5,-24(s0)
    80001468:	5fbc                	lw	a5,120(a5)
    8000146a:	37fd                	addiw	a5,a5,-1
    8000146c:	0007871b          	sext.w	a4,a5
    80001470:	fe843783          	ld	a5,-24(s0)
    80001474:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    80001476:	fe843783          	ld	a5,-24(s0)
    8000147a:	5fbc                	lw	a5,120(a5)
    8000147c:	eb89                	bnez	a5,8000148e <pop_off+0x74>
    8000147e:	fe843783          	ld	a5,-24(s0)
    80001482:	5ffc                	lw	a5,124(a5)
    80001484:	c789                	beqz	a5,8000148e <pop_off+0x74>
    intr_on();
    80001486:	00000097          	auipc	ra,0x0
    8000148a:	d8a080e7          	jalr	-630(ra) # 80001210 <intr_on>
}
    8000148e:	0001                	nop
    80001490:	60e2                	ld	ra,24(sp)
    80001492:	6442                	ld	s0,16(sp)
    80001494:	6105                	addi	sp,sp,32
    80001496:	8082                	ret

0000000080001498 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001498:	7179                	addi	sp,sp,-48
    8000149a:	f406                	sd	ra,40(sp)
    8000149c:	f022                	sd	s0,32(sp)
    8000149e:	1800                	addi	s0,sp,48
    800014a0:	fca43c23          	sd	a0,-40(s0)
    800014a4:	87ae                	mv	a5,a1
    800014a6:	8732                	mv	a4,a2
    800014a8:	fcf42a23          	sw	a5,-44(s0)
    800014ac:	87ba                	mv	a5,a4
    800014ae:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    800014b2:	fd843783          	ld	a5,-40(s0)
    800014b6:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    800014ba:	fe042623          	sw	zero,-20(s0)
    800014be:	a00d                	j	800014e0 <memset+0x48>
    cdst[i] = c;
    800014c0:	fec42783          	lw	a5,-20(s0)
    800014c4:	fe043703          	ld	a4,-32(s0)
    800014c8:	97ba                	add	a5,a5,a4
    800014ca:	fd442703          	lw	a4,-44(s0)
    800014ce:	0ff77713          	zext.b	a4,a4
    800014d2:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    800014d6:	fec42783          	lw	a5,-20(s0)
    800014da:	2785                	addiw	a5,a5,1
    800014dc:	fef42623          	sw	a5,-20(s0)
    800014e0:	fec42783          	lw	a5,-20(s0)
    800014e4:	fd042703          	lw	a4,-48(s0)
    800014e8:	2701                	sext.w	a4,a4
    800014ea:	fce7ebe3          	bltu	a5,a4,800014c0 <memset+0x28>
  }
  return dst;
    800014ee:	fd843783          	ld	a5,-40(s0)
}
    800014f2:	853e                	mv	a0,a5
    800014f4:	70a2                	ld	ra,40(sp)
    800014f6:	7402                	ld	s0,32(sp)
    800014f8:	6145                	addi	sp,sp,48
    800014fa:	8082                	ret

00000000800014fc <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014fc:	7139                	addi	sp,sp,-64
    800014fe:	fc06                	sd	ra,56(sp)
    80001500:	f822                	sd	s0,48(sp)
    80001502:	0080                	addi	s0,sp,64
    80001504:	fca43c23          	sd	a0,-40(s0)
    80001508:	fcb43823          	sd	a1,-48(s0)
    8000150c:	87b2                	mv	a5,a2
    8000150e:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    80001512:	fd843783          	ld	a5,-40(s0)
    80001516:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    8000151a:	fd043783          	ld	a5,-48(s0)
    8000151e:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    80001522:	a0a1                	j	8000156a <memcmp+0x6e>
    if(*s1 != *s2)
    80001524:	fe843783          	ld	a5,-24(s0)
    80001528:	0007c703          	lbu	a4,0(a5)
    8000152c:	fe043783          	ld	a5,-32(s0)
    80001530:	0007c783          	lbu	a5,0(a5)
    80001534:	02f70163          	beq	a4,a5,80001556 <memcmp+0x5a>
      return *s1 - *s2;
    80001538:	fe843783          	ld	a5,-24(s0)
    8000153c:	0007c783          	lbu	a5,0(a5)
    80001540:	0007871b          	sext.w	a4,a5
    80001544:	fe043783          	ld	a5,-32(s0)
    80001548:	0007c783          	lbu	a5,0(a5)
    8000154c:	2781                	sext.w	a5,a5
    8000154e:	40f707bb          	subw	a5,a4,a5
    80001552:	2781                	sext.w	a5,a5
    80001554:	a01d                	j	8000157a <memcmp+0x7e>
    s1++, s2++;
    80001556:	fe843783          	ld	a5,-24(s0)
    8000155a:	0785                	addi	a5,a5,1
    8000155c:	fef43423          	sd	a5,-24(s0)
    80001560:	fe043783          	ld	a5,-32(s0)
    80001564:	0785                	addi	a5,a5,1
    80001566:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    8000156a:	fcc42783          	lw	a5,-52(s0)
    8000156e:	fff7871b          	addiw	a4,a5,-1
    80001572:	fce42623          	sw	a4,-52(s0)
    80001576:	f7dd                	bnez	a5,80001524 <memcmp+0x28>
  }

  return 0;
    80001578:	4781                	li	a5,0
}
    8000157a:	853e                	mv	a0,a5
    8000157c:	70e2                	ld	ra,56(sp)
    8000157e:	7442                	ld	s0,48(sp)
    80001580:	6121                	addi	sp,sp,64
    80001582:	8082                	ret

0000000080001584 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001584:	7139                	addi	sp,sp,-64
    80001586:	fc06                	sd	ra,56(sp)
    80001588:	f822                	sd	s0,48(sp)
    8000158a:	0080                	addi	s0,sp,64
    8000158c:	fca43c23          	sd	a0,-40(s0)
    80001590:	fcb43823          	sd	a1,-48(s0)
    80001594:	87b2                	mv	a5,a2
    80001596:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    8000159a:	fcc42783          	lw	a5,-52(s0)
    8000159e:	2781                	sext.w	a5,a5
    800015a0:	e781                	bnez	a5,800015a8 <memmove+0x24>
    return dst;
    800015a2:	fd843783          	ld	a5,-40(s0)
    800015a6:	a855                	j	8000165a <memmove+0xd6>
  
  s = src;
    800015a8:	fd043783          	ld	a5,-48(s0)
    800015ac:	fef43423          	sd	a5,-24(s0)
  d = dst;
    800015b0:	fd843783          	ld	a5,-40(s0)
    800015b4:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    800015b8:	fe843703          	ld	a4,-24(s0)
    800015bc:	fe043783          	ld	a5,-32(s0)
    800015c0:	08f77463          	bgeu	a4,a5,80001648 <memmove+0xc4>
    800015c4:	fcc46783          	lwu	a5,-52(s0)
    800015c8:	fe843703          	ld	a4,-24(s0)
    800015cc:	97ba                	add	a5,a5,a4
    800015ce:	fe043703          	ld	a4,-32(s0)
    800015d2:	06f77b63          	bgeu	a4,a5,80001648 <memmove+0xc4>
    s += n;
    800015d6:	fcc46783          	lwu	a5,-52(s0)
    800015da:	fe843703          	ld	a4,-24(s0)
    800015de:	97ba                	add	a5,a5,a4
    800015e0:	fef43423          	sd	a5,-24(s0)
    d += n;
    800015e4:	fcc46783          	lwu	a5,-52(s0)
    800015e8:	fe043703          	ld	a4,-32(s0)
    800015ec:	97ba                	add	a5,a5,a4
    800015ee:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    800015f2:	a01d                	j	80001618 <memmove+0x94>
      *--d = *--s;
    800015f4:	fe843783          	ld	a5,-24(s0)
    800015f8:	17fd                	addi	a5,a5,-1
    800015fa:	fef43423          	sd	a5,-24(s0)
    800015fe:	fe043783          	ld	a5,-32(s0)
    80001602:	17fd                	addi	a5,a5,-1
    80001604:	fef43023          	sd	a5,-32(s0)
    80001608:	fe843783          	ld	a5,-24(s0)
    8000160c:	0007c703          	lbu	a4,0(a5)
    80001610:	fe043783          	ld	a5,-32(s0)
    80001614:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    80001618:	fcc42783          	lw	a5,-52(s0)
    8000161c:	fff7871b          	addiw	a4,a5,-1
    80001620:	fce42623          	sw	a4,-52(s0)
    80001624:	fbe1                	bnez	a5,800015f4 <memmove+0x70>
  if(s < d && s + n > d){
    80001626:	a805                	j	80001656 <memmove+0xd2>
  } else
    while(n-- > 0)
      *d++ = *s++;
    80001628:	fe843703          	ld	a4,-24(s0)
    8000162c:	00170793          	addi	a5,a4,1
    80001630:	fef43423          	sd	a5,-24(s0)
    80001634:	fe043783          	ld	a5,-32(s0)
    80001638:	00178693          	addi	a3,a5,1
    8000163c:	fed43023          	sd	a3,-32(s0)
    80001640:	00074703          	lbu	a4,0(a4)
    80001644:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    80001648:	fcc42783          	lw	a5,-52(s0)
    8000164c:	fff7871b          	addiw	a4,a5,-1
    80001650:	fce42623          	sw	a4,-52(s0)
    80001654:	fbf1                	bnez	a5,80001628 <memmove+0xa4>

  return dst;
    80001656:	fd843783          	ld	a5,-40(s0)
}
    8000165a:	853e                	mv	a0,a5
    8000165c:	70e2                	ld	ra,56(sp)
    8000165e:	7442                	ld	s0,48(sp)
    80001660:	6121                	addi	sp,sp,64
    80001662:	8082                	ret

0000000080001664 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80001664:	7179                	addi	sp,sp,-48
    80001666:	f406                	sd	ra,40(sp)
    80001668:	f022                	sd	s0,32(sp)
    8000166a:	1800                	addi	s0,sp,48
    8000166c:	fea43423          	sd	a0,-24(s0)
    80001670:	feb43023          	sd	a1,-32(s0)
    80001674:	87b2                	mv	a5,a2
    80001676:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    8000167a:	fdc42783          	lw	a5,-36(s0)
    8000167e:	863e                	mv	a2,a5
    80001680:	fe043583          	ld	a1,-32(s0)
    80001684:	fe843503          	ld	a0,-24(s0)
    80001688:	00000097          	auipc	ra,0x0
    8000168c:	efc080e7          	jalr	-260(ra) # 80001584 <memmove>
    80001690:	87aa                	mv	a5,a0
}
    80001692:	853e                	mv	a0,a5
    80001694:	70a2                	ld	ra,40(sp)
    80001696:	7402                	ld	s0,32(sp)
    80001698:	6145                	addi	sp,sp,48
    8000169a:	8082                	ret

000000008000169c <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8000169c:	7179                	addi	sp,sp,-48
    8000169e:	f406                	sd	ra,40(sp)
    800016a0:	f022                	sd	s0,32(sp)
    800016a2:	1800                	addi	s0,sp,48
    800016a4:	fea43423          	sd	a0,-24(s0)
    800016a8:	feb43023          	sd	a1,-32(s0)
    800016ac:	87b2                	mv	a5,a2
    800016ae:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    800016b2:	a005                	j	800016d2 <strncmp+0x36>
    n--, p++, q++;
    800016b4:	fdc42783          	lw	a5,-36(s0)
    800016b8:	37fd                	addiw	a5,a5,-1
    800016ba:	fcf42e23          	sw	a5,-36(s0)
    800016be:	fe843783          	ld	a5,-24(s0)
    800016c2:	0785                	addi	a5,a5,1
    800016c4:	fef43423          	sd	a5,-24(s0)
    800016c8:	fe043783          	ld	a5,-32(s0)
    800016cc:	0785                	addi	a5,a5,1
    800016ce:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    800016d2:	fdc42783          	lw	a5,-36(s0)
    800016d6:	2781                	sext.w	a5,a5
    800016d8:	c385                	beqz	a5,800016f8 <strncmp+0x5c>
    800016da:	fe843783          	ld	a5,-24(s0)
    800016de:	0007c783          	lbu	a5,0(a5)
    800016e2:	cb99                	beqz	a5,800016f8 <strncmp+0x5c>
    800016e4:	fe843783          	ld	a5,-24(s0)
    800016e8:	0007c703          	lbu	a4,0(a5)
    800016ec:	fe043783          	ld	a5,-32(s0)
    800016f0:	0007c783          	lbu	a5,0(a5)
    800016f4:	fcf700e3          	beq	a4,a5,800016b4 <strncmp+0x18>
  if(n == 0)
    800016f8:	fdc42783          	lw	a5,-36(s0)
    800016fc:	2781                	sext.w	a5,a5
    800016fe:	e399                	bnez	a5,80001704 <strncmp+0x68>
    return 0;
    80001700:	4781                	li	a5,0
    80001702:	a839                	j	80001720 <strncmp+0x84>
  return (uchar)*p - (uchar)*q;
    80001704:	fe843783          	ld	a5,-24(s0)
    80001708:	0007c783          	lbu	a5,0(a5)
    8000170c:	0007871b          	sext.w	a4,a5
    80001710:	fe043783          	ld	a5,-32(s0)
    80001714:	0007c783          	lbu	a5,0(a5)
    80001718:	2781                	sext.w	a5,a5
    8000171a:	40f707bb          	subw	a5,a4,a5
    8000171e:	2781                	sext.w	a5,a5
}
    80001720:	853e                	mv	a0,a5
    80001722:	70a2                	ld	ra,40(sp)
    80001724:	7402                	ld	s0,32(sp)
    80001726:	6145                	addi	sp,sp,48
    80001728:	8082                	ret

000000008000172a <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    8000172a:	7139                	addi	sp,sp,-64
    8000172c:	fc06                	sd	ra,56(sp)
    8000172e:	f822                	sd	s0,48(sp)
    80001730:	0080                	addi	s0,sp,64
    80001732:	fca43c23          	sd	a0,-40(s0)
    80001736:	fcb43823          	sd	a1,-48(s0)
    8000173a:	87b2                	mv	a5,a2
    8000173c:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    80001740:	fd843783          	ld	a5,-40(s0)
    80001744:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    80001748:	0001                	nop
    8000174a:	fcc42783          	lw	a5,-52(s0)
    8000174e:	fff7871b          	addiw	a4,a5,-1
    80001752:	fce42623          	sw	a4,-52(s0)
    80001756:	02f05e63          	blez	a5,80001792 <strncpy+0x68>
    8000175a:	fd043703          	ld	a4,-48(s0)
    8000175e:	00170793          	addi	a5,a4,1
    80001762:	fcf43823          	sd	a5,-48(s0)
    80001766:	fd843783          	ld	a5,-40(s0)
    8000176a:	00178693          	addi	a3,a5,1
    8000176e:	fcd43c23          	sd	a3,-40(s0)
    80001772:	00074703          	lbu	a4,0(a4)
    80001776:	00e78023          	sb	a4,0(a5)
    8000177a:	0007c783          	lbu	a5,0(a5)
    8000177e:	f7f1                	bnez	a5,8000174a <strncpy+0x20>
    ;
  while(n-- > 0)
    80001780:	a809                	j	80001792 <strncpy+0x68>
    *s++ = 0;
    80001782:	fd843783          	ld	a5,-40(s0)
    80001786:	00178713          	addi	a4,a5,1
    8000178a:	fce43c23          	sd	a4,-40(s0)
    8000178e:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    80001792:	fcc42783          	lw	a5,-52(s0)
    80001796:	fff7871b          	addiw	a4,a5,-1
    8000179a:	fce42623          	sw	a4,-52(s0)
    8000179e:	fef042e3          	bgtz	a5,80001782 <strncpy+0x58>
  return os;
    800017a2:	fe843783          	ld	a5,-24(s0)
}
    800017a6:	853e                	mv	a0,a5
    800017a8:	70e2                	ld	ra,56(sp)
    800017aa:	7442                	ld	s0,48(sp)
    800017ac:	6121                	addi	sp,sp,64
    800017ae:	8082                	ret

00000000800017b0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    800017b0:	7139                	addi	sp,sp,-64
    800017b2:	fc06                	sd	ra,56(sp)
    800017b4:	f822                	sd	s0,48(sp)
    800017b6:	0080                	addi	s0,sp,64
    800017b8:	fca43c23          	sd	a0,-40(s0)
    800017bc:	fcb43823          	sd	a1,-48(s0)
    800017c0:	87b2                	mv	a5,a2
    800017c2:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800017c6:	fd843783          	ld	a5,-40(s0)
    800017ca:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    800017ce:	fcc42783          	lw	a5,-52(s0)
    800017d2:	2781                	sext.w	a5,a5
    800017d4:	00f04563          	bgtz	a5,800017de <safestrcpy+0x2e>
    return os;
    800017d8:	fe843783          	ld	a5,-24(s0)
    800017dc:	a0a9                	j	80001826 <safestrcpy+0x76>
  while(--n > 0 && (*s++ = *t++) != 0)
    800017de:	0001                	nop
    800017e0:	fcc42783          	lw	a5,-52(s0)
    800017e4:	37fd                	addiw	a5,a5,-1
    800017e6:	fcf42623          	sw	a5,-52(s0)
    800017ea:	fcc42783          	lw	a5,-52(s0)
    800017ee:	2781                	sext.w	a5,a5
    800017f0:	02f05563          	blez	a5,8000181a <safestrcpy+0x6a>
    800017f4:	fd043703          	ld	a4,-48(s0)
    800017f8:	00170793          	addi	a5,a4,1
    800017fc:	fcf43823          	sd	a5,-48(s0)
    80001800:	fd843783          	ld	a5,-40(s0)
    80001804:	00178693          	addi	a3,a5,1
    80001808:	fcd43c23          	sd	a3,-40(s0)
    8000180c:	00074703          	lbu	a4,0(a4)
    80001810:	00e78023          	sb	a4,0(a5)
    80001814:	0007c783          	lbu	a5,0(a5)
    80001818:	f7e1                	bnez	a5,800017e0 <safestrcpy+0x30>
    ;
  *s = 0;
    8000181a:	fd843783          	ld	a5,-40(s0)
    8000181e:	00078023          	sb	zero,0(a5)
  return os;
    80001822:	fe843783          	ld	a5,-24(s0)
}
    80001826:	853e                	mv	a0,a5
    80001828:	70e2                	ld	ra,56(sp)
    8000182a:	7442                	ld	s0,48(sp)
    8000182c:	6121                	addi	sp,sp,64
    8000182e:	8082                	ret

0000000080001830 <strlen>:

int
strlen(const char *s)
{
    80001830:	7179                	addi	sp,sp,-48
    80001832:	f406                	sd	ra,40(sp)
    80001834:	f022                	sd	s0,32(sp)
    80001836:	1800                	addi	s0,sp,48
    80001838:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    8000183c:	fe042623          	sw	zero,-20(s0)
    80001840:	a031                	j	8000184c <strlen+0x1c>
    80001842:	fec42783          	lw	a5,-20(s0)
    80001846:	2785                	addiw	a5,a5,1
    80001848:	fef42623          	sw	a5,-20(s0)
    8000184c:	fec42783          	lw	a5,-20(s0)
    80001850:	fd843703          	ld	a4,-40(s0)
    80001854:	97ba                	add	a5,a5,a4
    80001856:	0007c783          	lbu	a5,0(a5)
    8000185a:	f7e5                	bnez	a5,80001842 <strlen+0x12>
    ;
  return n;
    8000185c:	fec42783          	lw	a5,-20(s0)
}
    80001860:	853e                	mv	a0,a5
    80001862:	70a2                	ld	ra,40(sp)
    80001864:	7402                	ld	s0,32(sp)
    80001866:	6145                	addi	sp,sp,48
    80001868:	8082                	ret

000000008000186a <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    8000186a:	1141                	addi	sp,sp,-16
    8000186c:	e406                	sd	ra,8(sp)
    8000186e:	e022                	sd	s0,0(sp)
    80001870:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    80001872:	00001097          	auipc	ra,0x1
    80001876:	fec080e7          	jalr	-20(ra) # 8000285e <cpuid>
    8000187a:	87aa                	mv	a5,a0
    8000187c:	efd5                	bnez	a5,80001938 <main+0xce>
    consoleinit();
    8000187e:	fffff097          	auipc	ra,0xfffff
    80001882:	020080e7          	jalr	32(ra) # 8000089e <consoleinit>
    printfinit();
    80001886:	fffff097          	auipc	ra,0xfffff
    8000188a:	48e080e7          	jalr	1166(ra) # 80000d14 <printfinit>
    printf("\n");
    8000188e:	00009517          	auipc	a0,0x9
    80001892:	7f250513          	addi	a0,a0,2034 # 8000b080 <etext+0x80>
    80001896:	fffff097          	auipc	ra,0xfffff
    8000189a:	1d4080e7          	jalr	468(ra) # 80000a6a <printf>
    printf("xv6 kernel is booting\n");
    8000189e:	00009517          	auipc	a0,0x9
    800018a2:	7ea50513          	addi	a0,a0,2026 # 8000b088 <etext+0x88>
    800018a6:	fffff097          	auipc	ra,0xfffff
    800018aa:	1c4080e7          	jalr	452(ra) # 80000a6a <printf>
    printf("\n");
    800018ae:	00009517          	auipc	a0,0x9
    800018b2:	7d250513          	addi	a0,a0,2002 # 8000b080 <etext+0x80>
    800018b6:	fffff097          	auipc	ra,0xfffff
    800018ba:	1b4080e7          	jalr	436(ra) # 80000a6a <printf>
    kinit();         // physical page allocator
    800018be:	fffff097          	auipc	ra,0xfffff
    800018c2:	76a080e7          	jalr	1898(ra) # 80001028 <kinit>
    kvminit();       // create kernel page table
    800018c6:	00000097          	auipc	ra,0x0
    800018ca:	1fc080e7          	jalr	508(ra) # 80001ac2 <kvminit>
    kvminithart();   // turn on paging
    800018ce:	00000097          	auipc	ra,0x0
    800018d2:	21a080e7          	jalr	538(ra) # 80001ae8 <kvminithart>
    procinit();      // process table
    800018d6:	00001097          	auipc	ra,0x1
    800018da:	eba080e7          	jalr	-326(ra) # 80002790 <procinit>
    trapinit();      // trap vectors
    800018de:	00002097          	auipc	ra,0x2
    800018e2:	288080e7          	jalr	648(ra) # 80003b66 <trapinit>
    trapinithart();  // install kernel trap vector
    800018e6:	00002097          	auipc	ra,0x2
    800018ea:	2aa080e7          	jalr	682(ra) # 80003b90 <trapinithart>
    plicinit();      // set up interrupt controller
    800018ee:	00007097          	auipc	ra,0x7
    800018f2:	04c080e7          	jalr	76(ra) # 8000893a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    800018f6:	00007097          	auipc	ra,0x7
    800018fa:	06c080e7          	jalr	108(ra) # 80008962 <plicinithart>
    binit();         // buffer cache
    800018fe:	00003097          	auipc	ra,0x3
    80001902:	c9a080e7          	jalr	-870(ra) # 80004598 <binit>
    iinit();         // inode table
    80001906:	00003097          	auipc	ra,0x3
    8000190a:	4c8080e7          	jalr	1224(ra) # 80004dce <iinit>
    fileinit();      // file table
    8000190e:	00005097          	auipc	ra,0x5
    80001912:	e72080e7          	jalr	-398(ra) # 80006780 <fileinit>
    virtio_disk_init(); // emulated hard disk
    80001916:	00007097          	auipc	ra,0x7
    8000191a:	120080e7          	jalr	288(ra) # 80008a36 <virtio_disk_init>
    userinit();      // first user process
    8000191e:	00001097          	auipc	ra,0x1
    80001922:	31e080e7          	jalr	798(ra) # 80002c3c <userinit>
    __sync_synchronize();
    80001926:	0330000f          	fence	rw,rw
    started = 1;
    8000192a:	00015797          	auipc	a5,0x15
    8000192e:	88678793          	addi	a5,a5,-1914 # 800161b0 <started>
    80001932:	4705                	li	a4,1
    80001934:	c398                	sw	a4,0(a5)
    80001936:	a0a9                	j	80001980 <main+0x116>
  } else {
    while(started == 0)
    80001938:	0001                	nop
    8000193a:	00015797          	auipc	a5,0x15
    8000193e:	87678793          	addi	a5,a5,-1930 # 800161b0 <started>
    80001942:	439c                	lw	a5,0(a5)
    80001944:	2781                	sext.w	a5,a5
    80001946:	dbf5                	beqz	a5,8000193a <main+0xd0>
      ;
    __sync_synchronize();
    80001948:	0330000f          	fence	rw,rw
    printf("hart %d starting\n", cpuid());
    8000194c:	00001097          	auipc	ra,0x1
    80001950:	f12080e7          	jalr	-238(ra) # 8000285e <cpuid>
    80001954:	87aa                	mv	a5,a0
    80001956:	85be                	mv	a1,a5
    80001958:	00009517          	auipc	a0,0x9
    8000195c:	74850513          	addi	a0,a0,1864 # 8000b0a0 <etext+0xa0>
    80001960:	fffff097          	auipc	ra,0xfffff
    80001964:	10a080e7          	jalr	266(ra) # 80000a6a <printf>
    kvminithart();    // turn on paging
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	180080e7          	jalr	384(ra) # 80001ae8 <kvminithart>
    trapinithart();   // install kernel trap vector
    80001970:	00002097          	auipc	ra,0x2
    80001974:	220080e7          	jalr	544(ra) # 80003b90 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001978:	00007097          	auipc	ra,0x7
    8000197c:	fea080e7          	jalr	-22(ra) # 80008962 <plicinithart>
  }

  scheduler();        
    80001980:	00002097          	auipc	ra,0x2
    80001984:	8d0080e7          	jalr	-1840(ra) # 80003250 <scheduler>

0000000080001988 <w_satp>:
{
    80001988:	1101                	addi	sp,sp,-32
    8000198a:	ec06                	sd	ra,24(sp)
    8000198c:	e822                	sd	s0,16(sp)
    8000198e:	1000                	addi	s0,sp,32
    80001990:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80001994:	fe843783          	ld	a5,-24(s0)
    80001998:	18079073          	csrw	satp,a5
}
    8000199c:	0001                	nop
    8000199e:	60e2                	ld	ra,24(sp)
    800019a0:	6442                	ld	s0,16(sp)
    800019a2:	6105                	addi	sp,sp,32
    800019a4:	8082                	ret

00000000800019a6 <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    800019a6:	1141                	addi	sp,sp,-16
    800019a8:	e406                	sd	ra,8(sp)
    800019aa:	e022                	sd	s0,0(sp)
    800019ac:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    800019ae:	12000073          	sfence.vma
}
    800019b2:	0001                	nop
    800019b4:	60a2                	ld	ra,8(sp)
    800019b6:	6402                	ld	s0,0(sp)
    800019b8:	0141                	addi	sp,sp,16
    800019ba:	8082                	ret

00000000800019bc <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    800019bc:	1101                	addi	sp,sp,-32
    800019be:	ec06                	sd	ra,24(sp)
    800019c0:	e822                	sd	s0,16(sp)
    800019c2:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    800019c4:	fffff097          	auipc	ra,0xfffff
    800019c8:	7a0080e7          	jalr	1952(ra) # 80001164 <kalloc>
    800019cc:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    800019d0:	6605                	lui	a2,0x1
    800019d2:	4581                	li	a1,0
    800019d4:	fe843503          	ld	a0,-24(s0)
    800019d8:	00000097          	auipc	ra,0x0
    800019dc:	ac0080e7          	jalr	-1344(ra) # 80001498 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    800019e0:	4719                	li	a4,6
    800019e2:	6685                	lui	a3,0x1
    800019e4:	10000637          	lui	a2,0x10000
    800019e8:	100005b7          	lui	a1,0x10000
    800019ec:	fe843503          	ld	a0,-24(s0)
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	2a2080e7          	jalr	674(ra) # 80001c92 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    800019f8:	4719                	li	a4,6
    800019fa:	6685                	lui	a3,0x1
    800019fc:	10001637          	lui	a2,0x10001
    80001a00:	100015b7          	lui	a1,0x10001
    80001a04:	fe843503          	ld	a0,-24(s0)
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	28a080e7          	jalr	650(ra) # 80001c92 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001a10:	4719                	li	a4,6
    80001a12:	004006b7          	lui	a3,0x400
    80001a16:	0c000637          	lui	a2,0xc000
    80001a1a:	0c0005b7          	lui	a1,0xc000
    80001a1e:	fe843503          	ld	a0,-24(s0)
    80001a22:	00000097          	auipc	ra,0x0
    80001a26:	270080e7          	jalr	624(ra) # 80001c92 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001a2a:	00009717          	auipc	a4,0x9
    80001a2e:	5d670713          	addi	a4,a4,1494 # 8000b000 <etext>
    80001a32:	800007b7          	lui	a5,0x80000
    80001a36:	97ba                	add	a5,a5,a4
    80001a38:	4729                	li	a4,10
    80001a3a:	86be                	mv	a3,a5
    80001a3c:	4785                	li	a5,1
    80001a3e:	01f79613          	slli	a2,a5,0x1f
    80001a42:	4785                	li	a5,1
    80001a44:	01f79593          	slli	a1,a5,0x1f
    80001a48:	fe843503          	ld	a0,-24(s0)
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	246080e7          	jalr	582(ra) # 80001c92 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001a54:	00009597          	auipc	a1,0x9
    80001a58:	5ac58593          	addi	a1,a1,1452 # 8000b000 <etext>
    80001a5c:	00009617          	auipc	a2,0x9
    80001a60:	5a460613          	addi	a2,a2,1444 # 8000b000 <etext>
    80001a64:	00009797          	auipc	a5,0x9
    80001a68:	59c78793          	addi	a5,a5,1436 # 8000b000 <etext>
    80001a6c:	4745                	li	a4,17
    80001a6e:	076e                	slli	a4,a4,0x1b
    80001a70:	40f707b3          	sub	a5,a4,a5
    80001a74:	4719                	li	a4,6
    80001a76:	86be                	mv	a3,a5
    80001a78:	fe843503          	ld	a0,-24(s0)
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	216080e7          	jalr	534(ra) # 80001c92 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a84:	00008797          	auipc	a5,0x8
    80001a88:	57c78793          	addi	a5,a5,1404 # 8000a000 <_trampoline>
    80001a8c:	4729                	li	a4,10
    80001a8e:	6685                	lui	a3,0x1
    80001a90:	863e                	mv	a2,a5
    80001a92:	040007b7          	lui	a5,0x4000
    80001a96:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80001a98:	00c79593          	slli	a1,a5,0xc
    80001a9c:	fe843503          	ld	a0,-24(s0)
    80001aa0:	00000097          	auipc	ra,0x0
    80001aa4:	1f2080e7          	jalr	498(ra) # 80001c92 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001aa8:	fe843503          	ld	a0,-24(s0)
    80001aac:	00001097          	auipc	ra,0x1
    80001ab0:	c28080e7          	jalr	-984(ra) # 800026d4 <proc_mapstacks>
  
  return kpgtbl;
    80001ab4:	fe843783          	ld	a5,-24(s0)
}
    80001ab8:	853e                	mv	a0,a5
    80001aba:	60e2                	ld	ra,24(sp)
    80001abc:	6442                	ld	s0,16(sp)
    80001abe:	6105                	addi	sp,sp,32
    80001ac0:	8082                	ret

0000000080001ac2 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001ac2:	1141                	addi	sp,sp,-16
    80001ac4:	e406                	sd	ra,8(sp)
    80001ac6:	e022                	sd	s0,0(sp)
    80001ac8:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001aca:	00000097          	auipc	ra,0x0
    80001ace:	ef2080e7          	jalr	-270(ra) # 800019bc <kvmmake>
    80001ad2:	872a                	mv	a4,a0
    80001ad4:	0000c797          	auipc	a5,0xc
    80001ad8:	46478793          	addi	a5,a5,1124 # 8000df38 <kernel_pagetable>
    80001adc:	e398                	sd	a4,0(a5)
}
    80001ade:	0001                	nop
    80001ae0:	60a2                	ld	ra,8(sp)
    80001ae2:	6402                	ld	s0,0(sp)
    80001ae4:	0141                	addi	sp,sp,16
    80001ae6:	8082                	ret

0000000080001ae8 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001ae8:	1141                	addi	sp,sp,-16
    80001aea:	e406                	sd	ra,8(sp)
    80001aec:	e022                	sd	s0,0(sp)
    80001aee:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80001af0:	00000097          	auipc	ra,0x0
    80001af4:	eb6080e7          	jalr	-330(ra) # 800019a6 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80001af8:	0000c797          	auipc	a5,0xc
    80001afc:	44078793          	addi	a5,a5,1088 # 8000df38 <kernel_pagetable>
    80001b00:	639c                	ld	a5,0(a5)
    80001b02:	00c7d713          	srli	a4,a5,0xc
    80001b06:	57fd                	li	a5,-1
    80001b08:	17fe                	slli	a5,a5,0x3f
    80001b0a:	8fd9                	or	a5,a5,a4
    80001b0c:	853e                	mv	a0,a5
    80001b0e:	00000097          	auipc	ra,0x0
    80001b12:	e7a080e7          	jalr	-390(ra) # 80001988 <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80001b16:	00000097          	auipc	ra,0x0
    80001b1a:	e90080e7          	jalr	-368(ra) # 800019a6 <sfence_vma>
}
    80001b1e:	0001                	nop
    80001b20:	60a2                	ld	ra,8(sp)
    80001b22:	6402                	ld	s0,0(sp)
    80001b24:	0141                	addi	sp,sp,16
    80001b26:	8082                	ret

0000000080001b28 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001b28:	7139                	addi	sp,sp,-64
    80001b2a:	fc06                	sd	ra,56(sp)
    80001b2c:	f822                	sd	s0,48(sp)
    80001b2e:	0080                	addi	s0,sp,64
    80001b30:	fca43c23          	sd	a0,-40(s0)
    80001b34:	fcb43823          	sd	a1,-48(s0)
    80001b38:	87b2                	mv	a5,a2
    80001b3a:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001b3e:	fd043703          	ld	a4,-48(s0)
    80001b42:	57fd                	li	a5,-1
    80001b44:	83e9                	srli	a5,a5,0x1a
    80001b46:	00e7fa63          	bgeu	a5,a4,80001b5a <walk+0x32>
    panic("walk");
    80001b4a:	00009517          	auipc	a0,0x9
    80001b4e:	56e50513          	addi	a0,a0,1390 # 8000b0b8 <etext+0xb8>
    80001b52:	fffff097          	auipc	ra,0xfffff
    80001b56:	16e080e7          	jalr	366(ra) # 80000cc0 <panic>

  for(int level = 2; level > 0; level--) {
    80001b5a:	4789                	li	a5,2
    80001b5c:	fef42623          	sw	a5,-20(s0)
    80001b60:	a851                	j	80001bf4 <walk+0xcc>
    pte_t *pte = &pagetable[PX(level, va)];
    80001b62:	fec42783          	lw	a5,-20(s0)
    80001b66:	873e                	mv	a4,a5
    80001b68:	87ba                	mv	a5,a4
    80001b6a:	0037979b          	slliw	a5,a5,0x3
    80001b6e:	9fb9                	addw	a5,a5,a4
    80001b70:	2781                	sext.w	a5,a5
    80001b72:	27b1                	addiw	a5,a5,12
    80001b74:	2781                	sext.w	a5,a5
    80001b76:	873e                	mv	a4,a5
    80001b78:	fd043783          	ld	a5,-48(s0)
    80001b7c:	00e7d7b3          	srl	a5,a5,a4
    80001b80:	1ff7f793          	andi	a5,a5,511
    80001b84:	078e                	slli	a5,a5,0x3
    80001b86:	fd843703          	ld	a4,-40(s0)
    80001b8a:	97ba                	add	a5,a5,a4
    80001b8c:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b90:	fe043783          	ld	a5,-32(s0)
    80001b94:	639c                	ld	a5,0(a5)
    80001b96:	8b85                	andi	a5,a5,1
    80001b98:	cb89                	beqz	a5,80001baa <walk+0x82>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b9a:	fe043783          	ld	a5,-32(s0)
    80001b9e:	639c                	ld	a5,0(a5)
    80001ba0:	83a9                	srli	a5,a5,0xa
    80001ba2:	07b2                	slli	a5,a5,0xc
    80001ba4:	fcf43c23          	sd	a5,-40(s0)
    80001ba8:	a089                	j	80001bea <walk+0xc2>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001baa:	fcc42783          	lw	a5,-52(s0)
    80001bae:	2781                	sext.w	a5,a5
    80001bb0:	cb91                	beqz	a5,80001bc4 <walk+0x9c>
    80001bb2:	fffff097          	auipc	ra,0xfffff
    80001bb6:	5b2080e7          	jalr	1458(ra) # 80001164 <kalloc>
    80001bba:	fca43c23          	sd	a0,-40(s0)
    80001bbe:	fd843783          	ld	a5,-40(s0)
    80001bc2:	e399                	bnez	a5,80001bc8 <walk+0xa0>
        return 0;
    80001bc4:	4781                	li	a5,0
    80001bc6:	a0a9                	j	80001c10 <walk+0xe8>
      memset(pagetable, 0, PGSIZE);
    80001bc8:	6605                	lui	a2,0x1
    80001bca:	4581                	li	a1,0
    80001bcc:	fd843503          	ld	a0,-40(s0)
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	8c8080e7          	jalr	-1848(ra) # 80001498 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001bd8:	fd843783          	ld	a5,-40(s0)
    80001bdc:	83b1                	srli	a5,a5,0xc
    80001bde:	07aa                	slli	a5,a5,0xa
    80001be0:	0017e713          	ori	a4,a5,1
    80001be4:	fe043783          	ld	a5,-32(s0)
    80001be8:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001bea:	fec42783          	lw	a5,-20(s0)
    80001bee:	37fd                	addiw	a5,a5,-1
    80001bf0:	fef42623          	sw	a5,-20(s0)
    80001bf4:	fec42783          	lw	a5,-20(s0)
    80001bf8:	2781                	sext.w	a5,a5
    80001bfa:	f6f044e3          	bgtz	a5,80001b62 <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001bfe:	fd043783          	ld	a5,-48(s0)
    80001c02:	83b1                	srli	a5,a5,0xc
    80001c04:	1ff7f793          	andi	a5,a5,511
    80001c08:	078e                	slli	a5,a5,0x3
    80001c0a:	fd843703          	ld	a4,-40(s0)
    80001c0e:	97ba                	add	a5,a5,a4
}
    80001c10:	853e                	mv	a0,a5
    80001c12:	70e2                	ld	ra,56(sp)
    80001c14:	7442                	ld	s0,48(sp)
    80001c16:	6121                	addi	sp,sp,64
    80001c18:	8082                	ret

0000000080001c1a <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001c1a:	7179                	addi	sp,sp,-48
    80001c1c:	f406                	sd	ra,40(sp)
    80001c1e:	f022                	sd	s0,32(sp)
    80001c20:	1800                	addi	s0,sp,48
    80001c22:	fca43c23          	sd	a0,-40(s0)
    80001c26:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001c2a:	fd043703          	ld	a4,-48(s0)
    80001c2e:	57fd                	li	a5,-1
    80001c30:	83e9                	srli	a5,a5,0x1a
    80001c32:	00e7f463          	bgeu	a5,a4,80001c3a <walkaddr+0x20>
    return 0;
    80001c36:	4781                	li	a5,0
    80001c38:	a881                	j	80001c88 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001c3a:	4601                	li	a2,0
    80001c3c:	fd043583          	ld	a1,-48(s0)
    80001c40:	fd843503          	ld	a0,-40(s0)
    80001c44:	00000097          	auipc	ra,0x0
    80001c48:	ee4080e7          	jalr	-284(ra) # 80001b28 <walk>
    80001c4c:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001c50:	fe843783          	ld	a5,-24(s0)
    80001c54:	e399                	bnez	a5,80001c5a <walkaddr+0x40>
    return 0;
    80001c56:	4781                	li	a5,0
    80001c58:	a805                	j	80001c88 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001c5a:	fe843783          	ld	a5,-24(s0)
    80001c5e:	639c                	ld	a5,0(a5)
    80001c60:	8b85                	andi	a5,a5,1
    80001c62:	e399                	bnez	a5,80001c68 <walkaddr+0x4e>
    return 0;
    80001c64:	4781                	li	a5,0
    80001c66:	a00d                	j	80001c88 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001c68:	fe843783          	ld	a5,-24(s0)
    80001c6c:	639c                	ld	a5,0(a5)
    80001c6e:	8bc1                	andi	a5,a5,16
    80001c70:	e399                	bnez	a5,80001c76 <walkaddr+0x5c>
    return 0;
    80001c72:	4781                	li	a5,0
    80001c74:	a811                	j	80001c88 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001c76:	fe843783          	ld	a5,-24(s0)
    80001c7a:	639c                	ld	a5,0(a5)
    80001c7c:	83a9                	srli	a5,a5,0xa
    80001c7e:	07b2                	slli	a5,a5,0xc
    80001c80:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001c84:	fe043783          	ld	a5,-32(s0)
}
    80001c88:	853e                	mv	a0,a5
    80001c8a:	70a2                	ld	ra,40(sp)
    80001c8c:	7402                	ld	s0,32(sp)
    80001c8e:	6145                	addi	sp,sp,48
    80001c90:	8082                	ret

0000000080001c92 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c92:	7139                	addi	sp,sp,-64
    80001c94:	fc06                	sd	ra,56(sp)
    80001c96:	f822                	sd	s0,48(sp)
    80001c98:	0080                	addi	s0,sp,64
    80001c9a:	fea43423          	sd	a0,-24(s0)
    80001c9e:	feb43023          	sd	a1,-32(s0)
    80001ca2:	fcc43c23          	sd	a2,-40(s0)
    80001ca6:	fcd43823          	sd	a3,-48(s0)
    80001caa:	87ba                	mv	a5,a4
    80001cac:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001cb0:	fcc42783          	lw	a5,-52(s0)
    80001cb4:	873e                	mv	a4,a5
    80001cb6:	fd843683          	ld	a3,-40(s0)
    80001cba:	fd043603          	ld	a2,-48(s0)
    80001cbe:	fe043583          	ld	a1,-32(s0)
    80001cc2:	fe843503          	ld	a0,-24(s0)
    80001cc6:	00000097          	auipc	ra,0x0
    80001cca:	026080e7          	jalr	38(ra) # 80001cec <mappages>
    80001cce:	87aa                	mv	a5,a0
    80001cd0:	cb89                	beqz	a5,80001ce2 <kvmmap+0x50>
    panic("kvmmap");
    80001cd2:	00009517          	auipc	a0,0x9
    80001cd6:	3ee50513          	addi	a0,a0,1006 # 8000b0c0 <etext+0xc0>
    80001cda:	fffff097          	auipc	ra,0xfffff
    80001cde:	fe6080e7          	jalr	-26(ra) # 80000cc0 <panic>
}
    80001ce2:	0001                	nop
    80001ce4:	70e2                	ld	ra,56(sp)
    80001ce6:	7442                	ld	s0,48(sp)
    80001ce8:	6121                	addi	sp,sp,64
    80001cea:	8082                	ret

0000000080001cec <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001cec:	711d                	addi	sp,sp,-96
    80001cee:	ec86                	sd	ra,88(sp)
    80001cf0:	e8a2                	sd	s0,80(sp)
    80001cf2:	1080                	addi	s0,sp,96
    80001cf4:	fca43423          	sd	a0,-56(s0)
    80001cf8:	fcb43023          	sd	a1,-64(s0)
    80001cfc:	fac43c23          	sd	a2,-72(s0)
    80001d00:	fad43823          	sd	a3,-80(s0)
    80001d04:	87ba                	mv	a5,a4
    80001d06:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001d0a:	fb843783          	ld	a5,-72(s0)
    80001d0e:	eb89                	bnez	a5,80001d20 <mappages+0x34>
    panic("mappages: size");
    80001d10:	00009517          	auipc	a0,0x9
    80001d14:	3b850513          	addi	a0,a0,952 # 8000b0c8 <etext+0xc8>
    80001d18:	fffff097          	auipc	ra,0xfffff
    80001d1c:	fa8080e7          	jalr	-88(ra) # 80000cc0 <panic>
  
  a = PGROUNDDOWN(va);
    80001d20:	fc043703          	ld	a4,-64(s0)
    80001d24:	77fd                	lui	a5,0xfffff
    80001d26:	8ff9                	and	a5,a5,a4
    80001d28:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001d2c:	fc043703          	ld	a4,-64(s0)
    80001d30:	fb843783          	ld	a5,-72(s0)
    80001d34:	97ba                	add	a5,a5,a4
    80001d36:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd7c37>
    80001d3a:	77fd                	lui	a5,0xfffff
    80001d3c:	8ff9                	and	a5,a5,a4
    80001d3e:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d42:	4605                	li	a2,1
    80001d44:	fe843583          	ld	a1,-24(s0)
    80001d48:	fc843503          	ld	a0,-56(s0)
    80001d4c:	00000097          	auipc	ra,0x0
    80001d50:	ddc080e7          	jalr	-548(ra) # 80001b28 <walk>
    80001d54:	fca43c23          	sd	a0,-40(s0)
    80001d58:	fd843783          	ld	a5,-40(s0)
    80001d5c:	e399                	bnez	a5,80001d62 <mappages+0x76>
      return -1;
    80001d5e:	57fd                	li	a5,-1
    80001d60:	a085                	j	80001dc0 <mappages+0xd4>
    if(*pte & PTE_V)
    80001d62:	fd843783          	ld	a5,-40(s0)
    80001d66:	639c                	ld	a5,0(a5)
    80001d68:	8b85                	andi	a5,a5,1
    80001d6a:	cb89                	beqz	a5,80001d7c <mappages+0x90>
      panic("mappages: remap");
    80001d6c:	00009517          	auipc	a0,0x9
    80001d70:	36c50513          	addi	a0,a0,876 # 8000b0d8 <etext+0xd8>
    80001d74:	fffff097          	auipc	ra,0xfffff
    80001d78:	f4c080e7          	jalr	-180(ra) # 80000cc0 <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001d7c:	fb043783          	ld	a5,-80(s0)
    80001d80:	83b1                	srli	a5,a5,0xc
    80001d82:	00a79713          	slli	a4,a5,0xa
    80001d86:	fac42783          	lw	a5,-84(s0)
    80001d8a:	8fd9                	or	a5,a5,a4
    80001d8c:	0017e713          	ori	a4,a5,1
    80001d90:	fd843783          	ld	a5,-40(s0)
    80001d94:	e398                	sd	a4,0(a5)
    if(a == last)
    80001d96:	fe843703          	ld	a4,-24(s0)
    80001d9a:	fe043783          	ld	a5,-32(s0)
    80001d9e:	00f70f63          	beq	a4,a5,80001dbc <mappages+0xd0>
      break;
    a += PGSIZE;
    80001da2:	fe843703          	ld	a4,-24(s0)
    80001da6:	6785                	lui	a5,0x1
    80001da8:	97ba                	add	a5,a5,a4
    80001daa:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001dae:	fb043703          	ld	a4,-80(s0)
    80001db2:	6785                	lui	a5,0x1
    80001db4:	97ba                	add	a5,a5,a4
    80001db6:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001dba:	b761                	j	80001d42 <mappages+0x56>
      break;
    80001dbc:	0001                	nop
  }
  return 0;
    80001dbe:	4781                	li	a5,0
}
    80001dc0:	853e                	mv	a0,a5
    80001dc2:	60e6                	ld	ra,88(sp)
    80001dc4:	6446                	ld	s0,80(sp)
    80001dc6:	6125                	addi	sp,sp,96
    80001dc8:	8082                	ret

0000000080001dca <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001dca:	715d                	addi	sp,sp,-80
    80001dcc:	e486                	sd	ra,72(sp)
    80001dce:	e0a2                	sd	s0,64(sp)
    80001dd0:	0880                	addi	s0,sp,80
    80001dd2:	fca43423          	sd	a0,-56(s0)
    80001dd6:	fcb43023          	sd	a1,-64(s0)
    80001dda:	fac43c23          	sd	a2,-72(s0)
    80001dde:	87b6                	mv	a5,a3
    80001de0:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001de4:	fc043703          	ld	a4,-64(s0)
    80001de8:	6785                	lui	a5,0x1
    80001dea:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001dec:	8ff9                	and	a5,a5,a4
    80001dee:	cb89                	beqz	a5,80001e00 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001df0:	00009517          	auipc	a0,0x9
    80001df4:	2f850513          	addi	a0,a0,760 # 8000b0e8 <etext+0xe8>
    80001df8:	fffff097          	auipc	ra,0xfffff
    80001dfc:	ec8080e7          	jalr	-312(ra) # 80000cc0 <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e00:	fc043783          	ld	a5,-64(s0)
    80001e04:	fef43423          	sd	a5,-24(s0)
    80001e08:	a045                	j	80001ea8 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001e0a:	4601                	li	a2,0
    80001e0c:	fe843583          	ld	a1,-24(s0)
    80001e10:	fc843503          	ld	a0,-56(s0)
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	d14080e7          	jalr	-748(ra) # 80001b28 <walk>
    80001e1c:	fea43023          	sd	a0,-32(s0)
    80001e20:	fe043783          	ld	a5,-32(s0)
    80001e24:	eb89                	bnez	a5,80001e36 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001e26:	00009517          	auipc	a0,0x9
    80001e2a:	2da50513          	addi	a0,a0,730 # 8000b100 <etext+0x100>
    80001e2e:	fffff097          	auipc	ra,0xfffff
    80001e32:	e92080e7          	jalr	-366(ra) # 80000cc0 <panic>
    if((*pte & PTE_V) == 0)
    80001e36:	fe043783          	ld	a5,-32(s0)
    80001e3a:	639c                	ld	a5,0(a5)
    80001e3c:	8b85                	andi	a5,a5,1
    80001e3e:	eb89                	bnez	a5,80001e50 <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001e40:	00009517          	auipc	a0,0x9
    80001e44:	2d050513          	addi	a0,a0,720 # 8000b110 <etext+0x110>
    80001e48:	fffff097          	auipc	ra,0xfffff
    80001e4c:	e78080e7          	jalr	-392(ra) # 80000cc0 <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001e50:	fe043783          	ld	a5,-32(s0)
    80001e54:	639c                	ld	a5,0(a5)
    80001e56:	3ff7f713          	andi	a4,a5,1023
    80001e5a:	4785                	li	a5,1
    80001e5c:	00f71a63          	bne	a4,a5,80001e70 <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001e60:	00009517          	auipc	a0,0x9
    80001e64:	2c850513          	addi	a0,a0,712 # 8000b128 <etext+0x128>
    80001e68:	fffff097          	auipc	ra,0xfffff
    80001e6c:	e58080e7          	jalr	-424(ra) # 80000cc0 <panic>
    if(do_free){
    80001e70:	fb442783          	lw	a5,-76(s0)
    80001e74:	2781                	sext.w	a5,a5
    80001e76:	cf99                	beqz	a5,80001e94 <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001e78:	fe043783          	ld	a5,-32(s0)
    80001e7c:	639c                	ld	a5,0(a5)
    80001e7e:	83a9                	srli	a5,a5,0xa
    80001e80:	07b2                	slli	a5,a5,0xc
    80001e82:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001e86:	fd843783          	ld	a5,-40(s0)
    80001e8a:	853e                	mv	a0,a5
    80001e8c:	fffff097          	auipc	ra,0xfffff
    80001e90:	234080e7          	jalr	564(ra) # 800010c0 <kfree>
    }
    *pte = 0;
    80001e94:	fe043783          	ld	a5,-32(s0)
    80001e98:	0007b023          	sd	zero,0(a5)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e9c:	fe843703          	ld	a4,-24(s0)
    80001ea0:	6785                	lui	a5,0x1
    80001ea2:	97ba                	add	a5,a5,a4
    80001ea4:	fef43423          	sd	a5,-24(s0)
    80001ea8:	fb843783          	ld	a5,-72(s0)
    80001eac:	00c79713          	slli	a4,a5,0xc
    80001eb0:	fc043783          	ld	a5,-64(s0)
    80001eb4:	97ba                	add	a5,a5,a4
    80001eb6:	fe843703          	ld	a4,-24(s0)
    80001eba:	f4f768e3          	bltu	a4,a5,80001e0a <uvmunmap+0x40>
  }
}
    80001ebe:	0001                	nop
    80001ec0:	0001                	nop
    80001ec2:	60a6                	ld	ra,72(sp)
    80001ec4:	6406                	ld	s0,64(sp)
    80001ec6:	6161                	addi	sp,sp,80
    80001ec8:	8082                	ret

0000000080001eca <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001eca:	1101                	addi	sp,sp,-32
    80001ecc:	ec06                	sd	ra,24(sp)
    80001ece:	e822                	sd	s0,16(sp)
    80001ed0:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001ed2:	fffff097          	auipc	ra,0xfffff
    80001ed6:	292080e7          	jalr	658(ra) # 80001164 <kalloc>
    80001eda:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001ede:	fe843783          	ld	a5,-24(s0)
    80001ee2:	e399                	bnez	a5,80001ee8 <uvmcreate+0x1e>
    return 0;
    80001ee4:	4781                	li	a5,0
    80001ee6:	a819                	j	80001efc <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001ee8:	6605                	lui	a2,0x1
    80001eea:	4581                	li	a1,0
    80001eec:	fe843503          	ld	a0,-24(s0)
    80001ef0:	fffff097          	auipc	ra,0xfffff
    80001ef4:	5a8080e7          	jalr	1448(ra) # 80001498 <memset>
  return pagetable;
    80001ef8:	fe843783          	ld	a5,-24(s0)
}
    80001efc:	853e                	mv	a0,a5
    80001efe:	60e2                	ld	ra,24(sp)
    80001f00:	6442                	ld	s0,16(sp)
    80001f02:	6105                	addi	sp,sp,32
    80001f04:	8082                	ret

0000000080001f06 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    80001f06:	7139                	addi	sp,sp,-64
    80001f08:	fc06                	sd	ra,56(sp)
    80001f0a:	f822                	sd	s0,48(sp)
    80001f0c:	0080                	addi	s0,sp,64
    80001f0e:	fca43c23          	sd	a0,-40(s0)
    80001f12:	fcb43823          	sd	a1,-48(s0)
    80001f16:	87b2                	mv	a5,a2
    80001f18:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001f1c:	fcc42783          	lw	a5,-52(s0)
    80001f20:	0007871b          	sext.w	a4,a5
    80001f24:	6785                	lui	a5,0x1
    80001f26:	00f76a63          	bltu	a4,a5,80001f3a <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    80001f2a:	00009517          	auipc	a0,0x9
    80001f2e:	21650513          	addi	a0,a0,534 # 8000b140 <etext+0x140>
    80001f32:	fffff097          	auipc	ra,0xfffff
    80001f36:	d8e080e7          	jalr	-626(ra) # 80000cc0 <panic>
  mem = kalloc();
    80001f3a:	fffff097          	auipc	ra,0xfffff
    80001f3e:	22a080e7          	jalr	554(ra) # 80001164 <kalloc>
    80001f42:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001f46:	6605                	lui	a2,0x1
    80001f48:	4581                	li	a1,0
    80001f4a:	fe843503          	ld	a0,-24(s0)
    80001f4e:	fffff097          	auipc	ra,0xfffff
    80001f52:	54a080e7          	jalr	1354(ra) # 80001498 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001f56:	fe843783          	ld	a5,-24(s0)
    80001f5a:	4779                	li	a4,30
    80001f5c:	86be                	mv	a3,a5
    80001f5e:	6605                	lui	a2,0x1
    80001f60:	4581                	li	a1,0
    80001f62:	fd843503          	ld	a0,-40(s0)
    80001f66:	00000097          	auipc	ra,0x0
    80001f6a:	d86080e7          	jalr	-634(ra) # 80001cec <mappages>
  memmove(mem, src, sz);
    80001f6e:	fcc42783          	lw	a5,-52(s0)
    80001f72:	863e                	mv	a2,a5
    80001f74:	fd043583          	ld	a1,-48(s0)
    80001f78:	fe843503          	ld	a0,-24(s0)
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	608080e7          	jalr	1544(ra) # 80001584 <memmove>
}
    80001f84:	0001                	nop
    80001f86:	70e2                	ld	ra,56(sp)
    80001f88:	7442                	ld	s0,48(sp)
    80001f8a:	6121                	addi	sp,sp,64
    80001f8c:	8082                	ret

0000000080001f8e <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    80001f8e:	7139                	addi	sp,sp,-64
    80001f90:	fc06                	sd	ra,56(sp)
    80001f92:	f822                	sd	s0,48(sp)
    80001f94:	0080                	addi	s0,sp,64
    80001f96:	fca43c23          	sd	a0,-40(s0)
    80001f9a:	fcb43823          	sd	a1,-48(s0)
    80001f9e:	fcc43423          	sd	a2,-56(s0)
    80001fa2:	87b6                	mv	a5,a3
    80001fa4:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001fa8:	fc843703          	ld	a4,-56(s0)
    80001fac:	fd043783          	ld	a5,-48(s0)
    80001fb0:	00f77563          	bgeu	a4,a5,80001fba <uvmalloc+0x2c>
    return oldsz;
    80001fb4:	fd043783          	ld	a5,-48(s0)
    80001fb8:	a87d                	j	80002076 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    80001fba:	fd043703          	ld	a4,-48(s0)
    80001fbe:	6785                	lui	a5,0x1
    80001fc0:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001fc2:	973e                	add	a4,a4,a5
    80001fc4:	77fd                	lui	a5,0xfffff
    80001fc6:	8ff9                	and	a5,a5,a4
    80001fc8:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fcc:	fd043783          	ld	a5,-48(s0)
    80001fd0:	fef43423          	sd	a5,-24(s0)
    80001fd4:	a849                	j	80002066 <uvmalloc+0xd8>
    mem = kalloc();
    80001fd6:	fffff097          	auipc	ra,0xfffff
    80001fda:	18e080e7          	jalr	398(ra) # 80001164 <kalloc>
    80001fde:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001fe2:	fe043783          	ld	a5,-32(s0)
    80001fe6:	ef89                	bnez	a5,80002000 <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    80001fe8:	fd043603          	ld	a2,-48(s0)
    80001fec:	fe843583          	ld	a1,-24(s0)
    80001ff0:	fd843503          	ld	a0,-40(s0)
    80001ff4:	00000097          	auipc	ra,0x0
    80001ff8:	08c080e7          	jalr	140(ra) # 80002080 <uvmdealloc>
      return 0;
    80001ffc:	4781                	li	a5,0
    80001ffe:	a8a5                	j	80002076 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    80002000:	6605                	lui	a2,0x1
    80002002:	4581                	li	a1,0
    80002004:	fe043503          	ld	a0,-32(s0)
    80002008:	fffff097          	auipc	ra,0xfffff
    8000200c:	490080e7          	jalr	1168(ra) # 80001498 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    80002010:	fe043783          	ld	a5,-32(s0)
    80002014:	fc442703          	lw	a4,-60(s0)
    80002018:	01276713          	ori	a4,a4,18
    8000201c:	2701                	sext.w	a4,a4
    8000201e:	86be                	mv	a3,a5
    80002020:	6605                	lui	a2,0x1
    80002022:	fe843583          	ld	a1,-24(s0)
    80002026:	fd843503          	ld	a0,-40(s0)
    8000202a:	00000097          	auipc	ra,0x0
    8000202e:	cc2080e7          	jalr	-830(ra) # 80001cec <mappages>
    80002032:	87aa                	mv	a5,a0
    80002034:	c39d                	beqz	a5,8000205a <uvmalloc+0xcc>
      kfree(mem);
    80002036:	fe043503          	ld	a0,-32(s0)
    8000203a:	fffff097          	auipc	ra,0xfffff
    8000203e:	086080e7          	jalr	134(ra) # 800010c0 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80002042:	fd043603          	ld	a2,-48(s0)
    80002046:	fe843583          	ld	a1,-24(s0)
    8000204a:	fd843503          	ld	a0,-40(s0)
    8000204e:	00000097          	auipc	ra,0x0
    80002052:	032080e7          	jalr	50(ra) # 80002080 <uvmdealloc>
      return 0;
    80002056:	4781                	li	a5,0
    80002058:	a839                	j	80002076 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    8000205a:	fe843703          	ld	a4,-24(s0)
    8000205e:	6785                	lui	a5,0x1
    80002060:	97ba                	add	a5,a5,a4
    80002062:	fef43423          	sd	a5,-24(s0)
    80002066:	fe843703          	ld	a4,-24(s0)
    8000206a:	fc843783          	ld	a5,-56(s0)
    8000206e:	f6f764e3          	bltu	a4,a5,80001fd6 <uvmalloc+0x48>
    }
  }
  return newsz;
    80002072:	fc843783          	ld	a5,-56(s0)
}
    80002076:	853e                	mv	a0,a5
    80002078:	70e2                	ld	ra,56(sp)
    8000207a:	7442                	ld	s0,48(sp)
    8000207c:	6121                	addi	sp,sp,64
    8000207e:	8082                	ret

0000000080002080 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80002080:	7139                	addi	sp,sp,-64
    80002082:	fc06                	sd	ra,56(sp)
    80002084:	f822                	sd	s0,48(sp)
    80002086:	0080                	addi	s0,sp,64
    80002088:	fca43c23          	sd	a0,-40(s0)
    8000208c:	fcb43823          	sd	a1,-48(s0)
    80002090:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002094:	fc843703          	ld	a4,-56(s0)
    80002098:	fd043783          	ld	a5,-48(s0)
    8000209c:	00f76563          	bltu	a4,a5,800020a6 <uvmdealloc+0x26>
    return oldsz;
    800020a0:	fd043783          	ld	a5,-48(s0)
    800020a4:	a885                	j	80002114 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    800020a6:	fc843703          	ld	a4,-56(s0)
    800020aa:	6785                	lui	a5,0x1
    800020ac:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800020ae:	973e                	add	a4,a4,a5
    800020b0:	77fd                	lui	a5,0xfffff
    800020b2:	8f7d                	and	a4,a4,a5
    800020b4:	fd043683          	ld	a3,-48(s0)
    800020b8:	6785                	lui	a5,0x1
    800020ba:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800020bc:	96be                	add	a3,a3,a5
    800020be:	77fd                	lui	a5,0xfffff
    800020c0:	8ff5                	and	a5,a5,a3
    800020c2:	04f77763          	bgeu	a4,a5,80002110 <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    800020c6:	fd043703          	ld	a4,-48(s0)
    800020ca:	6785                	lui	a5,0x1
    800020cc:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800020ce:	973e                	add	a4,a4,a5
    800020d0:	77fd                	lui	a5,0xfffff
    800020d2:	8f7d                	and	a4,a4,a5
    800020d4:	fc843683          	ld	a3,-56(s0)
    800020d8:	6785                	lui	a5,0x1
    800020da:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800020dc:	96be                	add	a3,a3,a5
    800020de:	77fd                	lui	a5,0xfffff
    800020e0:	8ff5                	and	a5,a5,a3
    800020e2:	40f707b3          	sub	a5,a4,a5
    800020e6:	83b1                	srli	a5,a5,0xc
    800020e8:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    800020ec:	fc843703          	ld	a4,-56(s0)
    800020f0:	6785                	lui	a5,0x1
    800020f2:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800020f4:	973e                	add	a4,a4,a5
    800020f6:	77fd                	lui	a5,0xfffff
    800020f8:	8ff9                	and	a5,a5,a4
    800020fa:	fec42703          	lw	a4,-20(s0)
    800020fe:	4685                	li	a3,1
    80002100:	863a                	mv	a2,a4
    80002102:	85be                	mv	a1,a5
    80002104:	fd843503          	ld	a0,-40(s0)
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	cc2080e7          	jalr	-830(ra) # 80001dca <uvmunmap>
  }

  return newsz;
    80002110:	fc843783          	ld	a5,-56(s0)
}
    80002114:	853e                	mv	a0,a5
    80002116:	70e2                	ld	ra,56(sp)
    80002118:	7442                	ld	s0,48(sp)
    8000211a:	6121                	addi	sp,sp,64
    8000211c:	8082                	ret

000000008000211e <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000211e:	7139                	addi	sp,sp,-64
    80002120:	fc06                	sd	ra,56(sp)
    80002122:	f822                	sd	s0,48(sp)
    80002124:	0080                	addi	s0,sp,64
    80002126:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    8000212a:	fe042623          	sw	zero,-20(s0)
    8000212e:	a88d                	j	800021a0 <freewalk+0x82>
    pte_t pte = pagetable[i];
    80002130:	fec42783          	lw	a5,-20(s0)
    80002134:	078e                	slli	a5,a5,0x3
    80002136:	fc843703          	ld	a4,-56(s0)
    8000213a:	97ba                	add	a5,a5,a4
    8000213c:	639c                	ld	a5,0(a5)
    8000213e:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002142:	fe043783          	ld	a5,-32(s0)
    80002146:	8b85                	andi	a5,a5,1
    80002148:	cb9d                	beqz	a5,8000217e <freewalk+0x60>
    8000214a:	fe043783          	ld	a5,-32(s0)
    8000214e:	8bb9                	andi	a5,a5,14
    80002150:	e79d                	bnez	a5,8000217e <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    80002152:	fe043783          	ld	a5,-32(s0)
    80002156:	83a9                	srli	a5,a5,0xa
    80002158:	07b2                	slli	a5,a5,0xc
    8000215a:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    8000215e:	fd843783          	ld	a5,-40(s0)
    80002162:	853e                	mv	a0,a5
    80002164:	00000097          	auipc	ra,0x0
    80002168:	fba080e7          	jalr	-70(ra) # 8000211e <freewalk>
      pagetable[i] = 0;
    8000216c:	fec42783          	lw	a5,-20(s0)
    80002170:	078e                	slli	a5,a5,0x3
    80002172:	fc843703          	ld	a4,-56(s0)
    80002176:	97ba                	add	a5,a5,a4
    80002178:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffd7c38>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000217c:	a829                	j	80002196 <freewalk+0x78>
    } else if(pte & PTE_V){
    8000217e:	fe043783          	ld	a5,-32(s0)
    80002182:	8b85                	andi	a5,a5,1
    80002184:	cb89                	beqz	a5,80002196 <freewalk+0x78>
      panic("freewalk: leaf");
    80002186:	00009517          	auipc	a0,0x9
    8000218a:	fda50513          	addi	a0,a0,-38 # 8000b160 <etext+0x160>
    8000218e:	fffff097          	auipc	ra,0xfffff
    80002192:	b32080e7          	jalr	-1230(ra) # 80000cc0 <panic>
  for(int i = 0; i < 512; i++){
    80002196:	fec42783          	lw	a5,-20(s0)
    8000219a:	2785                	addiw	a5,a5,1
    8000219c:	fef42623          	sw	a5,-20(s0)
    800021a0:	fec42783          	lw	a5,-20(s0)
    800021a4:	0007871b          	sext.w	a4,a5
    800021a8:	1ff00793          	li	a5,511
    800021ac:	f8e7d2e3          	bge	a5,a4,80002130 <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    800021b0:	fc843503          	ld	a0,-56(s0)
    800021b4:	fffff097          	auipc	ra,0xfffff
    800021b8:	f0c080e7          	jalr	-244(ra) # 800010c0 <kfree>
}
    800021bc:	0001                	nop
    800021be:	70e2                	ld	ra,56(sp)
    800021c0:	7442                	ld	s0,48(sp)
    800021c2:	6121                	addi	sp,sp,64
    800021c4:	8082                	ret

00000000800021c6 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    800021c6:	1101                	addi	sp,sp,-32
    800021c8:	ec06                	sd	ra,24(sp)
    800021ca:	e822                	sd	s0,16(sp)
    800021cc:	1000                	addi	s0,sp,32
    800021ce:	fea43423          	sd	a0,-24(s0)
    800021d2:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    800021d6:	fe043783          	ld	a5,-32(s0)
    800021da:	c385                	beqz	a5,800021fa <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    800021dc:	fe043703          	ld	a4,-32(s0)
    800021e0:	6785                	lui	a5,0x1
    800021e2:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800021e4:	97ba                	add	a5,a5,a4
    800021e6:	83b1                	srli	a5,a5,0xc
    800021e8:	4685                	li	a3,1
    800021ea:	863e                	mv	a2,a5
    800021ec:	4581                	li	a1,0
    800021ee:	fe843503          	ld	a0,-24(s0)
    800021f2:	00000097          	auipc	ra,0x0
    800021f6:	bd8080e7          	jalr	-1064(ra) # 80001dca <uvmunmap>
  freewalk(pagetable);
    800021fa:	fe843503          	ld	a0,-24(s0)
    800021fe:	00000097          	auipc	ra,0x0
    80002202:	f20080e7          	jalr	-224(ra) # 8000211e <freewalk>
}
    80002206:	0001                	nop
    80002208:	60e2                	ld	ra,24(sp)
    8000220a:	6442                	ld	s0,16(sp)
    8000220c:	6105                	addi	sp,sp,32
    8000220e:	8082                	ret

0000000080002210 <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    80002210:	711d                	addi	sp,sp,-96
    80002212:	ec86                	sd	ra,88(sp)
    80002214:	e8a2                	sd	s0,80(sp)
    80002216:	1080                	addi	s0,sp,96
    80002218:	faa43c23          	sd	a0,-72(s0)
    8000221c:	fab43823          	sd	a1,-80(s0)
    80002220:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002224:	fe043423          	sd	zero,-24(s0)
    80002228:	a0d9                	j	800022ee <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    8000222a:	4601                	li	a2,0
    8000222c:	fe843583          	ld	a1,-24(s0)
    80002230:	fb843503          	ld	a0,-72(s0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	8f4080e7          	jalr	-1804(ra) # 80001b28 <walk>
    8000223c:	fea43023          	sd	a0,-32(s0)
    80002240:	fe043783          	ld	a5,-32(s0)
    80002244:	eb89                	bnez	a5,80002256 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    80002246:	00009517          	auipc	a0,0x9
    8000224a:	f2a50513          	addi	a0,a0,-214 # 8000b170 <etext+0x170>
    8000224e:	fffff097          	auipc	ra,0xfffff
    80002252:	a72080e7          	jalr	-1422(ra) # 80000cc0 <panic>
    if((*pte & PTE_V) == 0)
    80002256:	fe043783          	ld	a5,-32(s0)
    8000225a:	639c                	ld	a5,0(a5)
    8000225c:	8b85                	andi	a5,a5,1
    8000225e:	eb89                	bnez	a5,80002270 <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    80002260:	00009517          	auipc	a0,0x9
    80002264:	f3050513          	addi	a0,a0,-208 # 8000b190 <etext+0x190>
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	a58080e7          	jalr	-1448(ra) # 80000cc0 <panic>
    pa = PTE2PA(*pte);
    80002270:	fe043783          	ld	a5,-32(s0)
    80002274:	639c                	ld	a5,0(a5)
    80002276:	83a9                	srli	a5,a5,0xa
    80002278:	07b2                	slli	a5,a5,0xc
    8000227a:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    8000227e:	fe043783          	ld	a5,-32(s0)
    80002282:	639c                	ld	a5,0(a5)
    80002284:	2781                	sext.w	a5,a5
    80002286:	3ff7f793          	andi	a5,a5,1023
    8000228a:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    8000228e:	fffff097          	auipc	ra,0xfffff
    80002292:	ed6080e7          	jalr	-298(ra) # 80001164 <kalloc>
    80002296:	fca43423          	sd	a0,-56(s0)
    8000229a:	fc843783          	ld	a5,-56(s0)
    8000229e:	c3a5                	beqz	a5,800022fe <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800022a0:	fd843783          	ld	a5,-40(s0)
    800022a4:	6605                	lui	a2,0x1
    800022a6:	85be                	mv	a1,a5
    800022a8:	fc843503          	ld	a0,-56(s0)
    800022ac:	fffff097          	auipc	ra,0xfffff
    800022b0:	2d8080e7          	jalr	728(ra) # 80001584 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    800022b4:	fc843783          	ld	a5,-56(s0)
    800022b8:	fd442703          	lw	a4,-44(s0)
    800022bc:	86be                	mv	a3,a5
    800022be:	6605                	lui	a2,0x1
    800022c0:	fe843583          	ld	a1,-24(s0)
    800022c4:	fb043503          	ld	a0,-80(s0)
    800022c8:	00000097          	auipc	ra,0x0
    800022cc:	a24080e7          	jalr	-1500(ra) # 80001cec <mappages>
    800022d0:	87aa                	mv	a5,a0
    800022d2:	cb81                	beqz	a5,800022e2 <uvmcopy+0xd2>
      kfree(mem);
    800022d4:	fc843503          	ld	a0,-56(s0)
    800022d8:	fffff097          	auipc	ra,0xfffff
    800022dc:	de8080e7          	jalr	-536(ra) # 800010c0 <kfree>
      goto err;
    800022e0:	a005                	j	80002300 <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    800022e2:	fe843703          	ld	a4,-24(s0)
    800022e6:	6785                	lui	a5,0x1
    800022e8:	97ba                	add	a5,a5,a4
    800022ea:	fef43423          	sd	a5,-24(s0)
    800022ee:	fe843703          	ld	a4,-24(s0)
    800022f2:	fa843783          	ld	a5,-88(s0)
    800022f6:	f2f76ae3          	bltu	a4,a5,8000222a <uvmcopy+0x1a>
    }
  }
  return 0;
    800022fa:	4781                	li	a5,0
    800022fc:	a839                	j	8000231a <uvmcopy+0x10a>
      goto err;
    800022fe:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    80002300:	fe843783          	ld	a5,-24(s0)
    80002304:	83b1                	srli	a5,a5,0xc
    80002306:	4685                	li	a3,1
    80002308:	863e                	mv	a2,a5
    8000230a:	4581                	li	a1,0
    8000230c:	fb043503          	ld	a0,-80(s0)
    80002310:	00000097          	auipc	ra,0x0
    80002314:	aba080e7          	jalr	-1350(ra) # 80001dca <uvmunmap>
  return -1;
    80002318:	57fd                	li	a5,-1
}
    8000231a:	853e                	mv	a0,a5
    8000231c:	60e6                	ld	ra,88(sp)
    8000231e:	6446                	ld	s0,80(sp)
    80002320:	6125                	addi	sp,sp,96
    80002322:	8082                	ret

0000000080002324 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002324:	7179                	addi	sp,sp,-48
    80002326:	f406                	sd	ra,40(sp)
    80002328:	f022                	sd	s0,32(sp)
    8000232a:	1800                	addi	s0,sp,48
    8000232c:	fca43c23          	sd	a0,-40(s0)
    80002330:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    80002334:	4601                	li	a2,0
    80002336:	fd043583          	ld	a1,-48(s0)
    8000233a:	fd843503          	ld	a0,-40(s0)
    8000233e:	fffff097          	auipc	ra,0xfffff
    80002342:	7ea080e7          	jalr	2026(ra) # 80001b28 <walk>
    80002346:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    8000234a:	fe843783          	ld	a5,-24(s0)
    8000234e:	eb89                	bnez	a5,80002360 <uvmclear+0x3c>
    panic("uvmclear");
    80002350:	00009517          	auipc	a0,0x9
    80002354:	e6050513          	addi	a0,a0,-416 # 8000b1b0 <etext+0x1b0>
    80002358:	fffff097          	auipc	ra,0xfffff
    8000235c:	968080e7          	jalr	-1688(ra) # 80000cc0 <panic>
  *pte &= ~PTE_U;
    80002360:	fe843783          	ld	a5,-24(s0)
    80002364:	639c                	ld	a5,0(a5)
    80002366:	fef7f713          	andi	a4,a5,-17
    8000236a:	fe843783          	ld	a5,-24(s0)
    8000236e:	e398                	sd	a4,0(a5)
}
    80002370:	0001                	nop
    80002372:	70a2                	ld	ra,40(sp)
    80002374:	7402                	ld	s0,32(sp)
    80002376:	6145                	addi	sp,sp,48
    80002378:	8082                	ret

000000008000237a <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    8000237a:	715d                	addi	sp,sp,-80
    8000237c:	e486                	sd	ra,72(sp)
    8000237e:	e0a2                	sd	s0,64(sp)
    80002380:	0880                	addi	s0,sp,80
    80002382:	fca43423          	sd	a0,-56(s0)
    80002386:	fcb43023          	sd	a1,-64(s0)
    8000238a:	fac43c23          	sd	a2,-72(s0)
    8000238e:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002392:	a055                	j	80002436 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    80002394:	fc043703          	ld	a4,-64(s0)
    80002398:	77fd                	lui	a5,0xfffff
    8000239a:	8ff9                	and	a5,a5,a4
    8000239c:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023a0:	fe043583          	ld	a1,-32(s0)
    800023a4:	fc843503          	ld	a0,-56(s0)
    800023a8:	00000097          	auipc	ra,0x0
    800023ac:	872080e7          	jalr	-1934(ra) # 80001c1a <walkaddr>
    800023b0:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800023b4:	fd843783          	ld	a5,-40(s0)
    800023b8:	e399                	bnez	a5,800023be <copyout+0x44>
      return -1;
    800023ba:	57fd                	li	a5,-1
    800023bc:	a049                	j	8000243e <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    800023be:	fe043703          	ld	a4,-32(s0)
    800023c2:	fc043783          	ld	a5,-64(s0)
    800023c6:	8f1d                	sub	a4,a4,a5
    800023c8:	6785                	lui	a5,0x1
    800023ca:	97ba                	add	a5,a5,a4
    800023cc:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800023d0:	fe843703          	ld	a4,-24(s0)
    800023d4:	fb043783          	ld	a5,-80(s0)
    800023d8:	00e7f663          	bgeu	a5,a4,800023e4 <copyout+0x6a>
      n = len;
    800023dc:	fb043783          	ld	a5,-80(s0)
    800023e0:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    800023e4:	fc043703          	ld	a4,-64(s0)
    800023e8:	fe043783          	ld	a5,-32(s0)
    800023ec:	8f1d                	sub	a4,a4,a5
    800023ee:	fd843783          	ld	a5,-40(s0)
    800023f2:	97ba                	add	a5,a5,a4
    800023f4:	873e                	mv	a4,a5
    800023f6:	fe843783          	ld	a5,-24(s0)
    800023fa:	2781                	sext.w	a5,a5
    800023fc:	863e                	mv	a2,a5
    800023fe:	fb843583          	ld	a1,-72(s0)
    80002402:	853a                	mv	a0,a4
    80002404:	fffff097          	auipc	ra,0xfffff
    80002408:	180080e7          	jalr	384(ra) # 80001584 <memmove>

    len -= n;
    8000240c:	fb043703          	ld	a4,-80(s0)
    80002410:	fe843783          	ld	a5,-24(s0)
    80002414:	40f707b3          	sub	a5,a4,a5
    80002418:	faf43823          	sd	a5,-80(s0)
    src += n;
    8000241c:	fb843703          	ld	a4,-72(s0)
    80002420:	fe843783          	ld	a5,-24(s0)
    80002424:	97ba                	add	a5,a5,a4
    80002426:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    8000242a:	fe043703          	ld	a4,-32(s0)
    8000242e:	6785                	lui	a5,0x1
    80002430:	97ba                	add	a5,a5,a4
    80002432:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    80002436:	fb043783          	ld	a5,-80(s0)
    8000243a:	ffa9                	bnez	a5,80002394 <copyout+0x1a>
  }
  return 0;
    8000243c:	4781                	li	a5,0
}
    8000243e:	853e                	mv	a0,a5
    80002440:	60a6                	ld	ra,72(sp)
    80002442:	6406                	ld	s0,64(sp)
    80002444:	6161                	addi	sp,sp,80
    80002446:	8082                	ret

0000000080002448 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    80002448:	715d                	addi	sp,sp,-80
    8000244a:	e486                	sd	ra,72(sp)
    8000244c:	e0a2                	sd	s0,64(sp)
    8000244e:	0880                	addi	s0,sp,80
    80002450:	fca43423          	sd	a0,-56(s0)
    80002454:	fcb43023          	sd	a1,-64(s0)
    80002458:	fac43c23          	sd	a2,-72(s0)
    8000245c:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002460:	a055                	j	80002504 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    80002462:	fb843703          	ld	a4,-72(s0)
    80002466:	77fd                	lui	a5,0xfffff
    80002468:	8ff9                	and	a5,a5,a4
    8000246a:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    8000246e:	fe043583          	ld	a1,-32(s0)
    80002472:	fc843503          	ld	a0,-56(s0)
    80002476:	fffff097          	auipc	ra,0xfffff
    8000247a:	7a4080e7          	jalr	1956(ra) # 80001c1a <walkaddr>
    8000247e:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002482:	fd843783          	ld	a5,-40(s0)
    80002486:	e399                	bnez	a5,8000248c <copyin+0x44>
      return -1;
    80002488:	57fd                	li	a5,-1
    8000248a:	a049                	j	8000250c <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    8000248c:	fe043703          	ld	a4,-32(s0)
    80002490:	fb843783          	ld	a5,-72(s0)
    80002494:	8f1d                	sub	a4,a4,a5
    80002496:	6785                	lui	a5,0x1
    80002498:	97ba                	add	a5,a5,a4
    8000249a:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000249e:	fe843703          	ld	a4,-24(s0)
    800024a2:	fb043783          	ld	a5,-80(s0)
    800024a6:	00e7f663          	bgeu	a5,a4,800024b2 <copyin+0x6a>
      n = len;
    800024aa:	fb043783          	ld	a5,-80(s0)
    800024ae:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    800024b2:	fb843703          	ld	a4,-72(s0)
    800024b6:	fe043783          	ld	a5,-32(s0)
    800024ba:	8f1d                	sub	a4,a4,a5
    800024bc:	fd843783          	ld	a5,-40(s0)
    800024c0:	97ba                	add	a5,a5,a4
    800024c2:	873e                	mv	a4,a5
    800024c4:	fe843783          	ld	a5,-24(s0)
    800024c8:	2781                	sext.w	a5,a5
    800024ca:	863e                	mv	a2,a5
    800024cc:	85ba                	mv	a1,a4
    800024ce:	fc043503          	ld	a0,-64(s0)
    800024d2:	fffff097          	auipc	ra,0xfffff
    800024d6:	0b2080e7          	jalr	178(ra) # 80001584 <memmove>

    len -= n;
    800024da:	fb043703          	ld	a4,-80(s0)
    800024de:	fe843783          	ld	a5,-24(s0)
    800024e2:	40f707b3          	sub	a5,a4,a5
    800024e6:	faf43823          	sd	a5,-80(s0)
    dst += n;
    800024ea:	fc043703          	ld	a4,-64(s0)
    800024ee:	fe843783          	ld	a5,-24(s0)
    800024f2:	97ba                	add	a5,a5,a4
    800024f4:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    800024f8:	fe043703          	ld	a4,-32(s0)
    800024fc:	6785                	lui	a5,0x1
    800024fe:	97ba                	add	a5,a5,a4
    80002500:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002504:	fb043783          	ld	a5,-80(s0)
    80002508:	ffa9                	bnez	a5,80002462 <copyin+0x1a>
  }
  return 0;
    8000250a:	4781                	li	a5,0
}
    8000250c:	853e                	mv	a0,a5
    8000250e:	60a6                	ld	ra,72(sp)
    80002510:	6406                	ld	s0,64(sp)
    80002512:	6161                	addi	sp,sp,80
    80002514:	8082                	ret

0000000080002516 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002516:	711d                	addi	sp,sp,-96
    80002518:	ec86                	sd	ra,88(sp)
    8000251a:	e8a2                	sd	s0,80(sp)
    8000251c:	1080                	addi	s0,sp,96
    8000251e:	faa43c23          	sd	a0,-72(s0)
    80002522:	fab43823          	sd	a1,-80(s0)
    80002526:	fac43423          	sd	a2,-88(s0)
    8000252a:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000252e:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    80002532:	a0f1                	j	800025fe <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    80002534:	fa843703          	ld	a4,-88(s0)
    80002538:	77fd                	lui	a5,0xfffff
    8000253a:	8ff9                	and	a5,a5,a4
    8000253c:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    80002540:	fd043583          	ld	a1,-48(s0)
    80002544:	fb843503          	ld	a0,-72(s0)
    80002548:	fffff097          	auipc	ra,0xfffff
    8000254c:	6d2080e7          	jalr	1746(ra) # 80001c1a <walkaddr>
    80002550:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    80002554:	fc843783          	ld	a5,-56(s0)
    80002558:	e399                	bnez	a5,8000255e <copyinstr+0x48>
      return -1;
    8000255a:	57fd                	li	a5,-1
    8000255c:	a87d                	j	8000261a <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    8000255e:	fd043703          	ld	a4,-48(s0)
    80002562:	fa843783          	ld	a5,-88(s0)
    80002566:	8f1d                	sub	a4,a4,a5
    80002568:	6785                	lui	a5,0x1
    8000256a:	97ba                	add	a5,a5,a4
    8000256c:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    80002570:	fe843703          	ld	a4,-24(s0)
    80002574:	fa043783          	ld	a5,-96(s0)
    80002578:	00e7f663          	bgeu	a5,a4,80002584 <copyinstr+0x6e>
      n = max;
    8000257c:	fa043783          	ld	a5,-96(s0)
    80002580:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    80002584:	fa843703          	ld	a4,-88(s0)
    80002588:	fd043783          	ld	a5,-48(s0)
    8000258c:	8f1d                	sub	a4,a4,a5
    8000258e:	fc843783          	ld	a5,-56(s0)
    80002592:	97ba                	add	a5,a5,a4
    80002594:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002598:	a891                	j	800025ec <copyinstr+0xd6>
      if(*p == '\0'){
    8000259a:	fd843783          	ld	a5,-40(s0)
    8000259e:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    800025a2:	eb89                	bnez	a5,800025b4 <copyinstr+0x9e>
        *dst = '\0';
    800025a4:	fb043783          	ld	a5,-80(s0)
    800025a8:	00078023          	sb	zero,0(a5)
        got_null = 1;
    800025ac:	4785                	li	a5,1
    800025ae:	fef42223          	sw	a5,-28(s0)
        break;
    800025b2:	a081                	j	800025f2 <copyinstr+0xdc>
      } else {
        *dst = *p;
    800025b4:	fd843783          	ld	a5,-40(s0)
    800025b8:	0007c703          	lbu	a4,0(a5)
    800025bc:	fb043783          	ld	a5,-80(s0)
    800025c0:	00e78023          	sb	a4,0(a5)
      }
      --n;
    800025c4:	fe843783          	ld	a5,-24(s0)
    800025c8:	17fd                	addi	a5,a5,-1
    800025ca:	fef43423          	sd	a5,-24(s0)
      --max;
    800025ce:	fa043783          	ld	a5,-96(s0)
    800025d2:	17fd                	addi	a5,a5,-1
    800025d4:	faf43023          	sd	a5,-96(s0)
      p++;
    800025d8:	fd843783          	ld	a5,-40(s0)
    800025dc:	0785                	addi	a5,a5,1
    800025de:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    800025e2:	fb043783          	ld	a5,-80(s0)
    800025e6:	0785                	addi	a5,a5,1
    800025e8:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    800025ec:	fe843783          	ld	a5,-24(s0)
    800025f0:	f7cd                	bnez	a5,8000259a <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    800025f2:	fd043703          	ld	a4,-48(s0)
    800025f6:	6785                	lui	a5,0x1
    800025f8:	97ba                	add	a5,a5,a4
    800025fa:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    800025fe:	fe442783          	lw	a5,-28(s0)
    80002602:	2781                	sext.w	a5,a5
    80002604:	e781                	bnez	a5,8000260c <copyinstr+0xf6>
    80002606:	fa043783          	ld	a5,-96(s0)
    8000260a:	f78d                	bnez	a5,80002534 <copyinstr+0x1e>
  }
  if(got_null){
    8000260c:	fe442783          	lw	a5,-28(s0)
    80002610:	2781                	sext.w	a5,a5
    80002612:	c399                	beqz	a5,80002618 <copyinstr+0x102>
    return 0;
    80002614:	4781                	li	a5,0
    80002616:	a011                	j	8000261a <copyinstr+0x104>
  } else {
    return -1;
    80002618:	57fd                	li	a5,-1
  }
}
    8000261a:	853e                	mv	a0,a5
    8000261c:	60e6                	ld	ra,88(sp)
    8000261e:	6446                	ld	s0,80(sp)
    80002620:	6125                	addi	sp,sp,96
    80002622:	8082                	ret

0000000080002624 <r_sstatus>:
{
    80002624:	1101                	addi	sp,sp,-32
    80002626:	ec06                	sd	ra,24(sp)
    80002628:	e822                	sd	s0,16(sp)
    8000262a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000262c:	100027f3          	csrr	a5,sstatus
    80002630:	fef43423          	sd	a5,-24(s0)
  return x;
    80002634:	fe843783          	ld	a5,-24(s0)
}
    80002638:	853e                	mv	a0,a5
    8000263a:	60e2                	ld	ra,24(sp)
    8000263c:	6442                	ld	s0,16(sp)
    8000263e:	6105                	addi	sp,sp,32
    80002640:	8082                	ret

0000000080002642 <w_sstatus>:
{
    80002642:	1101                	addi	sp,sp,-32
    80002644:	ec06                	sd	ra,24(sp)
    80002646:	e822                	sd	s0,16(sp)
    80002648:	1000                	addi	s0,sp,32
    8000264a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8000264e:	fe843783          	ld	a5,-24(s0)
    80002652:	10079073          	csrw	sstatus,a5
}
    80002656:	0001                	nop
    80002658:	60e2                	ld	ra,24(sp)
    8000265a:	6442                	ld	s0,16(sp)
    8000265c:	6105                	addi	sp,sp,32
    8000265e:	8082                	ret

0000000080002660 <intr_on>:
{
    80002660:	1141                	addi	sp,sp,-16
    80002662:	e406                	sd	ra,8(sp)
    80002664:	e022                	sd	s0,0(sp)
    80002666:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80002668:	00000097          	auipc	ra,0x0
    8000266c:	fbc080e7          	jalr	-68(ra) # 80002624 <r_sstatus>
    80002670:	87aa                	mv	a5,a0
    80002672:	0027e793          	ori	a5,a5,2
    80002676:	853e                	mv	a0,a5
    80002678:	00000097          	auipc	ra,0x0
    8000267c:	fca080e7          	jalr	-54(ra) # 80002642 <w_sstatus>
}
    80002680:	0001                	nop
    80002682:	60a2                	ld	ra,8(sp)
    80002684:	6402                	ld	s0,0(sp)
    80002686:	0141                	addi	sp,sp,16
    80002688:	8082                	ret

000000008000268a <intr_get>:
{
    8000268a:	1101                	addi	sp,sp,-32
    8000268c:	ec06                	sd	ra,24(sp)
    8000268e:	e822                	sd	s0,16(sp)
    80002690:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80002692:	00000097          	auipc	ra,0x0
    80002696:	f92080e7          	jalr	-110(ra) # 80002624 <r_sstatus>
    8000269a:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    8000269e:	fe843783          	ld	a5,-24(s0)
    800026a2:	8b89                	andi	a5,a5,2
    800026a4:	00f037b3          	snez	a5,a5
    800026a8:	0ff7f793          	zext.b	a5,a5
    800026ac:	2781                	sext.w	a5,a5
}
    800026ae:	853e                	mv	a0,a5
    800026b0:	60e2                	ld	ra,24(sp)
    800026b2:	6442                	ld	s0,16(sp)
    800026b4:	6105                	addi	sp,sp,32
    800026b6:	8082                	ret

00000000800026b8 <r_tp>:
{
    800026b8:	1101                	addi	sp,sp,-32
    800026ba:	ec06                	sd	ra,24(sp)
    800026bc:	e822                	sd	s0,16(sp)
    800026be:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    800026c0:	8792                	mv	a5,tp
    800026c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800026c6:	fe843783          	ld	a5,-24(s0)
}
    800026ca:	853e                	mv	a0,a5
    800026cc:	60e2                	ld	ra,24(sp)
    800026ce:	6442                	ld	s0,16(sp)
    800026d0:	6105                	addi	sp,sp,32
    800026d2:	8082                	ret

00000000800026d4 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    800026d4:	7139                	addi	sp,sp,-64
    800026d6:	fc06                	sd	ra,56(sp)
    800026d8:	f822                	sd	s0,48(sp)
    800026da:	0080                	addi	s0,sp,64
    800026dc:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    800026e0:	00014797          	auipc	a5,0x14
    800026e4:	ed878793          	addi	a5,a5,-296 # 800165b8 <proc>
    800026e8:	fef43423          	sd	a5,-24(s0)
    800026ec:	a061                	j	80002774 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    800026ee:	fffff097          	auipc	ra,0xfffff
    800026f2:	a76080e7          	jalr	-1418(ra) # 80001164 <kalloc>
    800026f6:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    800026fa:	fe043783          	ld	a5,-32(s0)
    800026fe:	eb89                	bnez	a5,80002710 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002700:	00009517          	auipc	a0,0x9
    80002704:	ac050513          	addi	a0,a0,-1344 # 8000b1c0 <etext+0x1c0>
    80002708:	ffffe097          	auipc	ra,0xffffe
    8000270c:	5b8080e7          	jalr	1464(ra) # 80000cc0 <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002710:	fe843703          	ld	a4,-24(s0)
    80002714:	00014797          	auipc	a5,0x14
    80002718:	ea478793          	addi	a5,a5,-348 # 800165b8 <proc>
    8000271c:	40f707b3          	sub	a5,a4,a5
    80002720:	4037d713          	srai	a4,a5,0x3
    80002724:	00009797          	auipc	a5,0x9
    80002728:	bac78793          	addi	a5,a5,-1108 # 8000b2d0 <etext+0x2d0>
    8000272c:	639c                	ld	a5,0(a5)
    8000272e:	02f707b3          	mul	a5,a4,a5
    80002732:	2781                	sext.w	a5,a5
    80002734:	2785                	addiw	a5,a5,1
    80002736:	2781                	sext.w	a5,a5
    80002738:	00d7979b          	slliw	a5,a5,0xd
    8000273c:	2781                	sext.w	a5,a5
    8000273e:	873e                	mv	a4,a5
    80002740:	040007b7          	lui	a5,0x4000
    80002744:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002746:	07b2                	slli	a5,a5,0xc
    80002748:	8f99                	sub	a5,a5,a4
    8000274a:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    8000274e:	fe043783          	ld	a5,-32(s0)
    80002752:	4719                	li	a4,6
    80002754:	6685                	lui	a3,0x1
    80002756:	863e                	mv	a2,a5
    80002758:	fd843583          	ld	a1,-40(s0)
    8000275c:	fc843503          	ld	a0,-56(s0)
    80002760:	fffff097          	auipc	ra,0xfffff
    80002764:	532080e7          	jalr	1330(ra) # 80001c92 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002768:	fe843783          	ld	a5,-24(s0)
    8000276c:	16878793          	addi	a5,a5,360
    80002770:	fef43423          	sd	a5,-24(s0)
    80002774:	fe843703          	ld	a4,-24(s0)
    80002778:	0001a797          	auipc	a5,0x1a
    8000277c:	84078793          	addi	a5,a5,-1984 # 8001bfb8 <pid_lock>
    80002780:	f6f767e3          	bltu	a4,a5,800026ee <proc_mapstacks+0x1a>
  }
}
    80002784:	0001                	nop
    80002786:	0001                	nop
    80002788:	70e2                	ld	ra,56(sp)
    8000278a:	7442                	ld	s0,48(sp)
    8000278c:	6121                	addi	sp,sp,64
    8000278e:	8082                	ret

0000000080002790 <procinit>:

// initialize the proc table.
void
procinit(void)
{
    80002790:	1101                	addi	sp,sp,-32
    80002792:	ec06                	sd	ra,24(sp)
    80002794:	e822                	sd	s0,16(sp)
    80002796:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    80002798:	00009597          	auipc	a1,0x9
    8000279c:	a3058593          	addi	a1,a1,-1488 # 8000b1c8 <etext+0x1c8>
    800027a0:	0001a517          	auipc	a0,0x1a
    800027a4:	81850513          	addi	a0,a0,-2024 # 8001bfb8 <pid_lock>
    800027a8:	fffff097          	auipc	ra,0xfffff
    800027ac:	ae8080e7          	jalr	-1304(ra) # 80001290 <initlock>
  initlock(&wait_lock, "wait_lock");
    800027b0:	00009597          	auipc	a1,0x9
    800027b4:	a2058593          	addi	a1,a1,-1504 # 8000b1d0 <etext+0x1d0>
    800027b8:	0001a517          	auipc	a0,0x1a
    800027bc:	81850513          	addi	a0,a0,-2024 # 8001bfd0 <wait_lock>
    800027c0:	fffff097          	auipc	ra,0xfffff
    800027c4:	ad0080e7          	jalr	-1328(ra) # 80001290 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    800027c8:	00014797          	auipc	a5,0x14
    800027cc:	df078793          	addi	a5,a5,-528 # 800165b8 <proc>
    800027d0:	fef43423          	sd	a5,-24(s0)
    800027d4:	a0bd                	j	80002842 <procinit+0xb2>
      initlock(&p->lock, "proc");
    800027d6:	fe843783          	ld	a5,-24(s0)
    800027da:	00009597          	auipc	a1,0x9
    800027de:	a0658593          	addi	a1,a1,-1530 # 8000b1e0 <etext+0x1e0>
    800027e2:	853e                	mv	a0,a5
    800027e4:	fffff097          	auipc	ra,0xfffff
    800027e8:	aac080e7          	jalr	-1364(ra) # 80001290 <initlock>
      p->state = UNUSED;
    800027ec:	fe843783          	ld	a5,-24(s0)
    800027f0:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    800027f4:	fe843703          	ld	a4,-24(s0)
    800027f8:	00014797          	auipc	a5,0x14
    800027fc:	dc078793          	addi	a5,a5,-576 # 800165b8 <proc>
    80002800:	40f707b3          	sub	a5,a4,a5
    80002804:	4037d713          	srai	a4,a5,0x3
    80002808:	00009797          	auipc	a5,0x9
    8000280c:	ac878793          	addi	a5,a5,-1336 # 8000b2d0 <etext+0x2d0>
    80002810:	639c                	ld	a5,0(a5)
    80002812:	02f707b3          	mul	a5,a4,a5
    80002816:	2781                	sext.w	a5,a5
    80002818:	2785                	addiw	a5,a5,1
    8000281a:	2781                	sext.w	a5,a5
    8000281c:	00d7979b          	slliw	a5,a5,0xd
    80002820:	2781                	sext.w	a5,a5
    80002822:	873e                	mv	a4,a5
    80002824:	040007b7          	lui	a5,0x4000
    80002828:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    8000282a:	07b2                	slli	a5,a5,0xc
    8000282c:	8f99                	sub	a5,a5,a4
    8000282e:	873e                	mv	a4,a5
    80002830:	fe843783          	ld	a5,-24(s0)
    80002834:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002836:	fe843783          	ld	a5,-24(s0)
    8000283a:	16878793          	addi	a5,a5,360
    8000283e:	fef43423          	sd	a5,-24(s0)
    80002842:	fe843703          	ld	a4,-24(s0)
    80002846:	00019797          	auipc	a5,0x19
    8000284a:	77278793          	addi	a5,a5,1906 # 8001bfb8 <pid_lock>
    8000284e:	f8f764e3          	bltu	a4,a5,800027d6 <procinit+0x46>
  }
}
    80002852:	0001                	nop
    80002854:	0001                	nop
    80002856:	60e2                	ld	ra,24(sp)
    80002858:	6442                	ld	s0,16(sp)
    8000285a:	6105                	addi	sp,sp,32
    8000285c:	8082                	ret

000000008000285e <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    8000285e:	1101                	addi	sp,sp,-32
    80002860:	ec06                	sd	ra,24(sp)
    80002862:	e822                	sd	s0,16(sp)
    80002864:	1000                	addi	s0,sp,32
  int id = r_tp();
    80002866:	00000097          	auipc	ra,0x0
    8000286a:	e52080e7          	jalr	-430(ra) # 800026b8 <r_tp>
    8000286e:	87aa                	mv	a5,a0
    80002870:	fef42623          	sw	a5,-20(s0)
  return id;
    80002874:	fec42783          	lw	a5,-20(s0)
}
    80002878:	853e                	mv	a0,a5
    8000287a:	60e2                	ld	ra,24(sp)
    8000287c:	6442                	ld	s0,16(sp)
    8000287e:	6105                	addi	sp,sp,32
    80002880:	8082                	ret

0000000080002882 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002882:	1101                	addi	sp,sp,-32
    80002884:	ec06                	sd	ra,24(sp)
    80002886:	e822                	sd	s0,16(sp)
    80002888:	1000                	addi	s0,sp,32
  int id = cpuid();
    8000288a:	00000097          	auipc	ra,0x0
    8000288e:	fd4080e7          	jalr	-44(ra) # 8000285e <cpuid>
    80002892:	87aa                	mv	a5,a0
    80002894:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002898:	fec42783          	lw	a5,-20(s0)
    8000289c:	00779713          	slli	a4,a5,0x7
    800028a0:	00014797          	auipc	a5,0x14
    800028a4:	91878793          	addi	a5,a5,-1768 # 800161b8 <cpus>
    800028a8:	97ba                	add	a5,a5,a4
    800028aa:	fef43023          	sd	a5,-32(s0)
  return c;
    800028ae:	fe043783          	ld	a5,-32(s0)
}
    800028b2:	853e                	mv	a0,a5
    800028b4:	60e2                	ld	ra,24(sp)
    800028b6:	6442                	ld	s0,16(sp)
    800028b8:	6105                	addi	sp,sp,32
    800028ba:	8082                	ret

00000000800028bc <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    800028bc:	1101                	addi	sp,sp,-32
    800028be:	ec06                	sd	ra,24(sp)
    800028c0:	e822                	sd	s0,16(sp)
    800028c2:	1000                	addi	s0,sp,32
  push_off();
    800028c4:	fffff097          	auipc	ra,0xfffff
    800028c8:	afe080e7          	jalr	-1282(ra) # 800013c2 <push_off>
  struct cpu *c = mycpu();
    800028cc:	00000097          	auipc	ra,0x0
    800028d0:	fb6080e7          	jalr	-74(ra) # 80002882 <mycpu>
    800028d4:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    800028d8:	fe843783          	ld	a5,-24(s0)
    800028dc:	639c                	ld	a5,0(a5)
    800028de:	fef43023          	sd	a5,-32(s0)
  pop_off();
    800028e2:	fffff097          	auipc	ra,0xfffff
    800028e6:	b38080e7          	jalr	-1224(ra) # 8000141a <pop_off>
  return p;
    800028ea:	fe043783          	ld	a5,-32(s0)
}
    800028ee:	853e                	mv	a0,a5
    800028f0:	60e2                	ld	ra,24(sp)
    800028f2:	6442                	ld	s0,16(sp)
    800028f4:	6105                	addi	sp,sp,32
    800028f6:	8082                	ret

00000000800028f8 <allocpid>:

int
allocpid()
{
    800028f8:	1101                	addi	sp,sp,-32
    800028fa:	ec06                	sd	ra,24(sp)
    800028fc:	e822                	sd	s0,16(sp)
    800028fe:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002900:	00019517          	auipc	a0,0x19
    80002904:	6b850513          	addi	a0,a0,1720 # 8001bfb8 <pid_lock>
    80002908:	fffff097          	auipc	ra,0xfffff
    8000290c:	9bc080e7          	jalr	-1604(ra) # 800012c4 <acquire>
  pid = nextpid;
    80002910:	0000b797          	auipc	a5,0xb
    80002914:	4a078793          	addi	a5,a5,1184 # 8000ddb0 <nextpid>
    80002918:	439c                	lw	a5,0(a5)
    8000291a:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    8000291e:	0000b797          	auipc	a5,0xb
    80002922:	49278793          	addi	a5,a5,1170 # 8000ddb0 <nextpid>
    80002926:	439c                	lw	a5,0(a5)
    80002928:	2785                	addiw	a5,a5,1
    8000292a:	0007871b          	sext.w	a4,a5
    8000292e:	0000b797          	auipc	a5,0xb
    80002932:	48278793          	addi	a5,a5,1154 # 8000ddb0 <nextpid>
    80002936:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002938:	00019517          	auipc	a0,0x19
    8000293c:	68050513          	addi	a0,a0,1664 # 8001bfb8 <pid_lock>
    80002940:	fffff097          	auipc	ra,0xfffff
    80002944:	9e8080e7          	jalr	-1560(ra) # 80001328 <release>

  return pid;
    80002948:	fec42783          	lw	a5,-20(s0)
}
    8000294c:	853e                	mv	a0,a5
    8000294e:	60e2                	ld	ra,24(sp)
    80002950:	6442                	ld	s0,16(sp)
    80002952:	6105                	addi	sp,sp,32
    80002954:	8082                	ret

0000000080002956 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002956:	1101                	addi	sp,sp,-32
    80002958:	ec06                	sd	ra,24(sp)
    8000295a:	e822                	sd	s0,16(sp)
    8000295c:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    8000295e:	00014797          	auipc	a5,0x14
    80002962:	c5a78793          	addi	a5,a5,-934 # 800165b8 <proc>
    80002966:	fef43423          	sd	a5,-24(s0)
    8000296a:	a80d                	j	8000299c <allocproc+0x46>
    acquire(&p->lock);
    8000296c:	fe843783          	ld	a5,-24(s0)
    80002970:	853e                	mv	a0,a5
    80002972:	fffff097          	auipc	ra,0xfffff
    80002976:	952080e7          	jalr	-1710(ra) # 800012c4 <acquire>
    if(p->state == UNUSED) {
    8000297a:	fe843783          	ld	a5,-24(s0)
    8000297e:	4f9c                	lw	a5,24(a5)
    80002980:	cb85                	beqz	a5,800029b0 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002982:	fe843783          	ld	a5,-24(s0)
    80002986:	853e                	mv	a0,a5
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	9a0080e7          	jalr	-1632(ra) # 80001328 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002990:	fe843783          	ld	a5,-24(s0)
    80002994:	16878793          	addi	a5,a5,360
    80002998:	fef43423          	sd	a5,-24(s0)
    8000299c:	fe843703          	ld	a4,-24(s0)
    800029a0:	00019797          	auipc	a5,0x19
    800029a4:	61878793          	addi	a5,a5,1560 # 8001bfb8 <pid_lock>
    800029a8:	fcf762e3          	bltu	a4,a5,8000296c <allocproc+0x16>
    }
  }
  return 0;
    800029ac:	4781                	li	a5,0
    800029ae:	a0e1                	j	80002a76 <allocproc+0x120>
      goto found;
    800029b0:	0001                	nop

found:
  p->pid = allocpid();
    800029b2:	00000097          	auipc	ra,0x0
    800029b6:	f46080e7          	jalr	-186(ra) # 800028f8 <allocpid>
    800029ba:	87aa                	mv	a5,a0
    800029bc:	873e                	mv	a4,a5
    800029be:	fe843783          	ld	a5,-24(s0)
    800029c2:	db98                	sw	a4,48(a5)
  p->state = USED;
    800029c4:	fe843783          	ld	a5,-24(s0)
    800029c8:	4705                	li	a4,1
    800029ca:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    800029cc:	ffffe097          	auipc	ra,0xffffe
    800029d0:	798080e7          	jalr	1944(ra) # 80001164 <kalloc>
    800029d4:	872a                	mv	a4,a0
    800029d6:	fe843783          	ld	a5,-24(s0)
    800029da:	efb8                	sd	a4,88(a5)
    800029dc:	fe843783          	ld	a5,-24(s0)
    800029e0:	6fbc                	ld	a5,88(a5)
    800029e2:	e385                	bnez	a5,80002a02 <allocproc+0xac>
    freeproc(p);
    800029e4:	fe843503          	ld	a0,-24(s0)
    800029e8:	00000097          	auipc	ra,0x0
    800029ec:	098080e7          	jalr	152(ra) # 80002a80 <freeproc>
    release(&p->lock);
    800029f0:	fe843783          	ld	a5,-24(s0)
    800029f4:	853e                	mv	a0,a5
    800029f6:	fffff097          	auipc	ra,0xfffff
    800029fa:	932080e7          	jalr	-1742(ra) # 80001328 <release>
    return 0;
    800029fe:	4781                	li	a5,0
    80002a00:	a89d                	j	80002a76 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002a02:	fe843503          	ld	a0,-24(s0)
    80002a06:	00000097          	auipc	ra,0x0
    80002a0a:	118080e7          	jalr	280(ra) # 80002b1e <proc_pagetable>
    80002a0e:	872a                	mv	a4,a0
    80002a10:	fe843783          	ld	a5,-24(s0)
    80002a14:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002a16:	fe843783          	ld	a5,-24(s0)
    80002a1a:	6bbc                	ld	a5,80(a5)
    80002a1c:	e385                	bnez	a5,80002a3c <allocproc+0xe6>
    freeproc(p);
    80002a1e:	fe843503          	ld	a0,-24(s0)
    80002a22:	00000097          	auipc	ra,0x0
    80002a26:	05e080e7          	jalr	94(ra) # 80002a80 <freeproc>
    release(&p->lock);
    80002a2a:	fe843783          	ld	a5,-24(s0)
    80002a2e:	853e                	mv	a0,a5
    80002a30:	fffff097          	auipc	ra,0xfffff
    80002a34:	8f8080e7          	jalr	-1800(ra) # 80001328 <release>
    return 0;
    80002a38:	4781                	li	a5,0
    80002a3a:	a835                	j	80002a76 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002a3c:	fe843783          	ld	a5,-24(s0)
    80002a40:	06078793          	addi	a5,a5,96
    80002a44:	07000613          	li	a2,112
    80002a48:	4581                	li	a1,0
    80002a4a:	853e                	mv	a0,a5
    80002a4c:	fffff097          	auipc	ra,0xfffff
    80002a50:	a4c080e7          	jalr	-1460(ra) # 80001498 <memset>
  p->context.ra = (uint64)forkret;
    80002a54:	00001717          	auipc	a4,0x1
    80002a58:	9d270713          	addi	a4,a4,-1582 # 80003426 <forkret>
    80002a5c:	fe843783          	ld	a5,-24(s0)
    80002a60:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002a62:	fe843783          	ld	a5,-24(s0)
    80002a66:	63b8                	ld	a4,64(a5)
    80002a68:	6785                	lui	a5,0x1
    80002a6a:	973e                	add	a4,a4,a5
    80002a6c:	fe843783          	ld	a5,-24(s0)
    80002a70:	f7b8                	sd	a4,104(a5)

  return p;
    80002a72:	fe843783          	ld	a5,-24(s0)
}
    80002a76:	853e                	mv	a0,a5
    80002a78:	60e2                	ld	ra,24(sp)
    80002a7a:	6442                	ld	s0,16(sp)
    80002a7c:	6105                	addi	sp,sp,32
    80002a7e:	8082                	ret

0000000080002a80 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002a80:	1101                	addi	sp,sp,-32
    80002a82:	ec06                	sd	ra,24(sp)
    80002a84:	e822                	sd	s0,16(sp)
    80002a86:	1000                	addi	s0,sp,32
    80002a88:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002a8c:	fe843783          	ld	a5,-24(s0)
    80002a90:	6fbc                	ld	a5,88(a5)
    80002a92:	cb89                	beqz	a5,80002aa4 <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002a94:	fe843783          	ld	a5,-24(s0)
    80002a98:	6fbc                	ld	a5,88(a5)
    80002a9a:	853e                	mv	a0,a5
    80002a9c:	ffffe097          	auipc	ra,0xffffe
    80002aa0:	624080e7          	jalr	1572(ra) # 800010c0 <kfree>
  p->trapframe = 0;
    80002aa4:	fe843783          	ld	a5,-24(s0)
    80002aa8:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002aac:	fe843783          	ld	a5,-24(s0)
    80002ab0:	6bbc                	ld	a5,80(a5)
    80002ab2:	cf89                	beqz	a5,80002acc <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002ab4:	fe843783          	ld	a5,-24(s0)
    80002ab8:	6bb8                	ld	a4,80(a5)
    80002aba:	fe843783          	ld	a5,-24(s0)
    80002abe:	67bc                	ld	a5,72(a5)
    80002ac0:	85be                	mv	a1,a5
    80002ac2:	853a                	mv	a0,a4
    80002ac4:	00000097          	auipc	ra,0x0
    80002ac8:	11a080e7          	jalr	282(ra) # 80002bde <proc_freepagetable>
  p->pagetable = 0;
    80002acc:	fe843783          	ld	a5,-24(s0)
    80002ad0:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002ad4:	fe843783          	ld	a5,-24(s0)
    80002ad8:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002adc:	fe843783          	ld	a5,-24(s0)
    80002ae0:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002ae4:	fe843783          	ld	a5,-24(s0)
    80002ae8:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002aec:	fe843783          	ld	a5,-24(s0)
    80002af0:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002af4:	fe843783          	ld	a5,-24(s0)
    80002af8:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002afc:	fe843783          	ld	a5,-24(s0)
    80002b00:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002b04:	fe843783          	ld	a5,-24(s0)
    80002b08:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002b0c:	fe843783          	ld	a5,-24(s0)
    80002b10:	0007ac23          	sw	zero,24(a5)
}
    80002b14:	0001                	nop
    80002b16:	60e2                	ld	ra,24(sp)
    80002b18:	6442                	ld	s0,16(sp)
    80002b1a:	6105                	addi	sp,sp,32
    80002b1c:	8082                	ret

0000000080002b1e <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002b1e:	7179                	addi	sp,sp,-48
    80002b20:	f406                	sd	ra,40(sp)
    80002b22:	f022                	sd	s0,32(sp)
    80002b24:	1800                	addi	s0,sp,48
    80002b26:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002b2a:	fffff097          	auipc	ra,0xfffff
    80002b2e:	3a0080e7          	jalr	928(ra) # 80001eca <uvmcreate>
    80002b32:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002b36:	fe843783          	ld	a5,-24(s0)
    80002b3a:	e399                	bnez	a5,80002b40 <proc_pagetable+0x22>
    return 0;
    80002b3c:	4781                	li	a5,0
    80002b3e:	a859                	j	80002bd4 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002b40:	00007797          	auipc	a5,0x7
    80002b44:	4c078793          	addi	a5,a5,1216 # 8000a000 <_trampoline>
    80002b48:	4729                	li	a4,10
    80002b4a:	86be                	mv	a3,a5
    80002b4c:	6605                	lui	a2,0x1
    80002b4e:	040007b7          	lui	a5,0x4000
    80002b52:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002b54:	00c79593          	slli	a1,a5,0xc
    80002b58:	fe843503          	ld	a0,-24(s0)
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	190080e7          	jalr	400(ra) # 80001cec <mappages>
    80002b64:	87aa                	mv	a5,a0
    80002b66:	0007db63          	bgez	a5,80002b7c <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002b6a:	4581                	li	a1,0
    80002b6c:	fe843503          	ld	a0,-24(s0)
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	656080e7          	jalr	1622(ra) # 800021c6 <uvmfree>
    return 0;
    80002b78:	4781                	li	a5,0
    80002b7a:	a8a9                	j	80002bd4 <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002b7c:	fd843783          	ld	a5,-40(s0)
    80002b80:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002b82:	4719                	li	a4,6
    80002b84:	86be                	mv	a3,a5
    80002b86:	6605                	lui	a2,0x1
    80002b88:	020007b7          	lui	a5,0x2000
    80002b8c:	17fd                	addi	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80002b8e:	00d79593          	slli	a1,a5,0xd
    80002b92:	fe843503          	ld	a0,-24(s0)
    80002b96:	fffff097          	auipc	ra,0xfffff
    80002b9a:	156080e7          	jalr	342(ra) # 80001cec <mappages>
    80002b9e:	87aa                	mv	a5,a0
    80002ba0:	0207d863          	bgez	a5,80002bd0 <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002ba4:	4681                	li	a3,0
    80002ba6:	4605                	li	a2,1
    80002ba8:	040007b7          	lui	a5,0x4000
    80002bac:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002bae:	00c79593          	slli	a1,a5,0xc
    80002bb2:	fe843503          	ld	a0,-24(s0)
    80002bb6:	fffff097          	auipc	ra,0xfffff
    80002bba:	214080e7          	jalr	532(ra) # 80001dca <uvmunmap>
    uvmfree(pagetable, 0);
    80002bbe:	4581                	li	a1,0
    80002bc0:	fe843503          	ld	a0,-24(s0)
    80002bc4:	fffff097          	auipc	ra,0xfffff
    80002bc8:	602080e7          	jalr	1538(ra) # 800021c6 <uvmfree>
    return 0;
    80002bcc:	4781                	li	a5,0
    80002bce:	a019                	j	80002bd4 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002bd0:	fe843783          	ld	a5,-24(s0)
}
    80002bd4:	853e                	mv	a0,a5
    80002bd6:	70a2                	ld	ra,40(sp)
    80002bd8:	7402                	ld	s0,32(sp)
    80002bda:	6145                	addi	sp,sp,48
    80002bdc:	8082                	ret

0000000080002bde <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002bde:	1101                	addi	sp,sp,-32
    80002be0:	ec06                	sd	ra,24(sp)
    80002be2:	e822                	sd	s0,16(sp)
    80002be4:	1000                	addi	s0,sp,32
    80002be6:	fea43423          	sd	a0,-24(s0)
    80002bea:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002bee:	4681                	li	a3,0
    80002bf0:	4605                	li	a2,1
    80002bf2:	040007b7          	lui	a5,0x4000
    80002bf6:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002bf8:	00c79593          	slli	a1,a5,0xc
    80002bfc:	fe843503          	ld	a0,-24(s0)
    80002c00:	fffff097          	auipc	ra,0xfffff
    80002c04:	1ca080e7          	jalr	458(ra) # 80001dca <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002c08:	4681                	li	a3,0
    80002c0a:	4605                	li	a2,1
    80002c0c:	020007b7          	lui	a5,0x2000
    80002c10:	17fd                	addi	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80002c12:	00d79593          	slli	a1,a5,0xd
    80002c16:	fe843503          	ld	a0,-24(s0)
    80002c1a:	fffff097          	auipc	ra,0xfffff
    80002c1e:	1b0080e7          	jalr	432(ra) # 80001dca <uvmunmap>
  uvmfree(pagetable, sz);
    80002c22:	fe043583          	ld	a1,-32(s0)
    80002c26:	fe843503          	ld	a0,-24(s0)
    80002c2a:	fffff097          	auipc	ra,0xfffff
    80002c2e:	59c080e7          	jalr	1436(ra) # 800021c6 <uvmfree>
}
    80002c32:	0001                	nop
    80002c34:	60e2                	ld	ra,24(sp)
    80002c36:	6442                	ld	s0,16(sp)
    80002c38:	6105                	addi	sp,sp,32
    80002c3a:	8082                	ret

0000000080002c3c <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002c3c:	1101                	addi	sp,sp,-32
    80002c3e:	ec06                	sd	ra,24(sp)
    80002c40:	e822                	sd	s0,16(sp)
    80002c42:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002c44:	00000097          	auipc	ra,0x0
    80002c48:	d12080e7          	jalr	-750(ra) # 80002956 <allocproc>
    80002c4c:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002c50:	0000b797          	auipc	a5,0xb
    80002c54:	2f078793          	addi	a5,a5,752 # 8000df40 <initproc>
    80002c58:	fe843703          	ld	a4,-24(s0)
    80002c5c:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002c5e:	fe843783          	ld	a5,-24(s0)
    80002c62:	6bbc                	ld	a5,80(a5)
    80002c64:	03400613          	li	a2,52
    80002c68:	0000b597          	auipc	a1,0xb
    80002c6c:	17058593          	addi	a1,a1,368 # 8000ddd8 <initcode>
    80002c70:	853e                	mv	a0,a5
    80002c72:	fffff097          	auipc	ra,0xfffff
    80002c76:	294080e7          	jalr	660(ra) # 80001f06 <uvmfirst>
  p->sz = PGSIZE;
    80002c7a:	fe843783          	ld	a5,-24(s0)
    80002c7e:	6705                	lui	a4,0x1
    80002c80:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002c82:	fe843783          	ld	a5,-24(s0)
    80002c86:	6fbc                	ld	a5,88(a5)
    80002c88:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002c8c:	fe843783          	ld	a5,-24(s0)
    80002c90:	6fbc                	ld	a5,88(a5)
    80002c92:	6705                	lui	a4,0x1
    80002c94:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002c96:	fe843783          	ld	a5,-24(s0)
    80002c9a:	15878793          	addi	a5,a5,344
    80002c9e:	4641                	li	a2,16
    80002ca0:	00008597          	auipc	a1,0x8
    80002ca4:	54858593          	addi	a1,a1,1352 # 8000b1e8 <etext+0x1e8>
    80002ca8:	853e                	mv	a0,a5
    80002caa:	fffff097          	auipc	ra,0xfffff
    80002cae:	b06080e7          	jalr	-1274(ra) # 800017b0 <safestrcpy>
  p->cwd = namei("/");
    80002cb2:	00008517          	auipc	a0,0x8
    80002cb6:	54650513          	addi	a0,a0,1350 # 8000b1f8 <etext+0x1f8>
    80002cba:	00003097          	auipc	ra,0x3
    80002cbe:	200080e7          	jalr	512(ra) # 80005eba <namei>
    80002cc2:	872a                	mv	a4,a0
    80002cc4:	fe843783          	ld	a5,-24(s0)
    80002cc8:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002ccc:	fe843783          	ld	a5,-24(s0)
    80002cd0:	470d                	li	a4,3
    80002cd2:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002cd4:	fe843783          	ld	a5,-24(s0)
    80002cd8:	853e                	mv	a0,a5
    80002cda:	ffffe097          	auipc	ra,0xffffe
    80002cde:	64e080e7          	jalr	1614(ra) # 80001328 <release>
}
    80002ce2:	0001                	nop
    80002ce4:	60e2                	ld	ra,24(sp)
    80002ce6:	6442                	ld	s0,16(sp)
    80002ce8:	6105                	addi	sp,sp,32
    80002cea:	8082                	ret

0000000080002cec <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002cec:	7179                	addi	sp,sp,-48
    80002cee:	f406                	sd	ra,40(sp)
    80002cf0:	f022                	sd	s0,32(sp)
    80002cf2:	1800                	addi	s0,sp,48
    80002cf4:	87aa                	mv	a5,a0
    80002cf6:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002cfa:	00000097          	auipc	ra,0x0
    80002cfe:	bc2080e7          	jalr	-1086(ra) # 800028bc <myproc>
    80002d02:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002d06:	fe043783          	ld	a5,-32(s0)
    80002d0a:	67bc                	ld	a5,72(a5)
    80002d0c:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002d10:	fdc42783          	lw	a5,-36(s0)
    80002d14:	2781                	sext.w	a5,a5
    80002d16:	02f05963          	blez	a5,80002d48 <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002d1a:	fe043783          	ld	a5,-32(s0)
    80002d1e:	6ba8                	ld	a0,80(a5)
    80002d20:	fdc42703          	lw	a4,-36(s0)
    80002d24:	fe843783          	ld	a5,-24(s0)
    80002d28:	97ba                	add	a5,a5,a4
    80002d2a:	4691                	li	a3,4
    80002d2c:	863e                	mv	a2,a5
    80002d2e:	fe843583          	ld	a1,-24(s0)
    80002d32:	fffff097          	auipc	ra,0xfffff
    80002d36:	25c080e7          	jalr	604(ra) # 80001f8e <uvmalloc>
    80002d3a:	fea43423          	sd	a0,-24(s0)
    80002d3e:	fe843783          	ld	a5,-24(s0)
    80002d42:	eb95                	bnez	a5,80002d76 <growproc+0x8a>
      return -1;
    80002d44:	57fd                	li	a5,-1
    80002d46:	a835                	j	80002d82 <growproc+0x96>
    }
  } else if(n < 0){
    80002d48:	fdc42783          	lw	a5,-36(s0)
    80002d4c:	2781                	sext.w	a5,a5
    80002d4e:	0207d463          	bgez	a5,80002d76 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002d52:	fe043783          	ld	a5,-32(s0)
    80002d56:	6bb4                	ld	a3,80(a5)
    80002d58:	fdc42703          	lw	a4,-36(s0)
    80002d5c:	fe843783          	ld	a5,-24(s0)
    80002d60:	97ba                	add	a5,a5,a4
    80002d62:	863e                	mv	a2,a5
    80002d64:	fe843583          	ld	a1,-24(s0)
    80002d68:	8536                	mv	a0,a3
    80002d6a:	fffff097          	auipc	ra,0xfffff
    80002d6e:	316080e7          	jalr	790(ra) # 80002080 <uvmdealloc>
    80002d72:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002d76:	fe043783          	ld	a5,-32(s0)
    80002d7a:	fe843703          	ld	a4,-24(s0)
    80002d7e:	e7b8                	sd	a4,72(a5)
  return 0;
    80002d80:	4781                	li	a5,0
}
    80002d82:	853e                	mv	a0,a5
    80002d84:	70a2                	ld	ra,40(sp)
    80002d86:	7402                	ld	s0,32(sp)
    80002d88:	6145                	addi	sp,sp,48
    80002d8a:	8082                	ret

0000000080002d8c <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002d8c:	7179                	addi	sp,sp,-48
    80002d8e:	f406                	sd	ra,40(sp)
    80002d90:	f022                	sd	s0,32(sp)
    80002d92:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	b28080e7          	jalr	-1240(ra) # 800028bc <myproc>
    80002d9c:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	bb6080e7          	jalr	-1098(ra) # 80002956 <allocproc>
    80002da8:	fca43c23          	sd	a0,-40(s0)
    80002dac:	fd843783          	ld	a5,-40(s0)
    80002db0:	e399                	bnez	a5,80002db6 <fork+0x2a>
    return -1;
    80002db2:	57fd                	li	a5,-1
    80002db4:	aab5                	j	80002f30 <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002db6:	fe043783          	ld	a5,-32(s0)
    80002dba:	6bb8                	ld	a4,80(a5)
    80002dbc:	fd843783          	ld	a5,-40(s0)
    80002dc0:	6bb4                	ld	a3,80(a5)
    80002dc2:	fe043783          	ld	a5,-32(s0)
    80002dc6:	67bc                	ld	a5,72(a5)
    80002dc8:	863e                	mv	a2,a5
    80002dca:	85b6                	mv	a1,a3
    80002dcc:	853a                	mv	a0,a4
    80002dce:	fffff097          	auipc	ra,0xfffff
    80002dd2:	442080e7          	jalr	1090(ra) # 80002210 <uvmcopy>
    80002dd6:	87aa                	mv	a5,a0
    80002dd8:	0207d163          	bgez	a5,80002dfa <fork+0x6e>
    freeproc(np);
    80002ddc:	fd843503          	ld	a0,-40(s0)
    80002de0:	00000097          	auipc	ra,0x0
    80002de4:	ca0080e7          	jalr	-864(ra) # 80002a80 <freeproc>
    release(&np->lock);
    80002de8:	fd843783          	ld	a5,-40(s0)
    80002dec:	853e                	mv	a0,a5
    80002dee:	ffffe097          	auipc	ra,0xffffe
    80002df2:	53a080e7          	jalr	1338(ra) # 80001328 <release>
    return -1;
    80002df6:	57fd                	li	a5,-1
    80002df8:	aa25                	j	80002f30 <fork+0x1a4>
  }
  np->sz = p->sz;
    80002dfa:	fe043783          	ld	a5,-32(s0)
    80002dfe:	67b8                	ld	a4,72(a5)
    80002e00:	fd843783          	ld	a5,-40(s0)
    80002e04:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002e06:	fe043783          	ld	a5,-32(s0)
    80002e0a:	6fb8                	ld	a4,88(a5)
    80002e0c:	fd843783          	ld	a5,-40(s0)
    80002e10:	6fbc                	ld	a5,88(a5)
    80002e12:	86be                	mv	a3,a5
    80002e14:	12000793          	li	a5,288
    80002e18:	863e                	mv	a2,a5
    80002e1a:	85ba                	mv	a1,a4
    80002e1c:	8536                	mv	a0,a3
    80002e1e:	fffff097          	auipc	ra,0xfffff
    80002e22:	846080e7          	jalr	-1978(ra) # 80001664 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002e26:	fd843783          	ld	a5,-40(s0)
    80002e2a:	6fbc                	ld	a5,88(a5)
    80002e2c:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002e30:	fe042623          	sw	zero,-20(s0)
    80002e34:	a0a9                	j	80002e7e <fork+0xf2>
    if(p->ofile[i])
    80002e36:	fe043703          	ld	a4,-32(s0)
    80002e3a:	fec42783          	lw	a5,-20(s0)
    80002e3e:	07e9                	addi	a5,a5,26
    80002e40:	078e                	slli	a5,a5,0x3
    80002e42:	97ba                	add	a5,a5,a4
    80002e44:	639c                	ld	a5,0(a5)
    80002e46:	c79d                	beqz	a5,80002e74 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002e48:	fe043703          	ld	a4,-32(s0)
    80002e4c:	fec42783          	lw	a5,-20(s0)
    80002e50:	07e9                	addi	a5,a5,26
    80002e52:	078e                	slli	a5,a5,0x3
    80002e54:	97ba                	add	a5,a5,a4
    80002e56:	639c                	ld	a5,0(a5)
    80002e58:	853e                	mv	a0,a5
    80002e5a:	00004097          	auipc	ra,0x4
    80002e5e:	9d4080e7          	jalr	-1580(ra) # 8000682e <filedup>
    80002e62:	86aa                	mv	a3,a0
    80002e64:	fd843703          	ld	a4,-40(s0)
    80002e68:	fec42783          	lw	a5,-20(s0)
    80002e6c:	07e9                	addi	a5,a5,26
    80002e6e:	078e                	slli	a5,a5,0x3
    80002e70:	97ba                	add	a5,a5,a4
    80002e72:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002e74:	fec42783          	lw	a5,-20(s0)
    80002e78:	2785                	addiw	a5,a5,1
    80002e7a:	fef42623          	sw	a5,-20(s0)
    80002e7e:	fec42783          	lw	a5,-20(s0)
    80002e82:	0007871b          	sext.w	a4,a5
    80002e86:	47bd                	li	a5,15
    80002e88:	fae7d7e3          	bge	a5,a4,80002e36 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002e8c:	fe043783          	ld	a5,-32(s0)
    80002e90:	1507b783          	ld	a5,336(a5)
    80002e94:	853e                	mv	a0,a5
    80002e96:	00002097          	auipc	ra,0x2
    80002e9a:	2b8080e7          	jalr	696(ra) # 8000514e <idup>
    80002e9e:	872a                	mv	a4,a0
    80002ea0:	fd843783          	ld	a5,-40(s0)
    80002ea4:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002ea8:	fd843783          	ld	a5,-40(s0)
    80002eac:	15878713          	addi	a4,a5,344
    80002eb0:	fe043783          	ld	a5,-32(s0)
    80002eb4:	15878793          	addi	a5,a5,344
    80002eb8:	4641                	li	a2,16
    80002eba:	85be                	mv	a1,a5
    80002ebc:	853a                	mv	a0,a4
    80002ebe:	fffff097          	auipc	ra,0xfffff
    80002ec2:	8f2080e7          	jalr	-1806(ra) # 800017b0 <safestrcpy>

  pid = np->pid;
    80002ec6:	fd843783          	ld	a5,-40(s0)
    80002eca:	5b9c                	lw	a5,48(a5)
    80002ecc:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80002ed0:	fd843783          	ld	a5,-40(s0)
    80002ed4:	853e                	mv	a0,a5
    80002ed6:	ffffe097          	auipc	ra,0xffffe
    80002eda:	452080e7          	jalr	1106(ra) # 80001328 <release>

  acquire(&wait_lock);
    80002ede:	00019517          	auipc	a0,0x19
    80002ee2:	0f250513          	addi	a0,a0,242 # 8001bfd0 <wait_lock>
    80002ee6:	ffffe097          	auipc	ra,0xffffe
    80002eea:	3de080e7          	jalr	990(ra) # 800012c4 <acquire>
  np->parent = p;
    80002eee:	fd843783          	ld	a5,-40(s0)
    80002ef2:	fe043703          	ld	a4,-32(s0)
    80002ef6:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002ef8:	00019517          	auipc	a0,0x19
    80002efc:	0d850513          	addi	a0,a0,216 # 8001bfd0 <wait_lock>
    80002f00:	ffffe097          	auipc	ra,0xffffe
    80002f04:	428080e7          	jalr	1064(ra) # 80001328 <release>

  acquire(&np->lock);
    80002f08:	fd843783          	ld	a5,-40(s0)
    80002f0c:	853e                	mv	a0,a5
    80002f0e:	ffffe097          	auipc	ra,0xffffe
    80002f12:	3b6080e7          	jalr	950(ra) # 800012c4 <acquire>
  np->state = RUNNABLE;
    80002f16:	fd843783          	ld	a5,-40(s0)
    80002f1a:	470d                	li	a4,3
    80002f1c:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    80002f1e:	fd843783          	ld	a5,-40(s0)
    80002f22:	853e                	mv	a0,a5
    80002f24:	ffffe097          	auipc	ra,0xffffe
    80002f28:	404080e7          	jalr	1028(ra) # 80001328 <release>

  return pid;
    80002f2c:	fd442783          	lw	a5,-44(s0)
}
    80002f30:	853e                	mv	a0,a5
    80002f32:	70a2                	ld	ra,40(sp)
    80002f34:	7402                	ld	s0,32(sp)
    80002f36:	6145                	addi	sp,sp,48
    80002f38:	8082                	ret

0000000080002f3a <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80002f3a:	7179                	addi	sp,sp,-48
    80002f3c:	f406                	sd	ra,40(sp)
    80002f3e:	f022                	sd	s0,32(sp)
    80002f40:	1800                	addi	s0,sp,48
    80002f42:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002f46:	00013797          	auipc	a5,0x13
    80002f4a:	67278793          	addi	a5,a5,1650 # 800165b8 <proc>
    80002f4e:	fef43423          	sd	a5,-24(s0)
    80002f52:	a081                	j	80002f92 <reparent+0x58>
    if(pp->parent == p){
    80002f54:	fe843783          	ld	a5,-24(s0)
    80002f58:	7f9c                	ld	a5,56(a5)
    80002f5a:	fd843703          	ld	a4,-40(s0)
    80002f5e:	02f71463          	bne	a4,a5,80002f86 <reparent+0x4c>
      pp->parent = initproc;
    80002f62:	0000b797          	auipc	a5,0xb
    80002f66:	fde78793          	addi	a5,a5,-34 # 8000df40 <initproc>
    80002f6a:	6398                	ld	a4,0(a5)
    80002f6c:	fe843783          	ld	a5,-24(s0)
    80002f70:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80002f72:	0000b797          	auipc	a5,0xb
    80002f76:	fce78793          	addi	a5,a5,-50 # 8000df40 <initproc>
    80002f7a:	639c                	ld	a5,0(a5)
    80002f7c:	853e                	mv	a0,a5
    80002f7e:	00000097          	auipc	ra,0x0
    80002f82:	574080e7          	jalr	1396(ra) # 800034f2 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002f86:	fe843783          	ld	a5,-24(s0)
    80002f8a:	16878793          	addi	a5,a5,360
    80002f8e:	fef43423          	sd	a5,-24(s0)
    80002f92:	fe843703          	ld	a4,-24(s0)
    80002f96:	00019797          	auipc	a5,0x19
    80002f9a:	02278793          	addi	a5,a5,34 # 8001bfb8 <pid_lock>
    80002f9e:	faf76be3          	bltu	a4,a5,80002f54 <reparent+0x1a>
    }
  }
}
    80002fa2:	0001                	nop
    80002fa4:	0001                	nop
    80002fa6:	70a2                	ld	ra,40(sp)
    80002fa8:	7402                	ld	s0,32(sp)
    80002faa:	6145                	addi	sp,sp,48
    80002fac:	8082                	ret

0000000080002fae <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80002fae:	7139                	addi	sp,sp,-64
    80002fb0:	fc06                	sd	ra,56(sp)
    80002fb2:	f822                	sd	s0,48(sp)
    80002fb4:	0080                	addi	s0,sp,64
    80002fb6:	87aa                	mv	a5,a0
    80002fb8:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80002fbc:	00000097          	auipc	ra,0x0
    80002fc0:	900080e7          	jalr	-1792(ra) # 800028bc <myproc>
    80002fc4:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80002fc8:	0000b797          	auipc	a5,0xb
    80002fcc:	f7878793          	addi	a5,a5,-136 # 8000df40 <initproc>
    80002fd0:	639c                	ld	a5,0(a5)
    80002fd2:	fe043703          	ld	a4,-32(s0)
    80002fd6:	00f71a63          	bne	a4,a5,80002fea <exit+0x3c>
    panic("init exiting");
    80002fda:	00008517          	auipc	a0,0x8
    80002fde:	22650513          	addi	a0,a0,550 # 8000b200 <etext+0x200>
    80002fe2:	ffffe097          	auipc	ra,0xffffe
    80002fe6:	cde080e7          	jalr	-802(ra) # 80000cc0 <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80002fea:	fe042623          	sw	zero,-20(s0)
    80002fee:	a881                	j	8000303e <exit+0x90>
    if(p->ofile[fd]){
    80002ff0:	fe043703          	ld	a4,-32(s0)
    80002ff4:	fec42783          	lw	a5,-20(s0)
    80002ff8:	07e9                	addi	a5,a5,26
    80002ffa:	078e                	slli	a5,a5,0x3
    80002ffc:	97ba                	add	a5,a5,a4
    80002ffe:	639c                	ld	a5,0(a5)
    80003000:	cb95                	beqz	a5,80003034 <exit+0x86>
      struct file *f = p->ofile[fd];
    80003002:	fe043703          	ld	a4,-32(s0)
    80003006:	fec42783          	lw	a5,-20(s0)
    8000300a:	07e9                	addi	a5,a5,26
    8000300c:	078e                	slli	a5,a5,0x3
    8000300e:	97ba                	add	a5,a5,a4
    80003010:	639c                	ld	a5,0(a5)
    80003012:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80003016:	fd843503          	ld	a0,-40(s0)
    8000301a:	00004097          	auipc	ra,0x4
    8000301e:	87a080e7          	jalr	-1926(ra) # 80006894 <fileclose>
      p->ofile[fd] = 0;
    80003022:	fe043703          	ld	a4,-32(s0)
    80003026:	fec42783          	lw	a5,-20(s0)
    8000302a:	07e9                	addi	a5,a5,26
    8000302c:	078e                	slli	a5,a5,0x3
    8000302e:	97ba                	add	a5,a5,a4
    80003030:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80003034:	fec42783          	lw	a5,-20(s0)
    80003038:	2785                	addiw	a5,a5,1
    8000303a:	fef42623          	sw	a5,-20(s0)
    8000303e:	fec42783          	lw	a5,-20(s0)
    80003042:	0007871b          	sext.w	a4,a5
    80003046:	47bd                	li	a5,15
    80003048:	fae7d4e3          	bge	a5,a4,80002ff0 <exit+0x42>
    }
  }

  begin_op();
    8000304c:	00003097          	auipc	ra,0x3
    80003050:	1be080e7          	jalr	446(ra) # 8000620a <begin_op>
  iput(p->cwd);
    80003054:	fe043783          	ld	a5,-32(s0)
    80003058:	1507b783          	ld	a5,336(a5)
    8000305c:	853e                	mv	a0,a5
    8000305e:	00002097          	auipc	ra,0x2
    80003062:	2ca080e7          	jalr	714(ra) # 80005328 <iput>
  end_op();
    80003066:	00003097          	auipc	ra,0x3
    8000306a:	266080e7          	jalr	614(ra) # 800062cc <end_op>
  p->cwd = 0;
    8000306e:	fe043783          	ld	a5,-32(s0)
    80003072:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80003076:	00019517          	auipc	a0,0x19
    8000307a:	f5a50513          	addi	a0,a0,-166 # 8001bfd0 <wait_lock>
    8000307e:	ffffe097          	auipc	ra,0xffffe
    80003082:	246080e7          	jalr	582(ra) # 800012c4 <acquire>

  // Give any children to init.
  reparent(p);
    80003086:	fe043503          	ld	a0,-32(s0)
    8000308a:	00000097          	auipc	ra,0x0
    8000308e:	eb0080e7          	jalr	-336(ra) # 80002f3a <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    80003092:	fe043783          	ld	a5,-32(s0)
    80003096:	7f9c                	ld	a5,56(a5)
    80003098:	853e                	mv	a0,a5
    8000309a:	00000097          	auipc	ra,0x0
    8000309e:	458080e7          	jalr	1112(ra) # 800034f2 <wakeup>
  
  acquire(&p->lock);
    800030a2:	fe043783          	ld	a5,-32(s0)
    800030a6:	853e                	mv	a0,a5
    800030a8:	ffffe097          	auipc	ra,0xffffe
    800030ac:	21c080e7          	jalr	540(ra) # 800012c4 <acquire>

  p->xstate = status;
    800030b0:	fe043783          	ld	a5,-32(s0)
    800030b4:	fcc42703          	lw	a4,-52(s0)
    800030b8:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    800030ba:	fe043783          	ld	a5,-32(s0)
    800030be:	4715                	li	a4,5
    800030c0:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    800030c2:	00019517          	auipc	a0,0x19
    800030c6:	f0e50513          	addi	a0,a0,-242 # 8001bfd0 <wait_lock>
    800030ca:	ffffe097          	auipc	ra,0xffffe
    800030ce:	25e080e7          	jalr	606(ra) # 80001328 <release>

  // Jump into the scheduler, never to return.
  sched();
    800030d2:	00000097          	auipc	ra,0x0
    800030d6:	22c080e7          	jalr	556(ra) # 800032fe <sched>
  panic("zombie exit");
    800030da:	00008517          	auipc	a0,0x8
    800030de:	13650513          	addi	a0,a0,310 # 8000b210 <etext+0x210>
    800030e2:	ffffe097          	auipc	ra,0xffffe
    800030e6:	bde080e7          	jalr	-1058(ra) # 80000cc0 <panic>

00000000800030ea <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800030ea:	7139                	addi	sp,sp,-64
    800030ec:	fc06                	sd	ra,56(sp)
    800030ee:	f822                	sd	s0,48(sp)
    800030f0:	0080                	addi	s0,sp,64
    800030f2:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    800030f6:	fffff097          	auipc	ra,0xfffff
    800030fa:	7c6080e7          	jalr	1990(ra) # 800028bc <myproc>
    800030fe:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003102:	00019517          	auipc	a0,0x19
    80003106:	ece50513          	addi	a0,a0,-306 # 8001bfd0 <wait_lock>
    8000310a:	ffffe097          	auipc	ra,0xffffe
    8000310e:	1ba080e7          	jalr	442(ra) # 800012c4 <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003112:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    80003116:	00013797          	auipc	a5,0x13
    8000311a:	4a278793          	addi	a5,a5,1186 # 800165b8 <proc>
    8000311e:	fef43423          	sd	a5,-24(s0)
    80003122:	a8c9                	j	800031f4 <wait+0x10a>
      if(pp->parent == p){
    80003124:	fe843783          	ld	a5,-24(s0)
    80003128:	7f9c                	ld	a5,56(a5)
    8000312a:	fd843703          	ld	a4,-40(s0)
    8000312e:	0af71d63          	bne	a4,a5,800031e8 <wait+0xfe>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    80003132:	fe843783          	ld	a5,-24(s0)
    80003136:	853e                	mv	a0,a5
    80003138:	ffffe097          	auipc	ra,0xffffe
    8000313c:	18c080e7          	jalr	396(ra) # 800012c4 <acquire>

        havekids = 1;
    80003140:	4785                	li	a5,1
    80003142:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    80003146:	fe843783          	ld	a5,-24(s0)
    8000314a:	4f98                	lw	a4,24(a5)
    8000314c:	4795                	li	a5,5
    8000314e:	08f71663          	bne	a4,a5,800031da <wait+0xf0>
          // Found one.
          pid = pp->pid;
    80003152:	fe843783          	ld	a5,-24(s0)
    80003156:	5b9c                	lw	a5,48(a5)
    80003158:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    8000315c:	fc843783          	ld	a5,-56(s0)
    80003160:	c7a9                	beqz	a5,800031aa <wait+0xc0>
    80003162:	fd843783          	ld	a5,-40(s0)
    80003166:	6bb8                	ld	a4,80(a5)
    80003168:	fe843783          	ld	a5,-24(s0)
    8000316c:	02c78793          	addi	a5,a5,44
    80003170:	4691                	li	a3,4
    80003172:	863e                	mv	a2,a5
    80003174:	fc843583          	ld	a1,-56(s0)
    80003178:	853a                	mv	a0,a4
    8000317a:	fffff097          	auipc	ra,0xfffff
    8000317e:	200080e7          	jalr	512(ra) # 8000237a <copyout>
    80003182:	87aa                	mv	a5,a0
    80003184:	0207d363          	bgez	a5,800031aa <wait+0xc0>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    80003188:	fe843783          	ld	a5,-24(s0)
    8000318c:	853e                	mv	a0,a5
    8000318e:	ffffe097          	auipc	ra,0xffffe
    80003192:	19a080e7          	jalr	410(ra) # 80001328 <release>
            release(&wait_lock);
    80003196:	00019517          	auipc	a0,0x19
    8000319a:	e3a50513          	addi	a0,a0,-454 # 8001bfd0 <wait_lock>
    8000319e:	ffffe097          	auipc	ra,0xffffe
    800031a2:	18a080e7          	jalr	394(ra) # 80001328 <release>
            return -1;
    800031a6:	57fd                	li	a5,-1
    800031a8:	a879                	j	80003246 <wait+0x15c>
          }
          freeproc(pp);
    800031aa:	fe843503          	ld	a0,-24(s0)
    800031ae:	00000097          	auipc	ra,0x0
    800031b2:	8d2080e7          	jalr	-1838(ra) # 80002a80 <freeproc>
          release(&pp->lock);
    800031b6:	fe843783          	ld	a5,-24(s0)
    800031ba:	853e                	mv	a0,a5
    800031bc:	ffffe097          	auipc	ra,0xffffe
    800031c0:	16c080e7          	jalr	364(ra) # 80001328 <release>
          release(&wait_lock);
    800031c4:	00019517          	auipc	a0,0x19
    800031c8:	e0c50513          	addi	a0,a0,-500 # 8001bfd0 <wait_lock>
    800031cc:	ffffe097          	auipc	ra,0xffffe
    800031d0:	15c080e7          	jalr	348(ra) # 80001328 <release>
          return pid;
    800031d4:	fd442783          	lw	a5,-44(s0)
    800031d8:	a0bd                	j	80003246 <wait+0x15c>
        }
        release(&pp->lock);
    800031da:	fe843783          	ld	a5,-24(s0)
    800031de:	853e                	mv	a0,a5
    800031e0:	ffffe097          	auipc	ra,0xffffe
    800031e4:	148080e7          	jalr	328(ra) # 80001328 <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800031e8:	fe843783          	ld	a5,-24(s0)
    800031ec:	16878793          	addi	a5,a5,360
    800031f0:	fef43423          	sd	a5,-24(s0)
    800031f4:	fe843703          	ld	a4,-24(s0)
    800031f8:	00019797          	auipc	a5,0x19
    800031fc:	dc078793          	addi	a5,a5,-576 # 8001bfb8 <pid_lock>
    80003200:	f2f762e3          	bltu	a4,a5,80003124 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    80003204:	fe442783          	lw	a5,-28(s0)
    80003208:	2781                	sext.w	a5,a5
    8000320a:	cb89                	beqz	a5,8000321c <wait+0x132>
    8000320c:	fd843503          	ld	a0,-40(s0)
    80003210:	00000097          	auipc	ra,0x0
    80003214:	44c080e7          	jalr	1100(ra) # 8000365c <killed>
    80003218:	87aa                	mv	a5,a0
    8000321a:	cb99                	beqz	a5,80003230 <wait+0x146>
      release(&wait_lock);
    8000321c:	00019517          	auipc	a0,0x19
    80003220:	db450513          	addi	a0,a0,-588 # 8001bfd0 <wait_lock>
    80003224:	ffffe097          	auipc	ra,0xffffe
    80003228:	104080e7          	jalr	260(ra) # 80001328 <release>
      return -1;
    8000322c:	57fd                	li	a5,-1
    8000322e:	a821                	j	80003246 <wait+0x15c>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    80003230:	00019597          	auipc	a1,0x19
    80003234:	da058593          	addi	a1,a1,-608 # 8001bfd0 <wait_lock>
    80003238:	fd843503          	ld	a0,-40(s0)
    8000323c:	00000097          	auipc	ra,0x0
    80003240:	23a080e7          	jalr	570(ra) # 80003476 <sleep>
    havekids = 0;
    80003244:	b5f9                	j	80003112 <wait+0x28>
  }
}
    80003246:	853e                	mv	a0,a5
    80003248:	70e2                	ld	ra,56(sp)
    8000324a:	7442                	ld	s0,48(sp)
    8000324c:	6121                	addi	sp,sp,64
    8000324e:	8082                	ret

0000000080003250 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    80003250:	1101                	addi	sp,sp,-32
    80003252:	ec06                	sd	ra,24(sp)
    80003254:	e822                	sd	s0,16(sp)
    80003256:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003258:	fffff097          	auipc	ra,0xfffff
    8000325c:	62a080e7          	jalr	1578(ra) # 80002882 <mycpu>
    80003260:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    80003264:	fe043783          	ld	a5,-32(s0)
    80003268:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    8000326c:	fffff097          	auipc	ra,0xfffff
    80003270:	3f4080e7          	jalr	1012(ra) # 80002660 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    80003274:	00013797          	auipc	a5,0x13
    80003278:	34478793          	addi	a5,a5,836 # 800165b8 <proc>
    8000327c:	fef43423          	sd	a5,-24(s0)
    80003280:	a0b5                	j	800032ec <scheduler+0x9c>
      acquire(&p->lock);
    80003282:	fe843783          	ld	a5,-24(s0)
    80003286:	853e                	mv	a0,a5
    80003288:	ffffe097          	auipc	ra,0xffffe
    8000328c:	03c080e7          	jalr	60(ra) # 800012c4 <acquire>
      if(p->state == RUNNABLE) {
    80003290:	fe843783          	ld	a5,-24(s0)
    80003294:	4f98                	lw	a4,24(a5)
    80003296:	478d                	li	a5,3
    80003298:	02f71d63          	bne	a4,a5,800032d2 <scheduler+0x82>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    8000329c:	fe843783          	ld	a5,-24(s0)
    800032a0:	4711                	li	a4,4
    800032a2:	cf98                	sw	a4,24(a5)
        c->proc = p;
    800032a4:	fe043783          	ld	a5,-32(s0)
    800032a8:	fe843703          	ld	a4,-24(s0)
    800032ac:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    800032ae:	fe043783          	ld	a5,-32(s0)
    800032b2:	00878713          	addi	a4,a5,8
    800032b6:	fe843783          	ld	a5,-24(s0)
    800032ba:	06078793          	addi	a5,a5,96
    800032be:	85be                	mv	a1,a5
    800032c0:	853a                	mv	a0,a4
    800032c2:	00000097          	auipc	ra,0x0
    800032c6:	672080e7          	jalr	1650(ra) # 80003934 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800032ca:	fe043783          	ld	a5,-32(s0)
    800032ce:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    800032d2:	fe843783          	ld	a5,-24(s0)
    800032d6:	853e                	mv	a0,a5
    800032d8:	ffffe097          	auipc	ra,0xffffe
    800032dc:	050080e7          	jalr	80(ra) # 80001328 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    800032e0:	fe843783          	ld	a5,-24(s0)
    800032e4:	16878793          	addi	a5,a5,360
    800032e8:	fef43423          	sd	a5,-24(s0)
    800032ec:	fe843703          	ld	a4,-24(s0)
    800032f0:	00019797          	auipc	a5,0x19
    800032f4:	cc878793          	addi	a5,a5,-824 # 8001bfb8 <pid_lock>
    800032f8:	f8f765e3          	bltu	a4,a5,80003282 <scheduler+0x32>
    intr_on();
    800032fc:	bf85                	j	8000326c <scheduler+0x1c>

00000000800032fe <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800032fe:	7179                	addi	sp,sp,-48
    80003300:	f406                	sd	ra,40(sp)
    80003302:	f022                	sd	s0,32(sp)
    80003304:	ec26                	sd	s1,24(sp)
    80003306:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    80003308:	fffff097          	auipc	ra,0xfffff
    8000330c:	5b4080e7          	jalr	1460(ra) # 800028bc <myproc>
    80003310:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    80003314:	fd843783          	ld	a5,-40(s0)
    80003318:	853e                	mv	a0,a5
    8000331a:	ffffe097          	auipc	ra,0xffffe
    8000331e:	064080e7          	jalr	100(ra) # 8000137e <holding>
    80003322:	87aa                	mv	a5,a0
    80003324:	eb89                	bnez	a5,80003336 <sched+0x38>
    panic("sched p->lock");
    80003326:	00008517          	auipc	a0,0x8
    8000332a:	efa50513          	addi	a0,a0,-262 # 8000b220 <etext+0x220>
    8000332e:	ffffe097          	auipc	ra,0xffffe
    80003332:	992080e7          	jalr	-1646(ra) # 80000cc0 <panic>
  if(mycpu()->noff != 1)
    80003336:	fffff097          	auipc	ra,0xfffff
    8000333a:	54c080e7          	jalr	1356(ra) # 80002882 <mycpu>
    8000333e:	87aa                	mv	a5,a0
    80003340:	5fb8                	lw	a4,120(a5)
    80003342:	4785                	li	a5,1
    80003344:	00f70a63          	beq	a4,a5,80003358 <sched+0x5a>
    panic("sched locks");
    80003348:	00008517          	auipc	a0,0x8
    8000334c:	ee850513          	addi	a0,a0,-280 # 8000b230 <etext+0x230>
    80003350:	ffffe097          	auipc	ra,0xffffe
    80003354:	970080e7          	jalr	-1680(ra) # 80000cc0 <panic>
  if(p->state == RUNNING)
    80003358:	fd843783          	ld	a5,-40(s0)
    8000335c:	4f98                	lw	a4,24(a5)
    8000335e:	4791                	li	a5,4
    80003360:	00f71a63          	bne	a4,a5,80003374 <sched+0x76>
    panic("sched running");
    80003364:	00008517          	auipc	a0,0x8
    80003368:	edc50513          	addi	a0,a0,-292 # 8000b240 <etext+0x240>
    8000336c:	ffffe097          	auipc	ra,0xffffe
    80003370:	954080e7          	jalr	-1708(ra) # 80000cc0 <panic>
  if(intr_get())
    80003374:	fffff097          	auipc	ra,0xfffff
    80003378:	316080e7          	jalr	790(ra) # 8000268a <intr_get>
    8000337c:	87aa                	mv	a5,a0
    8000337e:	cb89                	beqz	a5,80003390 <sched+0x92>
    panic("sched interruptible");
    80003380:	00008517          	auipc	a0,0x8
    80003384:	ed050513          	addi	a0,a0,-304 # 8000b250 <etext+0x250>
    80003388:	ffffe097          	auipc	ra,0xffffe
    8000338c:	938080e7          	jalr	-1736(ra) # 80000cc0 <panic>

  intena = mycpu()->intena;
    80003390:	fffff097          	auipc	ra,0xfffff
    80003394:	4f2080e7          	jalr	1266(ra) # 80002882 <mycpu>
    80003398:	87aa                	mv	a5,a0
    8000339a:	5ffc                	lw	a5,124(a5)
    8000339c:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    800033a0:	fd843783          	ld	a5,-40(s0)
    800033a4:	06078493          	addi	s1,a5,96
    800033a8:	fffff097          	auipc	ra,0xfffff
    800033ac:	4da080e7          	jalr	1242(ra) # 80002882 <mycpu>
    800033b0:	87aa                	mv	a5,a0
    800033b2:	07a1                	addi	a5,a5,8
    800033b4:	85be                	mv	a1,a5
    800033b6:	8526                	mv	a0,s1
    800033b8:	00000097          	auipc	ra,0x0
    800033bc:	57c080e7          	jalr	1404(ra) # 80003934 <swtch>
  mycpu()->intena = intena;
    800033c0:	fffff097          	auipc	ra,0xfffff
    800033c4:	4c2080e7          	jalr	1218(ra) # 80002882 <mycpu>
    800033c8:	872a                	mv	a4,a0
    800033ca:	fd442783          	lw	a5,-44(s0)
    800033ce:	df7c                	sw	a5,124(a4)
}
    800033d0:	0001                	nop
    800033d2:	70a2                	ld	ra,40(sp)
    800033d4:	7402                	ld	s0,32(sp)
    800033d6:	64e2                	ld	s1,24(sp)
    800033d8:	6145                	addi	sp,sp,48
    800033da:	8082                	ret

00000000800033dc <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800033dc:	1101                	addi	sp,sp,-32
    800033de:	ec06                	sd	ra,24(sp)
    800033e0:	e822                	sd	s0,16(sp)
    800033e2:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800033e4:	fffff097          	auipc	ra,0xfffff
    800033e8:	4d8080e7          	jalr	1240(ra) # 800028bc <myproc>
    800033ec:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800033f0:	fe843783          	ld	a5,-24(s0)
    800033f4:	853e                	mv	a0,a5
    800033f6:	ffffe097          	auipc	ra,0xffffe
    800033fa:	ece080e7          	jalr	-306(ra) # 800012c4 <acquire>
  p->state = RUNNABLE;
    800033fe:	fe843783          	ld	a5,-24(s0)
    80003402:	470d                	li	a4,3
    80003404:	cf98                	sw	a4,24(a5)
  sched();
    80003406:	00000097          	auipc	ra,0x0
    8000340a:	ef8080e7          	jalr	-264(ra) # 800032fe <sched>
  release(&p->lock);
    8000340e:	fe843783          	ld	a5,-24(s0)
    80003412:	853e                	mv	a0,a5
    80003414:	ffffe097          	auipc	ra,0xffffe
    80003418:	f14080e7          	jalr	-236(ra) # 80001328 <release>
}
    8000341c:	0001                	nop
    8000341e:	60e2                	ld	ra,24(sp)
    80003420:	6442                	ld	s0,16(sp)
    80003422:	6105                	addi	sp,sp,32
    80003424:	8082                	ret

0000000080003426 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    80003426:	1141                	addi	sp,sp,-16
    80003428:	e406                	sd	ra,8(sp)
    8000342a:	e022                	sd	s0,0(sp)
    8000342c:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    8000342e:	fffff097          	auipc	ra,0xfffff
    80003432:	48e080e7          	jalr	1166(ra) # 800028bc <myproc>
    80003436:	87aa                	mv	a5,a0
    80003438:	853e                	mv	a0,a5
    8000343a:	ffffe097          	auipc	ra,0xffffe
    8000343e:	eee080e7          	jalr	-274(ra) # 80001328 <release>

  if (first) {
    80003442:	0000b797          	auipc	a5,0xb
    80003446:	97278793          	addi	a5,a5,-1678 # 8000ddb4 <first.1>
    8000344a:	439c                	lw	a5,0(a5)
    8000344c:	cf81                	beqz	a5,80003464 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    8000344e:	0000b797          	auipc	a5,0xb
    80003452:	96678793          	addi	a5,a5,-1690 # 8000ddb4 <first.1>
    80003456:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    8000345a:	4505                	li	a0,1
    8000345c:	00001097          	auipc	ra,0x1
    80003460:	5e8080e7          	jalr	1512(ra) # 80004a44 <fsinit>
  }

  usertrapret();
    80003464:	00001097          	auipc	ra,0x1
    80003468:	8ae080e7          	jalr	-1874(ra) # 80003d12 <usertrapret>
}
    8000346c:	0001                	nop
    8000346e:	60a2                	ld	ra,8(sp)
    80003470:	6402                	ld	s0,0(sp)
    80003472:	0141                	addi	sp,sp,16
    80003474:	8082                	ret

0000000080003476 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003476:	7179                	addi	sp,sp,-48
    80003478:	f406                	sd	ra,40(sp)
    8000347a:	f022                	sd	s0,32(sp)
    8000347c:	1800                	addi	s0,sp,48
    8000347e:	fca43c23          	sd	a0,-40(s0)
    80003482:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003486:	fffff097          	auipc	ra,0xfffff
    8000348a:	436080e7          	jalr	1078(ra) # 800028bc <myproc>
    8000348e:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80003492:	fe843783          	ld	a5,-24(s0)
    80003496:	853e                	mv	a0,a5
    80003498:	ffffe097          	auipc	ra,0xffffe
    8000349c:	e2c080e7          	jalr	-468(ra) # 800012c4 <acquire>
  release(lk);
    800034a0:	fd043503          	ld	a0,-48(s0)
    800034a4:	ffffe097          	auipc	ra,0xffffe
    800034a8:	e84080e7          	jalr	-380(ra) # 80001328 <release>

  // Go to sleep.
  p->chan = chan;
    800034ac:	fe843783          	ld	a5,-24(s0)
    800034b0:	fd843703          	ld	a4,-40(s0)
    800034b4:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    800034b6:	fe843783          	ld	a5,-24(s0)
    800034ba:	4709                	li	a4,2
    800034bc:	cf98                	sw	a4,24(a5)

  sched();
    800034be:	00000097          	auipc	ra,0x0
    800034c2:	e40080e7          	jalr	-448(ra) # 800032fe <sched>

  // Tidy up.
  p->chan = 0;
    800034c6:	fe843783          	ld	a5,-24(s0)
    800034ca:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    800034ce:	fe843783          	ld	a5,-24(s0)
    800034d2:	853e                	mv	a0,a5
    800034d4:	ffffe097          	auipc	ra,0xffffe
    800034d8:	e54080e7          	jalr	-428(ra) # 80001328 <release>
  acquire(lk);
    800034dc:	fd043503          	ld	a0,-48(s0)
    800034e0:	ffffe097          	auipc	ra,0xffffe
    800034e4:	de4080e7          	jalr	-540(ra) # 800012c4 <acquire>
}
    800034e8:	0001                	nop
    800034ea:	70a2                	ld	ra,40(sp)
    800034ec:	7402                	ld	s0,32(sp)
    800034ee:	6145                	addi	sp,sp,48
    800034f0:	8082                	ret

00000000800034f2 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800034f2:	7179                	addi	sp,sp,-48
    800034f4:	f406                	sd	ra,40(sp)
    800034f6:	f022                	sd	s0,32(sp)
    800034f8:	1800                	addi	s0,sp,48
    800034fa:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800034fe:	00013797          	auipc	a5,0x13
    80003502:	0ba78793          	addi	a5,a5,186 # 800165b8 <proc>
    80003506:	fef43423          	sd	a5,-24(s0)
    8000350a:	a8b9                	j	80003568 <wakeup+0x76>
    if(p != myproc()){
    8000350c:	fffff097          	auipc	ra,0xfffff
    80003510:	3b0080e7          	jalr	944(ra) # 800028bc <myproc>
    80003514:	872a                	mv	a4,a0
    80003516:	fe843783          	ld	a5,-24(s0)
    8000351a:	04e78163          	beq	a5,a4,8000355c <wakeup+0x6a>
      acquire(&p->lock);
    8000351e:	fe843783          	ld	a5,-24(s0)
    80003522:	853e                	mv	a0,a5
    80003524:	ffffe097          	auipc	ra,0xffffe
    80003528:	da0080e7          	jalr	-608(ra) # 800012c4 <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    8000352c:	fe843783          	ld	a5,-24(s0)
    80003530:	4f98                	lw	a4,24(a5)
    80003532:	4789                	li	a5,2
    80003534:	00f71d63          	bne	a4,a5,8000354e <wakeup+0x5c>
    80003538:	fe843783          	ld	a5,-24(s0)
    8000353c:	739c                	ld	a5,32(a5)
    8000353e:	fd843703          	ld	a4,-40(s0)
    80003542:	00f71663          	bne	a4,a5,8000354e <wakeup+0x5c>
        p->state = RUNNABLE;
    80003546:	fe843783          	ld	a5,-24(s0)
    8000354a:	470d                	li	a4,3
    8000354c:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    8000354e:	fe843783          	ld	a5,-24(s0)
    80003552:	853e                	mv	a0,a5
    80003554:	ffffe097          	auipc	ra,0xffffe
    80003558:	dd4080e7          	jalr	-556(ra) # 80001328 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    8000355c:	fe843783          	ld	a5,-24(s0)
    80003560:	16878793          	addi	a5,a5,360
    80003564:	fef43423          	sd	a5,-24(s0)
    80003568:	fe843703          	ld	a4,-24(s0)
    8000356c:	00019797          	auipc	a5,0x19
    80003570:	a4c78793          	addi	a5,a5,-1460 # 8001bfb8 <pid_lock>
    80003574:	f8f76ce3          	bltu	a4,a5,8000350c <wakeup+0x1a>
    }
  }
}
    80003578:	0001                	nop
    8000357a:	0001                	nop
    8000357c:	70a2                	ld	ra,40(sp)
    8000357e:	7402                	ld	s0,32(sp)
    80003580:	6145                	addi	sp,sp,48
    80003582:	8082                	ret

0000000080003584 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003584:	7179                	addi	sp,sp,-48
    80003586:	f406                	sd	ra,40(sp)
    80003588:	f022                	sd	s0,32(sp)
    8000358a:	1800                	addi	s0,sp,48
    8000358c:	87aa                	mv	a5,a0
    8000358e:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80003592:	00013797          	auipc	a5,0x13
    80003596:	02678793          	addi	a5,a5,38 # 800165b8 <proc>
    8000359a:	fef43423          	sd	a5,-24(s0)
    8000359e:	a0a5                	j	80003606 <kill+0x82>
    acquire(&p->lock);
    800035a0:	fe843783          	ld	a5,-24(s0)
    800035a4:	853e                	mv	a0,a5
    800035a6:	ffffe097          	auipc	ra,0xffffe
    800035aa:	d1e080e7          	jalr	-738(ra) # 800012c4 <acquire>
    if(p->pid == pid){
    800035ae:	fe843783          	ld	a5,-24(s0)
    800035b2:	5b9c                	lw	a5,48(a5)
    800035b4:	fdc42703          	lw	a4,-36(s0)
    800035b8:	2701                	sext.w	a4,a4
    800035ba:	02f71963          	bne	a4,a5,800035ec <kill+0x68>
      p->killed = 1;
    800035be:	fe843783          	ld	a5,-24(s0)
    800035c2:	4705                	li	a4,1
    800035c4:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    800035c6:	fe843783          	ld	a5,-24(s0)
    800035ca:	4f98                	lw	a4,24(a5)
    800035cc:	4789                	li	a5,2
    800035ce:	00f71663          	bne	a4,a5,800035da <kill+0x56>
        // Wake process from sleep().
        p->state = RUNNABLE;
    800035d2:	fe843783          	ld	a5,-24(s0)
    800035d6:	470d                	li	a4,3
    800035d8:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    800035da:	fe843783          	ld	a5,-24(s0)
    800035de:	853e                	mv	a0,a5
    800035e0:	ffffe097          	auipc	ra,0xffffe
    800035e4:	d48080e7          	jalr	-696(ra) # 80001328 <release>
      return 0;
    800035e8:	4781                	li	a5,0
    800035ea:	a03d                	j	80003618 <kill+0x94>
    }
    release(&p->lock);
    800035ec:	fe843783          	ld	a5,-24(s0)
    800035f0:	853e                	mv	a0,a5
    800035f2:	ffffe097          	auipc	ra,0xffffe
    800035f6:	d36080e7          	jalr	-714(ra) # 80001328 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    800035fa:	fe843783          	ld	a5,-24(s0)
    800035fe:	16878793          	addi	a5,a5,360
    80003602:	fef43423          	sd	a5,-24(s0)
    80003606:	fe843703          	ld	a4,-24(s0)
    8000360a:	00019797          	auipc	a5,0x19
    8000360e:	9ae78793          	addi	a5,a5,-1618 # 8001bfb8 <pid_lock>
    80003612:	f8f767e3          	bltu	a4,a5,800035a0 <kill+0x1c>
  }
  return -1;
    80003616:	57fd                	li	a5,-1
}
    80003618:	853e                	mv	a0,a5
    8000361a:	70a2                	ld	ra,40(sp)
    8000361c:	7402                	ld	s0,32(sp)
    8000361e:	6145                	addi	sp,sp,48
    80003620:	8082                	ret

0000000080003622 <setkilled>:

void
setkilled(struct proc *p)
{
    80003622:	1101                	addi	sp,sp,-32
    80003624:	ec06                	sd	ra,24(sp)
    80003626:	e822                	sd	s0,16(sp)
    80003628:	1000                	addi	s0,sp,32
    8000362a:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    8000362e:	fe843783          	ld	a5,-24(s0)
    80003632:	853e                	mv	a0,a5
    80003634:	ffffe097          	auipc	ra,0xffffe
    80003638:	c90080e7          	jalr	-880(ra) # 800012c4 <acquire>
  p->killed = 1;
    8000363c:	fe843783          	ld	a5,-24(s0)
    80003640:	4705                	li	a4,1
    80003642:	d798                	sw	a4,40(a5)
  release(&p->lock);
    80003644:	fe843783          	ld	a5,-24(s0)
    80003648:	853e                	mv	a0,a5
    8000364a:	ffffe097          	auipc	ra,0xffffe
    8000364e:	cde080e7          	jalr	-802(ra) # 80001328 <release>
}
    80003652:	0001                	nop
    80003654:	60e2                	ld	ra,24(sp)
    80003656:	6442                	ld	s0,16(sp)
    80003658:	6105                	addi	sp,sp,32
    8000365a:	8082                	ret

000000008000365c <killed>:

int
killed(struct proc *p)
{
    8000365c:	7179                	addi	sp,sp,-48
    8000365e:	f406                	sd	ra,40(sp)
    80003660:	f022                	sd	s0,32(sp)
    80003662:	1800                	addi	s0,sp,48
    80003664:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    80003668:	fd843783          	ld	a5,-40(s0)
    8000366c:	853e                	mv	a0,a5
    8000366e:	ffffe097          	auipc	ra,0xffffe
    80003672:	c56080e7          	jalr	-938(ra) # 800012c4 <acquire>
  k = p->killed;
    80003676:	fd843783          	ld	a5,-40(s0)
    8000367a:	579c                	lw	a5,40(a5)
    8000367c:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    80003680:	fd843783          	ld	a5,-40(s0)
    80003684:	853e                	mv	a0,a5
    80003686:	ffffe097          	auipc	ra,0xffffe
    8000368a:	ca2080e7          	jalr	-862(ra) # 80001328 <release>
  return k;
    8000368e:	fec42783          	lw	a5,-20(s0)
}
    80003692:	853e                	mv	a0,a5
    80003694:	70a2                	ld	ra,40(sp)
    80003696:	7402                	ld	s0,32(sp)
    80003698:	6145                	addi	sp,sp,48
    8000369a:	8082                	ret

000000008000369c <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8000369c:	7139                	addi	sp,sp,-64
    8000369e:	fc06                	sd	ra,56(sp)
    800036a0:	f822                	sd	s0,48(sp)
    800036a2:	0080                	addi	s0,sp,64
    800036a4:	87aa                	mv	a5,a0
    800036a6:	fcb43823          	sd	a1,-48(s0)
    800036aa:	fcc43423          	sd	a2,-56(s0)
    800036ae:	fcd43023          	sd	a3,-64(s0)
    800036b2:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800036b6:	fffff097          	auipc	ra,0xfffff
    800036ba:	206080e7          	jalr	518(ra) # 800028bc <myproc>
    800036be:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    800036c2:	fdc42783          	lw	a5,-36(s0)
    800036c6:	2781                	sext.w	a5,a5
    800036c8:	c38d                	beqz	a5,800036ea <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    800036ca:	fe843783          	ld	a5,-24(s0)
    800036ce:	6bbc                	ld	a5,80(a5)
    800036d0:	fc043683          	ld	a3,-64(s0)
    800036d4:	fc843603          	ld	a2,-56(s0)
    800036d8:	fd043583          	ld	a1,-48(s0)
    800036dc:	853e                	mv	a0,a5
    800036de:	fffff097          	auipc	ra,0xfffff
    800036e2:	c9c080e7          	jalr	-868(ra) # 8000237a <copyout>
    800036e6:	87aa                	mv	a5,a0
    800036e8:	a839                	j	80003706 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    800036ea:	fd043783          	ld	a5,-48(s0)
    800036ee:	fc043703          	ld	a4,-64(s0)
    800036f2:	2701                	sext.w	a4,a4
    800036f4:	863a                	mv	a2,a4
    800036f6:	fc843583          	ld	a1,-56(s0)
    800036fa:	853e                	mv	a0,a5
    800036fc:	ffffe097          	auipc	ra,0xffffe
    80003700:	e88080e7          	jalr	-376(ra) # 80001584 <memmove>
    return 0;
    80003704:	4781                	li	a5,0
  }
}
    80003706:	853e                	mv	a0,a5
    80003708:	70e2                	ld	ra,56(sp)
    8000370a:	7442                	ld	s0,48(sp)
    8000370c:	6121                	addi	sp,sp,64
    8000370e:	8082                	ret

0000000080003710 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003710:	7139                	addi	sp,sp,-64
    80003712:	fc06                	sd	ra,56(sp)
    80003714:	f822                	sd	s0,48(sp)
    80003716:	0080                	addi	s0,sp,64
    80003718:	fca43c23          	sd	a0,-40(s0)
    8000371c:	87ae                	mv	a5,a1
    8000371e:	fcc43423          	sd	a2,-56(s0)
    80003722:	fcd43023          	sd	a3,-64(s0)
    80003726:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    8000372a:	fffff097          	auipc	ra,0xfffff
    8000372e:	192080e7          	jalr	402(ra) # 800028bc <myproc>
    80003732:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003736:	fd442783          	lw	a5,-44(s0)
    8000373a:	2781                	sext.w	a5,a5
    8000373c:	c38d                	beqz	a5,8000375e <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    8000373e:	fe843783          	ld	a5,-24(s0)
    80003742:	6bbc                	ld	a5,80(a5)
    80003744:	fc043683          	ld	a3,-64(s0)
    80003748:	fc843603          	ld	a2,-56(s0)
    8000374c:	fd843583          	ld	a1,-40(s0)
    80003750:	853e                	mv	a0,a5
    80003752:	fffff097          	auipc	ra,0xfffff
    80003756:	cf6080e7          	jalr	-778(ra) # 80002448 <copyin>
    8000375a:	87aa                	mv	a5,a0
    8000375c:	a839                	j	8000377a <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    8000375e:	fc843783          	ld	a5,-56(s0)
    80003762:	fc043703          	ld	a4,-64(s0)
    80003766:	2701                	sext.w	a4,a4
    80003768:	863a                	mv	a2,a4
    8000376a:	85be                	mv	a1,a5
    8000376c:	fd843503          	ld	a0,-40(s0)
    80003770:	ffffe097          	auipc	ra,0xffffe
    80003774:	e14080e7          	jalr	-492(ra) # 80001584 <memmove>
    return 0;
    80003778:	4781                	li	a5,0
  }
}
    8000377a:	853e                	mv	a0,a5
    8000377c:	70e2                	ld	ra,56(sp)
    8000377e:	7442                	ld	s0,48(sp)
    80003780:	6121                	addi	sp,sp,64
    80003782:	8082                	ret

0000000080003784 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003784:	1101                	addi	sp,sp,-32
    80003786:	ec06                	sd	ra,24(sp)
    80003788:	e822                	sd	s0,16(sp)
    8000378a:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    8000378c:	00008517          	auipc	a0,0x8
    80003790:	adc50513          	addi	a0,a0,-1316 # 8000b268 <etext+0x268>
    80003794:	ffffd097          	auipc	ra,0xffffd
    80003798:	2d6080e7          	jalr	726(ra) # 80000a6a <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8000379c:	00013797          	auipc	a5,0x13
    800037a0:	e1c78793          	addi	a5,a5,-484 # 800165b8 <proc>
    800037a4:	fef43423          	sd	a5,-24(s0)
    800037a8:	a045                	j	80003848 <procdump+0xc4>
    if(p->state == UNUSED)
    800037aa:	fe843783          	ld	a5,-24(s0)
    800037ae:	4f9c                	lw	a5,24(a5)
    800037b0:	c7c9                	beqz	a5,8000383a <procdump+0xb6>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    800037b2:	fe843783          	ld	a5,-24(s0)
    800037b6:	4f98                	lw	a4,24(a5)
    800037b8:	4795                	li	a5,5
    800037ba:	02e7ee63          	bltu	a5,a4,800037f6 <procdump+0x72>
    800037be:	fe843783          	ld	a5,-24(s0)
    800037c2:	4f9c                	lw	a5,24(a5)
    800037c4:	0000a717          	auipc	a4,0xa
    800037c8:	64c70713          	addi	a4,a4,1612 # 8000de10 <states.0>
    800037cc:	1782                	slli	a5,a5,0x20
    800037ce:	9381                	srli	a5,a5,0x20
    800037d0:	078e                	slli	a5,a5,0x3
    800037d2:	97ba                	add	a5,a5,a4
    800037d4:	639c                	ld	a5,0(a5)
    800037d6:	c385                	beqz	a5,800037f6 <procdump+0x72>
      state = states[p->state];
    800037d8:	fe843783          	ld	a5,-24(s0)
    800037dc:	4f9c                	lw	a5,24(a5)
    800037de:	0000a717          	auipc	a4,0xa
    800037e2:	63270713          	addi	a4,a4,1586 # 8000de10 <states.0>
    800037e6:	1782                	slli	a5,a5,0x20
    800037e8:	9381                	srli	a5,a5,0x20
    800037ea:	078e                	slli	a5,a5,0x3
    800037ec:	97ba                	add	a5,a5,a4
    800037ee:	639c                	ld	a5,0(a5)
    800037f0:	fef43023          	sd	a5,-32(s0)
    800037f4:	a039                	j	80003802 <procdump+0x7e>
    else
      state = "???";
    800037f6:	00008797          	auipc	a5,0x8
    800037fa:	a7a78793          	addi	a5,a5,-1414 # 8000b270 <etext+0x270>
    800037fe:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003802:	fe843783          	ld	a5,-24(s0)
    80003806:	5b98                	lw	a4,48(a5)
    80003808:	fe843783          	ld	a5,-24(s0)
    8000380c:	15878793          	addi	a5,a5,344
    80003810:	86be                	mv	a3,a5
    80003812:	fe043603          	ld	a2,-32(s0)
    80003816:	85ba                	mv	a1,a4
    80003818:	00008517          	auipc	a0,0x8
    8000381c:	a6050513          	addi	a0,a0,-1440 # 8000b278 <etext+0x278>
    80003820:	ffffd097          	auipc	ra,0xffffd
    80003824:	24a080e7          	jalr	586(ra) # 80000a6a <printf>
    printf("\n");
    80003828:	00008517          	auipc	a0,0x8
    8000382c:	a4050513          	addi	a0,a0,-1472 # 8000b268 <etext+0x268>
    80003830:	ffffd097          	auipc	ra,0xffffd
    80003834:	23a080e7          	jalr	570(ra) # 80000a6a <printf>
    80003838:	a011                	j	8000383c <procdump+0xb8>
      continue;
    8000383a:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    8000383c:	fe843783          	ld	a5,-24(s0)
    80003840:	16878793          	addi	a5,a5,360
    80003844:	fef43423          	sd	a5,-24(s0)
    80003848:	fe843703          	ld	a4,-24(s0)
    8000384c:	00018797          	auipc	a5,0x18
    80003850:	76c78793          	addi	a5,a5,1900 # 8001bfb8 <pid_lock>
    80003854:	f4f76be3          	bltu	a4,a5,800037aa <procdump+0x26>
  }
}
    80003858:	0001                	nop
    8000385a:	0001                	nop
    8000385c:	60e2                	ld	ra,24(sp)
    8000385e:	6442                	ld	s0,16(sp)
    80003860:	6105                	addi	sp,sp,32
    80003862:	8082                	ret

0000000080003864 <writeProcs>:

int
writeProcs(void)
{
    80003864:	1101                	addi	sp,sp,-32
    80003866:	ec06                	sd	ra,24(sp)
    80003868:	e822                	sd	s0,16(sp)
    8000386a:	1000                	addi	s0,sp,32
  int i;
  for (i = 0; i < NPROC; i++)
    8000386c:	fe042623          	sw	zero,-20(s0)
    80003870:	a065                	j	80003918 <writeProcs+0xb4>
  {
    if (proc[i].state != UNUSED)
    80003872:	00013717          	auipc	a4,0x13
    80003876:	d4670713          	addi	a4,a4,-698 # 800165b8 <proc>
    8000387a:	fec42683          	lw	a3,-20(s0)
    8000387e:	16800793          	li	a5,360
    80003882:	02f687b3          	mul	a5,a3,a5
    80003886:	97ba                	add	a5,a5,a4
    80003888:	4f9c                	lw	a5,24(a5)
    8000388a:	c3d1                	beqz	a5,8000390e <writeProcs+0xaa>
    {
      printf("%s", proc[i].name);
    8000388c:	fec42703          	lw	a4,-20(s0)
    80003890:	16800793          	li	a5,360
    80003894:	02f707b3          	mul	a5,a4,a5
    80003898:	15078713          	addi	a4,a5,336
    8000389c:	00013797          	auipc	a5,0x13
    800038a0:	d1c78793          	addi	a5,a5,-740 # 800165b8 <proc>
    800038a4:	97ba                	add	a5,a5,a4
    800038a6:	07a1                	addi	a5,a5,8
    800038a8:	85be                	mv	a1,a5
    800038aa:	00008517          	auipc	a0,0x8
    800038ae:	9de50513          	addi	a0,a0,-1570 # 8000b288 <etext+0x288>
    800038b2:	ffffd097          	auipc	ra,0xffffd
    800038b6:	1b8080e7          	jalr	440(ra) # 80000a6a <printf>
      printf(" (%d)", proc[i].pid);
    800038ba:	00013717          	auipc	a4,0x13
    800038be:	cfe70713          	addi	a4,a4,-770 # 800165b8 <proc>
    800038c2:	fec42683          	lw	a3,-20(s0)
    800038c6:	16800793          	li	a5,360
    800038ca:	02f687b3          	mul	a5,a3,a5
    800038ce:	97ba                	add	a5,a5,a4
    800038d0:	5b9c                	lw	a5,48(a5)
    800038d2:	85be                	mv	a1,a5
    800038d4:	00008517          	auipc	a0,0x8
    800038d8:	9bc50513          	addi	a0,a0,-1604 # 8000b290 <etext+0x290>
    800038dc:	ffffd097          	auipc	ra,0xffffd
    800038e0:	18e080e7          	jalr	398(ra) # 80000a6a <printf>
      printf(": %d\n", proc[i].state);
    800038e4:	00013717          	auipc	a4,0x13
    800038e8:	cd470713          	addi	a4,a4,-812 # 800165b8 <proc>
    800038ec:	fec42683          	lw	a3,-20(s0)
    800038f0:	16800793          	li	a5,360
    800038f4:	02f687b3          	mul	a5,a3,a5
    800038f8:	97ba                	add	a5,a5,a4
    800038fa:	4f9c                	lw	a5,24(a5)
    800038fc:	85be                	mv	a1,a5
    800038fe:	00008517          	auipc	a0,0x8
    80003902:	99a50513          	addi	a0,a0,-1638 # 8000b298 <etext+0x298>
    80003906:	ffffd097          	auipc	ra,0xffffd
    8000390a:	164080e7          	jalr	356(ra) # 80000a6a <printf>
  for (i = 0; i < NPROC; i++)
    8000390e:	fec42783          	lw	a5,-20(s0)
    80003912:	2785                	addiw	a5,a5,1
    80003914:	fef42623          	sw	a5,-20(s0)
    80003918:	fec42783          	lw	a5,-20(s0)
    8000391c:	0007871b          	sext.w	a4,a5
    80003920:	03f00793          	li	a5,63
    80003924:	f4e7d7e3          	bge	a5,a4,80003872 <writeProcs+0xe>
    }
  }
  return 0;
    80003928:	4781                	li	a5,0
}
    8000392a:	853e                	mv	a0,a5
    8000392c:	60e2                	ld	ra,24(sp)
    8000392e:	6442                	ld	s0,16(sp)
    80003930:	6105                	addi	sp,sp,32
    80003932:	8082                	ret

0000000080003934 <swtch>:
    80003934:	00153023          	sd	ra,0(a0)
    80003938:	00253423          	sd	sp,8(a0)
    8000393c:	e900                	sd	s0,16(a0)
    8000393e:	ed04                	sd	s1,24(a0)
    80003940:	03253023          	sd	s2,32(a0)
    80003944:	03353423          	sd	s3,40(a0)
    80003948:	03453823          	sd	s4,48(a0)
    8000394c:	03553c23          	sd	s5,56(a0)
    80003950:	05653023          	sd	s6,64(a0)
    80003954:	05753423          	sd	s7,72(a0)
    80003958:	05853823          	sd	s8,80(a0)
    8000395c:	05953c23          	sd	s9,88(a0)
    80003960:	07a53023          	sd	s10,96(a0)
    80003964:	07b53423          	sd	s11,104(a0)
    80003968:	0005b083          	ld	ra,0(a1)
    8000396c:	0085b103          	ld	sp,8(a1)
    80003970:	6980                	ld	s0,16(a1)
    80003972:	6d84                	ld	s1,24(a1)
    80003974:	0205b903          	ld	s2,32(a1)
    80003978:	0285b983          	ld	s3,40(a1)
    8000397c:	0305ba03          	ld	s4,48(a1)
    80003980:	0385ba83          	ld	s5,56(a1)
    80003984:	0405bb03          	ld	s6,64(a1)
    80003988:	0485bb83          	ld	s7,72(a1)
    8000398c:	0505bc03          	ld	s8,80(a1)
    80003990:	0585bc83          	ld	s9,88(a1)
    80003994:	0605bd03          	ld	s10,96(a1)
    80003998:	0685bd83          	ld	s11,104(a1)
    8000399c:	8082                	ret

000000008000399e <r_sstatus>:
{
    8000399e:	1101                	addi	sp,sp,-32
    800039a0:	ec06                	sd	ra,24(sp)
    800039a2:	e822                	sd	s0,16(sp)
    800039a4:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800039a6:	100027f3          	csrr	a5,sstatus
    800039aa:	fef43423          	sd	a5,-24(s0)
  return x;
    800039ae:	fe843783          	ld	a5,-24(s0)
}
    800039b2:	853e                	mv	a0,a5
    800039b4:	60e2                	ld	ra,24(sp)
    800039b6:	6442                	ld	s0,16(sp)
    800039b8:	6105                	addi	sp,sp,32
    800039ba:	8082                	ret

00000000800039bc <w_sstatus>:
{
    800039bc:	1101                	addi	sp,sp,-32
    800039be:	ec06                	sd	ra,24(sp)
    800039c0:	e822                	sd	s0,16(sp)
    800039c2:	1000                	addi	s0,sp,32
    800039c4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800039c8:	fe843783          	ld	a5,-24(s0)
    800039cc:	10079073          	csrw	sstatus,a5
}
    800039d0:	0001                	nop
    800039d2:	60e2                	ld	ra,24(sp)
    800039d4:	6442                	ld	s0,16(sp)
    800039d6:	6105                	addi	sp,sp,32
    800039d8:	8082                	ret

00000000800039da <r_sip>:
{
    800039da:	1101                	addi	sp,sp,-32
    800039dc:	ec06                	sd	ra,24(sp)
    800039de:	e822                	sd	s0,16(sp)
    800039e0:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    800039e2:	144027f3          	csrr	a5,sip
    800039e6:	fef43423          	sd	a5,-24(s0)
  return x;
    800039ea:	fe843783          	ld	a5,-24(s0)
}
    800039ee:	853e                	mv	a0,a5
    800039f0:	60e2                	ld	ra,24(sp)
    800039f2:	6442                	ld	s0,16(sp)
    800039f4:	6105                	addi	sp,sp,32
    800039f6:	8082                	ret

00000000800039f8 <w_sip>:
{
    800039f8:	1101                	addi	sp,sp,-32
    800039fa:	ec06                	sd	ra,24(sp)
    800039fc:	e822                	sd	s0,16(sp)
    800039fe:	1000                	addi	s0,sp,32
    80003a00:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003a04:	fe843783          	ld	a5,-24(s0)
    80003a08:	14479073          	csrw	sip,a5
}
    80003a0c:	0001                	nop
    80003a0e:	60e2                	ld	ra,24(sp)
    80003a10:	6442                	ld	s0,16(sp)
    80003a12:	6105                	addi	sp,sp,32
    80003a14:	8082                	ret

0000000080003a16 <w_sepc>:
{
    80003a16:	1101                	addi	sp,sp,-32
    80003a18:	ec06                	sd	ra,24(sp)
    80003a1a:	e822                	sd	s0,16(sp)
    80003a1c:	1000                	addi	s0,sp,32
    80003a1e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003a22:	fe843783          	ld	a5,-24(s0)
    80003a26:	14179073          	csrw	sepc,a5
}
    80003a2a:	0001                	nop
    80003a2c:	60e2                	ld	ra,24(sp)
    80003a2e:	6442                	ld	s0,16(sp)
    80003a30:	6105                	addi	sp,sp,32
    80003a32:	8082                	ret

0000000080003a34 <r_sepc>:
{
    80003a34:	1101                	addi	sp,sp,-32
    80003a36:	ec06                	sd	ra,24(sp)
    80003a38:	e822                	sd	s0,16(sp)
    80003a3a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003a3c:	141027f3          	csrr	a5,sepc
    80003a40:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a44:	fe843783          	ld	a5,-24(s0)
}
    80003a48:	853e                	mv	a0,a5
    80003a4a:	60e2                	ld	ra,24(sp)
    80003a4c:	6442                	ld	s0,16(sp)
    80003a4e:	6105                	addi	sp,sp,32
    80003a50:	8082                	ret

0000000080003a52 <w_stvec>:
{
    80003a52:	1101                	addi	sp,sp,-32
    80003a54:	ec06                	sd	ra,24(sp)
    80003a56:	e822                	sd	s0,16(sp)
    80003a58:	1000                	addi	s0,sp,32
    80003a5a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003a5e:	fe843783          	ld	a5,-24(s0)
    80003a62:	10579073          	csrw	stvec,a5
}
    80003a66:	0001                	nop
    80003a68:	60e2                	ld	ra,24(sp)
    80003a6a:	6442                	ld	s0,16(sp)
    80003a6c:	6105                	addi	sp,sp,32
    80003a6e:	8082                	ret

0000000080003a70 <r_satp>:
{
    80003a70:	1101                	addi	sp,sp,-32
    80003a72:	ec06                	sd	ra,24(sp)
    80003a74:	e822                	sd	s0,16(sp)
    80003a76:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003a78:	180027f3          	csrr	a5,satp
    80003a7c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a80:	fe843783          	ld	a5,-24(s0)
}
    80003a84:	853e                	mv	a0,a5
    80003a86:	60e2                	ld	ra,24(sp)
    80003a88:	6442                	ld	s0,16(sp)
    80003a8a:	6105                	addi	sp,sp,32
    80003a8c:	8082                	ret

0000000080003a8e <r_scause>:
{
    80003a8e:	1101                	addi	sp,sp,-32
    80003a90:	ec06                	sd	ra,24(sp)
    80003a92:	e822                	sd	s0,16(sp)
    80003a94:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003a96:	142027f3          	csrr	a5,scause
    80003a9a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a9e:	fe843783          	ld	a5,-24(s0)
}
    80003aa2:	853e                	mv	a0,a5
    80003aa4:	60e2                	ld	ra,24(sp)
    80003aa6:	6442                	ld	s0,16(sp)
    80003aa8:	6105                	addi	sp,sp,32
    80003aaa:	8082                	ret

0000000080003aac <r_stval>:
{
    80003aac:	1101                	addi	sp,sp,-32
    80003aae:	ec06                	sd	ra,24(sp)
    80003ab0:	e822                	sd	s0,16(sp)
    80003ab2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003ab4:	143027f3          	csrr	a5,stval
    80003ab8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003abc:	fe843783          	ld	a5,-24(s0)
}
    80003ac0:	853e                	mv	a0,a5
    80003ac2:	60e2                	ld	ra,24(sp)
    80003ac4:	6442                	ld	s0,16(sp)
    80003ac6:	6105                	addi	sp,sp,32
    80003ac8:	8082                	ret

0000000080003aca <intr_on>:
{
    80003aca:	1141                	addi	sp,sp,-16
    80003acc:	e406                	sd	ra,8(sp)
    80003ace:	e022                	sd	s0,0(sp)
    80003ad0:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003ad2:	00000097          	auipc	ra,0x0
    80003ad6:	ecc080e7          	jalr	-308(ra) # 8000399e <r_sstatus>
    80003ada:	87aa                	mv	a5,a0
    80003adc:	0027e793          	ori	a5,a5,2
    80003ae0:	853e                	mv	a0,a5
    80003ae2:	00000097          	auipc	ra,0x0
    80003ae6:	eda080e7          	jalr	-294(ra) # 800039bc <w_sstatus>
}
    80003aea:	0001                	nop
    80003aec:	60a2                	ld	ra,8(sp)
    80003aee:	6402                	ld	s0,0(sp)
    80003af0:	0141                	addi	sp,sp,16
    80003af2:	8082                	ret

0000000080003af4 <intr_off>:
{
    80003af4:	1141                	addi	sp,sp,-16
    80003af6:	e406                	sd	ra,8(sp)
    80003af8:	e022                	sd	s0,0(sp)
    80003afa:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003afc:	00000097          	auipc	ra,0x0
    80003b00:	ea2080e7          	jalr	-350(ra) # 8000399e <r_sstatus>
    80003b04:	87aa                	mv	a5,a0
    80003b06:	9bf5                	andi	a5,a5,-3
    80003b08:	853e                	mv	a0,a5
    80003b0a:	00000097          	auipc	ra,0x0
    80003b0e:	eb2080e7          	jalr	-334(ra) # 800039bc <w_sstatus>
}
    80003b12:	0001                	nop
    80003b14:	60a2                	ld	ra,8(sp)
    80003b16:	6402                	ld	s0,0(sp)
    80003b18:	0141                	addi	sp,sp,16
    80003b1a:	8082                	ret

0000000080003b1c <intr_get>:
{
    80003b1c:	1101                	addi	sp,sp,-32
    80003b1e:	ec06                	sd	ra,24(sp)
    80003b20:	e822                	sd	s0,16(sp)
    80003b22:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003b24:	00000097          	auipc	ra,0x0
    80003b28:	e7a080e7          	jalr	-390(ra) # 8000399e <r_sstatus>
    80003b2c:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003b30:	fe843783          	ld	a5,-24(s0)
    80003b34:	8b89                	andi	a5,a5,2
    80003b36:	00f037b3          	snez	a5,a5
    80003b3a:	0ff7f793          	zext.b	a5,a5
    80003b3e:	2781                	sext.w	a5,a5
}
    80003b40:	853e                	mv	a0,a5
    80003b42:	60e2                	ld	ra,24(sp)
    80003b44:	6442                	ld	s0,16(sp)
    80003b46:	6105                	addi	sp,sp,32
    80003b48:	8082                	ret

0000000080003b4a <r_tp>:
{
    80003b4a:	1101                	addi	sp,sp,-32
    80003b4c:	ec06                	sd	ra,24(sp)
    80003b4e:	e822                	sd	s0,16(sp)
    80003b50:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003b52:	8792                	mv	a5,tp
    80003b54:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b58:	fe843783          	ld	a5,-24(s0)
}
    80003b5c:	853e                	mv	a0,a5
    80003b5e:	60e2                	ld	ra,24(sp)
    80003b60:	6442                	ld	s0,16(sp)
    80003b62:	6105                	addi	sp,sp,32
    80003b64:	8082                	ret

0000000080003b66 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003b66:	1141                	addi	sp,sp,-16
    80003b68:	e406                	sd	ra,8(sp)
    80003b6a:	e022                	sd	s0,0(sp)
    80003b6c:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003b6e:	00007597          	auipc	a1,0x7
    80003b72:	76a58593          	addi	a1,a1,1898 # 8000b2d8 <etext+0x2d8>
    80003b76:	00018517          	auipc	a0,0x18
    80003b7a:	47250513          	addi	a0,a0,1138 # 8001bfe8 <tickslock>
    80003b7e:	ffffd097          	auipc	ra,0xffffd
    80003b82:	712080e7          	jalr	1810(ra) # 80001290 <initlock>
}
    80003b86:	0001                	nop
    80003b88:	60a2                	ld	ra,8(sp)
    80003b8a:	6402                	ld	s0,0(sp)
    80003b8c:	0141                	addi	sp,sp,16
    80003b8e:	8082                	ret

0000000080003b90 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003b90:	1141                	addi	sp,sp,-16
    80003b92:	e406                	sd	ra,8(sp)
    80003b94:	e022                	sd	s0,0(sp)
    80003b96:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003b98:	00005797          	auipc	a5,0x5
    80003b9c:	ce878793          	addi	a5,a5,-792 # 80008880 <kernelvec>
    80003ba0:	853e                	mv	a0,a5
    80003ba2:	00000097          	auipc	ra,0x0
    80003ba6:	eb0080e7          	jalr	-336(ra) # 80003a52 <w_stvec>
}
    80003baa:	0001                	nop
    80003bac:	60a2                	ld	ra,8(sp)
    80003bae:	6402                	ld	s0,0(sp)
    80003bb0:	0141                	addi	sp,sp,16
    80003bb2:	8082                	ret

0000000080003bb4 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003bb4:	7179                	addi	sp,sp,-48
    80003bb6:	f406                	sd	ra,40(sp)
    80003bb8:	f022                	sd	s0,32(sp)
    80003bba:	ec26                	sd	s1,24(sp)
    80003bbc:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003bbe:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003bc2:	00000097          	auipc	ra,0x0
    80003bc6:	ddc080e7          	jalr	-548(ra) # 8000399e <r_sstatus>
    80003bca:	87aa                	mv	a5,a0
    80003bcc:	1007f793          	andi	a5,a5,256
    80003bd0:	cb89                	beqz	a5,80003be2 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003bd2:	00007517          	auipc	a0,0x7
    80003bd6:	70e50513          	addi	a0,a0,1806 # 8000b2e0 <etext+0x2e0>
    80003bda:	ffffd097          	auipc	ra,0xffffd
    80003bde:	0e6080e7          	jalr	230(ra) # 80000cc0 <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003be2:	00005797          	auipc	a5,0x5
    80003be6:	c9e78793          	addi	a5,a5,-866 # 80008880 <kernelvec>
    80003bea:	853e                	mv	a0,a5
    80003bec:	00000097          	auipc	ra,0x0
    80003bf0:	e66080e7          	jalr	-410(ra) # 80003a52 <w_stvec>

  struct proc *p = myproc();
    80003bf4:	fffff097          	auipc	ra,0xfffff
    80003bf8:	cc8080e7          	jalr	-824(ra) # 800028bc <myproc>
    80003bfc:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003c00:	fd043783          	ld	a5,-48(s0)
    80003c04:	6fa4                	ld	s1,88(a5)
    80003c06:	00000097          	auipc	ra,0x0
    80003c0a:	e2e080e7          	jalr	-466(ra) # 80003a34 <r_sepc>
    80003c0e:	87aa                	mv	a5,a0
    80003c10:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003c12:	00000097          	auipc	ra,0x0
    80003c16:	e7c080e7          	jalr	-388(ra) # 80003a8e <r_scause>
    80003c1a:	872a                	mv	a4,a0
    80003c1c:	47a1                	li	a5,8
    80003c1e:	04f71163          	bne	a4,a5,80003c60 <usertrap+0xac>
    // system call

    if(killed(p))
    80003c22:	fd043503          	ld	a0,-48(s0)
    80003c26:	00000097          	auipc	ra,0x0
    80003c2a:	a36080e7          	jalr	-1482(ra) # 8000365c <killed>
    80003c2e:	87aa                	mv	a5,a0
    80003c30:	c791                	beqz	a5,80003c3c <usertrap+0x88>
      exit(-1);
    80003c32:	557d                	li	a0,-1
    80003c34:	fffff097          	auipc	ra,0xfffff
    80003c38:	37a080e7          	jalr	890(ra) # 80002fae <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003c3c:	fd043783          	ld	a5,-48(s0)
    80003c40:	6fbc                	ld	a5,88(a5)
    80003c42:	6f98                	ld	a4,24(a5)
    80003c44:	fd043783          	ld	a5,-48(s0)
    80003c48:	6fbc                	ld	a5,88(a5)
    80003c4a:	0711                	addi	a4,a4,4
    80003c4c:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003c4e:	00000097          	auipc	ra,0x0
    80003c52:	e7c080e7          	jalr	-388(ra) # 80003aca <intr_on>

    syscall();
    80003c56:	00000097          	auipc	ra,0x0
    80003c5a:	66a080e7          	jalr	1642(ra) # 800042c0 <syscall>
    80003c5e:	a885                	j	80003cce <usertrap+0x11a>
  } else if((which_dev = devintr()) != 0){
    80003c60:	00000097          	auipc	ra,0x0
    80003c64:	34c080e7          	jalr	844(ra) # 80003fac <devintr>
    80003c68:	87aa                	mv	a5,a0
    80003c6a:	fcf42e23          	sw	a5,-36(s0)
    80003c6e:	fdc42783          	lw	a5,-36(s0)
    80003c72:	2781                	sext.w	a5,a5
    80003c74:	efa9                	bnez	a5,80003cce <usertrap+0x11a>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003c76:	00000097          	auipc	ra,0x0
    80003c7a:	e18080e7          	jalr	-488(ra) # 80003a8e <r_scause>
    80003c7e:	872a                	mv	a4,a0
    80003c80:	fd043783          	ld	a5,-48(s0)
    80003c84:	5b9c                	lw	a5,48(a5)
    80003c86:	863e                	mv	a2,a5
    80003c88:	85ba                	mv	a1,a4
    80003c8a:	00007517          	auipc	a0,0x7
    80003c8e:	67650513          	addi	a0,a0,1654 # 8000b300 <etext+0x300>
    80003c92:	ffffd097          	auipc	ra,0xffffd
    80003c96:	dd8080e7          	jalr	-552(ra) # 80000a6a <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003c9a:	00000097          	auipc	ra,0x0
    80003c9e:	d9a080e7          	jalr	-614(ra) # 80003a34 <r_sepc>
    80003ca2:	84aa                	mv	s1,a0
    80003ca4:	00000097          	auipc	ra,0x0
    80003ca8:	e08080e7          	jalr	-504(ra) # 80003aac <r_stval>
    80003cac:	87aa                	mv	a5,a0
    80003cae:	863e                	mv	a2,a5
    80003cb0:	85a6                	mv	a1,s1
    80003cb2:	00007517          	auipc	a0,0x7
    80003cb6:	67e50513          	addi	a0,a0,1662 # 8000b330 <etext+0x330>
    80003cba:	ffffd097          	auipc	ra,0xffffd
    80003cbe:	db0080e7          	jalr	-592(ra) # 80000a6a <printf>
    setkilled(p);
    80003cc2:	fd043503          	ld	a0,-48(s0)
    80003cc6:	00000097          	auipc	ra,0x0
    80003cca:	95c080e7          	jalr	-1700(ra) # 80003622 <setkilled>
  }

  if(killed(p))
    80003cce:	fd043503          	ld	a0,-48(s0)
    80003cd2:	00000097          	auipc	ra,0x0
    80003cd6:	98a080e7          	jalr	-1654(ra) # 8000365c <killed>
    80003cda:	87aa                	mv	a5,a0
    80003cdc:	c791                	beqz	a5,80003ce8 <usertrap+0x134>
    exit(-1);
    80003cde:	557d                	li	a0,-1
    80003ce0:	fffff097          	auipc	ra,0xfffff
    80003ce4:	2ce080e7          	jalr	718(ra) # 80002fae <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003ce8:	fdc42783          	lw	a5,-36(s0)
    80003cec:	0007871b          	sext.w	a4,a5
    80003cf0:	4789                	li	a5,2
    80003cf2:	00f71663          	bne	a4,a5,80003cfe <usertrap+0x14a>
    yield();
    80003cf6:	fffff097          	auipc	ra,0xfffff
    80003cfa:	6e6080e7          	jalr	1766(ra) # 800033dc <yield>

  usertrapret();
    80003cfe:	00000097          	auipc	ra,0x0
    80003d02:	014080e7          	jalr	20(ra) # 80003d12 <usertrapret>
}
    80003d06:	0001                	nop
    80003d08:	70a2                	ld	ra,40(sp)
    80003d0a:	7402                	ld	s0,32(sp)
    80003d0c:	64e2                	ld	s1,24(sp)
    80003d0e:	6145                	addi	sp,sp,48
    80003d10:	8082                	ret

0000000080003d12 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003d12:	715d                	addi	sp,sp,-80
    80003d14:	e486                	sd	ra,72(sp)
    80003d16:	e0a2                	sd	s0,64(sp)
    80003d18:	fc26                	sd	s1,56(sp)
    80003d1a:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003d1c:	fffff097          	auipc	ra,0xfffff
    80003d20:	ba0080e7          	jalr	-1120(ra) # 800028bc <myproc>
    80003d24:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003d28:	00000097          	auipc	ra,0x0
    80003d2c:	dcc080e7          	jalr	-564(ra) # 80003af4 <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003d30:	00006717          	auipc	a4,0x6
    80003d34:	2d070713          	addi	a4,a4,720 # 8000a000 <_trampoline>
    80003d38:	00006797          	auipc	a5,0x6
    80003d3c:	2c878793          	addi	a5,a5,712 # 8000a000 <_trampoline>
    80003d40:	8f1d                	sub	a4,a4,a5
    80003d42:	040007b7          	lui	a5,0x4000
    80003d46:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80003d48:	07b2                	slli	a5,a5,0xc
    80003d4a:	97ba                	add	a5,a5,a4
    80003d4c:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003d50:	fd043503          	ld	a0,-48(s0)
    80003d54:	00000097          	auipc	ra,0x0
    80003d58:	cfe080e7          	jalr	-770(ra) # 80003a52 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003d5c:	fd843783          	ld	a5,-40(s0)
    80003d60:	6fa4                	ld	s1,88(a5)
    80003d62:	00000097          	auipc	ra,0x0
    80003d66:	d0e080e7          	jalr	-754(ra) # 80003a70 <r_satp>
    80003d6a:	87aa                	mv	a5,a0
    80003d6c:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003d6e:	fd843783          	ld	a5,-40(s0)
    80003d72:	63b4                	ld	a3,64(a5)
    80003d74:	fd843783          	ld	a5,-40(s0)
    80003d78:	6fbc                	ld	a5,88(a5)
    80003d7a:	6705                	lui	a4,0x1
    80003d7c:	9736                	add	a4,a4,a3
    80003d7e:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003d80:	fd843783          	ld	a5,-40(s0)
    80003d84:	6fbc                	ld	a5,88(a5)
    80003d86:	00000717          	auipc	a4,0x0
    80003d8a:	e2e70713          	addi	a4,a4,-466 # 80003bb4 <usertrap>
    80003d8e:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003d90:	fd843783          	ld	a5,-40(s0)
    80003d94:	6fa4                	ld	s1,88(a5)
    80003d96:	00000097          	auipc	ra,0x0
    80003d9a:	db4080e7          	jalr	-588(ra) # 80003b4a <r_tp>
    80003d9e:	87aa                	mv	a5,a0
    80003da0:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003da2:	00000097          	auipc	ra,0x0
    80003da6:	bfc080e7          	jalr	-1028(ra) # 8000399e <r_sstatus>
    80003daa:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003dae:	fc843783          	ld	a5,-56(s0)
    80003db2:	eff7f793          	andi	a5,a5,-257
    80003db6:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003dba:	fc843783          	ld	a5,-56(s0)
    80003dbe:	0207e793          	ori	a5,a5,32
    80003dc2:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003dc6:	fc843503          	ld	a0,-56(s0)
    80003dca:	00000097          	auipc	ra,0x0
    80003dce:	bf2080e7          	jalr	-1038(ra) # 800039bc <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003dd2:	fd843783          	ld	a5,-40(s0)
    80003dd6:	6fbc                	ld	a5,88(a5)
    80003dd8:	6f9c                	ld	a5,24(a5)
    80003dda:	853e                	mv	a0,a5
    80003ddc:	00000097          	auipc	ra,0x0
    80003de0:	c3a080e7          	jalr	-966(ra) # 80003a16 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003de4:	fd843783          	ld	a5,-40(s0)
    80003de8:	6bbc                	ld	a5,80(a5)
    80003dea:	00c7d713          	srli	a4,a5,0xc
    80003dee:	57fd                	li	a5,-1
    80003df0:	17fe                	slli	a5,a5,0x3f
    80003df2:	8fd9                	or	a5,a5,a4
    80003df4:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003df8:	00006717          	auipc	a4,0x6
    80003dfc:	2a470713          	addi	a4,a4,676 # 8000a09c <userret>
    80003e00:	00006797          	auipc	a5,0x6
    80003e04:	20078793          	addi	a5,a5,512 # 8000a000 <_trampoline>
    80003e08:	8f1d                	sub	a4,a4,a5
    80003e0a:	040007b7          	lui	a5,0x4000
    80003e0e:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80003e10:	07b2                	slli	a5,a5,0xc
    80003e12:	97ba                	add	a5,a5,a4
    80003e14:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003e18:	fb843783          	ld	a5,-72(s0)
    80003e1c:	fc043503          	ld	a0,-64(s0)
    80003e20:	9782                	jalr	a5
}
    80003e22:	0001                	nop
    80003e24:	60a6                	ld	ra,72(sp)
    80003e26:	6406                	ld	s0,64(sp)
    80003e28:	74e2                	ld	s1,56(sp)
    80003e2a:	6161                	addi	sp,sp,80
    80003e2c:	8082                	ret

0000000080003e2e <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003e2e:	7139                	addi	sp,sp,-64
    80003e30:	fc06                	sd	ra,56(sp)
    80003e32:	f822                	sd	s0,48(sp)
    80003e34:	f426                	sd	s1,40(sp)
    80003e36:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003e38:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003e3c:	00000097          	auipc	ra,0x0
    80003e40:	bf8080e7          	jalr	-1032(ra) # 80003a34 <r_sepc>
    80003e44:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003e48:	00000097          	auipc	ra,0x0
    80003e4c:	b56080e7          	jalr	-1194(ra) # 8000399e <r_sstatus>
    80003e50:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003e54:	00000097          	auipc	ra,0x0
    80003e58:	c3a080e7          	jalr	-966(ra) # 80003a8e <r_scause>
    80003e5c:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003e60:	fc843783          	ld	a5,-56(s0)
    80003e64:	1007f793          	andi	a5,a5,256
    80003e68:	eb89                	bnez	a5,80003e7a <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003e6a:	00007517          	auipc	a0,0x7
    80003e6e:	4e650513          	addi	a0,a0,1254 # 8000b350 <etext+0x350>
    80003e72:	ffffd097          	auipc	ra,0xffffd
    80003e76:	e4e080e7          	jalr	-434(ra) # 80000cc0 <panic>
  if(intr_get() != 0)
    80003e7a:	00000097          	auipc	ra,0x0
    80003e7e:	ca2080e7          	jalr	-862(ra) # 80003b1c <intr_get>
    80003e82:	87aa                	mv	a5,a0
    80003e84:	cb89                	beqz	a5,80003e96 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003e86:	00007517          	auipc	a0,0x7
    80003e8a:	4f250513          	addi	a0,a0,1266 # 8000b378 <etext+0x378>
    80003e8e:	ffffd097          	auipc	ra,0xffffd
    80003e92:	e32080e7          	jalr	-462(ra) # 80000cc0 <panic>

  if((which_dev = devintr()) == 0){
    80003e96:	00000097          	auipc	ra,0x0
    80003e9a:	116080e7          	jalr	278(ra) # 80003fac <devintr>
    80003e9e:	87aa                	mv	a5,a0
    80003ea0:	fcf42e23          	sw	a5,-36(s0)
    80003ea4:	fdc42783          	lw	a5,-36(s0)
    80003ea8:	2781                	sext.w	a5,a5
    80003eaa:	e7b9                	bnez	a5,80003ef8 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003eac:	fc043583          	ld	a1,-64(s0)
    80003eb0:	00007517          	auipc	a0,0x7
    80003eb4:	4e850513          	addi	a0,a0,1256 # 8000b398 <etext+0x398>
    80003eb8:	ffffd097          	auipc	ra,0xffffd
    80003ebc:	bb2080e7          	jalr	-1102(ra) # 80000a6a <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003ec0:	00000097          	auipc	ra,0x0
    80003ec4:	b74080e7          	jalr	-1164(ra) # 80003a34 <r_sepc>
    80003ec8:	84aa                	mv	s1,a0
    80003eca:	00000097          	auipc	ra,0x0
    80003ece:	be2080e7          	jalr	-1054(ra) # 80003aac <r_stval>
    80003ed2:	87aa                	mv	a5,a0
    80003ed4:	863e                	mv	a2,a5
    80003ed6:	85a6                	mv	a1,s1
    80003ed8:	00007517          	auipc	a0,0x7
    80003edc:	4d050513          	addi	a0,a0,1232 # 8000b3a8 <etext+0x3a8>
    80003ee0:	ffffd097          	auipc	ra,0xffffd
    80003ee4:	b8a080e7          	jalr	-1142(ra) # 80000a6a <printf>
    panic("kerneltrap");
    80003ee8:	00007517          	auipc	a0,0x7
    80003eec:	4d850513          	addi	a0,a0,1240 # 8000b3c0 <etext+0x3c0>
    80003ef0:	ffffd097          	auipc	ra,0xffffd
    80003ef4:	dd0080e7          	jalr	-560(ra) # 80000cc0 <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80003ef8:	fdc42783          	lw	a5,-36(s0)
    80003efc:	0007871b          	sext.w	a4,a5
    80003f00:	4789                	li	a5,2
    80003f02:	02f71563          	bne	a4,a5,80003f2c <kerneltrap+0xfe>
    80003f06:	fffff097          	auipc	ra,0xfffff
    80003f0a:	9b6080e7          	jalr	-1610(ra) # 800028bc <myproc>
    80003f0e:	87aa                	mv	a5,a0
    80003f10:	cf91                	beqz	a5,80003f2c <kerneltrap+0xfe>
    80003f12:	fffff097          	auipc	ra,0xfffff
    80003f16:	9aa080e7          	jalr	-1622(ra) # 800028bc <myproc>
    80003f1a:	87aa                	mv	a5,a0
    80003f1c:	4f98                	lw	a4,24(a5)
    80003f1e:	4791                	li	a5,4
    80003f20:	00f71663          	bne	a4,a5,80003f2c <kerneltrap+0xfe>
    yield();
    80003f24:	fffff097          	auipc	ra,0xfffff
    80003f28:	4b8080e7          	jalr	1208(ra) # 800033dc <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80003f2c:	fd043503          	ld	a0,-48(s0)
    80003f30:	00000097          	auipc	ra,0x0
    80003f34:	ae6080e7          	jalr	-1306(ra) # 80003a16 <w_sepc>
  w_sstatus(sstatus);
    80003f38:	fc843503          	ld	a0,-56(s0)
    80003f3c:	00000097          	auipc	ra,0x0
    80003f40:	a80080e7          	jalr	-1408(ra) # 800039bc <w_sstatus>
}
    80003f44:	0001                	nop
    80003f46:	70e2                	ld	ra,56(sp)
    80003f48:	7442                	ld	s0,48(sp)
    80003f4a:	74a2                	ld	s1,40(sp)
    80003f4c:	6121                	addi	sp,sp,64
    80003f4e:	8082                	ret

0000000080003f50 <clockintr>:

void
clockintr()
{
    80003f50:	1141                	addi	sp,sp,-16
    80003f52:	e406                	sd	ra,8(sp)
    80003f54:	e022                	sd	s0,0(sp)
    80003f56:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80003f58:	00018517          	auipc	a0,0x18
    80003f5c:	09050513          	addi	a0,a0,144 # 8001bfe8 <tickslock>
    80003f60:	ffffd097          	auipc	ra,0xffffd
    80003f64:	364080e7          	jalr	868(ra) # 800012c4 <acquire>
  ticks++;
    80003f68:	0000a797          	auipc	a5,0xa
    80003f6c:	fe078793          	addi	a5,a5,-32 # 8000df48 <ticks>
    80003f70:	439c                	lw	a5,0(a5)
    80003f72:	2785                	addiw	a5,a5,1
    80003f74:	0007871b          	sext.w	a4,a5
    80003f78:	0000a797          	auipc	a5,0xa
    80003f7c:	fd078793          	addi	a5,a5,-48 # 8000df48 <ticks>
    80003f80:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    80003f82:	0000a517          	auipc	a0,0xa
    80003f86:	fc650513          	addi	a0,a0,-58 # 8000df48 <ticks>
    80003f8a:	fffff097          	auipc	ra,0xfffff
    80003f8e:	568080e7          	jalr	1384(ra) # 800034f2 <wakeup>
  release(&tickslock);
    80003f92:	00018517          	auipc	a0,0x18
    80003f96:	05650513          	addi	a0,a0,86 # 8001bfe8 <tickslock>
    80003f9a:	ffffd097          	auipc	ra,0xffffd
    80003f9e:	38e080e7          	jalr	910(ra) # 80001328 <release>
}
    80003fa2:	0001                	nop
    80003fa4:	60a2                	ld	ra,8(sp)
    80003fa6:	6402                	ld	s0,0(sp)
    80003fa8:	0141                	addi	sp,sp,16
    80003faa:	8082                	ret

0000000080003fac <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80003fac:	1101                	addi	sp,sp,-32
    80003fae:	ec06                	sd	ra,24(sp)
    80003fb0:	e822                	sd	s0,16(sp)
    80003fb2:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80003fb4:	00000097          	auipc	ra,0x0
    80003fb8:	ada080e7          	jalr	-1318(ra) # 80003a8e <r_scause>
    80003fbc:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80003fc0:	fe843783          	ld	a5,-24(s0)
    80003fc4:	0807d463          	bgez	a5,8000404c <devintr+0xa0>
     (scause & 0xff) == 9){
    80003fc8:	fe843783          	ld	a5,-24(s0)
    80003fcc:	0ff7f713          	zext.b	a4,a5
  if((scause & 0x8000000000000000L) &&
    80003fd0:	47a5                	li	a5,9
    80003fd2:	06f71d63          	bne	a4,a5,8000404c <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80003fd6:	00005097          	auipc	ra,0x5
    80003fda:	9e0080e7          	jalr	-1568(ra) # 800089b6 <plic_claim>
    80003fde:	87aa                	mv	a5,a0
    80003fe0:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80003fe4:	fe442783          	lw	a5,-28(s0)
    80003fe8:	0007871b          	sext.w	a4,a5
    80003fec:	47a9                	li	a5,10
    80003fee:	00f71763          	bne	a4,a5,80003ffc <devintr+0x50>
      uartintr();
    80003ff2:	ffffd097          	auipc	ra,0xffffd
    80003ff6:	fce080e7          	jalr	-50(ra) # 80000fc0 <uartintr>
    80003ffa:	a825                	j	80004032 <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    80003ffc:	fe442783          	lw	a5,-28(s0)
    80004000:	0007871b          	sext.w	a4,a5
    80004004:	4785                	li	a5,1
    80004006:	00f71763          	bne	a4,a5,80004014 <devintr+0x68>
      virtio_disk_intr();
    8000400a:	00005097          	auipc	ra,0x5
    8000400e:	370080e7          	jalr	880(ra) # 8000937a <virtio_disk_intr>
    80004012:	a005                	j	80004032 <devintr+0x86>
    } else if(irq){
    80004014:	fe442783          	lw	a5,-28(s0)
    80004018:	2781                	sext.w	a5,a5
    8000401a:	cf81                	beqz	a5,80004032 <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    8000401c:	fe442783          	lw	a5,-28(s0)
    80004020:	85be                	mv	a1,a5
    80004022:	00007517          	auipc	a0,0x7
    80004026:	3ae50513          	addi	a0,a0,942 # 8000b3d0 <etext+0x3d0>
    8000402a:	ffffd097          	auipc	ra,0xffffd
    8000402e:	a40080e7          	jalr	-1472(ra) # 80000a6a <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80004032:	fe442783          	lw	a5,-28(s0)
    80004036:	2781                	sext.w	a5,a5
    80004038:	cb81                	beqz	a5,80004048 <devintr+0x9c>
      plic_complete(irq);
    8000403a:	fe442783          	lw	a5,-28(s0)
    8000403e:	853e                	mv	a0,a5
    80004040:	00005097          	auipc	ra,0x5
    80004044:	9b4080e7          	jalr	-1612(ra) # 800089f4 <plic_complete>

    return 1;
    80004048:	4785                	li	a5,1
    8000404a:	a081                	j	8000408a <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    8000404c:	fe843703          	ld	a4,-24(s0)
    80004050:	57fd                	li	a5,-1
    80004052:	17fe                	slli	a5,a5,0x3f
    80004054:	0785                	addi	a5,a5,1
    80004056:	02f71963          	bne	a4,a5,80004088 <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    8000405a:	fffff097          	auipc	ra,0xfffff
    8000405e:	804080e7          	jalr	-2044(ra) # 8000285e <cpuid>
    80004062:	87aa                	mv	a5,a0
    80004064:	e789                	bnez	a5,8000406e <devintr+0xc2>
      clockintr();
    80004066:	00000097          	auipc	ra,0x0
    8000406a:	eea080e7          	jalr	-278(ra) # 80003f50 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    8000406e:	00000097          	auipc	ra,0x0
    80004072:	96c080e7          	jalr	-1684(ra) # 800039da <r_sip>
    80004076:	87aa                	mv	a5,a0
    80004078:	9bf5                	andi	a5,a5,-3
    8000407a:	853e                	mv	a0,a5
    8000407c:	00000097          	auipc	ra,0x0
    80004080:	97c080e7          	jalr	-1668(ra) # 800039f8 <w_sip>

    return 2;
    80004084:	4789                	li	a5,2
    80004086:	a011                	j	8000408a <devintr+0xde>
  } else {
    return 0;
    80004088:	4781                	li	a5,0
  }
}
    8000408a:	853e                	mv	a0,a5
    8000408c:	60e2                	ld	ra,24(sp)
    8000408e:	6442                	ld	s0,16(sp)
    80004090:	6105                	addi	sp,sp,32
    80004092:	8082                	ret

0000000080004094 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80004094:	7179                	addi	sp,sp,-48
    80004096:	f406                	sd	ra,40(sp)
    80004098:	f022                	sd	s0,32(sp)
    8000409a:	1800                	addi	s0,sp,48
    8000409c:	fca43c23          	sd	a0,-40(s0)
    800040a0:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800040a4:	fffff097          	auipc	ra,0xfffff
    800040a8:	818080e7          	jalr	-2024(ra) # 800028bc <myproc>
    800040ac:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    800040b0:	fe843783          	ld	a5,-24(s0)
    800040b4:	67bc                	ld	a5,72(a5)
    800040b6:	fd843703          	ld	a4,-40(s0)
    800040ba:	00f77b63          	bgeu	a4,a5,800040d0 <fetchaddr+0x3c>
    800040be:	fd843783          	ld	a5,-40(s0)
    800040c2:	00878713          	addi	a4,a5,8
    800040c6:	fe843783          	ld	a5,-24(s0)
    800040ca:	67bc                	ld	a5,72(a5)
    800040cc:	00e7f463          	bgeu	a5,a4,800040d4 <fetchaddr+0x40>
    return -1;
    800040d0:	57fd                	li	a5,-1
    800040d2:	a01d                	j	800040f8 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    800040d4:	fe843783          	ld	a5,-24(s0)
    800040d8:	6bbc                	ld	a5,80(a5)
    800040da:	46a1                	li	a3,8
    800040dc:	fd843603          	ld	a2,-40(s0)
    800040e0:	fd043583          	ld	a1,-48(s0)
    800040e4:	853e                	mv	a0,a5
    800040e6:	ffffe097          	auipc	ra,0xffffe
    800040ea:	362080e7          	jalr	866(ra) # 80002448 <copyin>
    800040ee:	87aa                	mv	a5,a0
    800040f0:	c399                	beqz	a5,800040f6 <fetchaddr+0x62>
    return -1;
    800040f2:	57fd                	li	a5,-1
    800040f4:	a011                	j	800040f8 <fetchaddr+0x64>
  return 0;
    800040f6:	4781                	li	a5,0
}
    800040f8:	853e                	mv	a0,a5
    800040fa:	70a2                	ld	ra,40(sp)
    800040fc:	7402                	ld	s0,32(sp)
    800040fe:	6145                	addi	sp,sp,48
    80004100:	8082                	ret

0000000080004102 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80004102:	7139                	addi	sp,sp,-64
    80004104:	fc06                	sd	ra,56(sp)
    80004106:	f822                	sd	s0,48(sp)
    80004108:	0080                	addi	s0,sp,64
    8000410a:	fca43c23          	sd	a0,-40(s0)
    8000410e:	fcb43823          	sd	a1,-48(s0)
    80004112:	87b2                	mv	a5,a2
    80004114:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004118:	ffffe097          	auipc	ra,0xffffe
    8000411c:	7a4080e7          	jalr	1956(ra) # 800028bc <myproc>
    80004120:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    80004124:	fe843783          	ld	a5,-24(s0)
    80004128:	6bbc                	ld	a5,80(a5)
    8000412a:	fcc42703          	lw	a4,-52(s0)
    8000412e:	86ba                	mv	a3,a4
    80004130:	fd843603          	ld	a2,-40(s0)
    80004134:	fd043583          	ld	a1,-48(s0)
    80004138:	853e                	mv	a0,a5
    8000413a:	ffffe097          	auipc	ra,0xffffe
    8000413e:	3dc080e7          	jalr	988(ra) # 80002516 <copyinstr>
    80004142:	87aa                	mv	a5,a0
    80004144:	0007d463          	bgez	a5,8000414c <fetchstr+0x4a>
    return -1;
    80004148:	57fd                	li	a5,-1
    8000414a:	a801                	j	8000415a <fetchstr+0x58>
  return strlen(buf);
    8000414c:	fd043503          	ld	a0,-48(s0)
    80004150:	ffffd097          	auipc	ra,0xffffd
    80004154:	6e0080e7          	jalr	1760(ra) # 80001830 <strlen>
    80004158:	87aa                	mv	a5,a0
}
    8000415a:	853e                	mv	a0,a5
    8000415c:	70e2                	ld	ra,56(sp)
    8000415e:	7442                	ld	s0,48(sp)
    80004160:	6121                	addi	sp,sp,64
    80004162:	8082                	ret

0000000080004164 <argraw>:

static uint64
argraw(int n)
{
    80004164:	7179                	addi	sp,sp,-48
    80004166:	f406                	sd	ra,40(sp)
    80004168:	f022                	sd	s0,32(sp)
    8000416a:	1800                	addi	s0,sp,48
    8000416c:	87aa                	mv	a5,a0
    8000416e:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80004172:	ffffe097          	auipc	ra,0xffffe
    80004176:	74a080e7          	jalr	1866(ra) # 800028bc <myproc>
    8000417a:	fea43423          	sd	a0,-24(s0)
  switch (n) {
    8000417e:	fdc42783          	lw	a5,-36(s0)
    80004182:	0007871b          	sext.w	a4,a5
    80004186:	4795                	li	a5,5
    80004188:	06e7e263          	bltu	a5,a4,800041ec <argraw+0x88>
    8000418c:	fdc46783          	lwu	a5,-36(s0)
    80004190:	00279713          	slli	a4,a5,0x2
    80004194:	00007797          	auipc	a5,0x7
    80004198:	26478793          	addi	a5,a5,612 # 8000b3f8 <etext+0x3f8>
    8000419c:	97ba                	add	a5,a5,a4
    8000419e:	439c                	lw	a5,0(a5)
    800041a0:	0007871b          	sext.w	a4,a5
    800041a4:	00007797          	auipc	a5,0x7
    800041a8:	25478793          	addi	a5,a5,596 # 8000b3f8 <etext+0x3f8>
    800041ac:	97ba                	add	a5,a5,a4
    800041ae:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    800041b0:	fe843783          	ld	a5,-24(s0)
    800041b4:	6fbc                	ld	a5,88(a5)
    800041b6:	7bbc                	ld	a5,112(a5)
    800041b8:	a091                	j	800041fc <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    800041ba:	fe843783          	ld	a5,-24(s0)
    800041be:	6fbc                	ld	a5,88(a5)
    800041c0:	7fbc                	ld	a5,120(a5)
    800041c2:	a82d                	j	800041fc <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    800041c4:	fe843783          	ld	a5,-24(s0)
    800041c8:	6fbc                	ld	a5,88(a5)
    800041ca:	63dc                	ld	a5,128(a5)
    800041cc:	a805                	j	800041fc <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    800041ce:	fe843783          	ld	a5,-24(s0)
    800041d2:	6fbc                	ld	a5,88(a5)
    800041d4:	67dc                	ld	a5,136(a5)
    800041d6:	a01d                	j	800041fc <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    800041d8:	fe843783          	ld	a5,-24(s0)
    800041dc:	6fbc                	ld	a5,88(a5)
    800041de:	6bdc                	ld	a5,144(a5)
    800041e0:	a831                	j	800041fc <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    800041e2:	fe843783          	ld	a5,-24(s0)
    800041e6:	6fbc                	ld	a5,88(a5)
    800041e8:	6fdc                	ld	a5,152(a5)
    800041ea:	a809                	j	800041fc <argraw+0x98>
  }
  panic("argraw");
    800041ec:	00007517          	auipc	a0,0x7
    800041f0:	20450513          	addi	a0,a0,516 # 8000b3f0 <etext+0x3f0>
    800041f4:	ffffd097          	auipc	ra,0xffffd
    800041f8:	acc080e7          	jalr	-1332(ra) # 80000cc0 <panic>
  return -1;
}
    800041fc:	853e                	mv	a0,a5
    800041fe:	70a2                	ld	ra,40(sp)
    80004200:	7402                	ld	s0,32(sp)
    80004202:	6145                	addi	sp,sp,48
    80004204:	8082                	ret

0000000080004206 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    80004206:	1101                	addi	sp,sp,-32
    80004208:	ec06                	sd	ra,24(sp)
    8000420a:	e822                	sd	s0,16(sp)
    8000420c:	1000                	addi	s0,sp,32
    8000420e:	87aa                	mv	a5,a0
    80004210:	feb43023          	sd	a1,-32(s0)
    80004214:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004218:	fec42783          	lw	a5,-20(s0)
    8000421c:	853e                	mv	a0,a5
    8000421e:	00000097          	auipc	ra,0x0
    80004222:	f46080e7          	jalr	-186(ra) # 80004164 <argraw>
    80004226:	87aa                	mv	a5,a0
    80004228:	0007871b          	sext.w	a4,a5
    8000422c:	fe043783          	ld	a5,-32(s0)
    80004230:	c398                	sw	a4,0(a5)
}
    80004232:	0001                	nop
    80004234:	60e2                	ld	ra,24(sp)
    80004236:	6442                	ld	s0,16(sp)
    80004238:	6105                	addi	sp,sp,32
    8000423a:	8082                	ret

000000008000423c <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    8000423c:	1101                	addi	sp,sp,-32
    8000423e:	ec06                	sd	ra,24(sp)
    80004240:	e822                	sd	s0,16(sp)
    80004242:	1000                	addi	s0,sp,32
    80004244:	87aa                	mv	a5,a0
    80004246:	feb43023          	sd	a1,-32(s0)
    8000424a:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    8000424e:	fec42783          	lw	a5,-20(s0)
    80004252:	853e                	mv	a0,a5
    80004254:	00000097          	auipc	ra,0x0
    80004258:	f10080e7          	jalr	-240(ra) # 80004164 <argraw>
    8000425c:	872a                	mv	a4,a0
    8000425e:	fe043783          	ld	a5,-32(s0)
    80004262:	e398                	sd	a4,0(a5)
}
    80004264:	0001                	nop
    80004266:	60e2                	ld	ra,24(sp)
    80004268:	6442                	ld	s0,16(sp)
    8000426a:	6105                	addi	sp,sp,32
    8000426c:	8082                	ret

000000008000426e <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    8000426e:	7179                	addi	sp,sp,-48
    80004270:	f406                	sd	ra,40(sp)
    80004272:	f022                	sd	s0,32(sp)
    80004274:	1800                	addi	s0,sp,48
    80004276:	87aa                	mv	a5,a0
    80004278:	fcb43823          	sd	a1,-48(s0)
    8000427c:	8732                	mv	a4,a2
    8000427e:	fcf42e23          	sw	a5,-36(s0)
    80004282:	87ba                	mv	a5,a4
    80004284:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    80004288:	fe840713          	addi	a4,s0,-24
    8000428c:	fdc42783          	lw	a5,-36(s0)
    80004290:	85ba                	mv	a1,a4
    80004292:	853e                	mv	a0,a5
    80004294:	00000097          	auipc	ra,0x0
    80004298:	fa8080e7          	jalr	-88(ra) # 8000423c <argaddr>
  return fetchstr(addr, buf, max);
    8000429c:	fe843783          	ld	a5,-24(s0)
    800042a0:	fd842703          	lw	a4,-40(s0)
    800042a4:	863a                	mv	a2,a4
    800042a6:	fd043583          	ld	a1,-48(s0)
    800042aa:	853e                	mv	a0,a5
    800042ac:	00000097          	auipc	ra,0x0
    800042b0:	e56080e7          	jalr	-426(ra) # 80004102 <fetchstr>
    800042b4:	87aa                	mv	a5,a0
}
    800042b6:	853e                	mv	a0,a5
    800042b8:	70a2                	ld	ra,40(sp)
    800042ba:	7402                	ld	s0,32(sp)
    800042bc:	6145                	addi	sp,sp,48
    800042be:	8082                	ret

00000000800042c0 <syscall>:
[SYS_ps]   sys_ps,
};

void
syscall(void)
{
    800042c0:	7179                	addi	sp,sp,-48
    800042c2:	f406                	sd	ra,40(sp)
    800042c4:	f022                	sd	s0,32(sp)
    800042c6:	ec26                	sd	s1,24(sp)
    800042c8:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    800042ca:	ffffe097          	auipc	ra,0xffffe
    800042ce:	5f2080e7          	jalr	1522(ra) # 800028bc <myproc>
    800042d2:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    800042d6:	fd843783          	ld	a5,-40(s0)
    800042da:	6fbc                	ld	a5,88(a5)
    800042dc:	77dc                	ld	a5,168(a5)
    800042de:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    800042e2:	fd442783          	lw	a5,-44(s0)
    800042e6:	2781                	sext.w	a5,a5
    800042e8:	04f05163          	blez	a5,8000432a <syscall+0x6a>
    800042ec:	fd442703          	lw	a4,-44(s0)
    800042f0:	47d9                	li	a5,22
    800042f2:	02e7ec63          	bltu	a5,a4,8000432a <syscall+0x6a>
    800042f6:	0000a717          	auipc	a4,0xa
    800042fa:	b4a70713          	addi	a4,a4,-1206 # 8000de40 <syscalls>
    800042fe:	fd442783          	lw	a5,-44(s0)
    80004302:	078e                	slli	a5,a5,0x3
    80004304:	97ba                	add	a5,a5,a4
    80004306:	639c                	ld	a5,0(a5)
    80004308:	c38d                	beqz	a5,8000432a <syscall+0x6a>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    8000430a:	0000a717          	auipc	a4,0xa
    8000430e:	b3670713          	addi	a4,a4,-1226 # 8000de40 <syscalls>
    80004312:	fd442783          	lw	a5,-44(s0)
    80004316:	078e                	slli	a5,a5,0x3
    80004318:	97ba                	add	a5,a5,a4
    8000431a:	639c                	ld	a5,0(a5)
    8000431c:	fd843703          	ld	a4,-40(s0)
    80004320:	6f24                	ld	s1,88(a4)
    80004322:	9782                	jalr	a5
    80004324:	87aa                	mv	a5,a0
    80004326:	f8bc                	sd	a5,112(s1)
    80004328:	a815                	j	8000435c <syscall+0x9c>
  } else {
    printf("%d %s: unknown sys call %d\n",
    8000432a:	fd843783          	ld	a5,-40(s0)
    8000432e:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    80004330:	fd843783          	ld	a5,-40(s0)
    80004334:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    80004338:	fd442683          	lw	a3,-44(s0)
    8000433c:	863e                	mv	a2,a5
    8000433e:	85ba                	mv	a1,a4
    80004340:	00007517          	auipc	a0,0x7
    80004344:	0d050513          	addi	a0,a0,208 # 8000b410 <etext+0x410>
    80004348:	ffffc097          	auipc	ra,0xffffc
    8000434c:	722080e7          	jalr	1826(ra) # 80000a6a <printf>
    p->trapframe->a0 = -1;
    80004350:	fd843783          	ld	a5,-40(s0)
    80004354:	6fbc                	ld	a5,88(a5)
    80004356:	577d                	li	a4,-1
    80004358:	fbb8                	sd	a4,112(a5)
  }
}
    8000435a:	0001                	nop
    8000435c:	0001                	nop
    8000435e:	70a2                	ld	ra,40(sp)
    80004360:	7402                	ld	s0,32(sp)
    80004362:	64e2                	ld	s1,24(sp)
    80004364:	6145                	addi	sp,sp,48
    80004366:	8082                	ret

0000000080004368 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    80004368:	1101                	addi	sp,sp,-32
    8000436a:	ec06                	sd	ra,24(sp)
    8000436c:	e822                	sd	s0,16(sp)
    8000436e:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    80004370:	fec40793          	addi	a5,s0,-20
    80004374:	85be                	mv	a1,a5
    80004376:	4501                	li	a0,0
    80004378:	00000097          	auipc	ra,0x0
    8000437c:	e8e080e7          	jalr	-370(ra) # 80004206 <argint>
  exit(n);
    80004380:	fec42783          	lw	a5,-20(s0)
    80004384:	853e                	mv	a0,a5
    80004386:	fffff097          	auipc	ra,0xfffff
    8000438a:	c28080e7          	jalr	-984(ra) # 80002fae <exit>
  return 0;  // not reached
    8000438e:	4781                	li	a5,0
}
    80004390:	853e                	mv	a0,a5
    80004392:	60e2                	ld	ra,24(sp)
    80004394:	6442                	ld	s0,16(sp)
    80004396:	6105                	addi	sp,sp,32
    80004398:	8082                	ret

000000008000439a <sys_getpid>:

uint64
sys_getpid(void)
{
    8000439a:	1141                	addi	sp,sp,-16
    8000439c:	e406                	sd	ra,8(sp)
    8000439e:	e022                	sd	s0,0(sp)
    800043a0:	0800                	addi	s0,sp,16
  return myproc()->pid;
    800043a2:	ffffe097          	auipc	ra,0xffffe
    800043a6:	51a080e7          	jalr	1306(ra) # 800028bc <myproc>
    800043aa:	87aa                	mv	a5,a0
    800043ac:	5b9c                	lw	a5,48(a5)
}
    800043ae:	853e                	mv	a0,a5
    800043b0:	60a2                	ld	ra,8(sp)
    800043b2:	6402                	ld	s0,0(sp)
    800043b4:	0141                	addi	sp,sp,16
    800043b6:	8082                	ret

00000000800043b8 <sys_fork>:

uint64
sys_fork(void)
{
    800043b8:	1141                	addi	sp,sp,-16
    800043ba:	e406                	sd	ra,8(sp)
    800043bc:	e022                	sd	s0,0(sp)
    800043be:	0800                	addi	s0,sp,16
  return fork();
    800043c0:	fffff097          	auipc	ra,0xfffff
    800043c4:	9cc080e7          	jalr	-1588(ra) # 80002d8c <fork>
    800043c8:	87aa                	mv	a5,a0
}
    800043ca:	853e                	mv	a0,a5
    800043cc:	60a2                	ld	ra,8(sp)
    800043ce:	6402                	ld	s0,0(sp)
    800043d0:	0141                	addi	sp,sp,16
    800043d2:	8082                	ret

00000000800043d4 <sys_wait>:

uint64
sys_wait(void)
{
    800043d4:	1101                	addi	sp,sp,-32
    800043d6:	ec06                	sd	ra,24(sp)
    800043d8:	e822                	sd	s0,16(sp)
    800043da:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    800043dc:	fe840793          	addi	a5,s0,-24
    800043e0:	85be                	mv	a1,a5
    800043e2:	4501                	li	a0,0
    800043e4:	00000097          	auipc	ra,0x0
    800043e8:	e58080e7          	jalr	-424(ra) # 8000423c <argaddr>
  return wait(p);
    800043ec:	fe843783          	ld	a5,-24(s0)
    800043f0:	853e                	mv	a0,a5
    800043f2:	fffff097          	auipc	ra,0xfffff
    800043f6:	cf8080e7          	jalr	-776(ra) # 800030ea <wait>
    800043fa:	87aa                	mv	a5,a0
}
    800043fc:	853e                	mv	a0,a5
    800043fe:	60e2                	ld	ra,24(sp)
    80004400:	6442                	ld	s0,16(sp)
    80004402:	6105                	addi	sp,sp,32
    80004404:	8082                	ret

0000000080004406 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80004406:	1101                	addi	sp,sp,-32
    80004408:	ec06                	sd	ra,24(sp)
    8000440a:	e822                	sd	s0,16(sp)
    8000440c:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    8000440e:	fe440793          	addi	a5,s0,-28
    80004412:	85be                	mv	a1,a5
    80004414:	4501                	li	a0,0
    80004416:	00000097          	auipc	ra,0x0
    8000441a:	df0080e7          	jalr	-528(ra) # 80004206 <argint>
  addr = myproc()->sz;
    8000441e:	ffffe097          	auipc	ra,0xffffe
    80004422:	49e080e7          	jalr	1182(ra) # 800028bc <myproc>
    80004426:	87aa                	mv	a5,a0
    80004428:	67bc                	ld	a5,72(a5)
    8000442a:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    8000442e:	fe442783          	lw	a5,-28(s0)
    80004432:	853e                	mv	a0,a5
    80004434:	fffff097          	auipc	ra,0xfffff
    80004438:	8b8080e7          	jalr	-1864(ra) # 80002cec <growproc>
    8000443c:	87aa                	mv	a5,a0
    8000443e:	0007d463          	bgez	a5,80004446 <sys_sbrk+0x40>
    return -1;
    80004442:	57fd                	li	a5,-1
    80004444:	a019                	j	8000444a <sys_sbrk+0x44>
  return addr;
    80004446:	fe843783          	ld	a5,-24(s0)
}
    8000444a:	853e                	mv	a0,a5
    8000444c:	60e2                	ld	ra,24(sp)
    8000444e:	6442                	ld	s0,16(sp)
    80004450:	6105                	addi	sp,sp,32
    80004452:	8082                	ret

0000000080004454 <sys_sleep>:

uint64
sys_sleep(void)
{
    80004454:	1101                	addi	sp,sp,-32
    80004456:	ec06                	sd	ra,24(sp)
    80004458:	e822                	sd	s0,16(sp)
    8000445a:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    8000445c:	fe840793          	addi	a5,s0,-24
    80004460:	85be                	mv	a1,a5
    80004462:	4501                	li	a0,0
    80004464:	00000097          	auipc	ra,0x0
    80004468:	da2080e7          	jalr	-606(ra) # 80004206 <argint>
  acquire(&tickslock);
    8000446c:	00018517          	auipc	a0,0x18
    80004470:	b7c50513          	addi	a0,a0,-1156 # 8001bfe8 <tickslock>
    80004474:	ffffd097          	auipc	ra,0xffffd
    80004478:	e50080e7          	jalr	-432(ra) # 800012c4 <acquire>
  ticks0 = ticks;
    8000447c:	0000a797          	auipc	a5,0xa
    80004480:	acc78793          	addi	a5,a5,-1332 # 8000df48 <ticks>
    80004484:	439c                	lw	a5,0(a5)
    80004486:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    8000448a:	a099                	j	800044d0 <sys_sleep+0x7c>
    if(killed(myproc())){
    8000448c:	ffffe097          	auipc	ra,0xffffe
    80004490:	430080e7          	jalr	1072(ra) # 800028bc <myproc>
    80004494:	87aa                	mv	a5,a0
    80004496:	853e                	mv	a0,a5
    80004498:	fffff097          	auipc	ra,0xfffff
    8000449c:	1c4080e7          	jalr	452(ra) # 8000365c <killed>
    800044a0:	87aa                	mv	a5,a0
    800044a2:	cb99                	beqz	a5,800044b8 <sys_sleep+0x64>
      release(&tickslock);
    800044a4:	00018517          	auipc	a0,0x18
    800044a8:	b4450513          	addi	a0,a0,-1212 # 8001bfe8 <tickslock>
    800044ac:	ffffd097          	auipc	ra,0xffffd
    800044b0:	e7c080e7          	jalr	-388(ra) # 80001328 <release>
      return -1;
    800044b4:	57fd                	li	a5,-1
    800044b6:	a099                	j	800044fc <sys_sleep+0xa8>
    }
    sleep(&ticks, &tickslock);
    800044b8:	00018597          	auipc	a1,0x18
    800044bc:	b3058593          	addi	a1,a1,-1232 # 8001bfe8 <tickslock>
    800044c0:	0000a517          	auipc	a0,0xa
    800044c4:	a8850513          	addi	a0,a0,-1400 # 8000df48 <ticks>
    800044c8:	fffff097          	auipc	ra,0xfffff
    800044cc:	fae080e7          	jalr	-82(ra) # 80003476 <sleep>
  while(ticks - ticks0 < n){
    800044d0:	0000a797          	auipc	a5,0xa
    800044d4:	a7878793          	addi	a5,a5,-1416 # 8000df48 <ticks>
    800044d8:	439c                	lw	a5,0(a5)
    800044da:	fec42703          	lw	a4,-20(s0)
    800044de:	9f99                	subw	a5,a5,a4
    800044e0:	2781                	sext.w	a5,a5
    800044e2:	fe842703          	lw	a4,-24(s0)
    800044e6:	fae7e3e3          	bltu	a5,a4,8000448c <sys_sleep+0x38>
  }
  release(&tickslock);
    800044ea:	00018517          	auipc	a0,0x18
    800044ee:	afe50513          	addi	a0,a0,-1282 # 8001bfe8 <tickslock>
    800044f2:	ffffd097          	auipc	ra,0xffffd
    800044f6:	e36080e7          	jalr	-458(ra) # 80001328 <release>
  return 0;
    800044fa:	4781                	li	a5,0
}
    800044fc:	853e                	mv	a0,a5
    800044fe:	60e2                	ld	ra,24(sp)
    80004500:	6442                	ld	s0,16(sp)
    80004502:	6105                	addi	sp,sp,32
    80004504:	8082                	ret

0000000080004506 <sys_kill>:

uint64
sys_kill(void)
{
    80004506:	1101                	addi	sp,sp,-32
    80004508:	ec06                	sd	ra,24(sp)
    8000450a:	e822                	sd	s0,16(sp)
    8000450c:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    8000450e:	fec40793          	addi	a5,s0,-20
    80004512:	85be                	mv	a1,a5
    80004514:	4501                	li	a0,0
    80004516:	00000097          	auipc	ra,0x0
    8000451a:	cf0080e7          	jalr	-784(ra) # 80004206 <argint>
  return kill(pid);
    8000451e:	fec42783          	lw	a5,-20(s0)
    80004522:	853e                	mv	a0,a5
    80004524:	fffff097          	auipc	ra,0xfffff
    80004528:	060080e7          	jalr	96(ra) # 80003584 <kill>
    8000452c:	87aa                	mv	a5,a0
}
    8000452e:	853e                	mv	a0,a5
    80004530:	60e2                	ld	ra,24(sp)
    80004532:	6442                	ld	s0,16(sp)
    80004534:	6105                	addi	sp,sp,32
    80004536:	8082                	ret

0000000080004538 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004538:	1101                	addi	sp,sp,-32
    8000453a:	ec06                	sd	ra,24(sp)
    8000453c:	e822                	sd	s0,16(sp)
    8000453e:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80004540:	00018517          	auipc	a0,0x18
    80004544:	aa850513          	addi	a0,a0,-1368 # 8001bfe8 <tickslock>
    80004548:	ffffd097          	auipc	ra,0xffffd
    8000454c:	d7c080e7          	jalr	-644(ra) # 800012c4 <acquire>
  xticks = ticks;
    80004550:	0000a797          	auipc	a5,0xa
    80004554:	9f878793          	addi	a5,a5,-1544 # 8000df48 <ticks>
    80004558:	439c                	lw	a5,0(a5)
    8000455a:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    8000455e:	00018517          	auipc	a0,0x18
    80004562:	a8a50513          	addi	a0,a0,-1398 # 8001bfe8 <tickslock>
    80004566:	ffffd097          	auipc	ra,0xffffd
    8000456a:	dc2080e7          	jalr	-574(ra) # 80001328 <release>
  return xticks;
    8000456e:	fec46783          	lwu	a5,-20(s0)
}
    80004572:	853e                	mv	a0,a5
    80004574:	60e2                	ld	ra,24(sp)
    80004576:	6442                	ld	s0,16(sp)
    80004578:	6105                	addi	sp,sp,32
    8000457a:	8082                	ret

000000008000457c <sys_ps>:

uint64
sys_ps(void)
{
    8000457c:	1141                	addi	sp,sp,-16
    8000457e:	e406                	sd	ra,8(sp)
    80004580:	e022                	sd	s0,0(sp)
    80004582:	0800                	addi	s0,sp,16
  writeProcs();
    80004584:	fffff097          	auipc	ra,0xfffff
    80004588:	2e0080e7          	jalr	736(ra) # 80003864 <writeProcs>
  return 0;
    8000458c:	4781                	li	a5,0
}
    8000458e:	853e                	mv	a0,a5
    80004590:	60a2                	ld	ra,8(sp)
    80004592:	6402                	ld	s0,0(sp)
    80004594:	0141                	addi	sp,sp,16
    80004596:	8082                	ret

0000000080004598 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004598:	1101                	addi	sp,sp,-32
    8000459a:	ec06                	sd	ra,24(sp)
    8000459c:	e822                	sd	s0,16(sp)
    8000459e:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800045a0:	00007597          	auipc	a1,0x7
    800045a4:	e9058593          	addi	a1,a1,-368 # 8000b430 <etext+0x430>
    800045a8:	00018517          	auipc	a0,0x18
    800045ac:	a5850513          	addi	a0,a0,-1448 # 8001c000 <bcache>
    800045b0:	ffffd097          	auipc	ra,0xffffd
    800045b4:	ce0080e7          	jalr	-800(ra) # 80001290 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800045b8:	00018717          	auipc	a4,0x18
    800045bc:	a4870713          	addi	a4,a4,-1464 # 8001c000 <bcache>
    800045c0:	67a1                	lui	a5,0x8
    800045c2:	97ba                	add	a5,a5,a4
    800045c4:	00020717          	auipc	a4,0x20
    800045c8:	ca470713          	addi	a4,a4,-860 # 80024268 <bcache+0x8268>
    800045cc:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    800045d0:	00018717          	auipc	a4,0x18
    800045d4:	a3070713          	addi	a4,a4,-1488 # 8001c000 <bcache>
    800045d8:	67a1                	lui	a5,0x8
    800045da:	97ba                	add	a5,a5,a4
    800045dc:	00020717          	auipc	a4,0x20
    800045e0:	c8c70713          	addi	a4,a4,-884 # 80024268 <bcache+0x8268>
    800045e4:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800045e8:	00018797          	auipc	a5,0x18
    800045ec:	a3078793          	addi	a5,a5,-1488 # 8001c018 <bcache+0x18>
    800045f0:	fef43423          	sd	a5,-24(s0)
    800045f4:	a895                	j	80004668 <binit+0xd0>
    b->next = bcache.head.next;
    800045f6:	00018717          	auipc	a4,0x18
    800045fa:	a0a70713          	addi	a4,a4,-1526 # 8001c000 <bcache>
    800045fe:	67a1                	lui	a5,0x8
    80004600:	97ba                	add	a5,a5,a4
    80004602:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004606:	fe843783          	ld	a5,-24(s0)
    8000460a:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    8000460c:	fe843783          	ld	a5,-24(s0)
    80004610:	00020717          	auipc	a4,0x20
    80004614:	c5870713          	addi	a4,a4,-936 # 80024268 <bcache+0x8268>
    80004618:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    8000461a:	fe843783          	ld	a5,-24(s0)
    8000461e:	07c1                	addi	a5,a5,16
    80004620:	00007597          	auipc	a1,0x7
    80004624:	e1858593          	addi	a1,a1,-488 # 8000b438 <etext+0x438>
    80004628:	853e                	mv	a0,a5
    8000462a:	00002097          	auipc	ra,0x2
    8000462e:	fe4080e7          	jalr	-28(ra) # 8000660e <initsleeplock>
    bcache.head.next->prev = b;
    80004632:	00018717          	auipc	a4,0x18
    80004636:	9ce70713          	addi	a4,a4,-1586 # 8001c000 <bcache>
    8000463a:	67a1                	lui	a5,0x8
    8000463c:	97ba                	add	a5,a5,a4
    8000463e:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004642:	fe843703          	ld	a4,-24(s0)
    80004646:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004648:	00018717          	auipc	a4,0x18
    8000464c:	9b870713          	addi	a4,a4,-1608 # 8001c000 <bcache>
    80004650:	67a1                	lui	a5,0x8
    80004652:	97ba                	add	a5,a5,a4
    80004654:	fe843703          	ld	a4,-24(s0)
    80004658:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000465c:	fe843783          	ld	a5,-24(s0)
    80004660:	45878793          	addi	a5,a5,1112
    80004664:	fef43423          	sd	a5,-24(s0)
    80004668:	00020797          	auipc	a5,0x20
    8000466c:	c0078793          	addi	a5,a5,-1024 # 80024268 <bcache+0x8268>
    80004670:	fe843703          	ld	a4,-24(s0)
    80004674:	f8f761e3          	bltu	a4,a5,800045f6 <binit+0x5e>
  }
}
    80004678:	0001                	nop
    8000467a:	0001                	nop
    8000467c:	60e2                	ld	ra,24(sp)
    8000467e:	6442                	ld	s0,16(sp)
    80004680:	6105                	addi	sp,sp,32
    80004682:	8082                	ret

0000000080004684 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    80004684:	7179                	addi	sp,sp,-48
    80004686:	f406                	sd	ra,40(sp)
    80004688:	f022                	sd	s0,32(sp)
    8000468a:	1800                	addi	s0,sp,48
    8000468c:	87aa                	mv	a5,a0
    8000468e:	872e                	mv	a4,a1
    80004690:	fcf42e23          	sw	a5,-36(s0)
    80004694:	87ba                	mv	a5,a4
    80004696:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    8000469a:	00018517          	auipc	a0,0x18
    8000469e:	96650513          	addi	a0,a0,-1690 # 8001c000 <bcache>
    800046a2:	ffffd097          	auipc	ra,0xffffd
    800046a6:	c22080e7          	jalr	-990(ra) # 800012c4 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800046aa:	00018717          	auipc	a4,0x18
    800046ae:	95670713          	addi	a4,a4,-1706 # 8001c000 <bcache>
    800046b2:	67a1                	lui	a5,0x8
    800046b4:	97ba                	add	a5,a5,a4
    800046b6:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800046ba:	fef43423          	sd	a5,-24(s0)
    800046be:	a095                	j	80004722 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    800046c0:	fe843783          	ld	a5,-24(s0)
    800046c4:	479c                	lw	a5,8(a5)
    800046c6:	fdc42703          	lw	a4,-36(s0)
    800046ca:	2701                	sext.w	a4,a4
    800046cc:	04f71663          	bne	a4,a5,80004718 <bget+0x94>
    800046d0:	fe843783          	ld	a5,-24(s0)
    800046d4:	47dc                	lw	a5,12(a5)
    800046d6:	fd842703          	lw	a4,-40(s0)
    800046da:	2701                	sext.w	a4,a4
    800046dc:	02f71e63          	bne	a4,a5,80004718 <bget+0x94>
      b->refcnt++;
    800046e0:	fe843783          	ld	a5,-24(s0)
    800046e4:	43bc                	lw	a5,64(a5)
    800046e6:	2785                	addiw	a5,a5,1
    800046e8:	0007871b          	sext.w	a4,a5
    800046ec:	fe843783          	ld	a5,-24(s0)
    800046f0:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800046f2:	00018517          	auipc	a0,0x18
    800046f6:	90e50513          	addi	a0,a0,-1778 # 8001c000 <bcache>
    800046fa:	ffffd097          	auipc	ra,0xffffd
    800046fe:	c2e080e7          	jalr	-978(ra) # 80001328 <release>
      acquiresleep(&b->lock);
    80004702:	fe843783          	ld	a5,-24(s0)
    80004706:	07c1                	addi	a5,a5,16
    80004708:	853e                	mv	a0,a5
    8000470a:	00002097          	auipc	ra,0x2
    8000470e:	f50080e7          	jalr	-176(ra) # 8000665a <acquiresleep>
      return b;
    80004712:	fe843783          	ld	a5,-24(s0)
    80004716:	a07d                	j	800047c4 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004718:	fe843783          	ld	a5,-24(s0)
    8000471c:	6bbc                	ld	a5,80(a5)
    8000471e:	fef43423          	sd	a5,-24(s0)
    80004722:	fe843703          	ld	a4,-24(s0)
    80004726:	00020797          	auipc	a5,0x20
    8000472a:	b4278793          	addi	a5,a5,-1214 # 80024268 <bcache+0x8268>
    8000472e:	f8f719e3          	bne	a4,a5,800046c0 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004732:	00018717          	auipc	a4,0x18
    80004736:	8ce70713          	addi	a4,a4,-1842 # 8001c000 <bcache>
    8000473a:	67a1                	lui	a5,0x8
    8000473c:	97ba                	add	a5,a5,a4
    8000473e:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004742:	fef43423          	sd	a5,-24(s0)
    80004746:	a8b9                	j	800047a4 <bget+0x120>
    if(b->refcnt == 0) {
    80004748:	fe843783          	ld	a5,-24(s0)
    8000474c:	43bc                	lw	a5,64(a5)
    8000474e:	e7b1                	bnez	a5,8000479a <bget+0x116>
      b->dev = dev;
    80004750:	fe843783          	ld	a5,-24(s0)
    80004754:	fdc42703          	lw	a4,-36(s0)
    80004758:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    8000475a:	fe843783          	ld	a5,-24(s0)
    8000475e:	fd842703          	lw	a4,-40(s0)
    80004762:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004764:	fe843783          	ld	a5,-24(s0)
    80004768:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    8000476c:	fe843783          	ld	a5,-24(s0)
    80004770:	4705                	li	a4,1
    80004772:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004774:	00018517          	auipc	a0,0x18
    80004778:	88c50513          	addi	a0,a0,-1908 # 8001c000 <bcache>
    8000477c:	ffffd097          	auipc	ra,0xffffd
    80004780:	bac080e7          	jalr	-1108(ra) # 80001328 <release>
      acquiresleep(&b->lock);
    80004784:	fe843783          	ld	a5,-24(s0)
    80004788:	07c1                	addi	a5,a5,16
    8000478a:	853e                	mv	a0,a5
    8000478c:	00002097          	auipc	ra,0x2
    80004790:	ece080e7          	jalr	-306(ra) # 8000665a <acquiresleep>
      return b;
    80004794:	fe843783          	ld	a5,-24(s0)
    80004798:	a035                	j	800047c4 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000479a:	fe843783          	ld	a5,-24(s0)
    8000479e:	67bc                	ld	a5,72(a5)
    800047a0:	fef43423          	sd	a5,-24(s0)
    800047a4:	fe843703          	ld	a4,-24(s0)
    800047a8:	00020797          	auipc	a5,0x20
    800047ac:	ac078793          	addi	a5,a5,-1344 # 80024268 <bcache+0x8268>
    800047b0:	f8f71ce3          	bne	a4,a5,80004748 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    800047b4:	00007517          	auipc	a0,0x7
    800047b8:	c8c50513          	addi	a0,a0,-884 # 8000b440 <etext+0x440>
    800047bc:	ffffc097          	auipc	ra,0xffffc
    800047c0:	504080e7          	jalr	1284(ra) # 80000cc0 <panic>
}
    800047c4:	853e                	mv	a0,a5
    800047c6:	70a2                	ld	ra,40(sp)
    800047c8:	7402                	ld	s0,32(sp)
    800047ca:	6145                	addi	sp,sp,48
    800047cc:	8082                	ret

00000000800047ce <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    800047ce:	7179                	addi	sp,sp,-48
    800047d0:	f406                	sd	ra,40(sp)
    800047d2:	f022                	sd	s0,32(sp)
    800047d4:	1800                	addi	s0,sp,48
    800047d6:	87aa                	mv	a5,a0
    800047d8:	872e                	mv	a4,a1
    800047da:	fcf42e23          	sw	a5,-36(s0)
    800047de:	87ba                	mv	a5,a4
    800047e0:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    800047e4:	fd842703          	lw	a4,-40(s0)
    800047e8:	fdc42783          	lw	a5,-36(s0)
    800047ec:	85ba                	mv	a1,a4
    800047ee:	853e                	mv	a0,a5
    800047f0:	00000097          	auipc	ra,0x0
    800047f4:	e94080e7          	jalr	-364(ra) # 80004684 <bget>
    800047f8:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    800047fc:	fe843783          	ld	a5,-24(s0)
    80004800:	439c                	lw	a5,0(a5)
    80004802:	ef81                	bnez	a5,8000481a <bread+0x4c>
    virtio_disk_rw(b, 0);
    80004804:	4581                	li	a1,0
    80004806:	fe843503          	ld	a0,-24(s0)
    8000480a:	00005097          	auipc	ra,0x5
    8000480e:	830080e7          	jalr	-2000(ra) # 8000903a <virtio_disk_rw>
    b->valid = 1;
    80004812:	fe843783          	ld	a5,-24(s0)
    80004816:	4705                	li	a4,1
    80004818:	c398                	sw	a4,0(a5)
  }
  return b;
    8000481a:	fe843783          	ld	a5,-24(s0)
}
    8000481e:	853e                	mv	a0,a5
    80004820:	70a2                	ld	ra,40(sp)
    80004822:	7402                	ld	s0,32(sp)
    80004824:	6145                	addi	sp,sp,48
    80004826:	8082                	ret

0000000080004828 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004828:	1101                	addi	sp,sp,-32
    8000482a:	ec06                	sd	ra,24(sp)
    8000482c:	e822                	sd	s0,16(sp)
    8000482e:	1000                	addi	s0,sp,32
    80004830:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004834:	fe843783          	ld	a5,-24(s0)
    80004838:	07c1                	addi	a5,a5,16
    8000483a:	853e                	mv	a0,a5
    8000483c:	00002097          	auipc	ra,0x2
    80004840:	ede080e7          	jalr	-290(ra) # 8000671a <holdingsleep>
    80004844:	87aa                	mv	a5,a0
    80004846:	eb89                	bnez	a5,80004858 <bwrite+0x30>
    panic("bwrite");
    80004848:	00007517          	auipc	a0,0x7
    8000484c:	c1050513          	addi	a0,a0,-1008 # 8000b458 <etext+0x458>
    80004850:	ffffc097          	auipc	ra,0xffffc
    80004854:	470080e7          	jalr	1136(ra) # 80000cc0 <panic>
  virtio_disk_rw(b, 1);
    80004858:	4585                	li	a1,1
    8000485a:	fe843503          	ld	a0,-24(s0)
    8000485e:	00004097          	auipc	ra,0x4
    80004862:	7dc080e7          	jalr	2012(ra) # 8000903a <virtio_disk_rw>
}
    80004866:	0001                	nop
    80004868:	60e2                	ld	ra,24(sp)
    8000486a:	6442                	ld	s0,16(sp)
    8000486c:	6105                	addi	sp,sp,32
    8000486e:	8082                	ret

0000000080004870 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004870:	1101                	addi	sp,sp,-32
    80004872:	ec06                	sd	ra,24(sp)
    80004874:	e822                	sd	s0,16(sp)
    80004876:	1000                	addi	s0,sp,32
    80004878:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    8000487c:	fe843783          	ld	a5,-24(s0)
    80004880:	07c1                	addi	a5,a5,16
    80004882:	853e                	mv	a0,a5
    80004884:	00002097          	auipc	ra,0x2
    80004888:	e96080e7          	jalr	-362(ra) # 8000671a <holdingsleep>
    8000488c:	87aa                	mv	a5,a0
    8000488e:	eb89                	bnez	a5,800048a0 <brelse+0x30>
    panic("brelse");
    80004890:	00007517          	auipc	a0,0x7
    80004894:	bd050513          	addi	a0,a0,-1072 # 8000b460 <etext+0x460>
    80004898:	ffffc097          	auipc	ra,0xffffc
    8000489c:	428080e7          	jalr	1064(ra) # 80000cc0 <panic>

  releasesleep(&b->lock);
    800048a0:	fe843783          	ld	a5,-24(s0)
    800048a4:	07c1                	addi	a5,a5,16
    800048a6:	853e                	mv	a0,a5
    800048a8:	00002097          	auipc	ra,0x2
    800048ac:	e20080e7          	jalr	-480(ra) # 800066c8 <releasesleep>

  acquire(&bcache.lock);
    800048b0:	00017517          	auipc	a0,0x17
    800048b4:	75050513          	addi	a0,a0,1872 # 8001c000 <bcache>
    800048b8:	ffffd097          	auipc	ra,0xffffd
    800048bc:	a0c080e7          	jalr	-1524(ra) # 800012c4 <acquire>
  b->refcnt--;
    800048c0:	fe843783          	ld	a5,-24(s0)
    800048c4:	43bc                	lw	a5,64(a5)
    800048c6:	37fd                	addiw	a5,a5,-1
    800048c8:	0007871b          	sext.w	a4,a5
    800048cc:	fe843783          	ld	a5,-24(s0)
    800048d0:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    800048d2:	fe843783          	ld	a5,-24(s0)
    800048d6:	43bc                	lw	a5,64(a5)
    800048d8:	e7b5                	bnez	a5,80004944 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    800048da:	fe843783          	ld	a5,-24(s0)
    800048de:	6bbc                	ld	a5,80(a5)
    800048e0:	fe843703          	ld	a4,-24(s0)
    800048e4:	6738                	ld	a4,72(a4)
    800048e6:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    800048e8:	fe843783          	ld	a5,-24(s0)
    800048ec:	67bc                	ld	a5,72(a5)
    800048ee:	fe843703          	ld	a4,-24(s0)
    800048f2:	6b38                	ld	a4,80(a4)
    800048f4:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    800048f6:	00017717          	auipc	a4,0x17
    800048fa:	70a70713          	addi	a4,a4,1802 # 8001c000 <bcache>
    800048fe:	67a1                	lui	a5,0x8
    80004900:	97ba                	add	a5,a5,a4
    80004902:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004906:	fe843783          	ld	a5,-24(s0)
    8000490a:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    8000490c:	fe843783          	ld	a5,-24(s0)
    80004910:	00020717          	auipc	a4,0x20
    80004914:	95870713          	addi	a4,a4,-1704 # 80024268 <bcache+0x8268>
    80004918:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    8000491a:	00017717          	auipc	a4,0x17
    8000491e:	6e670713          	addi	a4,a4,1766 # 8001c000 <bcache>
    80004922:	67a1                	lui	a5,0x8
    80004924:	97ba                	add	a5,a5,a4
    80004926:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000492a:	fe843703          	ld	a4,-24(s0)
    8000492e:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004930:	00017717          	auipc	a4,0x17
    80004934:	6d070713          	addi	a4,a4,1744 # 8001c000 <bcache>
    80004938:	67a1                	lui	a5,0x8
    8000493a:	97ba                	add	a5,a5,a4
    8000493c:	fe843703          	ld	a4,-24(s0)
    80004940:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004944:	00017517          	auipc	a0,0x17
    80004948:	6bc50513          	addi	a0,a0,1724 # 8001c000 <bcache>
    8000494c:	ffffd097          	auipc	ra,0xffffd
    80004950:	9dc080e7          	jalr	-1572(ra) # 80001328 <release>
}
    80004954:	0001                	nop
    80004956:	60e2                	ld	ra,24(sp)
    80004958:	6442                	ld	s0,16(sp)
    8000495a:	6105                	addi	sp,sp,32
    8000495c:	8082                	ret

000000008000495e <bpin>:

void
bpin(struct buf *b) {
    8000495e:	1101                	addi	sp,sp,-32
    80004960:	ec06                	sd	ra,24(sp)
    80004962:	e822                	sd	s0,16(sp)
    80004964:	1000                	addi	s0,sp,32
    80004966:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    8000496a:	00017517          	auipc	a0,0x17
    8000496e:	69650513          	addi	a0,a0,1686 # 8001c000 <bcache>
    80004972:	ffffd097          	auipc	ra,0xffffd
    80004976:	952080e7          	jalr	-1710(ra) # 800012c4 <acquire>
  b->refcnt++;
    8000497a:	fe843783          	ld	a5,-24(s0)
    8000497e:	43bc                	lw	a5,64(a5)
    80004980:	2785                	addiw	a5,a5,1
    80004982:	0007871b          	sext.w	a4,a5
    80004986:	fe843783          	ld	a5,-24(s0)
    8000498a:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    8000498c:	00017517          	auipc	a0,0x17
    80004990:	67450513          	addi	a0,a0,1652 # 8001c000 <bcache>
    80004994:	ffffd097          	auipc	ra,0xffffd
    80004998:	994080e7          	jalr	-1644(ra) # 80001328 <release>
}
    8000499c:	0001                	nop
    8000499e:	60e2                	ld	ra,24(sp)
    800049a0:	6442                	ld	s0,16(sp)
    800049a2:	6105                	addi	sp,sp,32
    800049a4:	8082                	ret

00000000800049a6 <bunpin>:

void
bunpin(struct buf *b) {
    800049a6:	1101                	addi	sp,sp,-32
    800049a8:	ec06                	sd	ra,24(sp)
    800049aa:	e822                	sd	s0,16(sp)
    800049ac:	1000                	addi	s0,sp,32
    800049ae:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    800049b2:	00017517          	auipc	a0,0x17
    800049b6:	64e50513          	addi	a0,a0,1614 # 8001c000 <bcache>
    800049ba:	ffffd097          	auipc	ra,0xffffd
    800049be:	90a080e7          	jalr	-1782(ra) # 800012c4 <acquire>
  b->refcnt--;
    800049c2:	fe843783          	ld	a5,-24(s0)
    800049c6:	43bc                	lw	a5,64(a5)
    800049c8:	37fd                	addiw	a5,a5,-1
    800049ca:	0007871b          	sext.w	a4,a5
    800049ce:	fe843783          	ld	a5,-24(s0)
    800049d2:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    800049d4:	00017517          	auipc	a0,0x17
    800049d8:	62c50513          	addi	a0,a0,1580 # 8001c000 <bcache>
    800049dc:	ffffd097          	auipc	ra,0xffffd
    800049e0:	94c080e7          	jalr	-1716(ra) # 80001328 <release>
}
    800049e4:	0001                	nop
    800049e6:	60e2                	ld	ra,24(sp)
    800049e8:	6442                	ld	s0,16(sp)
    800049ea:	6105                	addi	sp,sp,32
    800049ec:	8082                	ret

00000000800049ee <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    800049ee:	7179                	addi	sp,sp,-48
    800049f0:	f406                	sd	ra,40(sp)
    800049f2:	f022                	sd	s0,32(sp)
    800049f4:	1800                	addi	s0,sp,48
    800049f6:	87aa                	mv	a5,a0
    800049f8:	fcb43823          	sd	a1,-48(s0)
    800049fc:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004a00:	fdc42783          	lw	a5,-36(s0)
    80004a04:	4585                	li	a1,1
    80004a06:	853e                	mv	a0,a5
    80004a08:	00000097          	auipc	ra,0x0
    80004a0c:	dc6080e7          	jalr	-570(ra) # 800047ce <bread>
    80004a10:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004a14:	fe843783          	ld	a5,-24(s0)
    80004a18:	05878793          	addi	a5,a5,88
    80004a1c:	02000613          	li	a2,32
    80004a20:	85be                	mv	a1,a5
    80004a22:	fd043503          	ld	a0,-48(s0)
    80004a26:	ffffd097          	auipc	ra,0xffffd
    80004a2a:	b5e080e7          	jalr	-1186(ra) # 80001584 <memmove>
  brelse(bp);
    80004a2e:	fe843503          	ld	a0,-24(s0)
    80004a32:	00000097          	auipc	ra,0x0
    80004a36:	e3e080e7          	jalr	-450(ra) # 80004870 <brelse>
}
    80004a3a:	0001                	nop
    80004a3c:	70a2                	ld	ra,40(sp)
    80004a3e:	7402                	ld	s0,32(sp)
    80004a40:	6145                	addi	sp,sp,48
    80004a42:	8082                	ret

0000000080004a44 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004a44:	1101                	addi	sp,sp,-32
    80004a46:	ec06                	sd	ra,24(sp)
    80004a48:	e822                	sd	s0,16(sp)
    80004a4a:	1000                	addi	s0,sp,32
    80004a4c:	87aa                	mv	a5,a0
    80004a4e:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004a52:	fec42783          	lw	a5,-20(s0)
    80004a56:	00020597          	auipc	a1,0x20
    80004a5a:	c6a58593          	addi	a1,a1,-918 # 800246c0 <sb>
    80004a5e:	853e                	mv	a0,a5
    80004a60:	00000097          	auipc	ra,0x0
    80004a64:	f8e080e7          	jalr	-114(ra) # 800049ee <readsb>
  if(sb.magic != FSMAGIC)
    80004a68:	00020797          	auipc	a5,0x20
    80004a6c:	c5878793          	addi	a5,a5,-936 # 800246c0 <sb>
    80004a70:	4398                	lw	a4,0(a5)
    80004a72:	102037b7          	lui	a5,0x10203
    80004a76:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004a7a:	00f70a63          	beq	a4,a5,80004a8e <fsinit+0x4a>
    panic("invalid file system");
    80004a7e:	00007517          	auipc	a0,0x7
    80004a82:	9ea50513          	addi	a0,a0,-1558 # 8000b468 <etext+0x468>
    80004a86:	ffffc097          	auipc	ra,0xffffc
    80004a8a:	23a080e7          	jalr	570(ra) # 80000cc0 <panic>
  initlog(dev, &sb);
    80004a8e:	fec42783          	lw	a5,-20(s0)
    80004a92:	00020597          	auipc	a1,0x20
    80004a96:	c2e58593          	addi	a1,a1,-978 # 800246c0 <sb>
    80004a9a:	853e                	mv	a0,a5
    80004a9c:	00001097          	auipc	ra,0x1
    80004aa0:	478080e7          	jalr	1144(ra) # 80005f14 <initlog>
}
    80004aa4:	0001                	nop
    80004aa6:	60e2                	ld	ra,24(sp)
    80004aa8:	6442                	ld	s0,16(sp)
    80004aaa:	6105                	addi	sp,sp,32
    80004aac:	8082                	ret

0000000080004aae <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004aae:	7179                	addi	sp,sp,-48
    80004ab0:	f406                	sd	ra,40(sp)
    80004ab2:	f022                	sd	s0,32(sp)
    80004ab4:	1800                	addi	s0,sp,48
    80004ab6:	87aa                	mv	a5,a0
    80004ab8:	872e                	mv	a4,a1
    80004aba:	fcf42e23          	sw	a5,-36(s0)
    80004abe:	87ba                	mv	a5,a4
    80004ac0:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004ac4:	fdc42783          	lw	a5,-36(s0)
    80004ac8:	fd842703          	lw	a4,-40(s0)
    80004acc:	85ba                	mv	a1,a4
    80004ace:	853e                	mv	a0,a5
    80004ad0:	00000097          	auipc	ra,0x0
    80004ad4:	cfe080e7          	jalr	-770(ra) # 800047ce <bread>
    80004ad8:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004adc:	fe843783          	ld	a5,-24(s0)
    80004ae0:	05878793          	addi	a5,a5,88
    80004ae4:	40000613          	li	a2,1024
    80004ae8:	4581                	li	a1,0
    80004aea:	853e                	mv	a0,a5
    80004aec:	ffffd097          	auipc	ra,0xffffd
    80004af0:	9ac080e7          	jalr	-1620(ra) # 80001498 <memset>
  log_write(bp);
    80004af4:	fe843503          	ld	a0,-24(s0)
    80004af8:	00002097          	auipc	ra,0x2
    80004afc:	9e8080e7          	jalr	-1560(ra) # 800064e0 <log_write>
  brelse(bp);
    80004b00:	fe843503          	ld	a0,-24(s0)
    80004b04:	00000097          	auipc	ra,0x0
    80004b08:	d6c080e7          	jalr	-660(ra) # 80004870 <brelse>
}
    80004b0c:	0001                	nop
    80004b0e:	70a2                	ld	ra,40(sp)
    80004b10:	7402                	ld	s0,32(sp)
    80004b12:	6145                	addi	sp,sp,48
    80004b14:	8082                	ret

0000000080004b16 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004b16:	7139                	addi	sp,sp,-64
    80004b18:	fc06                	sd	ra,56(sp)
    80004b1a:	f822                	sd	s0,48(sp)
    80004b1c:	0080                	addi	s0,sp,64
    80004b1e:	87aa                	mv	a5,a0
    80004b20:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004b24:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004b28:	fe042623          	sw	zero,-20(s0)
    80004b2c:	aab9                	j	80004c8a <balloc+0x174>
    bp = bread(dev, BBLOCK(b, sb));
    80004b2e:	fec42783          	lw	a5,-20(s0)
    80004b32:	41f7d71b          	sraiw	a4,a5,0x1f
    80004b36:	0137571b          	srliw	a4,a4,0x13
    80004b3a:	9fb9                	addw	a5,a5,a4
    80004b3c:	40d7d79b          	sraiw	a5,a5,0xd
    80004b40:	2781                	sext.w	a5,a5
    80004b42:	873e                	mv	a4,a5
    80004b44:	00020797          	auipc	a5,0x20
    80004b48:	b7c78793          	addi	a5,a5,-1156 # 800246c0 <sb>
    80004b4c:	4fdc                	lw	a5,28(a5)
    80004b4e:	9fb9                	addw	a5,a5,a4
    80004b50:	0007871b          	sext.w	a4,a5
    80004b54:	fcc42783          	lw	a5,-52(s0)
    80004b58:	85ba                	mv	a1,a4
    80004b5a:	853e                	mv	a0,a5
    80004b5c:	00000097          	auipc	ra,0x0
    80004b60:	c72080e7          	jalr	-910(ra) # 800047ce <bread>
    80004b64:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004b68:	fe042423          	sw	zero,-24(s0)
    80004b6c:	a8e1                	j	80004c44 <balloc+0x12e>
      m = 1 << (bi % 8);
    80004b6e:	fe842783          	lw	a5,-24(s0)
    80004b72:	8b9d                	andi	a5,a5,7
    80004b74:	2781                	sext.w	a5,a5
    80004b76:	4705                	li	a4,1
    80004b78:	00f717bb          	sllw	a5,a4,a5
    80004b7c:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004b80:	fe842783          	lw	a5,-24(s0)
    80004b84:	41f7d71b          	sraiw	a4,a5,0x1f
    80004b88:	01d7571b          	srliw	a4,a4,0x1d
    80004b8c:	9fb9                	addw	a5,a5,a4
    80004b8e:	4037d79b          	sraiw	a5,a5,0x3
    80004b92:	2781                	sext.w	a5,a5
    80004b94:	fe043703          	ld	a4,-32(s0)
    80004b98:	97ba                	add	a5,a5,a4
    80004b9a:	0587c783          	lbu	a5,88(a5)
    80004b9e:	2781                	sext.w	a5,a5
    80004ba0:	fdc42703          	lw	a4,-36(s0)
    80004ba4:	8ff9                	and	a5,a5,a4
    80004ba6:	2781                	sext.w	a5,a5
    80004ba8:	ebc9                	bnez	a5,80004c3a <balloc+0x124>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004baa:	fe842783          	lw	a5,-24(s0)
    80004bae:	41f7d71b          	sraiw	a4,a5,0x1f
    80004bb2:	01d7571b          	srliw	a4,a4,0x1d
    80004bb6:	9fb9                	addw	a5,a5,a4
    80004bb8:	4037d79b          	sraiw	a5,a5,0x3
    80004bbc:	2781                	sext.w	a5,a5
    80004bbe:	fe043703          	ld	a4,-32(s0)
    80004bc2:	973e                	add	a4,a4,a5
    80004bc4:	05874703          	lbu	a4,88(a4)
    80004bc8:	0187169b          	slliw	a3,a4,0x18
    80004bcc:	4186d69b          	sraiw	a3,a3,0x18
    80004bd0:	fdc42703          	lw	a4,-36(s0)
    80004bd4:	0187171b          	slliw	a4,a4,0x18
    80004bd8:	4187571b          	sraiw	a4,a4,0x18
    80004bdc:	8f55                	or	a4,a4,a3
    80004bde:	0187171b          	slliw	a4,a4,0x18
    80004be2:	4187571b          	sraiw	a4,a4,0x18
    80004be6:	0ff77713          	zext.b	a4,a4
    80004bea:	fe043683          	ld	a3,-32(s0)
    80004bee:	97b6                	add	a5,a5,a3
    80004bf0:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004bf4:	fe043503          	ld	a0,-32(s0)
    80004bf8:	00002097          	auipc	ra,0x2
    80004bfc:	8e8080e7          	jalr	-1816(ra) # 800064e0 <log_write>
        brelse(bp);
    80004c00:	fe043503          	ld	a0,-32(s0)
    80004c04:	00000097          	auipc	ra,0x0
    80004c08:	c6c080e7          	jalr	-916(ra) # 80004870 <brelse>
        bzero(dev, b + bi);
    80004c0c:	fcc42783          	lw	a5,-52(s0)
    80004c10:	fec42703          	lw	a4,-20(s0)
    80004c14:	86ba                	mv	a3,a4
    80004c16:	fe842703          	lw	a4,-24(s0)
    80004c1a:	9f35                	addw	a4,a4,a3
    80004c1c:	2701                	sext.w	a4,a4
    80004c1e:	85ba                	mv	a1,a4
    80004c20:	853e                	mv	a0,a5
    80004c22:	00000097          	auipc	ra,0x0
    80004c26:	e8c080e7          	jalr	-372(ra) # 80004aae <bzero>
        return b + bi;
    80004c2a:	fec42783          	lw	a5,-20(s0)
    80004c2e:	873e                	mv	a4,a5
    80004c30:	fe842783          	lw	a5,-24(s0)
    80004c34:	9fb9                	addw	a5,a5,a4
    80004c36:	2781                	sext.w	a5,a5
    80004c38:	a89d                	j	80004cae <balloc+0x198>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004c3a:	fe842783          	lw	a5,-24(s0)
    80004c3e:	2785                	addiw	a5,a5,1
    80004c40:	fef42423          	sw	a5,-24(s0)
    80004c44:	fe842783          	lw	a5,-24(s0)
    80004c48:	0007871b          	sext.w	a4,a5
    80004c4c:	6789                	lui	a5,0x2
    80004c4e:	02f75163          	bge	a4,a5,80004c70 <balloc+0x15a>
    80004c52:	fec42783          	lw	a5,-20(s0)
    80004c56:	873e                	mv	a4,a5
    80004c58:	fe842783          	lw	a5,-24(s0)
    80004c5c:	9fb9                	addw	a5,a5,a4
    80004c5e:	2781                	sext.w	a5,a5
    80004c60:	873e                	mv	a4,a5
    80004c62:	00020797          	auipc	a5,0x20
    80004c66:	a5e78793          	addi	a5,a5,-1442 # 800246c0 <sb>
    80004c6a:	43dc                	lw	a5,4(a5)
    80004c6c:	f0f761e3          	bltu	a4,a5,80004b6e <balloc+0x58>
      }
    }
    brelse(bp);
    80004c70:	fe043503          	ld	a0,-32(s0)
    80004c74:	00000097          	auipc	ra,0x0
    80004c78:	bfc080e7          	jalr	-1028(ra) # 80004870 <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004c7c:	fec42783          	lw	a5,-20(s0)
    80004c80:	873e                	mv	a4,a5
    80004c82:	6789                	lui	a5,0x2
    80004c84:	9fb9                	addw	a5,a5,a4
    80004c86:	fef42623          	sw	a5,-20(s0)
    80004c8a:	00020797          	auipc	a5,0x20
    80004c8e:	a3678793          	addi	a5,a5,-1482 # 800246c0 <sb>
    80004c92:	43d8                	lw	a4,4(a5)
    80004c94:	fec42783          	lw	a5,-20(s0)
    80004c98:	e8e7ebe3          	bltu	a5,a4,80004b2e <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004c9c:	00006517          	auipc	a0,0x6
    80004ca0:	7e450513          	addi	a0,a0,2020 # 8000b480 <etext+0x480>
    80004ca4:	ffffc097          	auipc	ra,0xffffc
    80004ca8:	dc6080e7          	jalr	-570(ra) # 80000a6a <printf>
  return 0;
    80004cac:	4781                	li	a5,0
}
    80004cae:	853e                	mv	a0,a5
    80004cb0:	70e2                	ld	ra,56(sp)
    80004cb2:	7442                	ld	s0,48(sp)
    80004cb4:	6121                	addi	sp,sp,64
    80004cb6:	8082                	ret

0000000080004cb8 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004cb8:	7179                	addi	sp,sp,-48
    80004cba:	f406                	sd	ra,40(sp)
    80004cbc:	f022                	sd	s0,32(sp)
    80004cbe:	1800                	addi	s0,sp,48
    80004cc0:	87aa                	mv	a5,a0
    80004cc2:	872e                	mv	a4,a1
    80004cc4:	fcf42e23          	sw	a5,-36(s0)
    80004cc8:	87ba                	mv	a5,a4
    80004cca:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004cce:	fdc42683          	lw	a3,-36(s0)
    80004cd2:	fd842783          	lw	a5,-40(s0)
    80004cd6:	00d7d79b          	srliw	a5,a5,0xd
    80004cda:	0007871b          	sext.w	a4,a5
    80004cde:	00020797          	auipc	a5,0x20
    80004ce2:	9e278793          	addi	a5,a5,-1566 # 800246c0 <sb>
    80004ce6:	4fdc                	lw	a5,28(a5)
    80004ce8:	9fb9                	addw	a5,a5,a4
    80004cea:	2781                	sext.w	a5,a5
    80004cec:	85be                	mv	a1,a5
    80004cee:	8536                	mv	a0,a3
    80004cf0:	00000097          	auipc	ra,0x0
    80004cf4:	ade080e7          	jalr	-1314(ra) # 800047ce <bread>
    80004cf8:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004cfc:	fd842703          	lw	a4,-40(s0)
    80004d00:	6789                	lui	a5,0x2
    80004d02:	17fd                	addi	a5,a5,-1 # 1fff <_entry-0x7fffe001>
    80004d04:	8ff9                	and	a5,a5,a4
    80004d06:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004d0a:	fe442783          	lw	a5,-28(s0)
    80004d0e:	8b9d                	andi	a5,a5,7
    80004d10:	2781                	sext.w	a5,a5
    80004d12:	4705                	li	a4,1
    80004d14:	00f717bb          	sllw	a5,a4,a5
    80004d18:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004d1c:	fe442783          	lw	a5,-28(s0)
    80004d20:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d24:	01d7571b          	srliw	a4,a4,0x1d
    80004d28:	9fb9                	addw	a5,a5,a4
    80004d2a:	4037d79b          	sraiw	a5,a5,0x3
    80004d2e:	2781                	sext.w	a5,a5
    80004d30:	fe843703          	ld	a4,-24(s0)
    80004d34:	97ba                	add	a5,a5,a4
    80004d36:	0587c783          	lbu	a5,88(a5)
    80004d3a:	2781                	sext.w	a5,a5
    80004d3c:	fe042703          	lw	a4,-32(s0)
    80004d40:	8ff9                	and	a5,a5,a4
    80004d42:	2781                	sext.w	a5,a5
    80004d44:	eb89                	bnez	a5,80004d56 <bfree+0x9e>
    panic("freeing free block");
    80004d46:	00006517          	auipc	a0,0x6
    80004d4a:	75250513          	addi	a0,a0,1874 # 8000b498 <etext+0x498>
    80004d4e:	ffffc097          	auipc	ra,0xffffc
    80004d52:	f72080e7          	jalr	-142(ra) # 80000cc0 <panic>
  bp->data[bi/8] &= ~m;
    80004d56:	fe442783          	lw	a5,-28(s0)
    80004d5a:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d5e:	01d7571b          	srliw	a4,a4,0x1d
    80004d62:	9fb9                	addw	a5,a5,a4
    80004d64:	4037d79b          	sraiw	a5,a5,0x3
    80004d68:	2781                	sext.w	a5,a5
    80004d6a:	fe843703          	ld	a4,-24(s0)
    80004d6e:	973e                	add	a4,a4,a5
    80004d70:	05874703          	lbu	a4,88(a4)
    80004d74:	0187169b          	slliw	a3,a4,0x18
    80004d78:	4186d69b          	sraiw	a3,a3,0x18
    80004d7c:	fe042703          	lw	a4,-32(s0)
    80004d80:	0187171b          	slliw	a4,a4,0x18
    80004d84:	4187571b          	sraiw	a4,a4,0x18
    80004d88:	fff74713          	not	a4,a4
    80004d8c:	0187171b          	slliw	a4,a4,0x18
    80004d90:	4187571b          	sraiw	a4,a4,0x18
    80004d94:	8f75                	and	a4,a4,a3
    80004d96:	0187171b          	slliw	a4,a4,0x18
    80004d9a:	4187571b          	sraiw	a4,a4,0x18
    80004d9e:	0ff77713          	zext.b	a4,a4
    80004da2:	fe843683          	ld	a3,-24(s0)
    80004da6:	97b6                	add	a5,a5,a3
    80004da8:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004dac:	fe843503          	ld	a0,-24(s0)
    80004db0:	00001097          	auipc	ra,0x1
    80004db4:	730080e7          	jalr	1840(ra) # 800064e0 <log_write>
  brelse(bp);
    80004db8:	fe843503          	ld	a0,-24(s0)
    80004dbc:	00000097          	auipc	ra,0x0
    80004dc0:	ab4080e7          	jalr	-1356(ra) # 80004870 <brelse>
}
    80004dc4:	0001                	nop
    80004dc6:	70a2                	ld	ra,40(sp)
    80004dc8:	7402                	ld	s0,32(sp)
    80004dca:	6145                	addi	sp,sp,48
    80004dcc:	8082                	ret

0000000080004dce <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004dce:	1101                	addi	sp,sp,-32
    80004dd0:	ec06                	sd	ra,24(sp)
    80004dd2:	e822                	sd	s0,16(sp)
    80004dd4:	1000                	addi	s0,sp,32
  int i = 0;
    80004dd6:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004dda:	00006597          	auipc	a1,0x6
    80004dde:	6d658593          	addi	a1,a1,1750 # 8000b4b0 <etext+0x4b0>
    80004de2:	00020517          	auipc	a0,0x20
    80004de6:	8fe50513          	addi	a0,a0,-1794 # 800246e0 <itable>
    80004dea:	ffffc097          	auipc	ra,0xffffc
    80004dee:	4a6080e7          	jalr	1190(ra) # 80001290 <initlock>
  for(i = 0; i < NINODE; i++) {
    80004df2:	fe042623          	sw	zero,-20(s0)
    80004df6:	a82d                	j	80004e30 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004df8:	fec42703          	lw	a4,-20(s0)
    80004dfc:	87ba                	mv	a5,a4
    80004dfe:	0792                	slli	a5,a5,0x4
    80004e00:	97ba                	add	a5,a5,a4
    80004e02:	078e                	slli	a5,a5,0x3
    80004e04:	02078713          	addi	a4,a5,32
    80004e08:	00020797          	auipc	a5,0x20
    80004e0c:	8d878793          	addi	a5,a5,-1832 # 800246e0 <itable>
    80004e10:	97ba                	add	a5,a5,a4
    80004e12:	07a1                	addi	a5,a5,8
    80004e14:	00006597          	auipc	a1,0x6
    80004e18:	6a458593          	addi	a1,a1,1700 # 8000b4b8 <etext+0x4b8>
    80004e1c:	853e                	mv	a0,a5
    80004e1e:	00001097          	auipc	ra,0x1
    80004e22:	7f0080e7          	jalr	2032(ra) # 8000660e <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004e26:	fec42783          	lw	a5,-20(s0)
    80004e2a:	2785                	addiw	a5,a5,1
    80004e2c:	fef42623          	sw	a5,-20(s0)
    80004e30:	fec42783          	lw	a5,-20(s0)
    80004e34:	0007871b          	sext.w	a4,a5
    80004e38:	03100793          	li	a5,49
    80004e3c:	fae7dee3          	bge	a5,a4,80004df8 <iinit+0x2a>
  }
}
    80004e40:	0001                	nop
    80004e42:	0001                	nop
    80004e44:	60e2                	ld	ra,24(sp)
    80004e46:	6442                	ld	s0,16(sp)
    80004e48:	6105                	addi	sp,sp,32
    80004e4a:	8082                	ret

0000000080004e4c <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    80004e4c:	7139                	addi	sp,sp,-64
    80004e4e:	fc06                	sd	ra,56(sp)
    80004e50:	f822                	sd	s0,48(sp)
    80004e52:	0080                	addi	s0,sp,64
    80004e54:	87aa                	mv	a5,a0
    80004e56:	872e                	mv	a4,a1
    80004e58:	fcf42623          	sw	a5,-52(s0)
    80004e5c:	87ba                	mv	a5,a4
    80004e5e:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004e62:	4785                	li	a5,1
    80004e64:	fef42623          	sw	a5,-20(s0)
    80004e68:	a855                	j	80004f1c <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004e6a:	fec42783          	lw	a5,-20(s0)
    80004e6e:	8391                	srli	a5,a5,0x4
    80004e70:	0007871b          	sext.w	a4,a5
    80004e74:	00020797          	auipc	a5,0x20
    80004e78:	84c78793          	addi	a5,a5,-1972 # 800246c0 <sb>
    80004e7c:	4f9c                	lw	a5,24(a5)
    80004e7e:	9fb9                	addw	a5,a5,a4
    80004e80:	0007871b          	sext.w	a4,a5
    80004e84:	fcc42783          	lw	a5,-52(s0)
    80004e88:	85ba                	mv	a1,a4
    80004e8a:	853e                	mv	a0,a5
    80004e8c:	00000097          	auipc	ra,0x0
    80004e90:	942080e7          	jalr	-1726(ra) # 800047ce <bread>
    80004e94:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004e98:	fe043783          	ld	a5,-32(s0)
    80004e9c:	05878713          	addi	a4,a5,88
    80004ea0:	fec42783          	lw	a5,-20(s0)
    80004ea4:	8bbd                	andi	a5,a5,15
    80004ea6:	079a                	slli	a5,a5,0x6
    80004ea8:	97ba                	add	a5,a5,a4
    80004eaa:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80004eae:	fd843783          	ld	a5,-40(s0)
    80004eb2:	00079783          	lh	a5,0(a5)
    80004eb6:	eba1                	bnez	a5,80004f06 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80004eb8:	04000613          	li	a2,64
    80004ebc:	4581                	li	a1,0
    80004ebe:	fd843503          	ld	a0,-40(s0)
    80004ec2:	ffffc097          	auipc	ra,0xffffc
    80004ec6:	5d6080e7          	jalr	1494(ra) # 80001498 <memset>
      dip->type = type;
    80004eca:	fd843783          	ld	a5,-40(s0)
    80004ece:	fca45703          	lhu	a4,-54(s0)
    80004ed2:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80004ed6:	fe043503          	ld	a0,-32(s0)
    80004eda:	00001097          	auipc	ra,0x1
    80004ede:	606080e7          	jalr	1542(ra) # 800064e0 <log_write>
      brelse(bp);
    80004ee2:	fe043503          	ld	a0,-32(s0)
    80004ee6:	00000097          	auipc	ra,0x0
    80004eea:	98a080e7          	jalr	-1654(ra) # 80004870 <brelse>
      return iget(dev, inum);
    80004eee:	fec42703          	lw	a4,-20(s0)
    80004ef2:	fcc42783          	lw	a5,-52(s0)
    80004ef6:	85ba                	mv	a1,a4
    80004ef8:	853e                	mv	a0,a5
    80004efa:	00000097          	auipc	ra,0x0
    80004efe:	138080e7          	jalr	312(ra) # 80005032 <iget>
    80004f02:	87aa                	mv	a5,a0
    80004f04:	a835                	j	80004f40 <ialloc+0xf4>
    }
    brelse(bp);
    80004f06:	fe043503          	ld	a0,-32(s0)
    80004f0a:	00000097          	auipc	ra,0x0
    80004f0e:	966080e7          	jalr	-1690(ra) # 80004870 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80004f12:	fec42783          	lw	a5,-20(s0)
    80004f16:	2785                	addiw	a5,a5,1
    80004f18:	fef42623          	sw	a5,-20(s0)
    80004f1c:	0001f797          	auipc	a5,0x1f
    80004f20:	7a478793          	addi	a5,a5,1956 # 800246c0 <sb>
    80004f24:	47d8                	lw	a4,12(a5)
    80004f26:	fec42783          	lw	a5,-20(s0)
    80004f2a:	f4e7e0e3          	bltu	a5,a4,80004e6a <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    80004f2e:	00006517          	auipc	a0,0x6
    80004f32:	59250513          	addi	a0,a0,1426 # 8000b4c0 <etext+0x4c0>
    80004f36:	ffffc097          	auipc	ra,0xffffc
    80004f3a:	b34080e7          	jalr	-1228(ra) # 80000a6a <printf>
  return 0;
    80004f3e:	4781                	li	a5,0
}
    80004f40:	853e                	mv	a0,a5
    80004f42:	70e2                	ld	ra,56(sp)
    80004f44:	7442                	ld	s0,48(sp)
    80004f46:	6121                	addi	sp,sp,64
    80004f48:	8082                	ret

0000000080004f4a <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80004f4a:	7179                	addi	sp,sp,-48
    80004f4c:	f406                	sd	ra,40(sp)
    80004f4e:	f022                	sd	s0,32(sp)
    80004f50:	1800                	addi	s0,sp,48
    80004f52:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80004f56:	fd843783          	ld	a5,-40(s0)
    80004f5a:	4394                	lw	a3,0(a5)
    80004f5c:	fd843783          	ld	a5,-40(s0)
    80004f60:	43dc                	lw	a5,4(a5)
    80004f62:	0047d79b          	srliw	a5,a5,0x4
    80004f66:	0007871b          	sext.w	a4,a5
    80004f6a:	0001f797          	auipc	a5,0x1f
    80004f6e:	75678793          	addi	a5,a5,1878 # 800246c0 <sb>
    80004f72:	4f9c                	lw	a5,24(a5)
    80004f74:	9fb9                	addw	a5,a5,a4
    80004f76:	2781                	sext.w	a5,a5
    80004f78:	85be                	mv	a1,a5
    80004f7a:	8536                	mv	a0,a3
    80004f7c:	00000097          	auipc	ra,0x0
    80004f80:	852080e7          	jalr	-1966(ra) # 800047ce <bread>
    80004f84:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80004f88:	fe843783          	ld	a5,-24(s0)
    80004f8c:	05878713          	addi	a4,a5,88
    80004f90:	fd843783          	ld	a5,-40(s0)
    80004f94:	43dc                	lw	a5,4(a5)
    80004f96:	1782                	slli	a5,a5,0x20
    80004f98:	9381                	srli	a5,a5,0x20
    80004f9a:	8bbd                	andi	a5,a5,15
    80004f9c:	079a                	slli	a5,a5,0x6
    80004f9e:	97ba                	add	a5,a5,a4
    80004fa0:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80004fa4:	fd843783          	ld	a5,-40(s0)
    80004fa8:	04479703          	lh	a4,68(a5)
    80004fac:	fe043783          	ld	a5,-32(s0)
    80004fb0:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80004fb4:	fd843783          	ld	a5,-40(s0)
    80004fb8:	04679703          	lh	a4,70(a5)
    80004fbc:	fe043783          	ld	a5,-32(s0)
    80004fc0:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80004fc4:	fd843783          	ld	a5,-40(s0)
    80004fc8:	04879703          	lh	a4,72(a5)
    80004fcc:	fe043783          	ld	a5,-32(s0)
    80004fd0:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80004fd4:	fd843783          	ld	a5,-40(s0)
    80004fd8:	04a79703          	lh	a4,74(a5)
    80004fdc:	fe043783          	ld	a5,-32(s0)
    80004fe0:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80004fe4:	fd843783          	ld	a5,-40(s0)
    80004fe8:	47f8                	lw	a4,76(a5)
    80004fea:	fe043783          	ld	a5,-32(s0)
    80004fee:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80004ff0:	fe043783          	ld	a5,-32(s0)
    80004ff4:	00c78713          	addi	a4,a5,12
    80004ff8:	fd843783          	ld	a5,-40(s0)
    80004ffc:	05078793          	addi	a5,a5,80
    80005000:	03400613          	li	a2,52
    80005004:	85be                	mv	a1,a5
    80005006:	853a                	mv	a0,a4
    80005008:	ffffc097          	auipc	ra,0xffffc
    8000500c:	57c080e7          	jalr	1404(ra) # 80001584 <memmove>
  log_write(bp);
    80005010:	fe843503          	ld	a0,-24(s0)
    80005014:	00001097          	auipc	ra,0x1
    80005018:	4cc080e7          	jalr	1228(ra) # 800064e0 <log_write>
  brelse(bp);
    8000501c:	fe843503          	ld	a0,-24(s0)
    80005020:	00000097          	auipc	ra,0x0
    80005024:	850080e7          	jalr	-1968(ra) # 80004870 <brelse>
}
    80005028:	0001                	nop
    8000502a:	70a2                	ld	ra,40(sp)
    8000502c:	7402                	ld	s0,32(sp)
    8000502e:	6145                	addi	sp,sp,48
    80005030:	8082                	ret

0000000080005032 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80005032:	7179                	addi	sp,sp,-48
    80005034:	f406                	sd	ra,40(sp)
    80005036:	f022                	sd	s0,32(sp)
    80005038:	1800                	addi	s0,sp,48
    8000503a:	87aa                	mv	a5,a0
    8000503c:	872e                	mv	a4,a1
    8000503e:	fcf42e23          	sw	a5,-36(s0)
    80005042:	87ba                	mv	a5,a4
    80005044:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    80005048:	0001f517          	auipc	a0,0x1f
    8000504c:	69850513          	addi	a0,a0,1688 # 800246e0 <itable>
    80005050:	ffffc097          	auipc	ra,0xffffc
    80005054:	274080e7          	jalr	628(ra) # 800012c4 <acquire>

  // Is the inode already in the table?
  empty = 0;
    80005058:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    8000505c:	0001f797          	auipc	a5,0x1f
    80005060:	69c78793          	addi	a5,a5,1692 # 800246f8 <itable+0x18>
    80005064:	fef43423          	sd	a5,-24(s0)
    80005068:	a89d                	j	800050de <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    8000506a:	fe843783          	ld	a5,-24(s0)
    8000506e:	479c                	lw	a5,8(a5)
    80005070:	04f05663          	blez	a5,800050bc <iget+0x8a>
    80005074:	fe843783          	ld	a5,-24(s0)
    80005078:	439c                	lw	a5,0(a5)
    8000507a:	fdc42703          	lw	a4,-36(s0)
    8000507e:	2701                	sext.w	a4,a4
    80005080:	02f71e63          	bne	a4,a5,800050bc <iget+0x8a>
    80005084:	fe843783          	ld	a5,-24(s0)
    80005088:	43dc                	lw	a5,4(a5)
    8000508a:	fd842703          	lw	a4,-40(s0)
    8000508e:	2701                	sext.w	a4,a4
    80005090:	02f71663          	bne	a4,a5,800050bc <iget+0x8a>
      ip->ref++;
    80005094:	fe843783          	ld	a5,-24(s0)
    80005098:	479c                	lw	a5,8(a5)
    8000509a:	2785                	addiw	a5,a5,1
    8000509c:	0007871b          	sext.w	a4,a5
    800050a0:	fe843783          	ld	a5,-24(s0)
    800050a4:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    800050a6:	0001f517          	auipc	a0,0x1f
    800050aa:	63a50513          	addi	a0,a0,1594 # 800246e0 <itable>
    800050ae:	ffffc097          	auipc	ra,0xffffc
    800050b2:	27a080e7          	jalr	634(ra) # 80001328 <release>
      return ip;
    800050b6:	fe843783          	ld	a5,-24(s0)
    800050ba:	a069                	j	80005144 <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    800050bc:	fe043783          	ld	a5,-32(s0)
    800050c0:	eb89                	bnez	a5,800050d2 <iget+0xa0>
    800050c2:	fe843783          	ld	a5,-24(s0)
    800050c6:	479c                	lw	a5,8(a5)
    800050c8:	e789                	bnez	a5,800050d2 <iget+0xa0>
      empty = ip;
    800050ca:	fe843783          	ld	a5,-24(s0)
    800050ce:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800050d2:	fe843783          	ld	a5,-24(s0)
    800050d6:	08878793          	addi	a5,a5,136
    800050da:	fef43423          	sd	a5,-24(s0)
    800050de:	fe843703          	ld	a4,-24(s0)
    800050e2:	00021797          	auipc	a5,0x21
    800050e6:	0a678793          	addi	a5,a5,166 # 80026188 <log>
    800050ea:	f8f760e3          	bltu	a4,a5,8000506a <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    800050ee:	fe043783          	ld	a5,-32(s0)
    800050f2:	eb89                	bnez	a5,80005104 <iget+0xd2>
    panic("iget: no inodes");
    800050f4:	00006517          	auipc	a0,0x6
    800050f8:	3e450513          	addi	a0,a0,996 # 8000b4d8 <etext+0x4d8>
    800050fc:	ffffc097          	auipc	ra,0xffffc
    80005100:	bc4080e7          	jalr	-1084(ra) # 80000cc0 <panic>

  ip = empty;
    80005104:	fe043783          	ld	a5,-32(s0)
    80005108:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    8000510c:	fe843783          	ld	a5,-24(s0)
    80005110:	fdc42703          	lw	a4,-36(s0)
    80005114:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    80005116:	fe843783          	ld	a5,-24(s0)
    8000511a:	fd842703          	lw	a4,-40(s0)
    8000511e:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80005120:	fe843783          	ld	a5,-24(s0)
    80005124:	4705                	li	a4,1
    80005126:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80005128:	fe843783          	ld	a5,-24(s0)
    8000512c:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005130:	0001f517          	auipc	a0,0x1f
    80005134:	5b050513          	addi	a0,a0,1456 # 800246e0 <itable>
    80005138:	ffffc097          	auipc	ra,0xffffc
    8000513c:	1f0080e7          	jalr	496(ra) # 80001328 <release>

  return ip;
    80005140:	fe843783          	ld	a5,-24(s0)
}
    80005144:	853e                	mv	a0,a5
    80005146:	70a2                	ld	ra,40(sp)
    80005148:	7402                	ld	s0,32(sp)
    8000514a:	6145                	addi	sp,sp,48
    8000514c:	8082                	ret

000000008000514e <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    8000514e:	1101                	addi	sp,sp,-32
    80005150:	ec06                	sd	ra,24(sp)
    80005152:	e822                	sd	s0,16(sp)
    80005154:	1000                	addi	s0,sp,32
    80005156:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000515a:	0001f517          	auipc	a0,0x1f
    8000515e:	58650513          	addi	a0,a0,1414 # 800246e0 <itable>
    80005162:	ffffc097          	auipc	ra,0xffffc
    80005166:	162080e7          	jalr	354(ra) # 800012c4 <acquire>
  ip->ref++;
    8000516a:	fe843783          	ld	a5,-24(s0)
    8000516e:	479c                	lw	a5,8(a5)
    80005170:	2785                	addiw	a5,a5,1
    80005172:	0007871b          	sext.w	a4,a5
    80005176:	fe843783          	ld	a5,-24(s0)
    8000517a:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000517c:	0001f517          	auipc	a0,0x1f
    80005180:	56450513          	addi	a0,a0,1380 # 800246e0 <itable>
    80005184:	ffffc097          	auipc	ra,0xffffc
    80005188:	1a4080e7          	jalr	420(ra) # 80001328 <release>
  return ip;
    8000518c:	fe843783          	ld	a5,-24(s0)
}
    80005190:	853e                	mv	a0,a5
    80005192:	60e2                	ld	ra,24(sp)
    80005194:	6442                	ld	s0,16(sp)
    80005196:	6105                	addi	sp,sp,32
    80005198:	8082                	ret

000000008000519a <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    8000519a:	7179                	addi	sp,sp,-48
    8000519c:	f406                	sd	ra,40(sp)
    8000519e:	f022                	sd	s0,32(sp)
    800051a0:	1800                	addi	s0,sp,48
    800051a2:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    800051a6:	fd843783          	ld	a5,-40(s0)
    800051aa:	c791                	beqz	a5,800051b6 <ilock+0x1c>
    800051ac:	fd843783          	ld	a5,-40(s0)
    800051b0:	479c                	lw	a5,8(a5)
    800051b2:	00f04a63          	bgtz	a5,800051c6 <ilock+0x2c>
    panic("ilock");
    800051b6:	00006517          	auipc	a0,0x6
    800051ba:	33250513          	addi	a0,a0,818 # 8000b4e8 <etext+0x4e8>
    800051be:	ffffc097          	auipc	ra,0xffffc
    800051c2:	b02080e7          	jalr	-1278(ra) # 80000cc0 <panic>

  acquiresleep(&ip->lock);
    800051c6:	fd843783          	ld	a5,-40(s0)
    800051ca:	07c1                	addi	a5,a5,16
    800051cc:	853e                	mv	a0,a5
    800051ce:	00001097          	auipc	ra,0x1
    800051d2:	48c080e7          	jalr	1164(ra) # 8000665a <acquiresleep>

  if(ip->valid == 0){
    800051d6:	fd843783          	ld	a5,-40(s0)
    800051da:	43bc                	lw	a5,64(a5)
    800051dc:	e7e5                	bnez	a5,800052c4 <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800051de:	fd843783          	ld	a5,-40(s0)
    800051e2:	4394                	lw	a3,0(a5)
    800051e4:	fd843783          	ld	a5,-40(s0)
    800051e8:	43dc                	lw	a5,4(a5)
    800051ea:	0047d79b          	srliw	a5,a5,0x4
    800051ee:	0007871b          	sext.w	a4,a5
    800051f2:	0001f797          	auipc	a5,0x1f
    800051f6:	4ce78793          	addi	a5,a5,1230 # 800246c0 <sb>
    800051fa:	4f9c                	lw	a5,24(a5)
    800051fc:	9fb9                	addw	a5,a5,a4
    800051fe:	2781                	sext.w	a5,a5
    80005200:	85be                	mv	a1,a5
    80005202:	8536                	mv	a0,a3
    80005204:	fffff097          	auipc	ra,0xfffff
    80005208:	5ca080e7          	jalr	1482(ra) # 800047ce <bread>
    8000520c:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005210:	fe843783          	ld	a5,-24(s0)
    80005214:	05878713          	addi	a4,a5,88
    80005218:	fd843783          	ld	a5,-40(s0)
    8000521c:	43dc                	lw	a5,4(a5)
    8000521e:	1782                	slli	a5,a5,0x20
    80005220:	9381                	srli	a5,a5,0x20
    80005222:	8bbd                	andi	a5,a5,15
    80005224:	079a                	slli	a5,a5,0x6
    80005226:	97ba                	add	a5,a5,a4
    80005228:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    8000522c:	fe043783          	ld	a5,-32(s0)
    80005230:	00079703          	lh	a4,0(a5)
    80005234:	fd843783          	ld	a5,-40(s0)
    80005238:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    8000523c:	fe043783          	ld	a5,-32(s0)
    80005240:	00279703          	lh	a4,2(a5)
    80005244:	fd843783          	ld	a5,-40(s0)
    80005248:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    8000524c:	fe043783          	ld	a5,-32(s0)
    80005250:	00479703          	lh	a4,4(a5)
    80005254:	fd843783          	ld	a5,-40(s0)
    80005258:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    8000525c:	fe043783          	ld	a5,-32(s0)
    80005260:	00679703          	lh	a4,6(a5)
    80005264:	fd843783          	ld	a5,-40(s0)
    80005268:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    8000526c:	fe043783          	ld	a5,-32(s0)
    80005270:	4798                	lw	a4,8(a5)
    80005272:	fd843783          	ld	a5,-40(s0)
    80005276:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    80005278:	fd843783          	ld	a5,-40(s0)
    8000527c:	05078713          	addi	a4,a5,80
    80005280:	fe043783          	ld	a5,-32(s0)
    80005284:	07b1                	addi	a5,a5,12
    80005286:	03400613          	li	a2,52
    8000528a:	85be                	mv	a1,a5
    8000528c:	853a                	mv	a0,a4
    8000528e:	ffffc097          	auipc	ra,0xffffc
    80005292:	2f6080e7          	jalr	758(ra) # 80001584 <memmove>
    brelse(bp);
    80005296:	fe843503          	ld	a0,-24(s0)
    8000529a:	fffff097          	auipc	ra,0xfffff
    8000529e:	5d6080e7          	jalr	1494(ra) # 80004870 <brelse>
    ip->valid = 1;
    800052a2:	fd843783          	ld	a5,-40(s0)
    800052a6:	4705                	li	a4,1
    800052a8:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    800052aa:	fd843783          	ld	a5,-40(s0)
    800052ae:	04479783          	lh	a5,68(a5)
    800052b2:	eb89                	bnez	a5,800052c4 <ilock+0x12a>
      panic("ilock: no type");
    800052b4:	00006517          	auipc	a0,0x6
    800052b8:	23c50513          	addi	a0,a0,572 # 8000b4f0 <etext+0x4f0>
    800052bc:	ffffc097          	auipc	ra,0xffffc
    800052c0:	a04080e7          	jalr	-1532(ra) # 80000cc0 <panic>
  }
}
    800052c4:	0001                	nop
    800052c6:	70a2                	ld	ra,40(sp)
    800052c8:	7402                	ld	s0,32(sp)
    800052ca:	6145                	addi	sp,sp,48
    800052cc:	8082                	ret

00000000800052ce <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    800052ce:	1101                	addi	sp,sp,-32
    800052d0:	ec06                	sd	ra,24(sp)
    800052d2:	e822                	sd	s0,16(sp)
    800052d4:	1000                	addi	s0,sp,32
    800052d6:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    800052da:	fe843783          	ld	a5,-24(s0)
    800052de:	c385                	beqz	a5,800052fe <iunlock+0x30>
    800052e0:	fe843783          	ld	a5,-24(s0)
    800052e4:	07c1                	addi	a5,a5,16
    800052e6:	853e                	mv	a0,a5
    800052e8:	00001097          	auipc	ra,0x1
    800052ec:	432080e7          	jalr	1074(ra) # 8000671a <holdingsleep>
    800052f0:	87aa                	mv	a5,a0
    800052f2:	c791                	beqz	a5,800052fe <iunlock+0x30>
    800052f4:	fe843783          	ld	a5,-24(s0)
    800052f8:	479c                	lw	a5,8(a5)
    800052fa:	00f04a63          	bgtz	a5,8000530e <iunlock+0x40>
    panic("iunlock");
    800052fe:	00006517          	auipc	a0,0x6
    80005302:	20250513          	addi	a0,a0,514 # 8000b500 <etext+0x500>
    80005306:	ffffc097          	auipc	ra,0xffffc
    8000530a:	9ba080e7          	jalr	-1606(ra) # 80000cc0 <panic>

  releasesleep(&ip->lock);
    8000530e:	fe843783          	ld	a5,-24(s0)
    80005312:	07c1                	addi	a5,a5,16
    80005314:	853e                	mv	a0,a5
    80005316:	00001097          	auipc	ra,0x1
    8000531a:	3b2080e7          	jalr	946(ra) # 800066c8 <releasesleep>
}
    8000531e:	0001                	nop
    80005320:	60e2                	ld	ra,24(sp)
    80005322:	6442                	ld	s0,16(sp)
    80005324:	6105                	addi	sp,sp,32
    80005326:	8082                	ret

0000000080005328 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    80005328:	1101                	addi	sp,sp,-32
    8000532a:	ec06                	sd	ra,24(sp)
    8000532c:	e822                	sd	s0,16(sp)
    8000532e:	1000                	addi	s0,sp,32
    80005330:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    80005334:	0001f517          	auipc	a0,0x1f
    80005338:	3ac50513          	addi	a0,a0,940 # 800246e0 <itable>
    8000533c:	ffffc097          	auipc	ra,0xffffc
    80005340:	f88080e7          	jalr	-120(ra) # 800012c4 <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    80005344:	fe843783          	ld	a5,-24(s0)
    80005348:	4798                	lw	a4,8(a5)
    8000534a:	4785                	li	a5,1
    8000534c:	06f71f63          	bne	a4,a5,800053ca <iput+0xa2>
    80005350:	fe843783          	ld	a5,-24(s0)
    80005354:	43bc                	lw	a5,64(a5)
    80005356:	cbb5                	beqz	a5,800053ca <iput+0xa2>
    80005358:	fe843783          	ld	a5,-24(s0)
    8000535c:	04a79783          	lh	a5,74(a5)
    80005360:	e7ad                	bnez	a5,800053ca <iput+0xa2>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    80005362:	fe843783          	ld	a5,-24(s0)
    80005366:	07c1                	addi	a5,a5,16
    80005368:	853e                	mv	a0,a5
    8000536a:	00001097          	auipc	ra,0x1
    8000536e:	2f0080e7          	jalr	752(ra) # 8000665a <acquiresleep>

    release(&itable.lock);
    80005372:	0001f517          	auipc	a0,0x1f
    80005376:	36e50513          	addi	a0,a0,878 # 800246e0 <itable>
    8000537a:	ffffc097          	auipc	ra,0xffffc
    8000537e:	fae080e7          	jalr	-82(ra) # 80001328 <release>

    itrunc(ip);
    80005382:	fe843503          	ld	a0,-24(s0)
    80005386:	00000097          	auipc	ra,0x0
    8000538a:	21a080e7          	jalr	538(ra) # 800055a0 <itrunc>
    ip->type = 0;
    8000538e:	fe843783          	ld	a5,-24(s0)
    80005392:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80005396:	fe843503          	ld	a0,-24(s0)
    8000539a:	00000097          	auipc	ra,0x0
    8000539e:	bb0080e7          	jalr	-1104(ra) # 80004f4a <iupdate>
    ip->valid = 0;
    800053a2:	fe843783          	ld	a5,-24(s0)
    800053a6:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    800053aa:	fe843783          	ld	a5,-24(s0)
    800053ae:	07c1                	addi	a5,a5,16
    800053b0:	853e                	mv	a0,a5
    800053b2:	00001097          	auipc	ra,0x1
    800053b6:	316080e7          	jalr	790(ra) # 800066c8 <releasesleep>

    acquire(&itable.lock);
    800053ba:	0001f517          	auipc	a0,0x1f
    800053be:	32650513          	addi	a0,a0,806 # 800246e0 <itable>
    800053c2:	ffffc097          	auipc	ra,0xffffc
    800053c6:	f02080e7          	jalr	-254(ra) # 800012c4 <acquire>
  }

  ip->ref--;
    800053ca:	fe843783          	ld	a5,-24(s0)
    800053ce:	479c                	lw	a5,8(a5)
    800053d0:	37fd                	addiw	a5,a5,-1
    800053d2:	0007871b          	sext.w	a4,a5
    800053d6:	fe843783          	ld	a5,-24(s0)
    800053da:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800053dc:	0001f517          	auipc	a0,0x1f
    800053e0:	30450513          	addi	a0,a0,772 # 800246e0 <itable>
    800053e4:	ffffc097          	auipc	ra,0xffffc
    800053e8:	f44080e7          	jalr	-188(ra) # 80001328 <release>
}
    800053ec:	0001                	nop
    800053ee:	60e2                	ld	ra,24(sp)
    800053f0:	6442                	ld	s0,16(sp)
    800053f2:	6105                	addi	sp,sp,32
    800053f4:	8082                	ret

00000000800053f6 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    800053f6:	1101                	addi	sp,sp,-32
    800053f8:	ec06                	sd	ra,24(sp)
    800053fa:	e822                	sd	s0,16(sp)
    800053fc:	1000                	addi	s0,sp,32
    800053fe:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    80005402:	fe843503          	ld	a0,-24(s0)
    80005406:	00000097          	auipc	ra,0x0
    8000540a:	ec8080e7          	jalr	-312(ra) # 800052ce <iunlock>
  iput(ip);
    8000540e:	fe843503          	ld	a0,-24(s0)
    80005412:	00000097          	auipc	ra,0x0
    80005416:	f16080e7          	jalr	-234(ra) # 80005328 <iput>
}
    8000541a:	0001                	nop
    8000541c:	60e2                	ld	ra,24(sp)
    8000541e:	6442                	ld	s0,16(sp)
    80005420:	6105                	addi	sp,sp,32
    80005422:	8082                	ret

0000000080005424 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    80005424:	7139                	addi	sp,sp,-64
    80005426:	fc06                	sd	ra,56(sp)
    80005428:	f822                	sd	s0,48(sp)
    8000542a:	0080                	addi	s0,sp,64
    8000542c:	fca43423          	sd	a0,-56(s0)
    80005430:	87ae                	mv	a5,a1
    80005432:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    80005436:	fc442783          	lw	a5,-60(s0)
    8000543a:	0007871b          	sext.w	a4,a5
    8000543e:	47ad                	li	a5,11
    80005440:	04e7ee63          	bltu	a5,a4,8000549c <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    80005444:	fc843703          	ld	a4,-56(s0)
    80005448:	fc446783          	lwu	a5,-60(s0)
    8000544c:	07d1                	addi	a5,a5,20
    8000544e:	078a                	slli	a5,a5,0x2
    80005450:	97ba                	add	a5,a5,a4
    80005452:	439c                	lw	a5,0(a5)
    80005454:	fef42623          	sw	a5,-20(s0)
    80005458:	fec42783          	lw	a5,-20(s0)
    8000545c:	2781                	sext.w	a5,a5
    8000545e:	ef85                	bnez	a5,80005496 <bmap+0x72>
      addr = balloc(ip->dev);
    80005460:	fc843783          	ld	a5,-56(s0)
    80005464:	439c                	lw	a5,0(a5)
    80005466:	853e                	mv	a0,a5
    80005468:	fffff097          	auipc	ra,0xfffff
    8000546c:	6ae080e7          	jalr	1710(ra) # 80004b16 <balloc>
    80005470:	87aa                	mv	a5,a0
    80005472:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005476:	fec42783          	lw	a5,-20(s0)
    8000547a:	2781                	sext.w	a5,a5
    8000547c:	e399                	bnez	a5,80005482 <bmap+0x5e>
        return 0;
    8000547e:	4781                	li	a5,0
    80005480:	aa19                	j	80005596 <bmap+0x172>
      ip->addrs[bn] = addr;
    80005482:	fc843703          	ld	a4,-56(s0)
    80005486:	fc446783          	lwu	a5,-60(s0)
    8000548a:	07d1                	addi	a5,a5,20
    8000548c:	078a                	slli	a5,a5,0x2
    8000548e:	97ba                	add	a5,a5,a4
    80005490:	fec42703          	lw	a4,-20(s0)
    80005494:	c398                	sw	a4,0(a5)
    }
    return addr;
    80005496:	fec42783          	lw	a5,-20(s0)
    8000549a:	a8f5                	j	80005596 <bmap+0x172>
  }
  bn -= NDIRECT;
    8000549c:	fc442783          	lw	a5,-60(s0)
    800054a0:	37d1                	addiw	a5,a5,-12
    800054a2:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    800054a6:	fc442783          	lw	a5,-60(s0)
    800054aa:	0007871b          	sext.w	a4,a5
    800054ae:	0ff00793          	li	a5,255
    800054b2:	0ce7ea63          	bltu	a5,a4,80005586 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    800054b6:	fc843783          	ld	a5,-56(s0)
    800054ba:	0807a783          	lw	a5,128(a5)
    800054be:	fef42623          	sw	a5,-20(s0)
    800054c2:	fec42783          	lw	a5,-20(s0)
    800054c6:	2781                	sext.w	a5,a5
    800054c8:	eb85                	bnez	a5,800054f8 <bmap+0xd4>
      addr = balloc(ip->dev);
    800054ca:	fc843783          	ld	a5,-56(s0)
    800054ce:	439c                	lw	a5,0(a5)
    800054d0:	853e                	mv	a0,a5
    800054d2:	fffff097          	auipc	ra,0xfffff
    800054d6:	644080e7          	jalr	1604(ra) # 80004b16 <balloc>
    800054da:	87aa                	mv	a5,a0
    800054dc:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    800054e0:	fec42783          	lw	a5,-20(s0)
    800054e4:	2781                	sext.w	a5,a5
    800054e6:	e399                	bnez	a5,800054ec <bmap+0xc8>
        return 0;
    800054e8:	4781                	li	a5,0
    800054ea:	a075                	j	80005596 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    800054ec:	fc843783          	ld	a5,-56(s0)
    800054f0:	fec42703          	lw	a4,-20(s0)
    800054f4:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    800054f8:	fc843783          	ld	a5,-56(s0)
    800054fc:	439c                	lw	a5,0(a5)
    800054fe:	fec42703          	lw	a4,-20(s0)
    80005502:	85ba                	mv	a1,a4
    80005504:	853e                	mv	a0,a5
    80005506:	fffff097          	auipc	ra,0xfffff
    8000550a:	2c8080e7          	jalr	712(ra) # 800047ce <bread>
    8000550e:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005512:	fe043783          	ld	a5,-32(s0)
    80005516:	05878793          	addi	a5,a5,88
    8000551a:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    8000551e:	fc446783          	lwu	a5,-60(s0)
    80005522:	078a                	slli	a5,a5,0x2
    80005524:	fd843703          	ld	a4,-40(s0)
    80005528:	97ba                	add	a5,a5,a4
    8000552a:	439c                	lw	a5,0(a5)
    8000552c:	fef42623          	sw	a5,-20(s0)
    80005530:	fec42783          	lw	a5,-20(s0)
    80005534:	2781                	sext.w	a5,a5
    80005536:	ef9d                	bnez	a5,80005574 <bmap+0x150>
      addr = balloc(ip->dev);
    80005538:	fc843783          	ld	a5,-56(s0)
    8000553c:	439c                	lw	a5,0(a5)
    8000553e:	853e                	mv	a0,a5
    80005540:	fffff097          	auipc	ra,0xfffff
    80005544:	5d6080e7          	jalr	1494(ra) # 80004b16 <balloc>
    80005548:	87aa                	mv	a5,a0
    8000554a:	fef42623          	sw	a5,-20(s0)
      if(addr){
    8000554e:	fec42783          	lw	a5,-20(s0)
    80005552:	2781                	sext.w	a5,a5
    80005554:	c385                	beqz	a5,80005574 <bmap+0x150>
        a[bn] = addr;
    80005556:	fc446783          	lwu	a5,-60(s0)
    8000555a:	078a                	slli	a5,a5,0x2
    8000555c:	fd843703          	ld	a4,-40(s0)
    80005560:	97ba                	add	a5,a5,a4
    80005562:	fec42703          	lw	a4,-20(s0)
    80005566:	c398                	sw	a4,0(a5)
        log_write(bp);
    80005568:	fe043503          	ld	a0,-32(s0)
    8000556c:	00001097          	auipc	ra,0x1
    80005570:	f74080e7          	jalr	-140(ra) # 800064e0 <log_write>
      }
    }
    brelse(bp);
    80005574:	fe043503          	ld	a0,-32(s0)
    80005578:	fffff097          	auipc	ra,0xfffff
    8000557c:	2f8080e7          	jalr	760(ra) # 80004870 <brelse>
    return addr;
    80005580:	fec42783          	lw	a5,-20(s0)
    80005584:	a809                	j	80005596 <bmap+0x172>
  }

  panic("bmap: out of range");
    80005586:	00006517          	auipc	a0,0x6
    8000558a:	f8250513          	addi	a0,a0,-126 # 8000b508 <etext+0x508>
    8000558e:	ffffb097          	auipc	ra,0xffffb
    80005592:	732080e7          	jalr	1842(ra) # 80000cc0 <panic>
}
    80005596:	853e                	mv	a0,a5
    80005598:	70e2                	ld	ra,56(sp)
    8000559a:	7442                	ld	s0,48(sp)
    8000559c:	6121                	addi	sp,sp,64
    8000559e:	8082                	ret

00000000800055a0 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    800055a0:	7139                	addi	sp,sp,-64
    800055a2:	fc06                	sd	ra,56(sp)
    800055a4:	f822                	sd	s0,48(sp)
    800055a6:	0080                	addi	s0,sp,64
    800055a8:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    800055ac:	fe042623          	sw	zero,-20(s0)
    800055b0:	a891                	j	80005604 <itrunc+0x64>
    if(ip->addrs[i]){
    800055b2:	fc843703          	ld	a4,-56(s0)
    800055b6:	fec42783          	lw	a5,-20(s0)
    800055ba:	07d1                	addi	a5,a5,20
    800055bc:	078a                	slli	a5,a5,0x2
    800055be:	97ba                	add	a5,a5,a4
    800055c0:	439c                	lw	a5,0(a5)
    800055c2:	cf85                	beqz	a5,800055fa <itrunc+0x5a>
      bfree(ip->dev, ip->addrs[i]);
    800055c4:	fc843783          	ld	a5,-56(s0)
    800055c8:	439c                	lw	a5,0(a5)
    800055ca:	86be                	mv	a3,a5
    800055cc:	fc843703          	ld	a4,-56(s0)
    800055d0:	fec42783          	lw	a5,-20(s0)
    800055d4:	07d1                	addi	a5,a5,20
    800055d6:	078a                	slli	a5,a5,0x2
    800055d8:	97ba                	add	a5,a5,a4
    800055da:	439c                	lw	a5,0(a5)
    800055dc:	85be                	mv	a1,a5
    800055de:	8536                	mv	a0,a3
    800055e0:	fffff097          	auipc	ra,0xfffff
    800055e4:	6d8080e7          	jalr	1752(ra) # 80004cb8 <bfree>
      ip->addrs[i] = 0;
    800055e8:	fc843703          	ld	a4,-56(s0)
    800055ec:	fec42783          	lw	a5,-20(s0)
    800055f0:	07d1                	addi	a5,a5,20
    800055f2:	078a                	slli	a5,a5,0x2
    800055f4:	97ba                	add	a5,a5,a4
    800055f6:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    800055fa:	fec42783          	lw	a5,-20(s0)
    800055fe:	2785                	addiw	a5,a5,1
    80005600:	fef42623          	sw	a5,-20(s0)
    80005604:	fec42783          	lw	a5,-20(s0)
    80005608:	0007871b          	sext.w	a4,a5
    8000560c:	47ad                	li	a5,11
    8000560e:	fae7d2e3          	bge	a5,a4,800055b2 <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    80005612:	fc843783          	ld	a5,-56(s0)
    80005616:	0807a783          	lw	a5,128(a5)
    8000561a:	c7cd                	beqz	a5,800056c4 <itrunc+0x124>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    8000561c:	fc843783          	ld	a5,-56(s0)
    80005620:	4398                	lw	a4,0(a5)
    80005622:	fc843783          	ld	a5,-56(s0)
    80005626:	0807a783          	lw	a5,128(a5)
    8000562a:	85be                	mv	a1,a5
    8000562c:	853a                	mv	a0,a4
    8000562e:	fffff097          	auipc	ra,0xfffff
    80005632:	1a0080e7          	jalr	416(ra) # 800047ce <bread>
    80005636:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    8000563a:	fe043783          	ld	a5,-32(s0)
    8000563e:	05878793          	addi	a5,a5,88
    80005642:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005646:	fe042423          	sw	zero,-24(s0)
    8000564a:	a83d                	j	80005688 <itrunc+0xe8>
      if(a[j])
    8000564c:	fe842783          	lw	a5,-24(s0)
    80005650:	078a                	slli	a5,a5,0x2
    80005652:	fd843703          	ld	a4,-40(s0)
    80005656:	97ba                	add	a5,a5,a4
    80005658:	439c                	lw	a5,0(a5)
    8000565a:	c395                	beqz	a5,8000567e <itrunc+0xde>
        bfree(ip->dev, a[j]);
    8000565c:	fc843783          	ld	a5,-56(s0)
    80005660:	439c                	lw	a5,0(a5)
    80005662:	86be                	mv	a3,a5
    80005664:	fe842783          	lw	a5,-24(s0)
    80005668:	078a                	slli	a5,a5,0x2
    8000566a:	fd843703          	ld	a4,-40(s0)
    8000566e:	97ba                	add	a5,a5,a4
    80005670:	439c                	lw	a5,0(a5)
    80005672:	85be                	mv	a1,a5
    80005674:	8536                	mv	a0,a3
    80005676:	fffff097          	auipc	ra,0xfffff
    8000567a:	642080e7          	jalr	1602(ra) # 80004cb8 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    8000567e:	fe842783          	lw	a5,-24(s0)
    80005682:	2785                	addiw	a5,a5,1
    80005684:	fef42423          	sw	a5,-24(s0)
    80005688:	fe842703          	lw	a4,-24(s0)
    8000568c:	0ff00793          	li	a5,255
    80005690:	fae7fee3          	bgeu	a5,a4,8000564c <itrunc+0xac>
    }
    brelse(bp);
    80005694:	fe043503          	ld	a0,-32(s0)
    80005698:	fffff097          	auipc	ra,0xfffff
    8000569c:	1d8080e7          	jalr	472(ra) # 80004870 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    800056a0:	fc843783          	ld	a5,-56(s0)
    800056a4:	439c                	lw	a5,0(a5)
    800056a6:	873e                	mv	a4,a5
    800056a8:	fc843783          	ld	a5,-56(s0)
    800056ac:	0807a783          	lw	a5,128(a5)
    800056b0:	85be                	mv	a1,a5
    800056b2:	853a                	mv	a0,a4
    800056b4:	fffff097          	auipc	ra,0xfffff
    800056b8:	604080e7          	jalr	1540(ra) # 80004cb8 <bfree>
    ip->addrs[NDIRECT] = 0;
    800056bc:	fc843783          	ld	a5,-56(s0)
    800056c0:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    800056c4:	fc843783          	ld	a5,-56(s0)
    800056c8:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    800056cc:	fc843503          	ld	a0,-56(s0)
    800056d0:	00000097          	auipc	ra,0x0
    800056d4:	87a080e7          	jalr	-1926(ra) # 80004f4a <iupdate>
}
    800056d8:	0001                	nop
    800056da:	70e2                	ld	ra,56(sp)
    800056dc:	7442                	ld	s0,48(sp)
    800056de:	6121                	addi	sp,sp,64
    800056e0:	8082                	ret

00000000800056e2 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    800056e2:	1101                	addi	sp,sp,-32
    800056e4:	ec06                	sd	ra,24(sp)
    800056e6:	e822                	sd	s0,16(sp)
    800056e8:	1000                	addi	s0,sp,32
    800056ea:	fea43423          	sd	a0,-24(s0)
    800056ee:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    800056f2:	fe843783          	ld	a5,-24(s0)
    800056f6:	439c                	lw	a5,0(a5)
    800056f8:	873e                	mv	a4,a5
    800056fa:	fe043783          	ld	a5,-32(s0)
    800056fe:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005700:	fe843783          	ld	a5,-24(s0)
    80005704:	43d8                	lw	a4,4(a5)
    80005706:	fe043783          	ld	a5,-32(s0)
    8000570a:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    8000570c:	fe843783          	ld	a5,-24(s0)
    80005710:	04479703          	lh	a4,68(a5)
    80005714:	fe043783          	ld	a5,-32(s0)
    80005718:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    8000571c:	fe843783          	ld	a5,-24(s0)
    80005720:	04a79703          	lh	a4,74(a5)
    80005724:	fe043783          	ld	a5,-32(s0)
    80005728:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    8000572c:	fe843783          	ld	a5,-24(s0)
    80005730:	47fc                	lw	a5,76(a5)
    80005732:	02079713          	slli	a4,a5,0x20
    80005736:	9301                	srli	a4,a4,0x20
    80005738:	fe043783          	ld	a5,-32(s0)
    8000573c:	eb98                	sd	a4,16(a5)
}
    8000573e:	0001                	nop
    80005740:	60e2                	ld	ra,24(sp)
    80005742:	6442                	ld	s0,16(sp)
    80005744:	6105                	addi	sp,sp,32
    80005746:	8082                	ret

0000000080005748 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005748:	715d                	addi	sp,sp,-80
    8000574a:	e486                	sd	ra,72(sp)
    8000574c:	e0a2                	sd	s0,64(sp)
    8000574e:	0880                	addi	s0,sp,80
    80005750:	fca43423          	sd	a0,-56(s0)
    80005754:	87ae                	mv	a5,a1
    80005756:	fac43c23          	sd	a2,-72(s0)
    8000575a:	fcf42223          	sw	a5,-60(s0)
    8000575e:	87b6                	mv	a5,a3
    80005760:	fcf42023          	sw	a5,-64(s0)
    80005764:	87ba                	mv	a5,a4
    80005766:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    8000576a:	fc843783          	ld	a5,-56(s0)
    8000576e:	47fc                	lw	a5,76(a5)
    80005770:	fc042703          	lw	a4,-64(s0)
    80005774:	2701                	sext.w	a4,a4
    80005776:	00e7ee63          	bltu	a5,a4,80005792 <readi+0x4a>
    8000577a:	fc042783          	lw	a5,-64(s0)
    8000577e:	873e                	mv	a4,a5
    80005780:	fb442783          	lw	a5,-76(s0)
    80005784:	9fb9                	addw	a5,a5,a4
    80005786:	2781                	sext.w	a5,a5
    80005788:	fc042703          	lw	a4,-64(s0)
    8000578c:	2701                	sext.w	a4,a4
    8000578e:	00e7f463          	bgeu	a5,a4,80005796 <readi+0x4e>
    return 0;
    80005792:	4781                	li	a5,0
    80005794:	a299                	j	800058da <readi+0x192>
  if(off + n > ip->size)
    80005796:	fc042783          	lw	a5,-64(s0)
    8000579a:	873e                	mv	a4,a5
    8000579c:	fb442783          	lw	a5,-76(s0)
    800057a0:	9fb9                	addw	a5,a5,a4
    800057a2:	0007871b          	sext.w	a4,a5
    800057a6:	fc843783          	ld	a5,-56(s0)
    800057aa:	47fc                	lw	a5,76(a5)
    800057ac:	00e7fa63          	bgeu	a5,a4,800057c0 <readi+0x78>
    n = ip->size - off;
    800057b0:	fc843783          	ld	a5,-56(s0)
    800057b4:	47fc                	lw	a5,76(a5)
    800057b6:	fc042703          	lw	a4,-64(s0)
    800057ba:	9f99                	subw	a5,a5,a4
    800057bc:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    800057c0:	fe042623          	sw	zero,-20(s0)
    800057c4:	a8f5                	j	800058c0 <readi+0x178>
    uint addr = bmap(ip, off/BSIZE);
    800057c6:	fc042783          	lw	a5,-64(s0)
    800057ca:	00a7d79b          	srliw	a5,a5,0xa
    800057ce:	2781                	sext.w	a5,a5
    800057d0:	85be                	mv	a1,a5
    800057d2:	fc843503          	ld	a0,-56(s0)
    800057d6:	00000097          	auipc	ra,0x0
    800057da:	c4e080e7          	jalr	-946(ra) # 80005424 <bmap>
    800057de:	87aa                	mv	a5,a0
    800057e0:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    800057e4:	fe842783          	lw	a5,-24(s0)
    800057e8:	2781                	sext.w	a5,a5
    800057ea:	c7ed                	beqz	a5,800058d4 <readi+0x18c>
      break;
    bp = bread(ip->dev, addr);
    800057ec:	fc843783          	ld	a5,-56(s0)
    800057f0:	439c                	lw	a5,0(a5)
    800057f2:	fe842703          	lw	a4,-24(s0)
    800057f6:	85ba                	mv	a1,a4
    800057f8:	853e                	mv	a0,a5
    800057fa:	fffff097          	auipc	ra,0xfffff
    800057fe:	fd4080e7          	jalr	-44(ra) # 800047ce <bread>
    80005802:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005806:	fc042783          	lw	a5,-64(s0)
    8000580a:	3ff7f793          	andi	a5,a5,1023
    8000580e:	2781                	sext.w	a5,a5
    80005810:	40000713          	li	a4,1024
    80005814:	40f707bb          	subw	a5,a4,a5
    80005818:	2781                	sext.w	a5,a5
    8000581a:	fb442703          	lw	a4,-76(s0)
    8000581e:	86ba                	mv	a3,a4
    80005820:	fec42703          	lw	a4,-20(s0)
    80005824:	40e6873b          	subw	a4,a3,a4
    80005828:	2701                	sext.w	a4,a4
    8000582a:	863a                	mv	a2,a4
    8000582c:	0007869b          	sext.w	a3,a5
    80005830:	0006071b          	sext.w	a4,a2
    80005834:	00d77363          	bgeu	a4,a3,8000583a <readi+0xf2>
    80005838:	87b2                	mv	a5,a2
    8000583a:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    8000583e:	fe043783          	ld	a5,-32(s0)
    80005842:	05878713          	addi	a4,a5,88
    80005846:	fc046783          	lwu	a5,-64(s0)
    8000584a:	3ff7f793          	andi	a5,a5,1023
    8000584e:	973e                	add	a4,a4,a5
    80005850:	fdc46683          	lwu	a3,-36(s0)
    80005854:	fc442783          	lw	a5,-60(s0)
    80005858:	863a                	mv	a2,a4
    8000585a:	fb843583          	ld	a1,-72(s0)
    8000585e:	853e                	mv	a0,a5
    80005860:	ffffe097          	auipc	ra,0xffffe
    80005864:	e3c080e7          	jalr	-452(ra) # 8000369c <either_copyout>
    80005868:	87aa                	mv	a5,a0
    8000586a:	873e                	mv	a4,a5
    8000586c:	57fd                	li	a5,-1
    8000586e:	00f71c63          	bne	a4,a5,80005886 <readi+0x13e>
      brelse(bp);
    80005872:	fe043503          	ld	a0,-32(s0)
    80005876:	fffff097          	auipc	ra,0xfffff
    8000587a:	ffa080e7          	jalr	-6(ra) # 80004870 <brelse>
      tot = -1;
    8000587e:	57fd                	li	a5,-1
    80005880:	fef42623          	sw	a5,-20(s0)
      break;
    80005884:	a889                	j	800058d6 <readi+0x18e>
    }
    brelse(bp);
    80005886:	fe043503          	ld	a0,-32(s0)
    8000588a:	fffff097          	auipc	ra,0xfffff
    8000588e:	fe6080e7          	jalr	-26(ra) # 80004870 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005892:	fec42783          	lw	a5,-20(s0)
    80005896:	873e                	mv	a4,a5
    80005898:	fdc42783          	lw	a5,-36(s0)
    8000589c:	9fb9                	addw	a5,a5,a4
    8000589e:	fef42623          	sw	a5,-20(s0)
    800058a2:	fc042783          	lw	a5,-64(s0)
    800058a6:	873e                	mv	a4,a5
    800058a8:	fdc42783          	lw	a5,-36(s0)
    800058ac:	9fb9                	addw	a5,a5,a4
    800058ae:	fcf42023          	sw	a5,-64(s0)
    800058b2:	fdc46783          	lwu	a5,-36(s0)
    800058b6:	fb843703          	ld	a4,-72(s0)
    800058ba:	97ba                	add	a5,a5,a4
    800058bc:	faf43c23          	sd	a5,-72(s0)
    800058c0:	fec42783          	lw	a5,-20(s0)
    800058c4:	873e                	mv	a4,a5
    800058c6:	fb442783          	lw	a5,-76(s0)
    800058ca:	2701                	sext.w	a4,a4
    800058cc:	2781                	sext.w	a5,a5
    800058ce:	eef76ce3          	bltu	a4,a5,800057c6 <readi+0x7e>
    800058d2:	a011                	j	800058d6 <readi+0x18e>
      break;
    800058d4:	0001                	nop
  }
  return tot;
    800058d6:	fec42783          	lw	a5,-20(s0)
}
    800058da:	853e                	mv	a0,a5
    800058dc:	60a6                	ld	ra,72(sp)
    800058de:	6406                	ld	s0,64(sp)
    800058e0:	6161                	addi	sp,sp,80
    800058e2:	8082                	ret

00000000800058e4 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    800058e4:	715d                	addi	sp,sp,-80
    800058e6:	e486                	sd	ra,72(sp)
    800058e8:	e0a2                	sd	s0,64(sp)
    800058ea:	0880                	addi	s0,sp,80
    800058ec:	fca43423          	sd	a0,-56(s0)
    800058f0:	87ae                	mv	a5,a1
    800058f2:	fac43c23          	sd	a2,-72(s0)
    800058f6:	fcf42223          	sw	a5,-60(s0)
    800058fa:	87b6                	mv	a5,a3
    800058fc:	fcf42023          	sw	a5,-64(s0)
    80005900:	87ba                	mv	a5,a4
    80005902:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005906:	fc843783          	ld	a5,-56(s0)
    8000590a:	47fc                	lw	a5,76(a5)
    8000590c:	fc042703          	lw	a4,-64(s0)
    80005910:	2701                	sext.w	a4,a4
    80005912:	00e7ee63          	bltu	a5,a4,8000592e <writei+0x4a>
    80005916:	fc042783          	lw	a5,-64(s0)
    8000591a:	873e                	mv	a4,a5
    8000591c:	fb442783          	lw	a5,-76(s0)
    80005920:	9fb9                	addw	a5,a5,a4
    80005922:	2781                	sext.w	a5,a5
    80005924:	fc042703          	lw	a4,-64(s0)
    80005928:	2701                	sext.w	a4,a4
    8000592a:	00e7f463          	bgeu	a5,a4,80005932 <writei+0x4e>
    return -1;
    8000592e:	57fd                	li	a5,-1
    80005930:	a295                	j	80005a94 <writei+0x1b0>
  if(off + n > MAXFILE*BSIZE)
    80005932:	fc042783          	lw	a5,-64(s0)
    80005936:	873e                	mv	a4,a5
    80005938:	fb442783          	lw	a5,-76(s0)
    8000593c:	9fb9                	addw	a5,a5,a4
    8000593e:	0007871b          	sext.w	a4,a5
    80005942:	000437b7          	lui	a5,0x43
    80005946:	00e7f463          	bgeu	a5,a4,8000594e <writei+0x6a>
    return -1;
    8000594a:	57fd                	li	a5,-1
    8000594c:	a2a1                	j	80005a94 <writei+0x1b0>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    8000594e:	fe042623          	sw	zero,-20(s0)
    80005952:	a209                	j	80005a54 <writei+0x170>
    uint addr = bmap(ip, off/BSIZE);
    80005954:	fc042783          	lw	a5,-64(s0)
    80005958:	00a7d79b          	srliw	a5,a5,0xa
    8000595c:	2781                	sext.w	a5,a5
    8000595e:	85be                	mv	a1,a5
    80005960:	fc843503          	ld	a0,-56(s0)
    80005964:	00000097          	auipc	ra,0x0
    80005968:	ac0080e7          	jalr	-1344(ra) # 80005424 <bmap>
    8000596c:	87aa                	mv	a5,a0
    8000596e:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005972:	fe842783          	lw	a5,-24(s0)
    80005976:	2781                	sext.w	a5,a5
    80005978:	cbe5                	beqz	a5,80005a68 <writei+0x184>
      break;
    bp = bread(ip->dev, addr);
    8000597a:	fc843783          	ld	a5,-56(s0)
    8000597e:	439c                	lw	a5,0(a5)
    80005980:	fe842703          	lw	a4,-24(s0)
    80005984:	85ba                	mv	a1,a4
    80005986:	853e                	mv	a0,a5
    80005988:	fffff097          	auipc	ra,0xfffff
    8000598c:	e46080e7          	jalr	-442(ra) # 800047ce <bread>
    80005990:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005994:	fc042783          	lw	a5,-64(s0)
    80005998:	3ff7f793          	andi	a5,a5,1023
    8000599c:	2781                	sext.w	a5,a5
    8000599e:	40000713          	li	a4,1024
    800059a2:	40f707bb          	subw	a5,a4,a5
    800059a6:	2781                	sext.w	a5,a5
    800059a8:	fb442703          	lw	a4,-76(s0)
    800059ac:	86ba                	mv	a3,a4
    800059ae:	fec42703          	lw	a4,-20(s0)
    800059b2:	40e6873b          	subw	a4,a3,a4
    800059b6:	2701                	sext.w	a4,a4
    800059b8:	863a                	mv	a2,a4
    800059ba:	0007869b          	sext.w	a3,a5
    800059be:	0006071b          	sext.w	a4,a2
    800059c2:	00d77363          	bgeu	a4,a3,800059c8 <writei+0xe4>
    800059c6:	87b2                	mv	a5,a2
    800059c8:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    800059cc:	fe043783          	ld	a5,-32(s0)
    800059d0:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    800059d4:	fc046783          	lwu	a5,-64(s0)
    800059d8:	3ff7f793          	andi	a5,a5,1023
    800059dc:	97ba                	add	a5,a5,a4
    800059de:	fdc46683          	lwu	a3,-36(s0)
    800059e2:	fc442703          	lw	a4,-60(s0)
    800059e6:	fb843603          	ld	a2,-72(s0)
    800059ea:	85ba                	mv	a1,a4
    800059ec:	853e                	mv	a0,a5
    800059ee:	ffffe097          	auipc	ra,0xffffe
    800059f2:	d22080e7          	jalr	-734(ra) # 80003710 <either_copyin>
    800059f6:	87aa                	mv	a5,a0
    800059f8:	873e                	mv	a4,a5
    800059fa:	57fd                	li	a5,-1
    800059fc:	00f71963          	bne	a4,a5,80005a0e <writei+0x12a>
      brelse(bp);
    80005a00:	fe043503          	ld	a0,-32(s0)
    80005a04:	fffff097          	auipc	ra,0xfffff
    80005a08:	e6c080e7          	jalr	-404(ra) # 80004870 <brelse>
      break;
    80005a0c:	a8b9                	j	80005a6a <writei+0x186>
    }
    log_write(bp);
    80005a0e:	fe043503          	ld	a0,-32(s0)
    80005a12:	00001097          	auipc	ra,0x1
    80005a16:	ace080e7          	jalr	-1330(ra) # 800064e0 <log_write>
    brelse(bp);
    80005a1a:	fe043503          	ld	a0,-32(s0)
    80005a1e:	fffff097          	auipc	ra,0xfffff
    80005a22:	e52080e7          	jalr	-430(ra) # 80004870 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005a26:	fec42783          	lw	a5,-20(s0)
    80005a2a:	873e                	mv	a4,a5
    80005a2c:	fdc42783          	lw	a5,-36(s0)
    80005a30:	9fb9                	addw	a5,a5,a4
    80005a32:	fef42623          	sw	a5,-20(s0)
    80005a36:	fc042783          	lw	a5,-64(s0)
    80005a3a:	873e                	mv	a4,a5
    80005a3c:	fdc42783          	lw	a5,-36(s0)
    80005a40:	9fb9                	addw	a5,a5,a4
    80005a42:	fcf42023          	sw	a5,-64(s0)
    80005a46:	fdc46783          	lwu	a5,-36(s0)
    80005a4a:	fb843703          	ld	a4,-72(s0)
    80005a4e:	97ba                	add	a5,a5,a4
    80005a50:	faf43c23          	sd	a5,-72(s0)
    80005a54:	fec42783          	lw	a5,-20(s0)
    80005a58:	873e                	mv	a4,a5
    80005a5a:	fb442783          	lw	a5,-76(s0)
    80005a5e:	2701                	sext.w	a4,a4
    80005a60:	2781                	sext.w	a5,a5
    80005a62:	eef769e3          	bltu	a4,a5,80005954 <writei+0x70>
    80005a66:	a011                	j	80005a6a <writei+0x186>
      break;
    80005a68:	0001                	nop
  }

  if(off > ip->size)
    80005a6a:	fc843783          	ld	a5,-56(s0)
    80005a6e:	47fc                	lw	a5,76(a5)
    80005a70:	fc042703          	lw	a4,-64(s0)
    80005a74:	2701                	sext.w	a4,a4
    80005a76:	00e7f763          	bgeu	a5,a4,80005a84 <writei+0x1a0>
    ip->size = off;
    80005a7a:	fc843783          	ld	a5,-56(s0)
    80005a7e:	fc042703          	lw	a4,-64(s0)
    80005a82:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005a84:	fc843503          	ld	a0,-56(s0)
    80005a88:	fffff097          	auipc	ra,0xfffff
    80005a8c:	4c2080e7          	jalr	1218(ra) # 80004f4a <iupdate>

  return tot;
    80005a90:	fec42783          	lw	a5,-20(s0)
}
    80005a94:	853e                	mv	a0,a5
    80005a96:	60a6                	ld	ra,72(sp)
    80005a98:	6406                	ld	s0,64(sp)
    80005a9a:	6161                	addi	sp,sp,80
    80005a9c:	8082                	ret

0000000080005a9e <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005a9e:	1101                	addi	sp,sp,-32
    80005aa0:	ec06                	sd	ra,24(sp)
    80005aa2:	e822                	sd	s0,16(sp)
    80005aa4:	1000                	addi	s0,sp,32
    80005aa6:	fea43423          	sd	a0,-24(s0)
    80005aaa:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005aae:	4639                	li	a2,14
    80005ab0:	fe043583          	ld	a1,-32(s0)
    80005ab4:	fe843503          	ld	a0,-24(s0)
    80005ab8:	ffffc097          	auipc	ra,0xffffc
    80005abc:	be4080e7          	jalr	-1052(ra) # 8000169c <strncmp>
    80005ac0:	87aa                	mv	a5,a0
}
    80005ac2:	853e                	mv	a0,a5
    80005ac4:	60e2                	ld	ra,24(sp)
    80005ac6:	6442                	ld	s0,16(sp)
    80005ac8:	6105                	addi	sp,sp,32
    80005aca:	8082                	ret

0000000080005acc <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005acc:	715d                	addi	sp,sp,-80
    80005ace:	e486                	sd	ra,72(sp)
    80005ad0:	e0a2                	sd	s0,64(sp)
    80005ad2:	0880                	addi	s0,sp,80
    80005ad4:	fca43423          	sd	a0,-56(s0)
    80005ad8:	fcb43023          	sd	a1,-64(s0)
    80005adc:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005ae0:	fc843783          	ld	a5,-56(s0)
    80005ae4:	04479703          	lh	a4,68(a5)
    80005ae8:	4785                	li	a5,1
    80005aea:	00f70a63          	beq	a4,a5,80005afe <dirlookup+0x32>
    panic("dirlookup not DIR");
    80005aee:	00006517          	auipc	a0,0x6
    80005af2:	a3250513          	addi	a0,a0,-1486 # 8000b520 <etext+0x520>
    80005af6:	ffffb097          	auipc	ra,0xffffb
    80005afa:	1ca080e7          	jalr	458(ra) # 80000cc0 <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005afe:	fe042623          	sw	zero,-20(s0)
    80005b02:	a849                	j	80005b94 <dirlookup+0xc8>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005b04:	fd840793          	addi	a5,s0,-40
    80005b08:	fec42683          	lw	a3,-20(s0)
    80005b0c:	4741                	li	a4,16
    80005b0e:	863e                	mv	a2,a5
    80005b10:	4581                	li	a1,0
    80005b12:	fc843503          	ld	a0,-56(s0)
    80005b16:	00000097          	auipc	ra,0x0
    80005b1a:	c32080e7          	jalr	-974(ra) # 80005748 <readi>
    80005b1e:	87aa                	mv	a5,a0
    80005b20:	873e                	mv	a4,a5
    80005b22:	47c1                	li	a5,16
    80005b24:	00f70a63          	beq	a4,a5,80005b38 <dirlookup+0x6c>
      panic("dirlookup read");
    80005b28:	00006517          	auipc	a0,0x6
    80005b2c:	a1050513          	addi	a0,a0,-1520 # 8000b538 <etext+0x538>
    80005b30:	ffffb097          	auipc	ra,0xffffb
    80005b34:	190080e7          	jalr	400(ra) # 80000cc0 <panic>
    if(de.inum == 0)
    80005b38:	fd845783          	lhu	a5,-40(s0)
    80005b3c:	c7b1                	beqz	a5,80005b88 <dirlookup+0xbc>
      continue;
    if(namecmp(name, de.name) == 0){
    80005b3e:	fd840793          	addi	a5,s0,-40
    80005b42:	0789                	addi	a5,a5,2
    80005b44:	85be                	mv	a1,a5
    80005b46:	fc043503          	ld	a0,-64(s0)
    80005b4a:	00000097          	auipc	ra,0x0
    80005b4e:	f54080e7          	jalr	-172(ra) # 80005a9e <namecmp>
    80005b52:	87aa                	mv	a5,a0
    80005b54:	eb9d                	bnez	a5,80005b8a <dirlookup+0xbe>
      // entry matches path element
      if(poff)
    80005b56:	fb843783          	ld	a5,-72(s0)
    80005b5a:	c791                	beqz	a5,80005b66 <dirlookup+0x9a>
        *poff = off;
    80005b5c:	fb843783          	ld	a5,-72(s0)
    80005b60:	fec42703          	lw	a4,-20(s0)
    80005b64:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005b66:	fd845783          	lhu	a5,-40(s0)
    80005b6a:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005b6e:	fc843783          	ld	a5,-56(s0)
    80005b72:	439c                	lw	a5,0(a5)
    80005b74:	fe842703          	lw	a4,-24(s0)
    80005b78:	85ba                	mv	a1,a4
    80005b7a:	853e                	mv	a0,a5
    80005b7c:	fffff097          	auipc	ra,0xfffff
    80005b80:	4b6080e7          	jalr	1206(ra) # 80005032 <iget>
    80005b84:	87aa                	mv	a5,a0
    80005b86:	a005                	j	80005ba6 <dirlookup+0xda>
      continue;
    80005b88:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005b8a:	fec42783          	lw	a5,-20(s0)
    80005b8e:	27c1                	addiw	a5,a5,16
    80005b90:	fef42623          	sw	a5,-20(s0)
    80005b94:	fc843783          	ld	a5,-56(s0)
    80005b98:	47fc                	lw	a5,76(a5)
    80005b9a:	fec42703          	lw	a4,-20(s0)
    80005b9e:	2701                	sext.w	a4,a4
    80005ba0:	f6f762e3          	bltu	a4,a5,80005b04 <dirlookup+0x38>
    }
  }

  return 0;
    80005ba4:	4781                	li	a5,0
}
    80005ba6:	853e                	mv	a0,a5
    80005ba8:	60a6                	ld	ra,72(sp)
    80005baa:	6406                	ld	s0,64(sp)
    80005bac:	6161                	addi	sp,sp,80
    80005bae:	8082                	ret

0000000080005bb0 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005bb0:	715d                	addi	sp,sp,-80
    80005bb2:	e486                	sd	ra,72(sp)
    80005bb4:	e0a2                	sd	s0,64(sp)
    80005bb6:	0880                	addi	s0,sp,80
    80005bb8:	fca43423          	sd	a0,-56(s0)
    80005bbc:	fcb43023          	sd	a1,-64(s0)
    80005bc0:	87b2                	mv	a5,a2
    80005bc2:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005bc6:	4601                	li	a2,0
    80005bc8:	fc043583          	ld	a1,-64(s0)
    80005bcc:	fc843503          	ld	a0,-56(s0)
    80005bd0:	00000097          	auipc	ra,0x0
    80005bd4:	efc080e7          	jalr	-260(ra) # 80005acc <dirlookup>
    80005bd8:	fea43023          	sd	a0,-32(s0)
    80005bdc:	fe043783          	ld	a5,-32(s0)
    80005be0:	cb89                	beqz	a5,80005bf2 <dirlink+0x42>
    iput(ip);
    80005be2:	fe043503          	ld	a0,-32(s0)
    80005be6:	fffff097          	auipc	ra,0xfffff
    80005bea:	742080e7          	jalr	1858(ra) # 80005328 <iput>
    return -1;
    80005bee:	57fd                	li	a5,-1
    80005bf0:	a075                	j	80005c9c <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005bf2:	fe042623          	sw	zero,-20(s0)
    80005bf6:	a0a1                	j	80005c3e <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005bf8:	fd040793          	addi	a5,s0,-48
    80005bfc:	fec42683          	lw	a3,-20(s0)
    80005c00:	4741                	li	a4,16
    80005c02:	863e                	mv	a2,a5
    80005c04:	4581                	li	a1,0
    80005c06:	fc843503          	ld	a0,-56(s0)
    80005c0a:	00000097          	auipc	ra,0x0
    80005c0e:	b3e080e7          	jalr	-1218(ra) # 80005748 <readi>
    80005c12:	87aa                	mv	a5,a0
    80005c14:	873e                	mv	a4,a5
    80005c16:	47c1                	li	a5,16
    80005c18:	00f70a63          	beq	a4,a5,80005c2c <dirlink+0x7c>
      panic("dirlink read");
    80005c1c:	00006517          	auipc	a0,0x6
    80005c20:	92c50513          	addi	a0,a0,-1748 # 8000b548 <etext+0x548>
    80005c24:	ffffb097          	auipc	ra,0xffffb
    80005c28:	09c080e7          	jalr	156(ra) # 80000cc0 <panic>
    if(de.inum == 0)
    80005c2c:	fd045783          	lhu	a5,-48(s0)
    80005c30:	cf99                	beqz	a5,80005c4e <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c32:	fec42783          	lw	a5,-20(s0)
    80005c36:	27c1                	addiw	a5,a5,16
    80005c38:	2781                	sext.w	a5,a5
    80005c3a:	fef42623          	sw	a5,-20(s0)
    80005c3e:	fc843783          	ld	a5,-56(s0)
    80005c42:	47f8                	lw	a4,76(a5)
    80005c44:	fec42783          	lw	a5,-20(s0)
    80005c48:	fae7e8e3          	bltu	a5,a4,80005bf8 <dirlink+0x48>
    80005c4c:	a011                	j	80005c50 <dirlink+0xa0>
      break;
    80005c4e:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005c50:	fd040793          	addi	a5,s0,-48
    80005c54:	0789                	addi	a5,a5,2
    80005c56:	4639                	li	a2,14
    80005c58:	fc043583          	ld	a1,-64(s0)
    80005c5c:	853e                	mv	a0,a5
    80005c5e:	ffffc097          	auipc	ra,0xffffc
    80005c62:	acc080e7          	jalr	-1332(ra) # 8000172a <strncpy>
  de.inum = inum;
    80005c66:	fbc42783          	lw	a5,-68(s0)
    80005c6a:	17c2                	slli	a5,a5,0x30
    80005c6c:	93c1                	srli	a5,a5,0x30
    80005c6e:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005c72:	fd040793          	addi	a5,s0,-48
    80005c76:	fec42683          	lw	a3,-20(s0)
    80005c7a:	4741                	li	a4,16
    80005c7c:	863e                	mv	a2,a5
    80005c7e:	4581                	li	a1,0
    80005c80:	fc843503          	ld	a0,-56(s0)
    80005c84:	00000097          	auipc	ra,0x0
    80005c88:	c60080e7          	jalr	-928(ra) # 800058e4 <writei>
    80005c8c:	87aa                	mv	a5,a0
    80005c8e:	873e                	mv	a4,a5
    80005c90:	47c1                	li	a5,16
    80005c92:	00f70463          	beq	a4,a5,80005c9a <dirlink+0xea>
    return -1;
    80005c96:	57fd                	li	a5,-1
    80005c98:	a011                	j	80005c9c <dirlink+0xec>

  return 0;
    80005c9a:	4781                	li	a5,0
}
    80005c9c:	853e                	mv	a0,a5
    80005c9e:	60a6                	ld	ra,72(sp)
    80005ca0:	6406                	ld	s0,64(sp)
    80005ca2:	6161                	addi	sp,sp,80
    80005ca4:	8082                	ret

0000000080005ca6 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005ca6:	7179                	addi	sp,sp,-48
    80005ca8:	f406                	sd	ra,40(sp)
    80005caa:	f022                	sd	s0,32(sp)
    80005cac:	1800                	addi	s0,sp,48
    80005cae:	fca43c23          	sd	a0,-40(s0)
    80005cb2:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005cb6:	a031                	j	80005cc2 <skipelem+0x1c>
    path++;
    80005cb8:	fd843783          	ld	a5,-40(s0)
    80005cbc:	0785                	addi	a5,a5,1
    80005cbe:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005cc2:	fd843783          	ld	a5,-40(s0)
    80005cc6:	0007c783          	lbu	a5,0(a5)
    80005cca:	873e                	mv	a4,a5
    80005ccc:	02f00793          	li	a5,47
    80005cd0:	fef704e3          	beq	a4,a5,80005cb8 <skipelem+0x12>
  if(*path == 0)
    80005cd4:	fd843783          	ld	a5,-40(s0)
    80005cd8:	0007c783          	lbu	a5,0(a5)
    80005cdc:	e399                	bnez	a5,80005ce2 <skipelem+0x3c>
    return 0;
    80005cde:	4781                	li	a5,0
    80005ce0:	a06d                	j	80005d8a <skipelem+0xe4>
  s = path;
    80005ce2:	fd843783          	ld	a5,-40(s0)
    80005ce6:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005cea:	a031                	j	80005cf6 <skipelem+0x50>
    path++;
    80005cec:	fd843783          	ld	a5,-40(s0)
    80005cf0:	0785                	addi	a5,a5,1
    80005cf2:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005cf6:	fd843783          	ld	a5,-40(s0)
    80005cfa:	0007c783          	lbu	a5,0(a5)
    80005cfe:	873e                	mv	a4,a5
    80005d00:	02f00793          	li	a5,47
    80005d04:	00f70763          	beq	a4,a5,80005d12 <skipelem+0x6c>
    80005d08:	fd843783          	ld	a5,-40(s0)
    80005d0c:	0007c783          	lbu	a5,0(a5)
    80005d10:	fff1                	bnez	a5,80005cec <skipelem+0x46>
  len = path - s;
    80005d12:	fd843703          	ld	a4,-40(s0)
    80005d16:	fe843783          	ld	a5,-24(s0)
    80005d1a:	40f707b3          	sub	a5,a4,a5
    80005d1e:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005d22:	fe442783          	lw	a5,-28(s0)
    80005d26:	0007871b          	sext.w	a4,a5
    80005d2a:	47b5                	li	a5,13
    80005d2c:	00e7dc63          	bge	a5,a4,80005d44 <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005d30:	4639                	li	a2,14
    80005d32:	fe843583          	ld	a1,-24(s0)
    80005d36:	fd043503          	ld	a0,-48(s0)
    80005d3a:	ffffc097          	auipc	ra,0xffffc
    80005d3e:	84a080e7          	jalr	-1974(ra) # 80001584 <memmove>
    80005d42:	a80d                	j	80005d74 <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005d44:	fe442783          	lw	a5,-28(s0)
    80005d48:	863e                	mv	a2,a5
    80005d4a:	fe843583          	ld	a1,-24(s0)
    80005d4e:	fd043503          	ld	a0,-48(s0)
    80005d52:	ffffc097          	auipc	ra,0xffffc
    80005d56:	832080e7          	jalr	-1998(ra) # 80001584 <memmove>
    name[len] = 0;
    80005d5a:	fe442783          	lw	a5,-28(s0)
    80005d5e:	fd043703          	ld	a4,-48(s0)
    80005d62:	97ba                	add	a5,a5,a4
    80005d64:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005d68:	a031                	j	80005d74 <skipelem+0xce>
    path++;
    80005d6a:	fd843783          	ld	a5,-40(s0)
    80005d6e:	0785                	addi	a5,a5,1
    80005d70:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005d74:	fd843783          	ld	a5,-40(s0)
    80005d78:	0007c783          	lbu	a5,0(a5)
    80005d7c:	873e                	mv	a4,a5
    80005d7e:	02f00793          	li	a5,47
    80005d82:	fef704e3          	beq	a4,a5,80005d6a <skipelem+0xc4>
  return path;
    80005d86:	fd843783          	ld	a5,-40(s0)
}
    80005d8a:	853e                	mv	a0,a5
    80005d8c:	70a2                	ld	ra,40(sp)
    80005d8e:	7402                	ld	s0,32(sp)
    80005d90:	6145                	addi	sp,sp,48
    80005d92:	8082                	ret

0000000080005d94 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005d94:	7139                	addi	sp,sp,-64
    80005d96:	fc06                	sd	ra,56(sp)
    80005d98:	f822                	sd	s0,48(sp)
    80005d9a:	0080                	addi	s0,sp,64
    80005d9c:	fca43c23          	sd	a0,-40(s0)
    80005da0:	87ae                	mv	a5,a1
    80005da2:	fcc43423          	sd	a2,-56(s0)
    80005da6:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005daa:	fd843783          	ld	a5,-40(s0)
    80005dae:	0007c783          	lbu	a5,0(a5)
    80005db2:	873e                	mv	a4,a5
    80005db4:	02f00793          	li	a5,47
    80005db8:	00f71b63          	bne	a4,a5,80005dce <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005dbc:	4585                	li	a1,1
    80005dbe:	4505                	li	a0,1
    80005dc0:	fffff097          	auipc	ra,0xfffff
    80005dc4:	272080e7          	jalr	626(ra) # 80005032 <iget>
    80005dc8:	fea43423          	sd	a0,-24(s0)
    80005dcc:	a07d                	j	80005e7a <namex+0xe6>
  else
    ip = idup(myproc()->cwd);
    80005dce:	ffffd097          	auipc	ra,0xffffd
    80005dd2:	aee080e7          	jalr	-1298(ra) # 800028bc <myproc>
    80005dd6:	87aa                	mv	a5,a0
    80005dd8:	1507b783          	ld	a5,336(a5)
    80005ddc:	853e                	mv	a0,a5
    80005dde:	fffff097          	auipc	ra,0xfffff
    80005de2:	370080e7          	jalr	880(ra) # 8000514e <idup>
    80005de6:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005dea:	a841                	j	80005e7a <namex+0xe6>
    ilock(ip);
    80005dec:	fe843503          	ld	a0,-24(s0)
    80005df0:	fffff097          	auipc	ra,0xfffff
    80005df4:	3aa080e7          	jalr	938(ra) # 8000519a <ilock>
    if(ip->type != T_DIR){
    80005df8:	fe843783          	ld	a5,-24(s0)
    80005dfc:	04479703          	lh	a4,68(a5)
    80005e00:	4785                	li	a5,1
    80005e02:	00f70a63          	beq	a4,a5,80005e16 <namex+0x82>
      iunlockput(ip);
    80005e06:	fe843503          	ld	a0,-24(s0)
    80005e0a:	fffff097          	auipc	ra,0xfffff
    80005e0e:	5ec080e7          	jalr	1516(ra) # 800053f6 <iunlockput>
      return 0;
    80005e12:	4781                	li	a5,0
    80005e14:	a871                	j	80005eb0 <namex+0x11c>
    }
    if(nameiparent && *path == '\0'){
    80005e16:	fd442783          	lw	a5,-44(s0)
    80005e1a:	2781                	sext.w	a5,a5
    80005e1c:	cf99                	beqz	a5,80005e3a <namex+0xa6>
    80005e1e:	fd843783          	ld	a5,-40(s0)
    80005e22:	0007c783          	lbu	a5,0(a5)
    80005e26:	eb91                	bnez	a5,80005e3a <namex+0xa6>
      // Stop one level early.
      iunlock(ip);
    80005e28:	fe843503          	ld	a0,-24(s0)
    80005e2c:	fffff097          	auipc	ra,0xfffff
    80005e30:	4a2080e7          	jalr	1186(ra) # 800052ce <iunlock>
      return ip;
    80005e34:	fe843783          	ld	a5,-24(s0)
    80005e38:	a8a5                	j	80005eb0 <namex+0x11c>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005e3a:	4601                	li	a2,0
    80005e3c:	fc843583          	ld	a1,-56(s0)
    80005e40:	fe843503          	ld	a0,-24(s0)
    80005e44:	00000097          	auipc	ra,0x0
    80005e48:	c88080e7          	jalr	-888(ra) # 80005acc <dirlookup>
    80005e4c:	fea43023          	sd	a0,-32(s0)
    80005e50:	fe043783          	ld	a5,-32(s0)
    80005e54:	eb89                	bnez	a5,80005e66 <namex+0xd2>
      iunlockput(ip);
    80005e56:	fe843503          	ld	a0,-24(s0)
    80005e5a:	fffff097          	auipc	ra,0xfffff
    80005e5e:	59c080e7          	jalr	1436(ra) # 800053f6 <iunlockput>
      return 0;
    80005e62:	4781                	li	a5,0
    80005e64:	a0b1                	j	80005eb0 <namex+0x11c>
    }
    iunlockput(ip);
    80005e66:	fe843503          	ld	a0,-24(s0)
    80005e6a:	fffff097          	auipc	ra,0xfffff
    80005e6e:	58c080e7          	jalr	1420(ra) # 800053f6 <iunlockput>
    ip = next;
    80005e72:	fe043783          	ld	a5,-32(s0)
    80005e76:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005e7a:	fc843583          	ld	a1,-56(s0)
    80005e7e:	fd843503          	ld	a0,-40(s0)
    80005e82:	00000097          	auipc	ra,0x0
    80005e86:	e24080e7          	jalr	-476(ra) # 80005ca6 <skipelem>
    80005e8a:	fca43c23          	sd	a0,-40(s0)
    80005e8e:	fd843783          	ld	a5,-40(s0)
    80005e92:	ffa9                	bnez	a5,80005dec <namex+0x58>
  }
  if(nameiparent){
    80005e94:	fd442783          	lw	a5,-44(s0)
    80005e98:	2781                	sext.w	a5,a5
    80005e9a:	cb89                	beqz	a5,80005eac <namex+0x118>
    iput(ip);
    80005e9c:	fe843503          	ld	a0,-24(s0)
    80005ea0:	fffff097          	auipc	ra,0xfffff
    80005ea4:	488080e7          	jalr	1160(ra) # 80005328 <iput>
    return 0;
    80005ea8:	4781                	li	a5,0
    80005eaa:	a019                	j	80005eb0 <namex+0x11c>
  }
  return ip;
    80005eac:	fe843783          	ld	a5,-24(s0)
}
    80005eb0:	853e                	mv	a0,a5
    80005eb2:	70e2                	ld	ra,56(sp)
    80005eb4:	7442                	ld	s0,48(sp)
    80005eb6:	6121                	addi	sp,sp,64
    80005eb8:	8082                	ret

0000000080005eba <namei>:

struct inode*
namei(char *path)
{
    80005eba:	7179                	addi	sp,sp,-48
    80005ebc:	f406                	sd	ra,40(sp)
    80005ebe:	f022                	sd	s0,32(sp)
    80005ec0:	1800                	addi	s0,sp,48
    80005ec2:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80005ec6:	fe040793          	addi	a5,s0,-32
    80005eca:	863e                	mv	a2,a5
    80005ecc:	4581                	li	a1,0
    80005ece:	fd843503          	ld	a0,-40(s0)
    80005ed2:	00000097          	auipc	ra,0x0
    80005ed6:	ec2080e7          	jalr	-318(ra) # 80005d94 <namex>
    80005eda:	87aa                	mv	a5,a0
}
    80005edc:	853e                	mv	a0,a5
    80005ede:	70a2                	ld	ra,40(sp)
    80005ee0:	7402                	ld	s0,32(sp)
    80005ee2:	6145                	addi	sp,sp,48
    80005ee4:	8082                	ret

0000000080005ee6 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80005ee6:	1101                	addi	sp,sp,-32
    80005ee8:	ec06                	sd	ra,24(sp)
    80005eea:	e822                	sd	s0,16(sp)
    80005eec:	1000                	addi	s0,sp,32
    80005eee:	fea43423          	sd	a0,-24(s0)
    80005ef2:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80005ef6:	fe043603          	ld	a2,-32(s0)
    80005efa:	4585                	li	a1,1
    80005efc:	fe843503          	ld	a0,-24(s0)
    80005f00:	00000097          	auipc	ra,0x0
    80005f04:	e94080e7          	jalr	-364(ra) # 80005d94 <namex>
    80005f08:	87aa                	mv	a5,a0
}
    80005f0a:	853e                	mv	a0,a5
    80005f0c:	60e2                	ld	ra,24(sp)
    80005f0e:	6442                	ld	s0,16(sp)
    80005f10:	6105                	addi	sp,sp,32
    80005f12:	8082                	ret

0000000080005f14 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80005f14:	1101                	addi	sp,sp,-32
    80005f16:	ec06                	sd	ra,24(sp)
    80005f18:	e822                	sd	s0,16(sp)
    80005f1a:	1000                	addi	s0,sp,32
    80005f1c:	87aa                	mv	a5,a0
    80005f1e:	feb43023          	sd	a1,-32(s0)
    80005f22:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80005f26:	00005597          	auipc	a1,0x5
    80005f2a:	63258593          	addi	a1,a1,1586 # 8000b558 <etext+0x558>
    80005f2e:	00020517          	auipc	a0,0x20
    80005f32:	25a50513          	addi	a0,a0,602 # 80026188 <log>
    80005f36:	ffffb097          	auipc	ra,0xffffb
    80005f3a:	35a080e7          	jalr	858(ra) # 80001290 <initlock>
  log.start = sb->logstart;
    80005f3e:	fe043783          	ld	a5,-32(s0)
    80005f42:	4bdc                	lw	a5,20(a5)
    80005f44:	873e                	mv	a4,a5
    80005f46:	00020797          	auipc	a5,0x20
    80005f4a:	24278793          	addi	a5,a5,578 # 80026188 <log>
    80005f4e:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80005f50:	fe043783          	ld	a5,-32(s0)
    80005f54:	4b9c                	lw	a5,16(a5)
    80005f56:	873e                	mv	a4,a5
    80005f58:	00020797          	auipc	a5,0x20
    80005f5c:	23078793          	addi	a5,a5,560 # 80026188 <log>
    80005f60:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80005f62:	00020797          	auipc	a5,0x20
    80005f66:	22678793          	addi	a5,a5,550 # 80026188 <log>
    80005f6a:	fec42703          	lw	a4,-20(s0)
    80005f6e:	d798                	sw	a4,40(a5)
  recover_from_log();
    80005f70:	00000097          	auipc	ra,0x0
    80005f74:	262080e7          	jalr	610(ra) # 800061d2 <recover_from_log>
}
    80005f78:	0001                	nop
    80005f7a:	60e2                	ld	ra,24(sp)
    80005f7c:	6442                	ld	s0,16(sp)
    80005f7e:	6105                	addi	sp,sp,32
    80005f80:	8082                	ret

0000000080005f82 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80005f82:	7139                	addi	sp,sp,-64
    80005f84:	fc06                	sd	ra,56(sp)
    80005f86:	f822                	sd	s0,48(sp)
    80005f88:	0080                	addi	s0,sp,64
    80005f8a:	87aa                	mv	a5,a0
    80005f8c:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80005f90:	fe042623          	sw	zero,-20(s0)
    80005f94:	a0d9                	j	8000605a <install_trans+0xd8>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80005f96:	00020797          	auipc	a5,0x20
    80005f9a:	1f278793          	addi	a5,a5,498 # 80026188 <log>
    80005f9e:	579c                	lw	a5,40(a5)
    80005fa0:	86be                	mv	a3,a5
    80005fa2:	00020797          	auipc	a5,0x20
    80005fa6:	1e678793          	addi	a5,a5,486 # 80026188 <log>
    80005faa:	4f9c                	lw	a5,24(a5)
    80005fac:	fec42703          	lw	a4,-20(s0)
    80005fb0:	9fb9                	addw	a5,a5,a4
    80005fb2:	2781                	sext.w	a5,a5
    80005fb4:	2785                	addiw	a5,a5,1
    80005fb6:	2781                	sext.w	a5,a5
    80005fb8:	85be                	mv	a1,a5
    80005fba:	8536                	mv	a0,a3
    80005fbc:	fffff097          	auipc	ra,0xfffff
    80005fc0:	812080e7          	jalr	-2030(ra) # 800047ce <bread>
    80005fc4:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80005fc8:	00020797          	auipc	a5,0x20
    80005fcc:	1c078793          	addi	a5,a5,448 # 80026188 <log>
    80005fd0:	579c                	lw	a5,40(a5)
    80005fd2:	86be                	mv	a3,a5
    80005fd4:	00020717          	auipc	a4,0x20
    80005fd8:	1b470713          	addi	a4,a4,436 # 80026188 <log>
    80005fdc:	fec42783          	lw	a5,-20(s0)
    80005fe0:	07a1                	addi	a5,a5,8
    80005fe2:	078a                	slli	a5,a5,0x2
    80005fe4:	97ba                	add	a5,a5,a4
    80005fe6:	4b9c                	lw	a5,16(a5)
    80005fe8:	85be                	mv	a1,a5
    80005fea:	8536                	mv	a0,a3
    80005fec:	ffffe097          	auipc	ra,0xffffe
    80005ff0:	7e2080e7          	jalr	2018(ra) # 800047ce <bread>
    80005ff4:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80005ff8:	fd843783          	ld	a5,-40(s0)
    80005ffc:	05878713          	addi	a4,a5,88
    80006000:	fe043783          	ld	a5,-32(s0)
    80006004:	05878793          	addi	a5,a5,88
    80006008:	40000613          	li	a2,1024
    8000600c:	85be                	mv	a1,a5
    8000600e:	853a                	mv	a0,a4
    80006010:	ffffb097          	auipc	ra,0xffffb
    80006014:	574080e7          	jalr	1396(ra) # 80001584 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006018:	fd843503          	ld	a0,-40(s0)
    8000601c:	fffff097          	auipc	ra,0xfffff
    80006020:	80c080e7          	jalr	-2036(ra) # 80004828 <bwrite>
    if(recovering == 0)
    80006024:	fcc42783          	lw	a5,-52(s0)
    80006028:	2781                	sext.w	a5,a5
    8000602a:	e799                	bnez	a5,80006038 <install_trans+0xb6>
      bunpin(dbuf);
    8000602c:	fd843503          	ld	a0,-40(s0)
    80006030:	fffff097          	auipc	ra,0xfffff
    80006034:	976080e7          	jalr	-1674(ra) # 800049a6 <bunpin>
    brelse(lbuf);
    80006038:	fe043503          	ld	a0,-32(s0)
    8000603c:	fffff097          	auipc	ra,0xfffff
    80006040:	834080e7          	jalr	-1996(ra) # 80004870 <brelse>
    brelse(dbuf);
    80006044:	fd843503          	ld	a0,-40(s0)
    80006048:	fffff097          	auipc	ra,0xfffff
    8000604c:	828080e7          	jalr	-2008(ra) # 80004870 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006050:	fec42783          	lw	a5,-20(s0)
    80006054:	2785                	addiw	a5,a5,1
    80006056:	fef42623          	sw	a5,-20(s0)
    8000605a:	00020797          	auipc	a5,0x20
    8000605e:	12e78793          	addi	a5,a5,302 # 80026188 <log>
    80006062:	57dc                	lw	a5,44(a5)
    80006064:	fec42703          	lw	a4,-20(s0)
    80006068:	2701                	sext.w	a4,a4
    8000606a:	f2f746e3          	blt	a4,a5,80005f96 <install_trans+0x14>
  }
}
    8000606e:	0001                	nop
    80006070:	0001                	nop
    80006072:	70e2                	ld	ra,56(sp)
    80006074:	7442                	ld	s0,48(sp)
    80006076:	6121                	addi	sp,sp,64
    80006078:	8082                	ret

000000008000607a <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    8000607a:	7179                	addi	sp,sp,-48
    8000607c:	f406                	sd	ra,40(sp)
    8000607e:	f022                	sd	s0,32(sp)
    80006080:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006082:	00020797          	auipc	a5,0x20
    80006086:	10678793          	addi	a5,a5,262 # 80026188 <log>
    8000608a:	579c                	lw	a5,40(a5)
    8000608c:	873e                	mv	a4,a5
    8000608e:	00020797          	auipc	a5,0x20
    80006092:	0fa78793          	addi	a5,a5,250 # 80026188 <log>
    80006096:	4f9c                	lw	a5,24(a5)
    80006098:	85be                	mv	a1,a5
    8000609a:	853a                	mv	a0,a4
    8000609c:	ffffe097          	auipc	ra,0xffffe
    800060a0:	732080e7          	jalr	1842(ra) # 800047ce <bread>
    800060a4:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    800060a8:	fe043783          	ld	a5,-32(s0)
    800060ac:	05878793          	addi	a5,a5,88
    800060b0:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    800060b4:	fd843783          	ld	a5,-40(s0)
    800060b8:	4398                	lw	a4,0(a5)
    800060ba:	00020797          	auipc	a5,0x20
    800060be:	0ce78793          	addi	a5,a5,206 # 80026188 <log>
    800060c2:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    800060c4:	fe042623          	sw	zero,-20(s0)
    800060c8:	a03d                	j	800060f6 <read_head+0x7c>
    log.lh.block[i] = lh->block[i];
    800060ca:	fd843703          	ld	a4,-40(s0)
    800060ce:	fec42783          	lw	a5,-20(s0)
    800060d2:	078a                	slli	a5,a5,0x2
    800060d4:	97ba                	add	a5,a5,a4
    800060d6:	43d8                	lw	a4,4(a5)
    800060d8:	00020697          	auipc	a3,0x20
    800060dc:	0b068693          	addi	a3,a3,176 # 80026188 <log>
    800060e0:	fec42783          	lw	a5,-20(s0)
    800060e4:	07a1                	addi	a5,a5,8
    800060e6:	078a                	slli	a5,a5,0x2
    800060e8:	97b6                	add	a5,a5,a3
    800060ea:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    800060ec:	fec42783          	lw	a5,-20(s0)
    800060f0:	2785                	addiw	a5,a5,1
    800060f2:	fef42623          	sw	a5,-20(s0)
    800060f6:	00020797          	auipc	a5,0x20
    800060fa:	09278793          	addi	a5,a5,146 # 80026188 <log>
    800060fe:	57dc                	lw	a5,44(a5)
    80006100:	fec42703          	lw	a4,-20(s0)
    80006104:	2701                	sext.w	a4,a4
    80006106:	fcf742e3          	blt	a4,a5,800060ca <read_head+0x50>
  }
  brelse(buf);
    8000610a:	fe043503          	ld	a0,-32(s0)
    8000610e:	ffffe097          	auipc	ra,0xffffe
    80006112:	762080e7          	jalr	1890(ra) # 80004870 <brelse>
}
    80006116:	0001                	nop
    80006118:	70a2                	ld	ra,40(sp)
    8000611a:	7402                	ld	s0,32(sp)
    8000611c:	6145                	addi	sp,sp,48
    8000611e:	8082                	ret

0000000080006120 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    80006120:	7179                	addi	sp,sp,-48
    80006122:	f406                	sd	ra,40(sp)
    80006124:	f022                	sd	s0,32(sp)
    80006126:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006128:	00020797          	auipc	a5,0x20
    8000612c:	06078793          	addi	a5,a5,96 # 80026188 <log>
    80006130:	579c                	lw	a5,40(a5)
    80006132:	873e                	mv	a4,a5
    80006134:	00020797          	auipc	a5,0x20
    80006138:	05478793          	addi	a5,a5,84 # 80026188 <log>
    8000613c:	4f9c                	lw	a5,24(a5)
    8000613e:	85be                	mv	a1,a5
    80006140:	853a                	mv	a0,a4
    80006142:	ffffe097          	auipc	ra,0xffffe
    80006146:	68c080e7          	jalr	1676(ra) # 800047ce <bread>
    8000614a:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    8000614e:	fe043783          	ld	a5,-32(s0)
    80006152:	05878793          	addi	a5,a5,88
    80006156:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    8000615a:	00020797          	auipc	a5,0x20
    8000615e:	02e78793          	addi	a5,a5,46 # 80026188 <log>
    80006162:	57d8                	lw	a4,44(a5)
    80006164:	fd843783          	ld	a5,-40(s0)
    80006168:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000616a:	fe042623          	sw	zero,-20(s0)
    8000616e:	a03d                	j	8000619c <write_head+0x7c>
    hb->block[i] = log.lh.block[i];
    80006170:	00020717          	auipc	a4,0x20
    80006174:	01870713          	addi	a4,a4,24 # 80026188 <log>
    80006178:	fec42783          	lw	a5,-20(s0)
    8000617c:	07a1                	addi	a5,a5,8
    8000617e:	078a                	slli	a5,a5,0x2
    80006180:	97ba                	add	a5,a5,a4
    80006182:	4b98                	lw	a4,16(a5)
    80006184:	fd843683          	ld	a3,-40(s0)
    80006188:	fec42783          	lw	a5,-20(s0)
    8000618c:	078a                	slli	a5,a5,0x2
    8000618e:	97b6                	add	a5,a5,a3
    80006190:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006192:	fec42783          	lw	a5,-20(s0)
    80006196:	2785                	addiw	a5,a5,1
    80006198:	fef42623          	sw	a5,-20(s0)
    8000619c:	00020797          	auipc	a5,0x20
    800061a0:	fec78793          	addi	a5,a5,-20 # 80026188 <log>
    800061a4:	57dc                	lw	a5,44(a5)
    800061a6:	fec42703          	lw	a4,-20(s0)
    800061aa:	2701                	sext.w	a4,a4
    800061ac:	fcf742e3          	blt	a4,a5,80006170 <write_head+0x50>
  }
  bwrite(buf);
    800061b0:	fe043503          	ld	a0,-32(s0)
    800061b4:	ffffe097          	auipc	ra,0xffffe
    800061b8:	674080e7          	jalr	1652(ra) # 80004828 <bwrite>
  brelse(buf);
    800061bc:	fe043503          	ld	a0,-32(s0)
    800061c0:	ffffe097          	auipc	ra,0xffffe
    800061c4:	6b0080e7          	jalr	1712(ra) # 80004870 <brelse>
}
    800061c8:	0001                	nop
    800061ca:	70a2                	ld	ra,40(sp)
    800061cc:	7402                	ld	s0,32(sp)
    800061ce:	6145                	addi	sp,sp,48
    800061d0:	8082                	ret

00000000800061d2 <recover_from_log>:

static void
recover_from_log(void)
{
    800061d2:	1141                	addi	sp,sp,-16
    800061d4:	e406                	sd	ra,8(sp)
    800061d6:	e022                	sd	s0,0(sp)
    800061d8:	0800                	addi	s0,sp,16
  read_head();
    800061da:	00000097          	auipc	ra,0x0
    800061de:	ea0080e7          	jalr	-352(ra) # 8000607a <read_head>
  install_trans(1); // if committed, copy from log to disk
    800061e2:	4505                	li	a0,1
    800061e4:	00000097          	auipc	ra,0x0
    800061e8:	d9e080e7          	jalr	-610(ra) # 80005f82 <install_trans>
  log.lh.n = 0;
    800061ec:	00020797          	auipc	a5,0x20
    800061f0:	f9c78793          	addi	a5,a5,-100 # 80026188 <log>
    800061f4:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    800061f8:	00000097          	auipc	ra,0x0
    800061fc:	f28080e7          	jalr	-216(ra) # 80006120 <write_head>
}
    80006200:	0001                	nop
    80006202:	60a2                	ld	ra,8(sp)
    80006204:	6402                	ld	s0,0(sp)
    80006206:	0141                	addi	sp,sp,16
    80006208:	8082                	ret

000000008000620a <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000620a:	1141                	addi	sp,sp,-16
    8000620c:	e406                	sd	ra,8(sp)
    8000620e:	e022                	sd	s0,0(sp)
    80006210:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006212:	00020517          	auipc	a0,0x20
    80006216:	f7650513          	addi	a0,a0,-138 # 80026188 <log>
    8000621a:	ffffb097          	auipc	ra,0xffffb
    8000621e:	0aa080e7          	jalr	170(ra) # 800012c4 <acquire>
  while(1){
    if(log.committing){
    80006222:	00020797          	auipc	a5,0x20
    80006226:	f6678793          	addi	a5,a5,-154 # 80026188 <log>
    8000622a:	53dc                	lw	a5,36(a5)
    8000622c:	cf91                	beqz	a5,80006248 <begin_op+0x3e>
      sleep(&log, &log.lock);
    8000622e:	00020597          	auipc	a1,0x20
    80006232:	f5a58593          	addi	a1,a1,-166 # 80026188 <log>
    80006236:	00020517          	auipc	a0,0x20
    8000623a:	f5250513          	addi	a0,a0,-174 # 80026188 <log>
    8000623e:	ffffd097          	auipc	ra,0xffffd
    80006242:	238080e7          	jalr	568(ra) # 80003476 <sleep>
    80006246:	bff1                	j	80006222 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    80006248:	00020797          	auipc	a5,0x20
    8000624c:	f4078793          	addi	a5,a5,-192 # 80026188 <log>
    80006250:	57d8                	lw	a4,44(a5)
    80006252:	00020797          	auipc	a5,0x20
    80006256:	f3678793          	addi	a5,a5,-202 # 80026188 <log>
    8000625a:	539c                	lw	a5,32(a5)
    8000625c:	2785                	addiw	a5,a5,1
    8000625e:	2781                	sext.w	a5,a5
    80006260:	86be                	mv	a3,a5
    80006262:	87b6                	mv	a5,a3
    80006264:	0027979b          	slliw	a5,a5,0x2
    80006268:	9fb5                	addw	a5,a5,a3
    8000626a:	0017979b          	slliw	a5,a5,0x1
    8000626e:	2781                	sext.w	a5,a5
    80006270:	9fb9                	addw	a5,a5,a4
    80006272:	0007871b          	sext.w	a4,a5
    80006276:	47f9                	li	a5,30
    80006278:	00e7df63          	bge	a5,a4,80006296 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    8000627c:	00020597          	auipc	a1,0x20
    80006280:	f0c58593          	addi	a1,a1,-244 # 80026188 <log>
    80006284:	00020517          	auipc	a0,0x20
    80006288:	f0450513          	addi	a0,a0,-252 # 80026188 <log>
    8000628c:	ffffd097          	auipc	ra,0xffffd
    80006290:	1ea080e7          	jalr	490(ra) # 80003476 <sleep>
    80006294:	b779                	j	80006222 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    80006296:	00020797          	auipc	a5,0x20
    8000629a:	ef278793          	addi	a5,a5,-270 # 80026188 <log>
    8000629e:	539c                	lw	a5,32(a5)
    800062a0:	2785                	addiw	a5,a5,1
    800062a2:	0007871b          	sext.w	a4,a5
    800062a6:	00020797          	auipc	a5,0x20
    800062aa:	ee278793          	addi	a5,a5,-286 # 80026188 <log>
    800062ae:	d398                	sw	a4,32(a5)
      release(&log.lock);
    800062b0:	00020517          	auipc	a0,0x20
    800062b4:	ed850513          	addi	a0,a0,-296 # 80026188 <log>
    800062b8:	ffffb097          	auipc	ra,0xffffb
    800062bc:	070080e7          	jalr	112(ra) # 80001328 <release>
      break;
    800062c0:	0001                	nop
    }
  }
}
    800062c2:	0001                	nop
    800062c4:	60a2                	ld	ra,8(sp)
    800062c6:	6402                	ld	s0,0(sp)
    800062c8:	0141                	addi	sp,sp,16
    800062ca:	8082                	ret

00000000800062cc <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    800062cc:	1101                	addi	sp,sp,-32
    800062ce:	ec06                	sd	ra,24(sp)
    800062d0:	e822                	sd	s0,16(sp)
    800062d2:	1000                	addi	s0,sp,32
  int do_commit = 0;
    800062d4:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    800062d8:	00020517          	auipc	a0,0x20
    800062dc:	eb050513          	addi	a0,a0,-336 # 80026188 <log>
    800062e0:	ffffb097          	auipc	ra,0xffffb
    800062e4:	fe4080e7          	jalr	-28(ra) # 800012c4 <acquire>
  log.outstanding -= 1;
    800062e8:	00020797          	auipc	a5,0x20
    800062ec:	ea078793          	addi	a5,a5,-352 # 80026188 <log>
    800062f0:	539c                	lw	a5,32(a5)
    800062f2:	37fd                	addiw	a5,a5,-1
    800062f4:	0007871b          	sext.w	a4,a5
    800062f8:	00020797          	auipc	a5,0x20
    800062fc:	e9078793          	addi	a5,a5,-368 # 80026188 <log>
    80006300:	d398                	sw	a4,32(a5)
  if(log.committing)
    80006302:	00020797          	auipc	a5,0x20
    80006306:	e8678793          	addi	a5,a5,-378 # 80026188 <log>
    8000630a:	53dc                	lw	a5,36(a5)
    8000630c:	cb89                	beqz	a5,8000631e <end_op+0x52>
    panic("log.committing");
    8000630e:	00005517          	auipc	a0,0x5
    80006312:	25250513          	addi	a0,a0,594 # 8000b560 <etext+0x560>
    80006316:	ffffb097          	auipc	ra,0xffffb
    8000631a:	9aa080e7          	jalr	-1622(ra) # 80000cc0 <panic>
  if(log.outstanding == 0){
    8000631e:	00020797          	auipc	a5,0x20
    80006322:	e6a78793          	addi	a5,a5,-406 # 80026188 <log>
    80006326:	539c                	lw	a5,32(a5)
    80006328:	eb99                	bnez	a5,8000633e <end_op+0x72>
    do_commit = 1;
    8000632a:	4785                	li	a5,1
    8000632c:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80006330:	00020797          	auipc	a5,0x20
    80006334:	e5878793          	addi	a5,a5,-424 # 80026188 <log>
    80006338:	4705                	li	a4,1
    8000633a:	d3d8                	sw	a4,36(a5)
    8000633c:	a809                	j	8000634e <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    8000633e:	00020517          	auipc	a0,0x20
    80006342:	e4a50513          	addi	a0,a0,-438 # 80026188 <log>
    80006346:	ffffd097          	auipc	ra,0xffffd
    8000634a:	1ac080e7          	jalr	428(ra) # 800034f2 <wakeup>
  }
  release(&log.lock);
    8000634e:	00020517          	auipc	a0,0x20
    80006352:	e3a50513          	addi	a0,a0,-454 # 80026188 <log>
    80006356:	ffffb097          	auipc	ra,0xffffb
    8000635a:	fd2080e7          	jalr	-46(ra) # 80001328 <release>

  if(do_commit){
    8000635e:	fec42783          	lw	a5,-20(s0)
    80006362:	2781                	sext.w	a5,a5
    80006364:	c3b9                	beqz	a5,800063aa <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    80006366:	00000097          	auipc	ra,0x0
    8000636a:	12c080e7          	jalr	300(ra) # 80006492 <commit>
    acquire(&log.lock);
    8000636e:	00020517          	auipc	a0,0x20
    80006372:	e1a50513          	addi	a0,a0,-486 # 80026188 <log>
    80006376:	ffffb097          	auipc	ra,0xffffb
    8000637a:	f4e080e7          	jalr	-178(ra) # 800012c4 <acquire>
    log.committing = 0;
    8000637e:	00020797          	auipc	a5,0x20
    80006382:	e0a78793          	addi	a5,a5,-502 # 80026188 <log>
    80006386:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    8000638a:	00020517          	auipc	a0,0x20
    8000638e:	dfe50513          	addi	a0,a0,-514 # 80026188 <log>
    80006392:	ffffd097          	auipc	ra,0xffffd
    80006396:	160080e7          	jalr	352(ra) # 800034f2 <wakeup>
    release(&log.lock);
    8000639a:	00020517          	auipc	a0,0x20
    8000639e:	dee50513          	addi	a0,a0,-530 # 80026188 <log>
    800063a2:	ffffb097          	auipc	ra,0xffffb
    800063a6:	f86080e7          	jalr	-122(ra) # 80001328 <release>
  }
}
    800063aa:	0001                	nop
    800063ac:	60e2                	ld	ra,24(sp)
    800063ae:	6442                	ld	s0,16(sp)
    800063b0:	6105                	addi	sp,sp,32
    800063b2:	8082                	ret

00000000800063b4 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    800063b4:	7179                	addi	sp,sp,-48
    800063b6:	f406                	sd	ra,40(sp)
    800063b8:	f022                	sd	s0,32(sp)
    800063ba:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800063bc:	fe042623          	sw	zero,-20(s0)
    800063c0:	a84d                	j	80006472 <write_log+0xbe>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    800063c2:	00020797          	auipc	a5,0x20
    800063c6:	dc678793          	addi	a5,a5,-570 # 80026188 <log>
    800063ca:	579c                	lw	a5,40(a5)
    800063cc:	86be                	mv	a3,a5
    800063ce:	00020797          	auipc	a5,0x20
    800063d2:	dba78793          	addi	a5,a5,-582 # 80026188 <log>
    800063d6:	4f9c                	lw	a5,24(a5)
    800063d8:	fec42703          	lw	a4,-20(s0)
    800063dc:	9fb9                	addw	a5,a5,a4
    800063de:	2781                	sext.w	a5,a5
    800063e0:	2785                	addiw	a5,a5,1
    800063e2:	2781                	sext.w	a5,a5
    800063e4:	85be                	mv	a1,a5
    800063e6:	8536                	mv	a0,a3
    800063e8:	ffffe097          	auipc	ra,0xffffe
    800063ec:	3e6080e7          	jalr	998(ra) # 800047ce <bread>
    800063f0:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    800063f4:	00020797          	auipc	a5,0x20
    800063f8:	d9478793          	addi	a5,a5,-620 # 80026188 <log>
    800063fc:	579c                	lw	a5,40(a5)
    800063fe:	86be                	mv	a3,a5
    80006400:	00020717          	auipc	a4,0x20
    80006404:	d8870713          	addi	a4,a4,-632 # 80026188 <log>
    80006408:	fec42783          	lw	a5,-20(s0)
    8000640c:	07a1                	addi	a5,a5,8
    8000640e:	078a                	slli	a5,a5,0x2
    80006410:	97ba                	add	a5,a5,a4
    80006412:	4b9c                	lw	a5,16(a5)
    80006414:	85be                	mv	a1,a5
    80006416:	8536                	mv	a0,a3
    80006418:	ffffe097          	auipc	ra,0xffffe
    8000641c:	3b6080e7          	jalr	950(ra) # 800047ce <bread>
    80006420:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    80006424:	fe043783          	ld	a5,-32(s0)
    80006428:	05878713          	addi	a4,a5,88
    8000642c:	fd843783          	ld	a5,-40(s0)
    80006430:	05878793          	addi	a5,a5,88
    80006434:	40000613          	li	a2,1024
    80006438:	85be                	mv	a1,a5
    8000643a:	853a                	mv	a0,a4
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	148080e7          	jalr	328(ra) # 80001584 <memmove>
    bwrite(to);  // write the log
    80006444:	fe043503          	ld	a0,-32(s0)
    80006448:	ffffe097          	auipc	ra,0xffffe
    8000644c:	3e0080e7          	jalr	992(ra) # 80004828 <bwrite>
    brelse(from);
    80006450:	fd843503          	ld	a0,-40(s0)
    80006454:	ffffe097          	auipc	ra,0xffffe
    80006458:	41c080e7          	jalr	1052(ra) # 80004870 <brelse>
    brelse(to);
    8000645c:	fe043503          	ld	a0,-32(s0)
    80006460:	ffffe097          	auipc	ra,0xffffe
    80006464:	410080e7          	jalr	1040(ra) # 80004870 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006468:	fec42783          	lw	a5,-20(s0)
    8000646c:	2785                	addiw	a5,a5,1
    8000646e:	fef42623          	sw	a5,-20(s0)
    80006472:	00020797          	auipc	a5,0x20
    80006476:	d1678793          	addi	a5,a5,-746 # 80026188 <log>
    8000647a:	57dc                	lw	a5,44(a5)
    8000647c:	fec42703          	lw	a4,-20(s0)
    80006480:	2701                	sext.w	a4,a4
    80006482:	f4f740e3          	blt	a4,a5,800063c2 <write_log+0xe>
  }
}
    80006486:	0001                	nop
    80006488:	0001                	nop
    8000648a:	70a2                	ld	ra,40(sp)
    8000648c:	7402                	ld	s0,32(sp)
    8000648e:	6145                	addi	sp,sp,48
    80006490:	8082                	ret

0000000080006492 <commit>:

static void
commit()
{
    80006492:	1141                	addi	sp,sp,-16
    80006494:	e406                	sd	ra,8(sp)
    80006496:	e022                	sd	s0,0(sp)
    80006498:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    8000649a:	00020797          	auipc	a5,0x20
    8000649e:	cee78793          	addi	a5,a5,-786 # 80026188 <log>
    800064a2:	57dc                	lw	a5,44(a5)
    800064a4:	02f05963          	blez	a5,800064d6 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    800064a8:	00000097          	auipc	ra,0x0
    800064ac:	f0c080e7          	jalr	-244(ra) # 800063b4 <write_log>
    write_head();    // Write header to disk -- the real commit
    800064b0:	00000097          	auipc	ra,0x0
    800064b4:	c70080e7          	jalr	-912(ra) # 80006120 <write_head>
    install_trans(0); // Now install writes to home locations
    800064b8:	4501                	li	a0,0
    800064ba:	00000097          	auipc	ra,0x0
    800064be:	ac8080e7          	jalr	-1336(ra) # 80005f82 <install_trans>
    log.lh.n = 0;
    800064c2:	00020797          	auipc	a5,0x20
    800064c6:	cc678793          	addi	a5,a5,-826 # 80026188 <log>
    800064ca:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    800064ce:	00000097          	auipc	ra,0x0
    800064d2:	c52080e7          	jalr	-942(ra) # 80006120 <write_head>
  }
}
    800064d6:	0001                	nop
    800064d8:	60a2                	ld	ra,8(sp)
    800064da:	6402                	ld	s0,0(sp)
    800064dc:	0141                	addi	sp,sp,16
    800064de:	8082                	ret

00000000800064e0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    800064e0:	7179                	addi	sp,sp,-48
    800064e2:	f406                	sd	ra,40(sp)
    800064e4:	f022                	sd	s0,32(sp)
    800064e6:	1800                	addi	s0,sp,48
    800064e8:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    800064ec:	00020517          	auipc	a0,0x20
    800064f0:	c9c50513          	addi	a0,a0,-868 # 80026188 <log>
    800064f4:	ffffb097          	auipc	ra,0xffffb
    800064f8:	dd0080e7          	jalr	-560(ra) # 800012c4 <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    800064fc:	00020797          	auipc	a5,0x20
    80006500:	c8c78793          	addi	a5,a5,-884 # 80026188 <log>
    80006504:	57d8                	lw	a4,44(a5)
    80006506:	47f5                	li	a5,29
    80006508:	02e7c063          	blt	a5,a4,80006528 <log_write+0x48>
    8000650c:	00020797          	auipc	a5,0x20
    80006510:	c7c78793          	addi	a5,a5,-900 # 80026188 <log>
    80006514:	57d8                	lw	a4,44(a5)
    80006516:	00020797          	auipc	a5,0x20
    8000651a:	c7278793          	addi	a5,a5,-910 # 80026188 <log>
    8000651e:	4fdc                	lw	a5,28(a5)
    80006520:	37fd                	addiw	a5,a5,-1
    80006522:	2781                	sext.w	a5,a5
    80006524:	00f74a63          	blt	a4,a5,80006538 <log_write+0x58>
    panic("too big a transaction");
    80006528:	00005517          	auipc	a0,0x5
    8000652c:	04850513          	addi	a0,a0,72 # 8000b570 <etext+0x570>
    80006530:	ffffa097          	auipc	ra,0xffffa
    80006534:	790080e7          	jalr	1936(ra) # 80000cc0 <panic>
  if (log.outstanding < 1)
    80006538:	00020797          	auipc	a5,0x20
    8000653c:	c5078793          	addi	a5,a5,-944 # 80026188 <log>
    80006540:	539c                	lw	a5,32(a5)
    80006542:	00f04a63          	bgtz	a5,80006556 <log_write+0x76>
    panic("log_write outside of trans");
    80006546:	00005517          	auipc	a0,0x5
    8000654a:	04250513          	addi	a0,a0,66 # 8000b588 <etext+0x588>
    8000654e:	ffffa097          	auipc	ra,0xffffa
    80006552:	772080e7          	jalr	1906(ra) # 80000cc0 <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006556:	fe042623          	sw	zero,-20(s0)
    8000655a:	a035                	j	80006586 <log_write+0xa6>
    if (log.lh.block[i] == b->blockno)   // log absorption
    8000655c:	00020717          	auipc	a4,0x20
    80006560:	c2c70713          	addi	a4,a4,-980 # 80026188 <log>
    80006564:	fec42783          	lw	a5,-20(s0)
    80006568:	07a1                	addi	a5,a5,8
    8000656a:	078a                	slli	a5,a5,0x2
    8000656c:	97ba                	add	a5,a5,a4
    8000656e:	4b9c                	lw	a5,16(a5)
    80006570:	873e                	mv	a4,a5
    80006572:	fd843783          	ld	a5,-40(s0)
    80006576:	47dc                	lw	a5,12(a5)
    80006578:	02f70263          	beq	a4,a5,8000659c <log_write+0xbc>
  for (i = 0; i < log.lh.n; i++) {
    8000657c:	fec42783          	lw	a5,-20(s0)
    80006580:	2785                	addiw	a5,a5,1
    80006582:	fef42623          	sw	a5,-20(s0)
    80006586:	00020797          	auipc	a5,0x20
    8000658a:	c0278793          	addi	a5,a5,-1022 # 80026188 <log>
    8000658e:	57dc                	lw	a5,44(a5)
    80006590:	fec42703          	lw	a4,-20(s0)
    80006594:	2701                	sext.w	a4,a4
    80006596:	fcf743e3          	blt	a4,a5,8000655c <log_write+0x7c>
    8000659a:	a011                	j	8000659e <log_write+0xbe>
      break;
    8000659c:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    8000659e:	fd843783          	ld	a5,-40(s0)
    800065a2:	47dc                	lw	a5,12(a5)
    800065a4:	86be                	mv	a3,a5
    800065a6:	00020717          	auipc	a4,0x20
    800065aa:	be270713          	addi	a4,a4,-1054 # 80026188 <log>
    800065ae:	fec42783          	lw	a5,-20(s0)
    800065b2:	07a1                	addi	a5,a5,8
    800065b4:	078a                	slli	a5,a5,0x2
    800065b6:	97ba                	add	a5,a5,a4
    800065b8:	cb94                	sw	a3,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    800065ba:	00020797          	auipc	a5,0x20
    800065be:	bce78793          	addi	a5,a5,-1074 # 80026188 <log>
    800065c2:	57dc                	lw	a5,44(a5)
    800065c4:	fec42703          	lw	a4,-20(s0)
    800065c8:	2701                	sext.w	a4,a4
    800065ca:	02f71563          	bne	a4,a5,800065f4 <log_write+0x114>
    bpin(b);
    800065ce:	fd843503          	ld	a0,-40(s0)
    800065d2:	ffffe097          	auipc	ra,0xffffe
    800065d6:	38c080e7          	jalr	908(ra) # 8000495e <bpin>
    log.lh.n++;
    800065da:	00020797          	auipc	a5,0x20
    800065de:	bae78793          	addi	a5,a5,-1106 # 80026188 <log>
    800065e2:	57dc                	lw	a5,44(a5)
    800065e4:	2785                	addiw	a5,a5,1
    800065e6:	0007871b          	sext.w	a4,a5
    800065ea:	00020797          	auipc	a5,0x20
    800065ee:	b9e78793          	addi	a5,a5,-1122 # 80026188 <log>
    800065f2:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    800065f4:	00020517          	auipc	a0,0x20
    800065f8:	b9450513          	addi	a0,a0,-1132 # 80026188 <log>
    800065fc:	ffffb097          	auipc	ra,0xffffb
    80006600:	d2c080e7          	jalr	-724(ra) # 80001328 <release>
}
    80006604:	0001                	nop
    80006606:	70a2                	ld	ra,40(sp)
    80006608:	7402                	ld	s0,32(sp)
    8000660a:	6145                	addi	sp,sp,48
    8000660c:	8082                	ret

000000008000660e <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8000660e:	1101                	addi	sp,sp,-32
    80006610:	ec06                	sd	ra,24(sp)
    80006612:	e822                	sd	s0,16(sp)
    80006614:	1000                	addi	s0,sp,32
    80006616:	fea43423          	sd	a0,-24(s0)
    8000661a:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    8000661e:	fe843783          	ld	a5,-24(s0)
    80006622:	07a1                	addi	a5,a5,8
    80006624:	00005597          	auipc	a1,0x5
    80006628:	f8458593          	addi	a1,a1,-124 # 8000b5a8 <etext+0x5a8>
    8000662c:	853e                	mv	a0,a5
    8000662e:	ffffb097          	auipc	ra,0xffffb
    80006632:	c62080e7          	jalr	-926(ra) # 80001290 <initlock>
  lk->name = name;
    80006636:	fe843783          	ld	a5,-24(s0)
    8000663a:	fe043703          	ld	a4,-32(s0)
    8000663e:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006640:	fe843783          	ld	a5,-24(s0)
    80006644:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006648:	fe843783          	ld	a5,-24(s0)
    8000664c:	0207a423          	sw	zero,40(a5)
}
    80006650:	0001                	nop
    80006652:	60e2                	ld	ra,24(sp)
    80006654:	6442                	ld	s0,16(sp)
    80006656:	6105                	addi	sp,sp,32
    80006658:	8082                	ret

000000008000665a <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    8000665a:	1101                	addi	sp,sp,-32
    8000665c:	ec06                	sd	ra,24(sp)
    8000665e:	e822                	sd	s0,16(sp)
    80006660:	1000                	addi	s0,sp,32
    80006662:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006666:	fe843783          	ld	a5,-24(s0)
    8000666a:	07a1                	addi	a5,a5,8
    8000666c:	853e                	mv	a0,a5
    8000666e:	ffffb097          	auipc	ra,0xffffb
    80006672:	c56080e7          	jalr	-938(ra) # 800012c4 <acquire>
  while (lk->locked) {
    80006676:	a819                	j	8000668c <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006678:	fe843783          	ld	a5,-24(s0)
    8000667c:	07a1                	addi	a5,a5,8
    8000667e:	85be                	mv	a1,a5
    80006680:	fe843503          	ld	a0,-24(s0)
    80006684:	ffffd097          	auipc	ra,0xffffd
    80006688:	df2080e7          	jalr	-526(ra) # 80003476 <sleep>
  while (lk->locked) {
    8000668c:	fe843783          	ld	a5,-24(s0)
    80006690:	439c                	lw	a5,0(a5)
    80006692:	f3fd                	bnez	a5,80006678 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006694:	fe843783          	ld	a5,-24(s0)
    80006698:	4705                	li	a4,1
    8000669a:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    8000669c:	ffffc097          	auipc	ra,0xffffc
    800066a0:	220080e7          	jalr	544(ra) # 800028bc <myproc>
    800066a4:	87aa                	mv	a5,a0
    800066a6:	5b98                	lw	a4,48(a5)
    800066a8:	fe843783          	ld	a5,-24(s0)
    800066ac:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    800066ae:	fe843783          	ld	a5,-24(s0)
    800066b2:	07a1                	addi	a5,a5,8
    800066b4:	853e                	mv	a0,a5
    800066b6:	ffffb097          	auipc	ra,0xffffb
    800066ba:	c72080e7          	jalr	-910(ra) # 80001328 <release>
}
    800066be:	0001                	nop
    800066c0:	60e2                	ld	ra,24(sp)
    800066c2:	6442                	ld	s0,16(sp)
    800066c4:	6105                	addi	sp,sp,32
    800066c6:	8082                	ret

00000000800066c8 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    800066c8:	1101                	addi	sp,sp,-32
    800066ca:	ec06                	sd	ra,24(sp)
    800066cc:	e822                	sd	s0,16(sp)
    800066ce:	1000                	addi	s0,sp,32
    800066d0:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800066d4:	fe843783          	ld	a5,-24(s0)
    800066d8:	07a1                	addi	a5,a5,8
    800066da:	853e                	mv	a0,a5
    800066dc:	ffffb097          	auipc	ra,0xffffb
    800066e0:	be8080e7          	jalr	-1048(ra) # 800012c4 <acquire>
  lk->locked = 0;
    800066e4:	fe843783          	ld	a5,-24(s0)
    800066e8:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800066ec:	fe843783          	ld	a5,-24(s0)
    800066f0:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    800066f4:	fe843503          	ld	a0,-24(s0)
    800066f8:	ffffd097          	auipc	ra,0xffffd
    800066fc:	dfa080e7          	jalr	-518(ra) # 800034f2 <wakeup>
  release(&lk->lk);
    80006700:	fe843783          	ld	a5,-24(s0)
    80006704:	07a1                	addi	a5,a5,8
    80006706:	853e                	mv	a0,a5
    80006708:	ffffb097          	auipc	ra,0xffffb
    8000670c:	c20080e7          	jalr	-992(ra) # 80001328 <release>
}
    80006710:	0001                	nop
    80006712:	60e2                	ld	ra,24(sp)
    80006714:	6442                	ld	s0,16(sp)
    80006716:	6105                	addi	sp,sp,32
    80006718:	8082                	ret

000000008000671a <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    8000671a:	7139                	addi	sp,sp,-64
    8000671c:	fc06                	sd	ra,56(sp)
    8000671e:	f822                	sd	s0,48(sp)
    80006720:	f426                	sd	s1,40(sp)
    80006722:	0080                	addi	s0,sp,64
    80006724:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006728:	fc843783          	ld	a5,-56(s0)
    8000672c:	07a1                	addi	a5,a5,8
    8000672e:	853e                	mv	a0,a5
    80006730:	ffffb097          	auipc	ra,0xffffb
    80006734:	b94080e7          	jalr	-1132(ra) # 800012c4 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006738:	fc843783          	ld	a5,-56(s0)
    8000673c:	439c                	lw	a5,0(a5)
    8000673e:	cf91                	beqz	a5,8000675a <holdingsleep+0x40>
    80006740:	fc843783          	ld	a5,-56(s0)
    80006744:	5784                	lw	s1,40(a5)
    80006746:	ffffc097          	auipc	ra,0xffffc
    8000674a:	176080e7          	jalr	374(ra) # 800028bc <myproc>
    8000674e:	87aa                	mv	a5,a0
    80006750:	5b9c                	lw	a5,48(a5)
    80006752:	00f49463          	bne	s1,a5,8000675a <holdingsleep+0x40>
    80006756:	4785                	li	a5,1
    80006758:	a011                	j	8000675c <holdingsleep+0x42>
    8000675a:	4781                	li	a5,0
    8000675c:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006760:	fc843783          	ld	a5,-56(s0)
    80006764:	07a1                	addi	a5,a5,8
    80006766:	853e                	mv	a0,a5
    80006768:	ffffb097          	auipc	ra,0xffffb
    8000676c:	bc0080e7          	jalr	-1088(ra) # 80001328 <release>
  return r;
    80006770:	fdc42783          	lw	a5,-36(s0)
}
    80006774:	853e                	mv	a0,a5
    80006776:	70e2                	ld	ra,56(sp)
    80006778:	7442                	ld	s0,48(sp)
    8000677a:	74a2                	ld	s1,40(sp)
    8000677c:	6121                	addi	sp,sp,64
    8000677e:	8082                	ret

0000000080006780 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006780:	1141                	addi	sp,sp,-16
    80006782:	e406                	sd	ra,8(sp)
    80006784:	e022                	sd	s0,0(sp)
    80006786:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006788:	00005597          	auipc	a1,0x5
    8000678c:	e3058593          	addi	a1,a1,-464 # 8000b5b8 <etext+0x5b8>
    80006790:	00020517          	auipc	a0,0x20
    80006794:	b4050513          	addi	a0,a0,-1216 # 800262d0 <ftable>
    80006798:	ffffb097          	auipc	ra,0xffffb
    8000679c:	af8080e7          	jalr	-1288(ra) # 80001290 <initlock>
}
    800067a0:	0001                	nop
    800067a2:	60a2                	ld	ra,8(sp)
    800067a4:	6402                	ld	s0,0(sp)
    800067a6:	0141                	addi	sp,sp,16
    800067a8:	8082                	ret

00000000800067aa <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    800067aa:	1101                	addi	sp,sp,-32
    800067ac:	ec06                	sd	ra,24(sp)
    800067ae:	e822                	sd	s0,16(sp)
    800067b0:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    800067b2:	00020517          	auipc	a0,0x20
    800067b6:	b1e50513          	addi	a0,a0,-1250 # 800262d0 <ftable>
    800067ba:	ffffb097          	auipc	ra,0xffffb
    800067be:	b0a080e7          	jalr	-1270(ra) # 800012c4 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800067c2:	00020797          	auipc	a5,0x20
    800067c6:	b2678793          	addi	a5,a5,-1242 # 800262e8 <ftable+0x18>
    800067ca:	fef43423          	sd	a5,-24(s0)
    800067ce:	a815                	j	80006802 <filealloc+0x58>
    if(f->ref == 0){
    800067d0:	fe843783          	ld	a5,-24(s0)
    800067d4:	43dc                	lw	a5,4(a5)
    800067d6:	e385                	bnez	a5,800067f6 <filealloc+0x4c>
      f->ref = 1;
    800067d8:	fe843783          	ld	a5,-24(s0)
    800067dc:	4705                	li	a4,1
    800067de:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    800067e0:	00020517          	auipc	a0,0x20
    800067e4:	af050513          	addi	a0,a0,-1296 # 800262d0 <ftable>
    800067e8:	ffffb097          	auipc	ra,0xffffb
    800067ec:	b40080e7          	jalr	-1216(ra) # 80001328 <release>
      return f;
    800067f0:	fe843783          	ld	a5,-24(s0)
    800067f4:	a805                	j	80006824 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800067f6:	fe843783          	ld	a5,-24(s0)
    800067fa:	02878793          	addi	a5,a5,40
    800067fe:	fef43423          	sd	a5,-24(s0)
    80006802:	00021797          	auipc	a5,0x21
    80006806:	a8678793          	addi	a5,a5,-1402 # 80027288 <disk>
    8000680a:	fe843703          	ld	a4,-24(s0)
    8000680e:	fcf761e3          	bltu	a4,a5,800067d0 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006812:	00020517          	auipc	a0,0x20
    80006816:	abe50513          	addi	a0,a0,-1346 # 800262d0 <ftable>
    8000681a:	ffffb097          	auipc	ra,0xffffb
    8000681e:	b0e080e7          	jalr	-1266(ra) # 80001328 <release>
  return 0;
    80006822:	4781                	li	a5,0
}
    80006824:	853e                	mv	a0,a5
    80006826:	60e2                	ld	ra,24(sp)
    80006828:	6442                	ld	s0,16(sp)
    8000682a:	6105                	addi	sp,sp,32
    8000682c:	8082                	ret

000000008000682e <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    8000682e:	1101                	addi	sp,sp,-32
    80006830:	ec06                	sd	ra,24(sp)
    80006832:	e822                	sd	s0,16(sp)
    80006834:	1000                	addi	s0,sp,32
    80006836:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    8000683a:	00020517          	auipc	a0,0x20
    8000683e:	a9650513          	addi	a0,a0,-1386 # 800262d0 <ftable>
    80006842:	ffffb097          	auipc	ra,0xffffb
    80006846:	a82080e7          	jalr	-1406(ra) # 800012c4 <acquire>
  if(f->ref < 1)
    8000684a:	fe843783          	ld	a5,-24(s0)
    8000684e:	43dc                	lw	a5,4(a5)
    80006850:	00f04a63          	bgtz	a5,80006864 <filedup+0x36>
    panic("filedup");
    80006854:	00005517          	auipc	a0,0x5
    80006858:	d6c50513          	addi	a0,a0,-660 # 8000b5c0 <etext+0x5c0>
    8000685c:	ffffa097          	auipc	ra,0xffffa
    80006860:	464080e7          	jalr	1124(ra) # 80000cc0 <panic>
  f->ref++;
    80006864:	fe843783          	ld	a5,-24(s0)
    80006868:	43dc                	lw	a5,4(a5)
    8000686a:	2785                	addiw	a5,a5,1
    8000686c:	0007871b          	sext.w	a4,a5
    80006870:	fe843783          	ld	a5,-24(s0)
    80006874:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006876:	00020517          	auipc	a0,0x20
    8000687a:	a5a50513          	addi	a0,a0,-1446 # 800262d0 <ftable>
    8000687e:	ffffb097          	auipc	ra,0xffffb
    80006882:	aaa080e7          	jalr	-1366(ra) # 80001328 <release>
  return f;
    80006886:	fe843783          	ld	a5,-24(s0)
}
    8000688a:	853e                	mv	a0,a5
    8000688c:	60e2                	ld	ra,24(sp)
    8000688e:	6442                	ld	s0,16(sp)
    80006890:	6105                	addi	sp,sp,32
    80006892:	8082                	ret

0000000080006894 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006894:	715d                	addi	sp,sp,-80
    80006896:	e486                	sd	ra,72(sp)
    80006898:	e0a2                	sd	s0,64(sp)
    8000689a:	0880                	addi	s0,sp,80
    8000689c:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    800068a0:	00020517          	auipc	a0,0x20
    800068a4:	a3050513          	addi	a0,a0,-1488 # 800262d0 <ftable>
    800068a8:	ffffb097          	auipc	ra,0xffffb
    800068ac:	a1c080e7          	jalr	-1508(ra) # 800012c4 <acquire>
  if(f->ref < 1)
    800068b0:	fb843783          	ld	a5,-72(s0)
    800068b4:	43dc                	lw	a5,4(a5)
    800068b6:	00f04a63          	bgtz	a5,800068ca <fileclose+0x36>
    panic("fileclose");
    800068ba:	00005517          	auipc	a0,0x5
    800068be:	d0e50513          	addi	a0,a0,-754 # 8000b5c8 <etext+0x5c8>
    800068c2:	ffffa097          	auipc	ra,0xffffa
    800068c6:	3fe080e7          	jalr	1022(ra) # 80000cc0 <panic>
  if(--f->ref > 0){
    800068ca:	fb843783          	ld	a5,-72(s0)
    800068ce:	43dc                	lw	a5,4(a5)
    800068d0:	37fd                	addiw	a5,a5,-1
    800068d2:	0007871b          	sext.w	a4,a5
    800068d6:	fb843783          	ld	a5,-72(s0)
    800068da:	c3d8                	sw	a4,4(a5)
    800068dc:	fb843783          	ld	a5,-72(s0)
    800068e0:	43dc                	lw	a5,4(a5)
    800068e2:	00f05b63          	blez	a5,800068f8 <fileclose+0x64>
    release(&ftable.lock);
    800068e6:	00020517          	auipc	a0,0x20
    800068ea:	9ea50513          	addi	a0,a0,-1558 # 800262d0 <ftable>
    800068ee:	ffffb097          	auipc	ra,0xffffb
    800068f2:	a3a080e7          	jalr	-1478(ra) # 80001328 <release>
    800068f6:	a861                	j	8000698e <fileclose+0xfa>
    return;
  }
  ff = *f;
    800068f8:	fb843783          	ld	a5,-72(s0)
    800068fc:	638c                	ld	a1,0(a5)
    800068fe:	6790                	ld	a2,8(a5)
    80006900:	6b94                	ld	a3,16(a5)
    80006902:	6f98                	ld	a4,24(a5)
    80006904:	739c                	ld	a5,32(a5)
    80006906:	fcb43423          	sd	a1,-56(s0)
    8000690a:	fcc43823          	sd	a2,-48(s0)
    8000690e:	fcd43c23          	sd	a3,-40(s0)
    80006912:	fee43023          	sd	a4,-32(s0)
    80006916:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    8000691a:	fb843783          	ld	a5,-72(s0)
    8000691e:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006922:	fb843783          	ld	a5,-72(s0)
    80006926:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    8000692a:	00020517          	auipc	a0,0x20
    8000692e:	9a650513          	addi	a0,a0,-1626 # 800262d0 <ftable>
    80006932:	ffffb097          	auipc	ra,0xffffb
    80006936:	9f6080e7          	jalr	-1546(ra) # 80001328 <release>

  if(ff.type == FD_PIPE){
    8000693a:	fc842703          	lw	a4,-56(s0)
    8000693e:	4785                	li	a5,1
    80006940:	00f71e63          	bne	a4,a5,8000695c <fileclose+0xc8>
    pipeclose(ff.pipe, ff.writable);
    80006944:	fd843783          	ld	a5,-40(s0)
    80006948:	fd144703          	lbu	a4,-47(s0)
    8000694c:	2701                	sext.w	a4,a4
    8000694e:	85ba                	mv	a1,a4
    80006950:	853e                	mv	a0,a5
    80006952:	00000097          	auipc	ra,0x0
    80006956:	58e080e7          	jalr	1422(ra) # 80006ee0 <pipeclose>
    8000695a:	a815                	j	8000698e <fileclose+0xfa>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    8000695c:	fc842703          	lw	a4,-56(s0)
    80006960:	4789                	li	a5,2
    80006962:	00f70763          	beq	a4,a5,80006970 <fileclose+0xdc>
    80006966:	fc842703          	lw	a4,-56(s0)
    8000696a:	478d                	li	a5,3
    8000696c:	02f71163          	bne	a4,a5,8000698e <fileclose+0xfa>
    begin_op();
    80006970:	00000097          	auipc	ra,0x0
    80006974:	89a080e7          	jalr	-1894(ra) # 8000620a <begin_op>
    iput(ff.ip);
    80006978:	fe043783          	ld	a5,-32(s0)
    8000697c:	853e                	mv	a0,a5
    8000697e:	fffff097          	auipc	ra,0xfffff
    80006982:	9aa080e7          	jalr	-1622(ra) # 80005328 <iput>
    end_op();
    80006986:	00000097          	auipc	ra,0x0
    8000698a:	946080e7          	jalr	-1722(ra) # 800062cc <end_op>
  }
}
    8000698e:	60a6                	ld	ra,72(sp)
    80006990:	6406                	ld	s0,64(sp)
    80006992:	6161                	addi	sp,sp,80
    80006994:	8082                	ret

0000000080006996 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006996:	7139                	addi	sp,sp,-64
    80006998:	fc06                	sd	ra,56(sp)
    8000699a:	f822                	sd	s0,48(sp)
    8000699c:	0080                	addi	s0,sp,64
    8000699e:	fca43423          	sd	a0,-56(s0)
    800069a2:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    800069a6:	ffffc097          	auipc	ra,0xffffc
    800069aa:	f16080e7          	jalr	-234(ra) # 800028bc <myproc>
    800069ae:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    800069b2:	fc843783          	ld	a5,-56(s0)
    800069b6:	4398                	lw	a4,0(a5)
    800069b8:	4789                	li	a5,2
    800069ba:	00f70863          	beq	a4,a5,800069ca <filestat+0x34>
    800069be:	fc843783          	ld	a5,-56(s0)
    800069c2:	4398                	lw	a4,0(a5)
    800069c4:	478d                	li	a5,3
    800069c6:	06f71263          	bne	a4,a5,80006a2a <filestat+0x94>
    ilock(f->ip);
    800069ca:	fc843783          	ld	a5,-56(s0)
    800069ce:	6f9c                	ld	a5,24(a5)
    800069d0:	853e                	mv	a0,a5
    800069d2:	ffffe097          	auipc	ra,0xffffe
    800069d6:	7c8080e7          	jalr	1992(ra) # 8000519a <ilock>
    stati(f->ip, &st);
    800069da:	fc843783          	ld	a5,-56(s0)
    800069de:	6f9c                	ld	a5,24(a5)
    800069e0:	fd040713          	addi	a4,s0,-48
    800069e4:	85ba                	mv	a1,a4
    800069e6:	853e                	mv	a0,a5
    800069e8:	fffff097          	auipc	ra,0xfffff
    800069ec:	cfa080e7          	jalr	-774(ra) # 800056e2 <stati>
    iunlock(f->ip);
    800069f0:	fc843783          	ld	a5,-56(s0)
    800069f4:	6f9c                	ld	a5,24(a5)
    800069f6:	853e                	mv	a0,a5
    800069f8:	fffff097          	auipc	ra,0xfffff
    800069fc:	8d6080e7          	jalr	-1834(ra) # 800052ce <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006a00:	fe843783          	ld	a5,-24(s0)
    80006a04:	6bbc                	ld	a5,80(a5)
    80006a06:	fd040713          	addi	a4,s0,-48
    80006a0a:	46e1                	li	a3,24
    80006a0c:	863a                	mv	a2,a4
    80006a0e:	fc043583          	ld	a1,-64(s0)
    80006a12:	853e                	mv	a0,a5
    80006a14:	ffffc097          	auipc	ra,0xffffc
    80006a18:	966080e7          	jalr	-1690(ra) # 8000237a <copyout>
    80006a1c:	87aa                	mv	a5,a0
    80006a1e:	0007d463          	bgez	a5,80006a26 <filestat+0x90>
      return -1;
    80006a22:	57fd                	li	a5,-1
    80006a24:	a021                	j	80006a2c <filestat+0x96>
    return 0;
    80006a26:	4781                	li	a5,0
    80006a28:	a011                	j	80006a2c <filestat+0x96>
  }
  return -1;
    80006a2a:	57fd                	li	a5,-1
}
    80006a2c:	853e                	mv	a0,a5
    80006a2e:	70e2                	ld	ra,56(sp)
    80006a30:	7442                	ld	s0,48(sp)
    80006a32:	6121                	addi	sp,sp,64
    80006a34:	8082                	ret

0000000080006a36 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006a36:	7139                	addi	sp,sp,-64
    80006a38:	fc06                	sd	ra,56(sp)
    80006a3a:	f822                	sd	s0,48(sp)
    80006a3c:	0080                	addi	s0,sp,64
    80006a3e:	fca43c23          	sd	a0,-40(s0)
    80006a42:	fcb43823          	sd	a1,-48(s0)
    80006a46:	87b2                	mv	a5,a2
    80006a48:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006a4c:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006a50:	fd843783          	ld	a5,-40(s0)
    80006a54:	0087c783          	lbu	a5,8(a5)
    80006a58:	e399                	bnez	a5,80006a5e <fileread+0x28>
    return -1;
    80006a5a:	57fd                	li	a5,-1
    80006a5c:	a21d                	j	80006b82 <fileread+0x14c>

  if(f->type == FD_PIPE){
    80006a5e:	fd843783          	ld	a5,-40(s0)
    80006a62:	4398                	lw	a4,0(a5)
    80006a64:	4785                	li	a5,1
    80006a66:	02f71363          	bne	a4,a5,80006a8c <fileread+0x56>
    r = piperead(f->pipe, addr, n);
    80006a6a:	fd843783          	ld	a5,-40(s0)
    80006a6e:	6b9c                	ld	a5,16(a5)
    80006a70:	fcc42703          	lw	a4,-52(s0)
    80006a74:	863a                	mv	a2,a4
    80006a76:	fd043583          	ld	a1,-48(s0)
    80006a7a:	853e                	mv	a0,a5
    80006a7c:	00000097          	auipc	ra,0x0
    80006a80:	65e080e7          	jalr	1630(ra) # 800070da <piperead>
    80006a84:	87aa                	mv	a5,a0
    80006a86:	fef42623          	sw	a5,-20(s0)
    80006a8a:	a8d5                	j	80006b7e <fileread+0x148>
  } else if(f->type == FD_DEVICE){
    80006a8c:	fd843783          	ld	a5,-40(s0)
    80006a90:	4398                	lw	a4,0(a5)
    80006a92:	478d                	li	a5,3
    80006a94:	06f71363          	bne	a4,a5,80006afa <fileread+0xc4>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006a98:	fd843783          	ld	a5,-40(s0)
    80006a9c:	02479783          	lh	a5,36(a5)
    80006aa0:	0207c563          	bltz	a5,80006aca <fileread+0x94>
    80006aa4:	fd843783          	ld	a5,-40(s0)
    80006aa8:	02479703          	lh	a4,36(a5)
    80006aac:	47a5                	li	a5,9
    80006aae:	00e7ce63          	blt	a5,a4,80006aca <fileread+0x94>
    80006ab2:	fd843783          	ld	a5,-40(s0)
    80006ab6:	02479783          	lh	a5,36(a5)
    80006aba:	0001f717          	auipc	a4,0x1f
    80006abe:	77670713          	addi	a4,a4,1910 # 80026230 <devsw>
    80006ac2:	0792                	slli	a5,a5,0x4
    80006ac4:	97ba                	add	a5,a5,a4
    80006ac6:	639c                	ld	a5,0(a5)
    80006ac8:	e399                	bnez	a5,80006ace <fileread+0x98>
      return -1;
    80006aca:	57fd                	li	a5,-1
    80006acc:	a85d                	j	80006b82 <fileread+0x14c>
    r = devsw[f->major].read(1, addr, n);
    80006ace:	fd843783          	ld	a5,-40(s0)
    80006ad2:	02479783          	lh	a5,36(a5)
    80006ad6:	0001f717          	auipc	a4,0x1f
    80006ada:	75a70713          	addi	a4,a4,1882 # 80026230 <devsw>
    80006ade:	0792                	slli	a5,a5,0x4
    80006ae0:	97ba                	add	a5,a5,a4
    80006ae2:	639c                	ld	a5,0(a5)
    80006ae4:	fcc42703          	lw	a4,-52(s0)
    80006ae8:	863a                	mv	a2,a4
    80006aea:	fd043583          	ld	a1,-48(s0)
    80006aee:	4505                	li	a0,1
    80006af0:	9782                	jalr	a5
    80006af2:	87aa                	mv	a5,a0
    80006af4:	fef42623          	sw	a5,-20(s0)
    80006af8:	a059                	j	80006b7e <fileread+0x148>
  } else if(f->type == FD_INODE){
    80006afa:	fd843783          	ld	a5,-40(s0)
    80006afe:	4398                	lw	a4,0(a5)
    80006b00:	4789                	li	a5,2
    80006b02:	06f71663          	bne	a4,a5,80006b6e <fileread+0x138>
    ilock(f->ip);
    80006b06:	fd843783          	ld	a5,-40(s0)
    80006b0a:	6f9c                	ld	a5,24(a5)
    80006b0c:	853e                	mv	a0,a5
    80006b0e:	ffffe097          	auipc	ra,0xffffe
    80006b12:	68c080e7          	jalr	1676(ra) # 8000519a <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006b16:	fd843783          	ld	a5,-40(s0)
    80006b1a:	6f88                	ld	a0,24(a5)
    80006b1c:	fd843783          	ld	a5,-40(s0)
    80006b20:	539c                	lw	a5,32(a5)
    80006b22:	fcc42703          	lw	a4,-52(s0)
    80006b26:	86be                	mv	a3,a5
    80006b28:	fd043603          	ld	a2,-48(s0)
    80006b2c:	4585                	li	a1,1
    80006b2e:	fffff097          	auipc	ra,0xfffff
    80006b32:	c1a080e7          	jalr	-998(ra) # 80005748 <readi>
    80006b36:	87aa                	mv	a5,a0
    80006b38:	fef42623          	sw	a5,-20(s0)
    80006b3c:	fec42783          	lw	a5,-20(s0)
    80006b40:	2781                	sext.w	a5,a5
    80006b42:	00f05d63          	blez	a5,80006b5c <fileread+0x126>
      f->off += r;
    80006b46:	fd843783          	ld	a5,-40(s0)
    80006b4a:	5398                	lw	a4,32(a5)
    80006b4c:	fec42783          	lw	a5,-20(s0)
    80006b50:	9fb9                	addw	a5,a5,a4
    80006b52:	0007871b          	sext.w	a4,a5
    80006b56:	fd843783          	ld	a5,-40(s0)
    80006b5a:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006b5c:	fd843783          	ld	a5,-40(s0)
    80006b60:	6f9c                	ld	a5,24(a5)
    80006b62:	853e                	mv	a0,a5
    80006b64:	ffffe097          	auipc	ra,0xffffe
    80006b68:	76a080e7          	jalr	1898(ra) # 800052ce <iunlock>
    80006b6c:	a809                	j	80006b7e <fileread+0x148>
  } else {
    panic("fileread");
    80006b6e:	00005517          	auipc	a0,0x5
    80006b72:	a6a50513          	addi	a0,a0,-1430 # 8000b5d8 <etext+0x5d8>
    80006b76:	ffffa097          	auipc	ra,0xffffa
    80006b7a:	14a080e7          	jalr	330(ra) # 80000cc0 <panic>
  }

  return r;
    80006b7e:	fec42783          	lw	a5,-20(s0)
}
    80006b82:	853e                	mv	a0,a5
    80006b84:	70e2                	ld	ra,56(sp)
    80006b86:	7442                	ld	s0,48(sp)
    80006b88:	6121                	addi	sp,sp,64
    80006b8a:	8082                	ret

0000000080006b8c <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006b8c:	715d                	addi	sp,sp,-80
    80006b8e:	e486                	sd	ra,72(sp)
    80006b90:	e0a2                	sd	s0,64(sp)
    80006b92:	0880                	addi	s0,sp,80
    80006b94:	fca43423          	sd	a0,-56(s0)
    80006b98:	fcb43023          	sd	a1,-64(s0)
    80006b9c:	87b2                	mv	a5,a2
    80006b9e:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006ba2:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006ba6:	fc843783          	ld	a5,-56(s0)
    80006baa:	0097c783          	lbu	a5,9(a5)
    80006bae:	e399                	bnez	a5,80006bb4 <filewrite+0x28>
    return -1;
    80006bb0:	57fd                	li	a5,-1
    80006bb2:	aac1                	j	80006d82 <filewrite+0x1f6>

  if(f->type == FD_PIPE){
    80006bb4:	fc843783          	ld	a5,-56(s0)
    80006bb8:	4398                	lw	a4,0(a5)
    80006bba:	4785                	li	a5,1
    80006bbc:	02f71363          	bne	a4,a5,80006be2 <filewrite+0x56>
    ret = pipewrite(f->pipe, addr, n);
    80006bc0:	fc843783          	ld	a5,-56(s0)
    80006bc4:	6b9c                	ld	a5,16(a5)
    80006bc6:	fbc42703          	lw	a4,-68(s0)
    80006bca:	863a                	mv	a2,a4
    80006bcc:	fc043583          	ld	a1,-64(s0)
    80006bd0:	853e                	mv	a0,a5
    80006bd2:	00000097          	auipc	ra,0x0
    80006bd6:	3b6080e7          	jalr	950(ra) # 80006f88 <pipewrite>
    80006bda:	87aa                	mv	a5,a0
    80006bdc:	fef42623          	sw	a5,-20(s0)
    80006be0:	aa79                	j	80006d7e <filewrite+0x1f2>
  } else if(f->type == FD_DEVICE){
    80006be2:	fc843783          	ld	a5,-56(s0)
    80006be6:	4398                	lw	a4,0(a5)
    80006be8:	478d                	li	a5,3
    80006bea:	06f71363          	bne	a4,a5,80006c50 <filewrite+0xc4>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006bee:	fc843783          	ld	a5,-56(s0)
    80006bf2:	02479783          	lh	a5,36(a5)
    80006bf6:	0207c563          	bltz	a5,80006c20 <filewrite+0x94>
    80006bfa:	fc843783          	ld	a5,-56(s0)
    80006bfe:	02479703          	lh	a4,36(a5)
    80006c02:	47a5                	li	a5,9
    80006c04:	00e7ce63          	blt	a5,a4,80006c20 <filewrite+0x94>
    80006c08:	fc843783          	ld	a5,-56(s0)
    80006c0c:	02479783          	lh	a5,36(a5)
    80006c10:	0001f717          	auipc	a4,0x1f
    80006c14:	62070713          	addi	a4,a4,1568 # 80026230 <devsw>
    80006c18:	0792                	slli	a5,a5,0x4
    80006c1a:	97ba                	add	a5,a5,a4
    80006c1c:	679c                	ld	a5,8(a5)
    80006c1e:	e399                	bnez	a5,80006c24 <filewrite+0x98>
      return -1;
    80006c20:	57fd                	li	a5,-1
    80006c22:	a285                	j	80006d82 <filewrite+0x1f6>
    ret = devsw[f->major].write(1, addr, n);
    80006c24:	fc843783          	ld	a5,-56(s0)
    80006c28:	02479783          	lh	a5,36(a5)
    80006c2c:	0001f717          	auipc	a4,0x1f
    80006c30:	60470713          	addi	a4,a4,1540 # 80026230 <devsw>
    80006c34:	0792                	slli	a5,a5,0x4
    80006c36:	97ba                	add	a5,a5,a4
    80006c38:	679c                	ld	a5,8(a5)
    80006c3a:	fbc42703          	lw	a4,-68(s0)
    80006c3e:	863a                	mv	a2,a4
    80006c40:	fc043583          	ld	a1,-64(s0)
    80006c44:	4505                	li	a0,1
    80006c46:	9782                	jalr	a5
    80006c48:	87aa                	mv	a5,a0
    80006c4a:	fef42623          	sw	a5,-20(s0)
    80006c4e:	aa05                	j	80006d7e <filewrite+0x1f2>
  } else if(f->type == FD_INODE){
    80006c50:	fc843783          	ld	a5,-56(s0)
    80006c54:	4398                	lw	a4,0(a5)
    80006c56:	4789                	li	a5,2
    80006c58:	10f71b63          	bne	a4,a5,80006d6e <filewrite+0x1e2>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006c5c:	6785                	lui	a5,0x1
    80006c5e:	c0078793          	addi	a5,a5,-1024 # c00 <_entry-0x7ffff400>
    80006c62:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006c66:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006c6a:	a0f9                	j	80006d38 <filewrite+0x1ac>
      int n1 = n - i;
    80006c6c:	fbc42783          	lw	a5,-68(s0)
    80006c70:	873e                	mv	a4,a5
    80006c72:	fe842783          	lw	a5,-24(s0)
    80006c76:	40f707bb          	subw	a5,a4,a5
    80006c7a:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006c7e:	fe442783          	lw	a5,-28(s0)
    80006c82:	873e                	mv	a4,a5
    80006c84:	fe042783          	lw	a5,-32(s0)
    80006c88:	2701                	sext.w	a4,a4
    80006c8a:	2781                	sext.w	a5,a5
    80006c8c:	00e7d663          	bge	a5,a4,80006c98 <filewrite+0x10c>
        n1 = max;
    80006c90:	fe042783          	lw	a5,-32(s0)
    80006c94:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006c98:	fffff097          	auipc	ra,0xfffff
    80006c9c:	572080e7          	jalr	1394(ra) # 8000620a <begin_op>
      ilock(f->ip);
    80006ca0:	fc843783          	ld	a5,-56(s0)
    80006ca4:	6f9c                	ld	a5,24(a5)
    80006ca6:	853e                	mv	a0,a5
    80006ca8:	ffffe097          	auipc	ra,0xffffe
    80006cac:	4f2080e7          	jalr	1266(ra) # 8000519a <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006cb0:	fc843783          	ld	a5,-56(s0)
    80006cb4:	6f88                	ld	a0,24(a5)
    80006cb6:	fe842703          	lw	a4,-24(s0)
    80006cba:	fc043783          	ld	a5,-64(s0)
    80006cbe:	00f70633          	add	a2,a4,a5
    80006cc2:	fc843783          	ld	a5,-56(s0)
    80006cc6:	539c                	lw	a5,32(a5)
    80006cc8:	fe442703          	lw	a4,-28(s0)
    80006ccc:	86be                	mv	a3,a5
    80006cce:	4585                	li	a1,1
    80006cd0:	fffff097          	auipc	ra,0xfffff
    80006cd4:	c14080e7          	jalr	-1004(ra) # 800058e4 <writei>
    80006cd8:	87aa                	mv	a5,a0
    80006cda:	fcf42e23          	sw	a5,-36(s0)
    80006cde:	fdc42783          	lw	a5,-36(s0)
    80006ce2:	2781                	sext.w	a5,a5
    80006ce4:	00f05d63          	blez	a5,80006cfe <filewrite+0x172>
        f->off += r;
    80006ce8:	fc843783          	ld	a5,-56(s0)
    80006cec:	5398                	lw	a4,32(a5)
    80006cee:	fdc42783          	lw	a5,-36(s0)
    80006cf2:	9fb9                	addw	a5,a5,a4
    80006cf4:	0007871b          	sext.w	a4,a5
    80006cf8:	fc843783          	ld	a5,-56(s0)
    80006cfc:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006cfe:	fc843783          	ld	a5,-56(s0)
    80006d02:	6f9c                	ld	a5,24(a5)
    80006d04:	853e                	mv	a0,a5
    80006d06:	ffffe097          	auipc	ra,0xffffe
    80006d0a:	5c8080e7          	jalr	1480(ra) # 800052ce <iunlock>
      end_op();
    80006d0e:	fffff097          	auipc	ra,0xfffff
    80006d12:	5be080e7          	jalr	1470(ra) # 800062cc <end_op>

      if(r != n1){
    80006d16:	fdc42783          	lw	a5,-36(s0)
    80006d1a:	873e                	mv	a4,a5
    80006d1c:	fe442783          	lw	a5,-28(s0)
    80006d20:	2701                	sext.w	a4,a4
    80006d22:	2781                	sext.w	a5,a5
    80006d24:	02f71463          	bne	a4,a5,80006d4c <filewrite+0x1c0>
        // error from writei
        break;
      }
      i += r;
    80006d28:	fe842783          	lw	a5,-24(s0)
    80006d2c:	873e                	mv	a4,a5
    80006d2e:	fdc42783          	lw	a5,-36(s0)
    80006d32:	9fb9                	addw	a5,a5,a4
    80006d34:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006d38:	fe842783          	lw	a5,-24(s0)
    80006d3c:	873e                	mv	a4,a5
    80006d3e:	fbc42783          	lw	a5,-68(s0)
    80006d42:	2701                	sext.w	a4,a4
    80006d44:	2781                	sext.w	a5,a5
    80006d46:	f2f743e3          	blt	a4,a5,80006c6c <filewrite+0xe0>
    80006d4a:	a011                	j	80006d4e <filewrite+0x1c2>
        break;
    80006d4c:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006d4e:	fe842783          	lw	a5,-24(s0)
    80006d52:	873e                	mv	a4,a5
    80006d54:	fbc42783          	lw	a5,-68(s0)
    80006d58:	2701                	sext.w	a4,a4
    80006d5a:	2781                	sext.w	a5,a5
    80006d5c:	00f71563          	bne	a4,a5,80006d66 <filewrite+0x1da>
    80006d60:	fbc42783          	lw	a5,-68(s0)
    80006d64:	a011                	j	80006d68 <filewrite+0x1dc>
    80006d66:	57fd                	li	a5,-1
    80006d68:	fef42623          	sw	a5,-20(s0)
    80006d6c:	a809                	j	80006d7e <filewrite+0x1f2>
  } else {
    panic("filewrite");
    80006d6e:	00005517          	auipc	a0,0x5
    80006d72:	87a50513          	addi	a0,a0,-1926 # 8000b5e8 <etext+0x5e8>
    80006d76:	ffffa097          	auipc	ra,0xffffa
    80006d7a:	f4a080e7          	jalr	-182(ra) # 80000cc0 <panic>
  }

  return ret;
    80006d7e:	fec42783          	lw	a5,-20(s0)
}
    80006d82:	853e                	mv	a0,a5
    80006d84:	60a6                	ld	ra,72(sp)
    80006d86:	6406                	ld	s0,64(sp)
    80006d88:	6161                	addi	sp,sp,80
    80006d8a:	8082                	ret

0000000080006d8c <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006d8c:	7179                	addi	sp,sp,-48
    80006d8e:	f406                	sd	ra,40(sp)
    80006d90:	f022                	sd	s0,32(sp)
    80006d92:	1800                	addi	s0,sp,48
    80006d94:	fca43c23          	sd	a0,-40(s0)
    80006d98:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006d9c:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006da0:	fd043783          	ld	a5,-48(s0)
    80006da4:	0007b023          	sd	zero,0(a5)
    80006da8:	fd043783          	ld	a5,-48(s0)
    80006dac:	6398                	ld	a4,0(a5)
    80006dae:	fd843783          	ld	a5,-40(s0)
    80006db2:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006db4:	00000097          	auipc	ra,0x0
    80006db8:	9f6080e7          	jalr	-1546(ra) # 800067aa <filealloc>
    80006dbc:	872a                	mv	a4,a0
    80006dbe:	fd843783          	ld	a5,-40(s0)
    80006dc2:	e398                	sd	a4,0(a5)
    80006dc4:	fd843783          	ld	a5,-40(s0)
    80006dc8:	639c                	ld	a5,0(a5)
    80006dca:	c3e9                	beqz	a5,80006e8c <pipealloc+0x100>
    80006dcc:	00000097          	auipc	ra,0x0
    80006dd0:	9de080e7          	jalr	-1570(ra) # 800067aa <filealloc>
    80006dd4:	872a                	mv	a4,a0
    80006dd6:	fd043783          	ld	a5,-48(s0)
    80006dda:	e398                	sd	a4,0(a5)
    80006ddc:	fd043783          	ld	a5,-48(s0)
    80006de0:	639c                	ld	a5,0(a5)
    80006de2:	c7cd                	beqz	a5,80006e8c <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006de4:	ffffa097          	auipc	ra,0xffffa
    80006de8:	380080e7          	jalr	896(ra) # 80001164 <kalloc>
    80006dec:	fea43423          	sd	a0,-24(s0)
    80006df0:	fe843783          	ld	a5,-24(s0)
    80006df4:	cfd1                	beqz	a5,80006e90 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006df6:	fe843783          	ld	a5,-24(s0)
    80006dfa:	4705                	li	a4,1
    80006dfc:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006e00:	fe843783          	ld	a5,-24(s0)
    80006e04:	4705                	li	a4,1
    80006e06:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006e0a:	fe843783          	ld	a5,-24(s0)
    80006e0e:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006e12:	fe843783          	ld	a5,-24(s0)
    80006e16:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006e1a:	fe843783          	ld	a5,-24(s0)
    80006e1e:	00004597          	auipc	a1,0x4
    80006e22:	7da58593          	addi	a1,a1,2010 # 8000b5f8 <etext+0x5f8>
    80006e26:	853e                	mv	a0,a5
    80006e28:	ffffa097          	auipc	ra,0xffffa
    80006e2c:	468080e7          	jalr	1128(ra) # 80001290 <initlock>
  (*f0)->type = FD_PIPE;
    80006e30:	fd843783          	ld	a5,-40(s0)
    80006e34:	639c                	ld	a5,0(a5)
    80006e36:	4705                	li	a4,1
    80006e38:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006e3a:	fd843783          	ld	a5,-40(s0)
    80006e3e:	639c                	ld	a5,0(a5)
    80006e40:	4705                	li	a4,1
    80006e42:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006e46:	fd843783          	ld	a5,-40(s0)
    80006e4a:	639c                	ld	a5,0(a5)
    80006e4c:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006e50:	fd843783          	ld	a5,-40(s0)
    80006e54:	639c                	ld	a5,0(a5)
    80006e56:	fe843703          	ld	a4,-24(s0)
    80006e5a:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80006e5c:	fd043783          	ld	a5,-48(s0)
    80006e60:	639c                	ld	a5,0(a5)
    80006e62:	4705                	li	a4,1
    80006e64:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80006e66:	fd043783          	ld	a5,-48(s0)
    80006e6a:	639c                	ld	a5,0(a5)
    80006e6c:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80006e70:	fd043783          	ld	a5,-48(s0)
    80006e74:	639c                	ld	a5,0(a5)
    80006e76:	4705                	li	a4,1
    80006e78:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80006e7c:	fd043783          	ld	a5,-48(s0)
    80006e80:	639c                	ld	a5,0(a5)
    80006e82:	fe843703          	ld	a4,-24(s0)
    80006e86:	eb98                	sd	a4,16(a5)
  return 0;
    80006e88:	4781                	li	a5,0
    80006e8a:	a0b1                	j	80006ed6 <pipealloc+0x14a>
    goto bad;
    80006e8c:	0001                	nop
    80006e8e:	a011                	j	80006e92 <pipealloc+0x106>
    goto bad;
    80006e90:	0001                	nop

 bad:
  if(pi)
    80006e92:	fe843783          	ld	a5,-24(s0)
    80006e96:	c799                	beqz	a5,80006ea4 <pipealloc+0x118>
    kfree((char*)pi);
    80006e98:	fe843503          	ld	a0,-24(s0)
    80006e9c:	ffffa097          	auipc	ra,0xffffa
    80006ea0:	224080e7          	jalr	548(ra) # 800010c0 <kfree>
  if(*f0)
    80006ea4:	fd843783          	ld	a5,-40(s0)
    80006ea8:	639c                	ld	a5,0(a5)
    80006eaa:	cb89                	beqz	a5,80006ebc <pipealloc+0x130>
    fileclose(*f0);
    80006eac:	fd843783          	ld	a5,-40(s0)
    80006eb0:	639c                	ld	a5,0(a5)
    80006eb2:	853e                	mv	a0,a5
    80006eb4:	00000097          	auipc	ra,0x0
    80006eb8:	9e0080e7          	jalr	-1568(ra) # 80006894 <fileclose>
  if(*f1)
    80006ebc:	fd043783          	ld	a5,-48(s0)
    80006ec0:	639c                	ld	a5,0(a5)
    80006ec2:	cb89                	beqz	a5,80006ed4 <pipealloc+0x148>
    fileclose(*f1);
    80006ec4:	fd043783          	ld	a5,-48(s0)
    80006ec8:	639c                	ld	a5,0(a5)
    80006eca:	853e                	mv	a0,a5
    80006ecc:	00000097          	auipc	ra,0x0
    80006ed0:	9c8080e7          	jalr	-1592(ra) # 80006894 <fileclose>
  return -1;
    80006ed4:	57fd                	li	a5,-1
}
    80006ed6:	853e                	mv	a0,a5
    80006ed8:	70a2                	ld	ra,40(sp)
    80006eda:	7402                	ld	s0,32(sp)
    80006edc:	6145                	addi	sp,sp,48
    80006ede:	8082                	ret

0000000080006ee0 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80006ee0:	1101                	addi	sp,sp,-32
    80006ee2:	ec06                	sd	ra,24(sp)
    80006ee4:	e822                	sd	s0,16(sp)
    80006ee6:	1000                	addi	s0,sp,32
    80006ee8:	fea43423          	sd	a0,-24(s0)
    80006eec:	87ae                	mv	a5,a1
    80006eee:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80006ef2:	fe843783          	ld	a5,-24(s0)
    80006ef6:	853e                	mv	a0,a5
    80006ef8:	ffffa097          	auipc	ra,0xffffa
    80006efc:	3cc080e7          	jalr	972(ra) # 800012c4 <acquire>
  if(writable){
    80006f00:	fe442783          	lw	a5,-28(s0)
    80006f04:	2781                	sext.w	a5,a5
    80006f06:	cf99                	beqz	a5,80006f24 <pipeclose+0x44>
    pi->writeopen = 0;
    80006f08:	fe843783          	ld	a5,-24(s0)
    80006f0c:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80006f10:	fe843783          	ld	a5,-24(s0)
    80006f14:	21878793          	addi	a5,a5,536
    80006f18:	853e                	mv	a0,a5
    80006f1a:	ffffc097          	auipc	ra,0xffffc
    80006f1e:	5d8080e7          	jalr	1496(ra) # 800034f2 <wakeup>
    80006f22:	a831                	j	80006f3e <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80006f24:	fe843783          	ld	a5,-24(s0)
    80006f28:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80006f2c:	fe843783          	ld	a5,-24(s0)
    80006f30:	21c78793          	addi	a5,a5,540
    80006f34:	853e                	mv	a0,a5
    80006f36:	ffffc097          	auipc	ra,0xffffc
    80006f3a:	5bc080e7          	jalr	1468(ra) # 800034f2 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80006f3e:	fe843783          	ld	a5,-24(s0)
    80006f42:	2207a783          	lw	a5,544(a5)
    80006f46:	e785                	bnez	a5,80006f6e <pipeclose+0x8e>
    80006f48:	fe843783          	ld	a5,-24(s0)
    80006f4c:	2247a783          	lw	a5,548(a5)
    80006f50:	ef99                	bnez	a5,80006f6e <pipeclose+0x8e>
    release(&pi->lock);
    80006f52:	fe843783          	ld	a5,-24(s0)
    80006f56:	853e                	mv	a0,a5
    80006f58:	ffffa097          	auipc	ra,0xffffa
    80006f5c:	3d0080e7          	jalr	976(ra) # 80001328 <release>
    kfree((char*)pi);
    80006f60:	fe843503          	ld	a0,-24(s0)
    80006f64:	ffffa097          	auipc	ra,0xffffa
    80006f68:	15c080e7          	jalr	348(ra) # 800010c0 <kfree>
    80006f6c:	a809                	j	80006f7e <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80006f6e:	fe843783          	ld	a5,-24(s0)
    80006f72:	853e                	mv	a0,a5
    80006f74:	ffffa097          	auipc	ra,0xffffa
    80006f78:	3b4080e7          	jalr	948(ra) # 80001328 <release>
}
    80006f7c:	0001                	nop
    80006f7e:	0001                	nop
    80006f80:	60e2                	ld	ra,24(sp)
    80006f82:	6442                	ld	s0,16(sp)
    80006f84:	6105                	addi	sp,sp,32
    80006f86:	8082                	ret

0000000080006f88 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80006f88:	715d                	addi	sp,sp,-80
    80006f8a:	e486                	sd	ra,72(sp)
    80006f8c:	e0a2                	sd	s0,64(sp)
    80006f8e:	0880                	addi	s0,sp,80
    80006f90:	fca43423          	sd	a0,-56(s0)
    80006f94:	fcb43023          	sd	a1,-64(s0)
    80006f98:	87b2                	mv	a5,a2
    80006f9a:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80006f9e:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80006fa2:	ffffc097          	auipc	ra,0xffffc
    80006fa6:	91a080e7          	jalr	-1766(ra) # 800028bc <myproc>
    80006faa:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80006fae:	fc843783          	ld	a5,-56(s0)
    80006fb2:	853e                	mv	a0,a5
    80006fb4:	ffffa097          	auipc	ra,0xffffa
    80006fb8:	310080e7          	jalr	784(ra) # 800012c4 <acquire>
  while(i < n){
    80006fbc:	a8e9                	j	80007096 <pipewrite+0x10e>
    if(pi->readopen == 0 || killed(pr)){
    80006fbe:	fc843783          	ld	a5,-56(s0)
    80006fc2:	2207a783          	lw	a5,544(a5)
    80006fc6:	cb89                	beqz	a5,80006fd8 <pipewrite+0x50>
    80006fc8:	fe043503          	ld	a0,-32(s0)
    80006fcc:	ffffc097          	auipc	ra,0xffffc
    80006fd0:	690080e7          	jalr	1680(ra) # 8000365c <killed>
    80006fd4:	87aa                	mv	a5,a0
    80006fd6:	cb91                	beqz	a5,80006fea <pipewrite+0x62>
      release(&pi->lock);
    80006fd8:	fc843783          	ld	a5,-56(s0)
    80006fdc:	853e                	mv	a0,a5
    80006fde:	ffffa097          	auipc	ra,0xffffa
    80006fe2:	34a080e7          	jalr	842(ra) # 80001328 <release>
      return -1;
    80006fe6:	57fd                	li	a5,-1
    80006fe8:	a0e5                	j	800070d0 <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80006fea:	fc843783          	ld	a5,-56(s0)
    80006fee:	21c7a703          	lw	a4,540(a5)
    80006ff2:	fc843783          	ld	a5,-56(s0)
    80006ff6:	2187a783          	lw	a5,536(a5)
    80006ffa:	2007879b          	addiw	a5,a5,512
    80006ffe:	2781                	sext.w	a5,a5
    80007000:	02f71863          	bne	a4,a5,80007030 <pipewrite+0xa8>
      wakeup(&pi->nread);
    80007004:	fc843783          	ld	a5,-56(s0)
    80007008:	21878793          	addi	a5,a5,536
    8000700c:	853e                	mv	a0,a5
    8000700e:	ffffc097          	auipc	ra,0xffffc
    80007012:	4e4080e7          	jalr	1252(ra) # 800034f2 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80007016:	fc843783          	ld	a5,-56(s0)
    8000701a:	21c78793          	addi	a5,a5,540
    8000701e:	fc843703          	ld	a4,-56(s0)
    80007022:	85ba                	mv	a1,a4
    80007024:	853e                	mv	a0,a5
    80007026:	ffffc097          	auipc	ra,0xffffc
    8000702a:	450080e7          	jalr	1104(ra) # 80003476 <sleep>
    8000702e:	a0a5                	j	80007096 <pipewrite+0x10e>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80007030:	fe043783          	ld	a5,-32(s0)
    80007034:	6ba8                	ld	a0,80(a5)
    80007036:	fec42703          	lw	a4,-20(s0)
    8000703a:	fc043783          	ld	a5,-64(s0)
    8000703e:	973e                	add	a4,a4,a5
    80007040:	fdf40793          	addi	a5,s0,-33
    80007044:	4685                	li	a3,1
    80007046:	863a                	mv	a2,a4
    80007048:	85be                	mv	a1,a5
    8000704a:	ffffb097          	auipc	ra,0xffffb
    8000704e:	3fe080e7          	jalr	1022(ra) # 80002448 <copyin>
    80007052:	87aa                	mv	a5,a0
    80007054:	873e                	mv	a4,a5
    80007056:	57fd                	li	a5,-1
    80007058:	04f70963          	beq	a4,a5,800070aa <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8000705c:	fc843783          	ld	a5,-56(s0)
    80007060:	21c7a783          	lw	a5,540(a5)
    80007064:	0017871b          	addiw	a4,a5,1
    80007068:	0007069b          	sext.w	a3,a4
    8000706c:	fc843703          	ld	a4,-56(s0)
    80007070:	20d72e23          	sw	a3,540(a4)
    80007074:	1ff7f793          	andi	a5,a5,511
    80007078:	2781                	sext.w	a5,a5
    8000707a:	fdf44703          	lbu	a4,-33(s0)
    8000707e:	fc843683          	ld	a3,-56(s0)
    80007082:	1782                	slli	a5,a5,0x20
    80007084:	9381                	srli	a5,a5,0x20
    80007086:	97b6                	add	a5,a5,a3
    80007088:	00e78c23          	sb	a4,24(a5)
      i++;
    8000708c:	fec42783          	lw	a5,-20(s0)
    80007090:	2785                	addiw	a5,a5,1
    80007092:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80007096:	fec42783          	lw	a5,-20(s0)
    8000709a:	873e                	mv	a4,a5
    8000709c:	fbc42783          	lw	a5,-68(s0)
    800070a0:	2701                	sext.w	a4,a4
    800070a2:	2781                	sext.w	a5,a5
    800070a4:	f0f74de3          	blt	a4,a5,80006fbe <pipewrite+0x36>
    800070a8:	a011                	j	800070ac <pipewrite+0x124>
        break;
    800070aa:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    800070ac:	fc843783          	ld	a5,-56(s0)
    800070b0:	21878793          	addi	a5,a5,536
    800070b4:	853e                	mv	a0,a5
    800070b6:	ffffc097          	auipc	ra,0xffffc
    800070ba:	43c080e7          	jalr	1084(ra) # 800034f2 <wakeup>
  release(&pi->lock);
    800070be:	fc843783          	ld	a5,-56(s0)
    800070c2:	853e                	mv	a0,a5
    800070c4:	ffffa097          	auipc	ra,0xffffa
    800070c8:	264080e7          	jalr	612(ra) # 80001328 <release>

  return i;
    800070cc:	fec42783          	lw	a5,-20(s0)
}
    800070d0:	853e                	mv	a0,a5
    800070d2:	60a6                	ld	ra,72(sp)
    800070d4:	6406                	ld	s0,64(sp)
    800070d6:	6161                	addi	sp,sp,80
    800070d8:	8082                	ret

00000000800070da <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    800070da:	715d                	addi	sp,sp,-80
    800070dc:	e486                	sd	ra,72(sp)
    800070de:	e0a2                	sd	s0,64(sp)
    800070e0:	0880                	addi	s0,sp,80
    800070e2:	fca43423          	sd	a0,-56(s0)
    800070e6:	fcb43023          	sd	a1,-64(s0)
    800070ea:	87b2                	mv	a5,a2
    800070ec:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    800070f0:	ffffb097          	auipc	ra,0xffffb
    800070f4:	7cc080e7          	jalr	1996(ra) # 800028bc <myproc>
    800070f8:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800070fc:	fc843783          	ld	a5,-56(s0)
    80007100:	853e                	mv	a0,a5
    80007102:	ffffa097          	auipc	ra,0xffffa
    80007106:	1c2080e7          	jalr	450(ra) # 800012c4 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000710a:	a835                	j	80007146 <piperead+0x6c>
    if(killed(pr)){
    8000710c:	fe043503          	ld	a0,-32(s0)
    80007110:	ffffc097          	auipc	ra,0xffffc
    80007114:	54c080e7          	jalr	1356(ra) # 8000365c <killed>
    80007118:	87aa                	mv	a5,a0
    8000711a:	cb91                	beqz	a5,8000712e <piperead+0x54>
      release(&pi->lock);
    8000711c:	fc843783          	ld	a5,-56(s0)
    80007120:	853e                	mv	a0,a5
    80007122:	ffffa097          	auipc	ra,0xffffa
    80007126:	206080e7          	jalr	518(ra) # 80001328 <release>
      return -1;
    8000712a:	57fd                	li	a5,-1
    8000712c:	a8dd                	j	80007222 <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8000712e:	fc843783          	ld	a5,-56(s0)
    80007132:	21878793          	addi	a5,a5,536
    80007136:	fc843703          	ld	a4,-56(s0)
    8000713a:	85ba                	mv	a1,a4
    8000713c:	853e                	mv	a0,a5
    8000713e:	ffffc097          	auipc	ra,0xffffc
    80007142:	338080e7          	jalr	824(ra) # 80003476 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007146:	fc843783          	ld	a5,-56(s0)
    8000714a:	2187a703          	lw	a4,536(a5)
    8000714e:	fc843783          	ld	a5,-56(s0)
    80007152:	21c7a783          	lw	a5,540(a5)
    80007156:	00f71763          	bne	a4,a5,80007164 <piperead+0x8a>
    8000715a:	fc843783          	ld	a5,-56(s0)
    8000715e:	2247a783          	lw	a5,548(a5)
    80007162:	f7cd                	bnez	a5,8000710c <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007164:	fe042623          	sw	zero,-20(s0)
    80007168:	a8b5                	j	800071e4 <piperead+0x10a>
    if(pi->nread == pi->nwrite)
    8000716a:	fc843783          	ld	a5,-56(s0)
    8000716e:	2187a703          	lw	a4,536(a5)
    80007172:	fc843783          	ld	a5,-56(s0)
    80007176:	21c7a783          	lw	a5,540(a5)
    8000717a:	06f70f63          	beq	a4,a5,800071f8 <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    8000717e:	fc843783          	ld	a5,-56(s0)
    80007182:	2187a783          	lw	a5,536(a5)
    80007186:	0017871b          	addiw	a4,a5,1
    8000718a:	0007069b          	sext.w	a3,a4
    8000718e:	fc843703          	ld	a4,-56(s0)
    80007192:	20d72c23          	sw	a3,536(a4)
    80007196:	1ff7f793          	andi	a5,a5,511
    8000719a:	2781                	sext.w	a5,a5
    8000719c:	fc843703          	ld	a4,-56(s0)
    800071a0:	1782                	slli	a5,a5,0x20
    800071a2:	9381                	srli	a5,a5,0x20
    800071a4:	97ba                	add	a5,a5,a4
    800071a6:	0187c783          	lbu	a5,24(a5)
    800071aa:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    800071ae:	fe043783          	ld	a5,-32(s0)
    800071b2:	6ba8                	ld	a0,80(a5)
    800071b4:	fec42703          	lw	a4,-20(s0)
    800071b8:	fc043783          	ld	a5,-64(s0)
    800071bc:	97ba                	add	a5,a5,a4
    800071be:	fdf40713          	addi	a4,s0,-33
    800071c2:	4685                	li	a3,1
    800071c4:	863a                	mv	a2,a4
    800071c6:	85be                	mv	a1,a5
    800071c8:	ffffb097          	auipc	ra,0xffffb
    800071cc:	1b2080e7          	jalr	434(ra) # 8000237a <copyout>
    800071d0:	87aa                	mv	a5,a0
    800071d2:	873e                	mv	a4,a5
    800071d4:	57fd                	li	a5,-1
    800071d6:	02f70363          	beq	a4,a5,800071fc <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800071da:	fec42783          	lw	a5,-20(s0)
    800071de:	2785                	addiw	a5,a5,1
    800071e0:	fef42623          	sw	a5,-20(s0)
    800071e4:	fec42783          	lw	a5,-20(s0)
    800071e8:	873e                	mv	a4,a5
    800071ea:	fbc42783          	lw	a5,-68(s0)
    800071ee:	2701                	sext.w	a4,a4
    800071f0:	2781                	sext.w	a5,a5
    800071f2:	f6f74ce3          	blt	a4,a5,8000716a <piperead+0x90>
    800071f6:	a021                	j	800071fe <piperead+0x124>
      break;
    800071f8:	0001                	nop
    800071fa:	a011                	j	800071fe <piperead+0x124>
      break;
    800071fc:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800071fe:	fc843783          	ld	a5,-56(s0)
    80007202:	21c78793          	addi	a5,a5,540
    80007206:	853e                	mv	a0,a5
    80007208:	ffffc097          	auipc	ra,0xffffc
    8000720c:	2ea080e7          	jalr	746(ra) # 800034f2 <wakeup>
  release(&pi->lock);
    80007210:	fc843783          	ld	a5,-56(s0)
    80007214:	853e                	mv	a0,a5
    80007216:	ffffa097          	auipc	ra,0xffffa
    8000721a:	112080e7          	jalr	274(ra) # 80001328 <release>
  return i;
    8000721e:	fec42783          	lw	a5,-20(s0)
}
    80007222:	853e                	mv	a0,a5
    80007224:	60a6                	ld	ra,72(sp)
    80007226:	6406                	ld	s0,64(sp)
    80007228:	6161                	addi	sp,sp,80
    8000722a:	8082                	ret

000000008000722c <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    8000722c:	7179                	addi	sp,sp,-48
    8000722e:	f406                	sd	ra,40(sp)
    80007230:	f022                	sd	s0,32(sp)
    80007232:	1800                	addi	s0,sp,48
    80007234:	87aa                	mv	a5,a0
    80007236:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    8000723a:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    8000723e:	fdc42783          	lw	a5,-36(s0)
    80007242:	8b85                	andi	a5,a5,1
    80007244:	2781                	sext.w	a5,a5
    80007246:	c781                	beqz	a5,8000724e <flags2perm+0x22>
      perm = PTE_X;
    80007248:	47a1                	li	a5,8
    8000724a:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    8000724e:	fdc42783          	lw	a5,-36(s0)
    80007252:	8b89                	andi	a5,a5,2
    80007254:	2781                	sext.w	a5,a5
    80007256:	c799                	beqz	a5,80007264 <flags2perm+0x38>
      perm |= PTE_W;
    80007258:	fec42783          	lw	a5,-20(s0)
    8000725c:	0047e793          	ori	a5,a5,4
    80007260:	fef42623          	sw	a5,-20(s0)
    return perm;
    80007264:	fec42783          	lw	a5,-20(s0)
}
    80007268:	853e                	mv	a0,a5
    8000726a:	70a2                	ld	ra,40(sp)
    8000726c:	7402                	ld	s0,32(sp)
    8000726e:	6145                	addi	sp,sp,48
    80007270:	8082                	ret

0000000080007272 <exec>:

int
exec(char *path, char **argv)
{
    80007272:	de010113          	addi	sp,sp,-544
    80007276:	20113c23          	sd	ra,536(sp)
    8000727a:	20813823          	sd	s0,528(sp)
    8000727e:	20913423          	sd	s1,520(sp)
    80007282:	1400                	addi	s0,sp,544
    80007284:	dea43423          	sd	a0,-536(s0)
    80007288:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    8000728c:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007290:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007294:	ffffb097          	auipc	ra,0xffffb
    80007298:	628080e7          	jalr	1576(ra) # 800028bc <myproc>
    8000729c:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    800072a0:	fffff097          	auipc	ra,0xfffff
    800072a4:	f6a080e7          	jalr	-150(ra) # 8000620a <begin_op>

  if((ip = namei(path)) == 0){
    800072a8:	de843503          	ld	a0,-536(s0)
    800072ac:	fffff097          	auipc	ra,0xfffff
    800072b0:	c0e080e7          	jalr	-1010(ra) # 80005eba <namei>
    800072b4:	faa43423          	sd	a0,-88(s0)
    800072b8:	fa843783          	ld	a5,-88(s0)
    800072bc:	e799                	bnez	a5,800072ca <exec+0x58>
    end_op();
    800072be:	fffff097          	auipc	ra,0xfffff
    800072c2:	00e080e7          	jalr	14(ra) # 800062cc <end_op>
    return -1;
    800072c6:	57fd                	li	a5,-1
    800072c8:	a181                	j	80007708 <exec+0x496>
  }
  ilock(ip);
    800072ca:	fa843503          	ld	a0,-88(s0)
    800072ce:	ffffe097          	auipc	ra,0xffffe
    800072d2:	ecc080e7          	jalr	-308(ra) # 8000519a <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800072d6:	e3040793          	addi	a5,s0,-464
    800072da:	04000713          	li	a4,64
    800072de:	4681                	li	a3,0
    800072e0:	863e                	mv	a2,a5
    800072e2:	4581                	li	a1,0
    800072e4:	fa843503          	ld	a0,-88(s0)
    800072e8:	ffffe097          	auipc	ra,0xffffe
    800072ec:	460080e7          	jalr	1120(ra) # 80005748 <readi>
    800072f0:	87aa                	mv	a5,a0
    800072f2:	873e                	mv	a4,a5
    800072f4:	04000793          	li	a5,64
    800072f8:	3af71263          	bne	a4,a5,8000769c <exec+0x42a>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    800072fc:	e3042703          	lw	a4,-464(s0)
    80007300:	464c47b7          	lui	a5,0x464c4
    80007304:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80007308:	38f71c63          	bne	a4,a5,800076a0 <exec+0x42e>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    8000730c:	f9843503          	ld	a0,-104(s0)
    80007310:	ffffc097          	auipc	ra,0xffffc
    80007314:	80e080e7          	jalr	-2034(ra) # 80002b1e <proc_pagetable>
    80007318:	faa43023          	sd	a0,-96(s0)
    8000731c:	fa043783          	ld	a5,-96(s0)
    80007320:	38078263          	beqz	a5,800076a4 <exec+0x432>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007324:	fc042623          	sw	zero,-52(s0)
    80007328:	e5043783          	ld	a5,-432(s0)
    8000732c:	fcf42423          	sw	a5,-56(s0)
    80007330:	a0ed                	j	8000741a <exec+0x1a8>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80007332:	df840793          	addi	a5,s0,-520
    80007336:	fc842683          	lw	a3,-56(s0)
    8000733a:	03800713          	li	a4,56
    8000733e:	863e                	mv	a2,a5
    80007340:	4581                	li	a1,0
    80007342:	fa843503          	ld	a0,-88(s0)
    80007346:	ffffe097          	auipc	ra,0xffffe
    8000734a:	402080e7          	jalr	1026(ra) # 80005748 <readi>
    8000734e:	87aa                	mv	a5,a0
    80007350:	873e                	mv	a4,a5
    80007352:	03800793          	li	a5,56
    80007356:	34f71963          	bne	a4,a5,800076a8 <exec+0x436>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    8000735a:	df842703          	lw	a4,-520(s0)
    8000735e:	4785                	li	a5,1
    80007360:	0af71063          	bne	a4,a5,80007400 <exec+0x18e>
      continue;
    if(ph.memsz < ph.filesz)
    80007364:	e2043703          	ld	a4,-480(s0)
    80007368:	e1843783          	ld	a5,-488(s0)
    8000736c:	34f76063          	bltu	a4,a5,800076ac <exec+0x43a>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007370:	e0843703          	ld	a4,-504(s0)
    80007374:	e2043783          	ld	a5,-480(s0)
    80007378:	973e                	add	a4,a4,a5
    8000737a:	e0843783          	ld	a5,-504(s0)
    8000737e:	32f76963          	bltu	a4,a5,800076b0 <exec+0x43e>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007382:	e0843703          	ld	a4,-504(s0)
    80007386:	6785                	lui	a5,0x1
    80007388:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000738a:	8ff9                	and	a5,a5,a4
    8000738c:	32079463          	bnez	a5,800076b4 <exec+0x442>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007390:	e0843703          	ld	a4,-504(s0)
    80007394:	e2043783          	ld	a5,-480(s0)
    80007398:	00f704b3          	add	s1,a4,a5
    8000739c:	dfc42783          	lw	a5,-516(s0)
    800073a0:	853e                	mv	a0,a5
    800073a2:	00000097          	auipc	ra,0x0
    800073a6:	e8a080e7          	jalr	-374(ra) # 8000722c <flags2perm>
    800073aa:	87aa                	mv	a5,a0
    800073ac:	86be                	mv	a3,a5
    800073ae:	8626                	mv	a2,s1
    800073b0:	fb843583          	ld	a1,-72(s0)
    800073b4:	fa043503          	ld	a0,-96(s0)
    800073b8:	ffffb097          	auipc	ra,0xffffb
    800073bc:	bd6080e7          	jalr	-1066(ra) # 80001f8e <uvmalloc>
    800073c0:	f6a43823          	sd	a0,-144(s0)
    800073c4:	f7043783          	ld	a5,-144(s0)
    800073c8:	2e078863          	beqz	a5,800076b8 <exec+0x446>
      goto bad;
    sz = sz1;
    800073cc:	f7043783          	ld	a5,-144(s0)
    800073d0:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800073d4:	e0843783          	ld	a5,-504(s0)
    800073d8:	e0043703          	ld	a4,-512(s0)
    800073dc:	0007069b          	sext.w	a3,a4
    800073e0:	e1843703          	ld	a4,-488(s0)
    800073e4:	2701                	sext.w	a4,a4
    800073e6:	fa843603          	ld	a2,-88(s0)
    800073ea:	85be                	mv	a1,a5
    800073ec:	fa043503          	ld	a0,-96(s0)
    800073f0:	00000097          	auipc	ra,0x0
    800073f4:	32c080e7          	jalr	812(ra) # 8000771c <loadseg>
    800073f8:	87aa                	mv	a5,a0
    800073fa:	2c07c163          	bltz	a5,800076bc <exec+0x44a>
    800073fe:	a011                	j	80007402 <exec+0x190>
      continue;
    80007400:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007402:	fcc42783          	lw	a5,-52(s0)
    80007406:	2785                	addiw	a5,a5,1
    80007408:	fcf42623          	sw	a5,-52(s0)
    8000740c:	fc842783          	lw	a5,-56(s0)
    80007410:	0387879b          	addiw	a5,a5,56
    80007414:	2781                	sext.w	a5,a5
    80007416:	fcf42423          	sw	a5,-56(s0)
    8000741a:	e6845783          	lhu	a5,-408(s0)
    8000741e:	2781                	sext.w	a5,a5
    80007420:	fcc42703          	lw	a4,-52(s0)
    80007424:	2701                	sext.w	a4,a4
    80007426:	f0f746e3          	blt	a4,a5,80007332 <exec+0xc0>
      goto bad;
  }
  iunlockput(ip);
    8000742a:	fa843503          	ld	a0,-88(s0)
    8000742e:	ffffe097          	auipc	ra,0xffffe
    80007432:	fc8080e7          	jalr	-56(ra) # 800053f6 <iunlockput>
  end_op();
    80007436:	fffff097          	auipc	ra,0xfffff
    8000743a:	e96080e7          	jalr	-362(ra) # 800062cc <end_op>
  ip = 0;
    8000743e:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    80007442:	ffffb097          	auipc	ra,0xffffb
    80007446:	47a080e7          	jalr	1146(ra) # 800028bc <myproc>
    8000744a:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    8000744e:	f9843783          	ld	a5,-104(s0)
    80007452:	67bc                	ld	a5,72(a5)
    80007454:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007458:	fb843703          	ld	a4,-72(s0)
    8000745c:	6785                	lui	a5,0x1
    8000745e:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80007460:	973e                	add	a4,a4,a5
    80007462:	77fd                	lui	a5,0xfffff
    80007464:	8ff9                	and	a5,a5,a4
    80007466:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    8000746a:	fb843703          	ld	a4,-72(s0)
    8000746e:	6789                	lui	a5,0x2
    80007470:	97ba                	add	a5,a5,a4
    80007472:	4691                	li	a3,4
    80007474:	863e                	mv	a2,a5
    80007476:	fb843583          	ld	a1,-72(s0)
    8000747a:	fa043503          	ld	a0,-96(s0)
    8000747e:	ffffb097          	auipc	ra,0xffffb
    80007482:	b10080e7          	jalr	-1264(ra) # 80001f8e <uvmalloc>
    80007486:	f8a43423          	sd	a0,-120(s0)
    8000748a:	f8843783          	ld	a5,-120(s0)
    8000748e:	22078963          	beqz	a5,800076c0 <exec+0x44e>
    goto bad;
  sz = sz1;
    80007492:	f8843783          	ld	a5,-120(s0)
    80007496:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    8000749a:	fb843703          	ld	a4,-72(s0)
    8000749e:	77f9                	lui	a5,0xffffe
    800074a0:	97ba                	add	a5,a5,a4
    800074a2:	85be                	mv	a1,a5
    800074a4:	fa043503          	ld	a0,-96(s0)
    800074a8:	ffffb097          	auipc	ra,0xffffb
    800074ac:	e7c080e7          	jalr	-388(ra) # 80002324 <uvmclear>
  sp = sz;
    800074b0:	fb843783          	ld	a5,-72(s0)
    800074b4:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    800074b8:	fb043703          	ld	a4,-80(s0)
    800074bc:	77fd                	lui	a5,0xfffff
    800074be:	97ba                	add	a5,a5,a4
    800074c0:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    800074c4:	fc043023          	sd	zero,-64(s0)
    800074c8:	a07d                	j	80007576 <exec+0x304>
    if(argc >= MAXARG)
    800074ca:	fc043703          	ld	a4,-64(s0)
    800074ce:	47fd                	li	a5,31
    800074d0:	1ee7ea63          	bltu	a5,a4,800076c4 <exec+0x452>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800074d4:	fc043783          	ld	a5,-64(s0)
    800074d8:	078e                	slli	a5,a5,0x3
    800074da:	de043703          	ld	a4,-544(s0)
    800074de:	97ba                	add	a5,a5,a4
    800074e0:	639c                	ld	a5,0(a5)
    800074e2:	853e                	mv	a0,a5
    800074e4:	ffffa097          	auipc	ra,0xffffa
    800074e8:	34c080e7          	jalr	844(ra) # 80001830 <strlen>
    800074ec:	87aa                	mv	a5,a0
    800074ee:	2785                	addiw	a5,a5,1 # fffffffffffff001 <end+0xffffffff7ffd7c39>
    800074f0:	2781                	sext.w	a5,a5
    800074f2:	873e                	mv	a4,a5
    800074f4:	fb043783          	ld	a5,-80(s0)
    800074f8:	8f99                	sub	a5,a5,a4
    800074fa:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800074fe:	fb043783          	ld	a5,-80(s0)
    80007502:	9bc1                	andi	a5,a5,-16
    80007504:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007508:	fb043703          	ld	a4,-80(s0)
    8000750c:	f8043783          	ld	a5,-128(s0)
    80007510:	1af76c63          	bltu	a4,a5,800076c8 <exec+0x456>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80007514:	fc043783          	ld	a5,-64(s0)
    80007518:	078e                	slli	a5,a5,0x3
    8000751a:	de043703          	ld	a4,-544(s0)
    8000751e:	97ba                	add	a5,a5,a4
    80007520:	6384                	ld	s1,0(a5)
    80007522:	fc043783          	ld	a5,-64(s0)
    80007526:	078e                	slli	a5,a5,0x3
    80007528:	de043703          	ld	a4,-544(s0)
    8000752c:	97ba                	add	a5,a5,a4
    8000752e:	639c                	ld	a5,0(a5)
    80007530:	853e                	mv	a0,a5
    80007532:	ffffa097          	auipc	ra,0xffffa
    80007536:	2fe080e7          	jalr	766(ra) # 80001830 <strlen>
    8000753a:	87aa                	mv	a5,a0
    8000753c:	2785                	addiw	a5,a5,1
    8000753e:	2781                	sext.w	a5,a5
    80007540:	86be                	mv	a3,a5
    80007542:	8626                	mv	a2,s1
    80007544:	fb043583          	ld	a1,-80(s0)
    80007548:	fa043503          	ld	a0,-96(s0)
    8000754c:	ffffb097          	auipc	ra,0xffffb
    80007550:	e2e080e7          	jalr	-466(ra) # 8000237a <copyout>
    80007554:	87aa                	mv	a5,a0
    80007556:	1607cb63          	bltz	a5,800076cc <exec+0x45a>
      goto bad;
    ustack[argc] = sp;
    8000755a:	fc043703          	ld	a4,-64(s0)
    8000755e:	e7040793          	addi	a5,s0,-400
    80007562:	070e                	slli	a4,a4,0x3
    80007564:	97ba                	add	a5,a5,a4
    80007566:	fb043703          	ld	a4,-80(s0)
    8000756a:	e398                	sd	a4,0(a5)
  for(argc = 0; argv[argc]; argc++) {
    8000756c:	fc043783          	ld	a5,-64(s0)
    80007570:	0785                	addi	a5,a5,1
    80007572:	fcf43023          	sd	a5,-64(s0)
    80007576:	fc043783          	ld	a5,-64(s0)
    8000757a:	078e                	slli	a5,a5,0x3
    8000757c:	de043703          	ld	a4,-544(s0)
    80007580:	97ba                	add	a5,a5,a4
    80007582:	639c                	ld	a5,0(a5)
    80007584:	f3b9                	bnez	a5,800074ca <exec+0x258>
  }
  ustack[argc] = 0;
    80007586:	fc043703          	ld	a4,-64(s0)
    8000758a:	e7040793          	addi	a5,s0,-400
    8000758e:	070e                	slli	a4,a4,0x3
    80007590:	97ba                	add	a5,a5,a4
    80007592:	0007b023          	sd	zero,0(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007596:	fc043783          	ld	a5,-64(s0)
    8000759a:	0785                	addi	a5,a5,1
    8000759c:	078e                	slli	a5,a5,0x3
    8000759e:	fb043703          	ld	a4,-80(s0)
    800075a2:	40f707b3          	sub	a5,a4,a5
    800075a6:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    800075aa:	fb043783          	ld	a5,-80(s0)
    800075ae:	9bc1                	andi	a5,a5,-16
    800075b0:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    800075b4:	fb043703          	ld	a4,-80(s0)
    800075b8:	f8043783          	ld	a5,-128(s0)
    800075bc:	10f76a63          	bltu	a4,a5,800076d0 <exec+0x45e>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    800075c0:	fc043783          	ld	a5,-64(s0)
    800075c4:	0785                	addi	a5,a5,1
    800075c6:	00379713          	slli	a4,a5,0x3
    800075ca:	e7040793          	addi	a5,s0,-400
    800075ce:	86ba                	mv	a3,a4
    800075d0:	863e                	mv	a2,a5
    800075d2:	fb043583          	ld	a1,-80(s0)
    800075d6:	fa043503          	ld	a0,-96(s0)
    800075da:	ffffb097          	auipc	ra,0xffffb
    800075de:	da0080e7          	jalr	-608(ra) # 8000237a <copyout>
    800075e2:	87aa                	mv	a5,a0
    800075e4:	0e07c863          	bltz	a5,800076d4 <exec+0x462>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800075e8:	f9843783          	ld	a5,-104(s0)
    800075ec:	6fbc                	ld	a5,88(a5)
    800075ee:	fb043703          	ld	a4,-80(s0)
    800075f2:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800075f4:	de843783          	ld	a5,-536(s0)
    800075f8:	fcf43c23          	sd	a5,-40(s0)
    800075fc:	fd843783          	ld	a5,-40(s0)
    80007600:	fcf43823          	sd	a5,-48(s0)
    80007604:	a025                	j	8000762c <exec+0x3ba>
    if(*s == '/')
    80007606:	fd843783          	ld	a5,-40(s0)
    8000760a:	0007c783          	lbu	a5,0(a5)
    8000760e:	873e                	mv	a4,a5
    80007610:	02f00793          	li	a5,47
    80007614:	00f71763          	bne	a4,a5,80007622 <exec+0x3b0>
      last = s+1;
    80007618:	fd843783          	ld	a5,-40(s0)
    8000761c:	0785                	addi	a5,a5,1
    8000761e:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80007622:	fd843783          	ld	a5,-40(s0)
    80007626:	0785                	addi	a5,a5,1
    80007628:	fcf43c23          	sd	a5,-40(s0)
    8000762c:	fd843783          	ld	a5,-40(s0)
    80007630:	0007c783          	lbu	a5,0(a5)
    80007634:	fbe9                	bnez	a5,80007606 <exec+0x394>
  safestrcpy(p->name, last, sizeof(p->name));
    80007636:	f9843783          	ld	a5,-104(s0)
    8000763a:	15878793          	addi	a5,a5,344
    8000763e:	4641                	li	a2,16
    80007640:	fd043583          	ld	a1,-48(s0)
    80007644:	853e                	mv	a0,a5
    80007646:	ffffa097          	auipc	ra,0xffffa
    8000764a:	16a080e7          	jalr	362(ra) # 800017b0 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    8000764e:	f9843783          	ld	a5,-104(s0)
    80007652:	6bbc                	ld	a5,80(a5)
    80007654:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007658:	f9843783          	ld	a5,-104(s0)
    8000765c:	fa043703          	ld	a4,-96(s0)
    80007660:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007662:	f9843783          	ld	a5,-104(s0)
    80007666:	fb843703          	ld	a4,-72(s0)
    8000766a:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    8000766c:	f9843783          	ld	a5,-104(s0)
    80007670:	6fbc                	ld	a5,88(a5)
    80007672:	e4843703          	ld	a4,-440(s0)
    80007676:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007678:	f9843783          	ld	a5,-104(s0)
    8000767c:	6fbc                	ld	a5,88(a5)
    8000767e:	fb043703          	ld	a4,-80(s0)
    80007682:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007684:	f9043583          	ld	a1,-112(s0)
    80007688:	f7843503          	ld	a0,-136(s0)
    8000768c:	ffffb097          	auipc	ra,0xffffb
    80007690:	552080e7          	jalr	1362(ra) # 80002bde <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007694:	fc043783          	ld	a5,-64(s0)
    80007698:	2781                	sext.w	a5,a5
    8000769a:	a0bd                	j	80007708 <exec+0x496>
    goto bad;
    8000769c:	0001                	nop
    8000769e:	a825                	j	800076d6 <exec+0x464>
    goto bad;
    800076a0:	0001                	nop
    800076a2:	a815                	j	800076d6 <exec+0x464>
    goto bad;
    800076a4:	0001                	nop
    800076a6:	a805                	j	800076d6 <exec+0x464>
      goto bad;
    800076a8:	0001                	nop
    800076aa:	a035                	j	800076d6 <exec+0x464>
      goto bad;
    800076ac:	0001                	nop
    800076ae:	a025                	j	800076d6 <exec+0x464>
      goto bad;
    800076b0:	0001                	nop
    800076b2:	a015                	j	800076d6 <exec+0x464>
      goto bad;
    800076b4:	0001                	nop
    800076b6:	a005                	j	800076d6 <exec+0x464>
      goto bad;
    800076b8:	0001                	nop
    800076ba:	a831                	j	800076d6 <exec+0x464>
      goto bad;
    800076bc:	0001                	nop
    800076be:	a821                	j	800076d6 <exec+0x464>
    goto bad;
    800076c0:	0001                	nop
    800076c2:	a811                	j	800076d6 <exec+0x464>
      goto bad;
    800076c4:	0001                	nop
    800076c6:	a801                	j	800076d6 <exec+0x464>
      goto bad;
    800076c8:	0001                	nop
    800076ca:	a031                	j	800076d6 <exec+0x464>
      goto bad;
    800076cc:	0001                	nop
    800076ce:	a021                	j	800076d6 <exec+0x464>
    goto bad;
    800076d0:	0001                	nop
    800076d2:	a011                	j	800076d6 <exec+0x464>
    goto bad;
    800076d4:	0001                	nop

 bad:
  if(pagetable)
    800076d6:	fa043783          	ld	a5,-96(s0)
    800076da:	cb89                	beqz	a5,800076ec <exec+0x47a>
    proc_freepagetable(pagetable, sz);
    800076dc:	fb843583          	ld	a1,-72(s0)
    800076e0:	fa043503          	ld	a0,-96(s0)
    800076e4:	ffffb097          	auipc	ra,0xffffb
    800076e8:	4fa080e7          	jalr	1274(ra) # 80002bde <proc_freepagetable>
  if(ip){
    800076ec:	fa843783          	ld	a5,-88(s0)
    800076f0:	cb99                	beqz	a5,80007706 <exec+0x494>
    iunlockput(ip);
    800076f2:	fa843503          	ld	a0,-88(s0)
    800076f6:	ffffe097          	auipc	ra,0xffffe
    800076fa:	d00080e7          	jalr	-768(ra) # 800053f6 <iunlockput>
    end_op();
    800076fe:	fffff097          	auipc	ra,0xfffff
    80007702:	bce080e7          	jalr	-1074(ra) # 800062cc <end_op>
  }
  return -1;
    80007706:	57fd                	li	a5,-1
}
    80007708:	853e                	mv	a0,a5
    8000770a:	21813083          	ld	ra,536(sp)
    8000770e:	21013403          	ld	s0,528(sp)
    80007712:	20813483          	ld	s1,520(sp)
    80007716:	22010113          	addi	sp,sp,544
    8000771a:	8082                	ret

000000008000771c <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    8000771c:	7139                	addi	sp,sp,-64
    8000771e:	fc06                	sd	ra,56(sp)
    80007720:	f822                	sd	s0,48(sp)
    80007722:	0080                	addi	s0,sp,64
    80007724:	fca43c23          	sd	a0,-40(s0)
    80007728:	fcb43823          	sd	a1,-48(s0)
    8000772c:	fcc43423          	sd	a2,-56(s0)
    80007730:	87b6                	mv	a5,a3
    80007732:	fcf42223          	sw	a5,-60(s0)
    80007736:	87ba                	mv	a5,a4
    80007738:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    8000773c:	fe042623          	sw	zero,-20(s0)
    80007740:	a075                	j	800077ec <loadseg+0xd0>
    pa = walkaddr(pagetable, va + i);
    80007742:	fec46703          	lwu	a4,-20(s0)
    80007746:	fd043783          	ld	a5,-48(s0)
    8000774a:	97ba                	add	a5,a5,a4
    8000774c:	85be                	mv	a1,a5
    8000774e:	fd843503          	ld	a0,-40(s0)
    80007752:	ffffa097          	auipc	ra,0xffffa
    80007756:	4c8080e7          	jalr	1224(ra) # 80001c1a <walkaddr>
    8000775a:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000775e:	fe043783          	ld	a5,-32(s0)
    80007762:	eb89                	bnez	a5,80007774 <loadseg+0x58>
      panic("loadseg: address should exist");
    80007764:	00004517          	auipc	a0,0x4
    80007768:	e9c50513          	addi	a0,a0,-356 # 8000b600 <etext+0x600>
    8000776c:	ffff9097          	auipc	ra,0xffff9
    80007770:	554080e7          	jalr	1364(ra) # 80000cc0 <panic>
    if(sz - i < PGSIZE)
    80007774:	fc042783          	lw	a5,-64(s0)
    80007778:	873e                	mv	a4,a5
    8000777a:	fec42783          	lw	a5,-20(s0)
    8000777e:	40f707bb          	subw	a5,a4,a5
    80007782:	0007871b          	sext.w	a4,a5
    80007786:	6785                	lui	a5,0x1
    80007788:	00f77c63          	bgeu	a4,a5,800077a0 <loadseg+0x84>
      n = sz - i;
    8000778c:	fc042783          	lw	a5,-64(s0)
    80007790:	873e                	mv	a4,a5
    80007792:	fec42783          	lw	a5,-20(s0)
    80007796:	40f707bb          	subw	a5,a4,a5
    8000779a:	fef42423          	sw	a5,-24(s0)
    8000779e:	a021                	j	800077a6 <loadseg+0x8a>
    else
      n = PGSIZE;
    800077a0:	6785                	lui	a5,0x1
    800077a2:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    800077a6:	fc442783          	lw	a5,-60(s0)
    800077aa:	873e                	mv	a4,a5
    800077ac:	fec42783          	lw	a5,-20(s0)
    800077b0:	9fb9                	addw	a5,a5,a4
    800077b2:	2781                	sext.w	a5,a5
    800077b4:	fe842703          	lw	a4,-24(s0)
    800077b8:	86be                	mv	a3,a5
    800077ba:	fe043603          	ld	a2,-32(s0)
    800077be:	4581                	li	a1,0
    800077c0:	fc843503          	ld	a0,-56(s0)
    800077c4:	ffffe097          	auipc	ra,0xffffe
    800077c8:	f84080e7          	jalr	-124(ra) # 80005748 <readi>
    800077cc:	87aa                	mv	a5,a0
    800077ce:	873e                	mv	a4,a5
    800077d0:	fe842783          	lw	a5,-24(s0)
    800077d4:	2781                	sext.w	a5,a5
    800077d6:	00e78463          	beq	a5,a4,800077de <loadseg+0xc2>
      return -1;
    800077da:	57fd                	li	a5,-1
    800077dc:	a015                	j	80007800 <loadseg+0xe4>
  for(i = 0; i < sz; i += PGSIZE){
    800077de:	fec42783          	lw	a5,-20(s0)
    800077e2:	873e                	mv	a4,a5
    800077e4:	6785                	lui	a5,0x1
    800077e6:	9fb9                	addw	a5,a5,a4
    800077e8:	fef42623          	sw	a5,-20(s0)
    800077ec:	fec42783          	lw	a5,-20(s0)
    800077f0:	873e                	mv	a4,a5
    800077f2:	fc042783          	lw	a5,-64(s0)
    800077f6:	2701                	sext.w	a4,a4
    800077f8:	2781                	sext.w	a5,a5
    800077fa:	f4f764e3          	bltu	a4,a5,80007742 <loadseg+0x26>
  }
  
  return 0;
    800077fe:	4781                	li	a5,0
}
    80007800:	853e                	mv	a0,a5
    80007802:	70e2                	ld	ra,56(sp)
    80007804:	7442                	ld	s0,48(sp)
    80007806:	6121                	addi	sp,sp,64
    80007808:	8082                	ret

000000008000780a <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    8000780a:	7139                	addi	sp,sp,-64
    8000780c:	fc06                	sd	ra,56(sp)
    8000780e:	f822                	sd	s0,48(sp)
    80007810:	0080                	addi	s0,sp,64
    80007812:	87aa                	mv	a5,a0
    80007814:	fcb43823          	sd	a1,-48(s0)
    80007818:	fcc43423          	sd	a2,-56(s0)
    8000781c:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    80007820:	fe440713          	addi	a4,s0,-28
    80007824:	fdc42783          	lw	a5,-36(s0)
    80007828:	85ba                	mv	a1,a4
    8000782a:	853e                	mv	a0,a5
    8000782c:	ffffd097          	auipc	ra,0xffffd
    80007830:	9da080e7          	jalr	-1574(ra) # 80004206 <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007834:	fe442783          	lw	a5,-28(s0)
    80007838:	0207c763          	bltz	a5,80007866 <argfd+0x5c>
    8000783c:	fe442703          	lw	a4,-28(s0)
    80007840:	47bd                	li	a5,15
    80007842:	02e7c263          	blt	a5,a4,80007866 <argfd+0x5c>
    80007846:	ffffb097          	auipc	ra,0xffffb
    8000784a:	076080e7          	jalr	118(ra) # 800028bc <myproc>
    8000784e:	872a                	mv	a4,a0
    80007850:	fe442783          	lw	a5,-28(s0)
    80007854:	07e9                	addi	a5,a5,26 # 101a <_entry-0x7fffefe6>
    80007856:	078e                	slli	a5,a5,0x3
    80007858:	97ba                	add	a5,a5,a4
    8000785a:	639c                	ld	a5,0(a5)
    8000785c:	fef43423          	sd	a5,-24(s0)
    80007860:	fe843783          	ld	a5,-24(s0)
    80007864:	e399                	bnez	a5,8000786a <argfd+0x60>
    return -1;
    80007866:	57fd                	li	a5,-1
    80007868:	a015                	j	8000788c <argfd+0x82>
  if(pfd)
    8000786a:	fd043783          	ld	a5,-48(s0)
    8000786e:	c791                	beqz	a5,8000787a <argfd+0x70>
    *pfd = fd;
    80007870:	fe442703          	lw	a4,-28(s0)
    80007874:	fd043783          	ld	a5,-48(s0)
    80007878:	c398                	sw	a4,0(a5)
  if(pf)
    8000787a:	fc843783          	ld	a5,-56(s0)
    8000787e:	c791                	beqz	a5,8000788a <argfd+0x80>
    *pf = f;
    80007880:	fc843783          	ld	a5,-56(s0)
    80007884:	fe843703          	ld	a4,-24(s0)
    80007888:	e398                	sd	a4,0(a5)
  return 0;
    8000788a:	4781                	li	a5,0
}
    8000788c:	853e                	mv	a0,a5
    8000788e:	70e2                	ld	ra,56(sp)
    80007890:	7442                	ld	s0,48(sp)
    80007892:	6121                	addi	sp,sp,64
    80007894:	8082                	ret

0000000080007896 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007896:	7179                	addi	sp,sp,-48
    80007898:	f406                	sd	ra,40(sp)
    8000789a:	f022                	sd	s0,32(sp)
    8000789c:	1800                	addi	s0,sp,48
    8000789e:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    800078a2:	ffffb097          	auipc	ra,0xffffb
    800078a6:	01a080e7          	jalr	26(ra) # 800028bc <myproc>
    800078aa:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    800078ae:	fe042623          	sw	zero,-20(s0)
    800078b2:	a825                	j	800078ea <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    800078b4:	fe043703          	ld	a4,-32(s0)
    800078b8:	fec42783          	lw	a5,-20(s0)
    800078bc:	07e9                	addi	a5,a5,26
    800078be:	078e                	slli	a5,a5,0x3
    800078c0:	97ba                	add	a5,a5,a4
    800078c2:	639c                	ld	a5,0(a5)
    800078c4:	ef91                	bnez	a5,800078e0 <fdalloc+0x4a>
      p->ofile[fd] = f;
    800078c6:	fe043703          	ld	a4,-32(s0)
    800078ca:	fec42783          	lw	a5,-20(s0)
    800078ce:	07e9                	addi	a5,a5,26
    800078d0:	078e                	slli	a5,a5,0x3
    800078d2:	97ba                	add	a5,a5,a4
    800078d4:	fd843703          	ld	a4,-40(s0)
    800078d8:	e398                	sd	a4,0(a5)
      return fd;
    800078da:	fec42783          	lw	a5,-20(s0)
    800078de:	a831                	j	800078fa <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    800078e0:	fec42783          	lw	a5,-20(s0)
    800078e4:	2785                	addiw	a5,a5,1
    800078e6:	fef42623          	sw	a5,-20(s0)
    800078ea:	fec42783          	lw	a5,-20(s0)
    800078ee:	0007871b          	sext.w	a4,a5
    800078f2:	47bd                	li	a5,15
    800078f4:	fce7d0e3          	bge	a5,a4,800078b4 <fdalloc+0x1e>
    }
  }
  return -1;
    800078f8:	57fd                	li	a5,-1
}
    800078fa:	853e                	mv	a0,a5
    800078fc:	70a2                	ld	ra,40(sp)
    800078fe:	7402                	ld	s0,32(sp)
    80007900:	6145                	addi	sp,sp,48
    80007902:	8082                	ret

0000000080007904 <sys_dup>:

uint64
sys_dup(void)
{
    80007904:	1101                	addi	sp,sp,-32
    80007906:	ec06                	sd	ra,24(sp)
    80007908:	e822                	sd	s0,16(sp)
    8000790a:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    8000790c:	fe040793          	addi	a5,s0,-32
    80007910:	863e                	mv	a2,a5
    80007912:	4581                	li	a1,0
    80007914:	4501                	li	a0,0
    80007916:	00000097          	auipc	ra,0x0
    8000791a:	ef4080e7          	jalr	-268(ra) # 8000780a <argfd>
    8000791e:	87aa                	mv	a5,a0
    80007920:	0007d463          	bgez	a5,80007928 <sys_dup+0x24>
    return -1;
    80007924:	57fd                	li	a5,-1
    80007926:	a81d                	j	8000795c <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007928:	fe043783          	ld	a5,-32(s0)
    8000792c:	853e                	mv	a0,a5
    8000792e:	00000097          	auipc	ra,0x0
    80007932:	f68080e7          	jalr	-152(ra) # 80007896 <fdalloc>
    80007936:	87aa                	mv	a5,a0
    80007938:	fef42623          	sw	a5,-20(s0)
    8000793c:	fec42783          	lw	a5,-20(s0)
    80007940:	2781                	sext.w	a5,a5
    80007942:	0007d463          	bgez	a5,8000794a <sys_dup+0x46>
    return -1;
    80007946:	57fd                	li	a5,-1
    80007948:	a811                	j	8000795c <sys_dup+0x58>
  filedup(f);
    8000794a:	fe043783          	ld	a5,-32(s0)
    8000794e:	853e                	mv	a0,a5
    80007950:	fffff097          	auipc	ra,0xfffff
    80007954:	ede080e7          	jalr	-290(ra) # 8000682e <filedup>
  return fd;
    80007958:	fec42783          	lw	a5,-20(s0)
}
    8000795c:	853e                	mv	a0,a5
    8000795e:	60e2                	ld	ra,24(sp)
    80007960:	6442                	ld	s0,16(sp)
    80007962:	6105                	addi	sp,sp,32
    80007964:	8082                	ret

0000000080007966 <sys_read>:

uint64
sys_read(void)
{
    80007966:	7179                	addi	sp,sp,-48
    80007968:	f406                	sd	ra,40(sp)
    8000796a:	f022                	sd	s0,32(sp)
    8000796c:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    8000796e:	fd840793          	addi	a5,s0,-40
    80007972:	85be                	mv	a1,a5
    80007974:	4505                	li	a0,1
    80007976:	ffffd097          	auipc	ra,0xffffd
    8000797a:	8c6080e7          	jalr	-1850(ra) # 8000423c <argaddr>
  argint(2, &n);
    8000797e:	fe440793          	addi	a5,s0,-28
    80007982:	85be                	mv	a1,a5
    80007984:	4509                	li	a0,2
    80007986:	ffffd097          	auipc	ra,0xffffd
    8000798a:	880080e7          	jalr	-1920(ra) # 80004206 <argint>
  if(argfd(0, 0, &f) < 0)
    8000798e:	fe840793          	addi	a5,s0,-24
    80007992:	863e                	mv	a2,a5
    80007994:	4581                	li	a1,0
    80007996:	4501                	li	a0,0
    80007998:	00000097          	auipc	ra,0x0
    8000799c:	e72080e7          	jalr	-398(ra) # 8000780a <argfd>
    800079a0:	87aa                	mv	a5,a0
    800079a2:	0007d463          	bgez	a5,800079aa <sys_read+0x44>
    return -1;
    800079a6:	57fd                	li	a5,-1
    800079a8:	a839                	j	800079c6 <sys_read+0x60>
  return fileread(f, p, n);
    800079aa:	fe843783          	ld	a5,-24(s0)
    800079ae:	fd843703          	ld	a4,-40(s0)
    800079b2:	fe442683          	lw	a3,-28(s0)
    800079b6:	8636                	mv	a2,a3
    800079b8:	85ba                	mv	a1,a4
    800079ba:	853e                	mv	a0,a5
    800079bc:	fffff097          	auipc	ra,0xfffff
    800079c0:	07a080e7          	jalr	122(ra) # 80006a36 <fileread>
    800079c4:	87aa                	mv	a5,a0
}
    800079c6:	853e                	mv	a0,a5
    800079c8:	70a2                	ld	ra,40(sp)
    800079ca:	7402                	ld	s0,32(sp)
    800079cc:	6145                	addi	sp,sp,48
    800079ce:	8082                	ret

00000000800079d0 <sys_write>:

uint64
sys_write(void)
{
    800079d0:	7179                	addi	sp,sp,-48
    800079d2:	f406                	sd	ra,40(sp)
    800079d4:	f022                	sd	s0,32(sp)
    800079d6:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    800079d8:	fd840793          	addi	a5,s0,-40
    800079dc:	85be                	mv	a1,a5
    800079de:	4505                	li	a0,1
    800079e0:	ffffd097          	auipc	ra,0xffffd
    800079e4:	85c080e7          	jalr	-1956(ra) # 8000423c <argaddr>
  argint(2, &n);
    800079e8:	fe440793          	addi	a5,s0,-28
    800079ec:	85be                	mv	a1,a5
    800079ee:	4509                	li	a0,2
    800079f0:	ffffd097          	auipc	ra,0xffffd
    800079f4:	816080e7          	jalr	-2026(ra) # 80004206 <argint>
  if(argfd(0, 0, &f) < 0)
    800079f8:	fe840793          	addi	a5,s0,-24
    800079fc:	863e                	mv	a2,a5
    800079fe:	4581                	li	a1,0
    80007a00:	4501                	li	a0,0
    80007a02:	00000097          	auipc	ra,0x0
    80007a06:	e08080e7          	jalr	-504(ra) # 8000780a <argfd>
    80007a0a:	87aa                	mv	a5,a0
    80007a0c:	0007d463          	bgez	a5,80007a14 <sys_write+0x44>
    return -1;
    80007a10:	57fd                	li	a5,-1
    80007a12:	a839                	j	80007a30 <sys_write+0x60>

  return filewrite(f, p, n);
    80007a14:	fe843783          	ld	a5,-24(s0)
    80007a18:	fd843703          	ld	a4,-40(s0)
    80007a1c:	fe442683          	lw	a3,-28(s0)
    80007a20:	8636                	mv	a2,a3
    80007a22:	85ba                	mv	a1,a4
    80007a24:	853e                	mv	a0,a5
    80007a26:	fffff097          	auipc	ra,0xfffff
    80007a2a:	166080e7          	jalr	358(ra) # 80006b8c <filewrite>
    80007a2e:	87aa                	mv	a5,a0
}
    80007a30:	853e                	mv	a0,a5
    80007a32:	70a2                	ld	ra,40(sp)
    80007a34:	7402                	ld	s0,32(sp)
    80007a36:	6145                	addi	sp,sp,48
    80007a38:	8082                	ret

0000000080007a3a <sys_close>:

uint64
sys_close(void)
{
    80007a3a:	1101                	addi	sp,sp,-32
    80007a3c:	ec06                	sd	ra,24(sp)
    80007a3e:	e822                	sd	s0,16(sp)
    80007a40:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007a42:	fe040713          	addi	a4,s0,-32
    80007a46:	fec40793          	addi	a5,s0,-20
    80007a4a:	863a                	mv	a2,a4
    80007a4c:	85be                	mv	a1,a5
    80007a4e:	4501                	li	a0,0
    80007a50:	00000097          	auipc	ra,0x0
    80007a54:	dba080e7          	jalr	-582(ra) # 8000780a <argfd>
    80007a58:	87aa                	mv	a5,a0
    80007a5a:	0007d463          	bgez	a5,80007a62 <sys_close+0x28>
    return -1;
    80007a5e:	57fd                	li	a5,-1
    80007a60:	a02d                	j	80007a8a <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007a62:	ffffb097          	auipc	ra,0xffffb
    80007a66:	e5a080e7          	jalr	-422(ra) # 800028bc <myproc>
    80007a6a:	872a                	mv	a4,a0
    80007a6c:	fec42783          	lw	a5,-20(s0)
    80007a70:	07e9                	addi	a5,a5,26
    80007a72:	078e                	slli	a5,a5,0x3
    80007a74:	97ba                	add	a5,a5,a4
    80007a76:	0007b023          	sd	zero,0(a5)
  fileclose(f);
    80007a7a:	fe043783          	ld	a5,-32(s0)
    80007a7e:	853e                	mv	a0,a5
    80007a80:	fffff097          	auipc	ra,0xfffff
    80007a84:	e14080e7          	jalr	-492(ra) # 80006894 <fileclose>
  return 0;
    80007a88:	4781                	li	a5,0
}
    80007a8a:	853e                	mv	a0,a5
    80007a8c:	60e2                	ld	ra,24(sp)
    80007a8e:	6442                	ld	s0,16(sp)
    80007a90:	6105                	addi	sp,sp,32
    80007a92:	8082                	ret

0000000080007a94 <sys_fstat>:

uint64
sys_fstat(void)
{
    80007a94:	1101                	addi	sp,sp,-32
    80007a96:	ec06                	sd	ra,24(sp)
    80007a98:	e822                	sd	s0,16(sp)
    80007a9a:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007a9c:	fe040793          	addi	a5,s0,-32
    80007aa0:	85be                	mv	a1,a5
    80007aa2:	4505                	li	a0,1
    80007aa4:	ffffc097          	auipc	ra,0xffffc
    80007aa8:	798080e7          	jalr	1944(ra) # 8000423c <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007aac:	fe840793          	addi	a5,s0,-24
    80007ab0:	863e                	mv	a2,a5
    80007ab2:	4581                	li	a1,0
    80007ab4:	4501                	li	a0,0
    80007ab6:	00000097          	auipc	ra,0x0
    80007aba:	d54080e7          	jalr	-684(ra) # 8000780a <argfd>
    80007abe:	87aa                	mv	a5,a0
    80007ac0:	0007d463          	bgez	a5,80007ac8 <sys_fstat+0x34>
    return -1;
    80007ac4:	57fd                	li	a5,-1
    80007ac6:	a821                	j	80007ade <sys_fstat+0x4a>
  return filestat(f, st);
    80007ac8:	fe843783          	ld	a5,-24(s0)
    80007acc:	fe043703          	ld	a4,-32(s0)
    80007ad0:	85ba                	mv	a1,a4
    80007ad2:	853e                	mv	a0,a5
    80007ad4:	fffff097          	auipc	ra,0xfffff
    80007ad8:	ec2080e7          	jalr	-318(ra) # 80006996 <filestat>
    80007adc:	87aa                	mv	a5,a0
}
    80007ade:	853e                	mv	a0,a5
    80007ae0:	60e2                	ld	ra,24(sp)
    80007ae2:	6442                	ld	s0,16(sp)
    80007ae4:	6105                	addi	sp,sp,32
    80007ae6:	8082                	ret

0000000080007ae8 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007ae8:	7169                	addi	sp,sp,-304
    80007aea:	f606                	sd	ra,296(sp)
    80007aec:	f222                	sd	s0,288(sp)
    80007aee:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007af0:	ed040793          	addi	a5,s0,-304
    80007af4:	08000613          	li	a2,128
    80007af8:	85be                	mv	a1,a5
    80007afa:	4501                	li	a0,0
    80007afc:	ffffc097          	auipc	ra,0xffffc
    80007b00:	772080e7          	jalr	1906(ra) # 8000426e <argstr>
    80007b04:	87aa                	mv	a5,a0
    80007b06:	0007cf63          	bltz	a5,80007b24 <sys_link+0x3c>
    80007b0a:	f5040793          	addi	a5,s0,-176
    80007b0e:	08000613          	li	a2,128
    80007b12:	85be                	mv	a1,a5
    80007b14:	4505                	li	a0,1
    80007b16:	ffffc097          	auipc	ra,0xffffc
    80007b1a:	758080e7          	jalr	1880(ra) # 8000426e <argstr>
    80007b1e:	87aa                	mv	a5,a0
    80007b20:	0007d463          	bgez	a5,80007b28 <sys_link+0x40>
    return -1;
    80007b24:	57fd                	li	a5,-1
    80007b26:	aaa5                	j	80007c9e <sys_link+0x1b6>

  begin_op();
    80007b28:	ffffe097          	auipc	ra,0xffffe
    80007b2c:	6e2080e7          	jalr	1762(ra) # 8000620a <begin_op>
  if((ip = namei(old)) == 0){
    80007b30:	ed040793          	addi	a5,s0,-304
    80007b34:	853e                	mv	a0,a5
    80007b36:	ffffe097          	auipc	ra,0xffffe
    80007b3a:	384080e7          	jalr	900(ra) # 80005eba <namei>
    80007b3e:	fea43423          	sd	a0,-24(s0)
    80007b42:	fe843783          	ld	a5,-24(s0)
    80007b46:	e799                	bnez	a5,80007b54 <sys_link+0x6c>
    end_op();
    80007b48:	ffffe097          	auipc	ra,0xffffe
    80007b4c:	784080e7          	jalr	1924(ra) # 800062cc <end_op>
    return -1;
    80007b50:	57fd                	li	a5,-1
    80007b52:	a2b1                	j	80007c9e <sys_link+0x1b6>
  }

  ilock(ip);
    80007b54:	fe843503          	ld	a0,-24(s0)
    80007b58:	ffffd097          	auipc	ra,0xffffd
    80007b5c:	642080e7          	jalr	1602(ra) # 8000519a <ilock>
  if(ip->type == T_DIR){
    80007b60:	fe843783          	ld	a5,-24(s0)
    80007b64:	04479703          	lh	a4,68(a5)
    80007b68:	4785                	li	a5,1
    80007b6a:	00f71e63          	bne	a4,a5,80007b86 <sys_link+0x9e>
    iunlockput(ip);
    80007b6e:	fe843503          	ld	a0,-24(s0)
    80007b72:	ffffe097          	auipc	ra,0xffffe
    80007b76:	884080e7          	jalr	-1916(ra) # 800053f6 <iunlockput>
    end_op();
    80007b7a:	ffffe097          	auipc	ra,0xffffe
    80007b7e:	752080e7          	jalr	1874(ra) # 800062cc <end_op>
    return -1;
    80007b82:	57fd                	li	a5,-1
    80007b84:	aa29                	j	80007c9e <sys_link+0x1b6>
  }

  ip->nlink++;
    80007b86:	fe843783          	ld	a5,-24(s0)
    80007b8a:	04a79783          	lh	a5,74(a5)
    80007b8e:	17c2                	slli	a5,a5,0x30
    80007b90:	93c1                	srli	a5,a5,0x30
    80007b92:	2785                	addiw	a5,a5,1
    80007b94:	17c2                	slli	a5,a5,0x30
    80007b96:	93c1                	srli	a5,a5,0x30
    80007b98:	0107971b          	slliw	a4,a5,0x10
    80007b9c:	4107571b          	sraiw	a4,a4,0x10
    80007ba0:	fe843783          	ld	a5,-24(s0)
    80007ba4:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007ba8:	fe843503          	ld	a0,-24(s0)
    80007bac:	ffffd097          	auipc	ra,0xffffd
    80007bb0:	39e080e7          	jalr	926(ra) # 80004f4a <iupdate>
  iunlock(ip);
    80007bb4:	fe843503          	ld	a0,-24(s0)
    80007bb8:	ffffd097          	auipc	ra,0xffffd
    80007bbc:	716080e7          	jalr	1814(ra) # 800052ce <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007bc0:	fd040713          	addi	a4,s0,-48
    80007bc4:	f5040793          	addi	a5,s0,-176
    80007bc8:	85ba                	mv	a1,a4
    80007bca:	853e                	mv	a0,a5
    80007bcc:	ffffe097          	auipc	ra,0xffffe
    80007bd0:	31a080e7          	jalr	794(ra) # 80005ee6 <nameiparent>
    80007bd4:	fea43023          	sd	a0,-32(s0)
    80007bd8:	fe043783          	ld	a5,-32(s0)
    80007bdc:	cba5                	beqz	a5,80007c4c <sys_link+0x164>
    goto bad;
  ilock(dp);
    80007bde:	fe043503          	ld	a0,-32(s0)
    80007be2:	ffffd097          	auipc	ra,0xffffd
    80007be6:	5b8080e7          	jalr	1464(ra) # 8000519a <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007bea:	fe043783          	ld	a5,-32(s0)
    80007bee:	4398                	lw	a4,0(a5)
    80007bf0:	fe843783          	ld	a5,-24(s0)
    80007bf4:	439c                	lw	a5,0(a5)
    80007bf6:	02f71263          	bne	a4,a5,80007c1a <sys_link+0x132>
    80007bfa:	fe843783          	ld	a5,-24(s0)
    80007bfe:	43d8                	lw	a4,4(a5)
    80007c00:	fd040793          	addi	a5,s0,-48
    80007c04:	863a                	mv	a2,a4
    80007c06:	85be                	mv	a1,a5
    80007c08:	fe043503          	ld	a0,-32(s0)
    80007c0c:	ffffe097          	auipc	ra,0xffffe
    80007c10:	fa4080e7          	jalr	-92(ra) # 80005bb0 <dirlink>
    80007c14:	87aa                	mv	a5,a0
    80007c16:	0007d963          	bgez	a5,80007c28 <sys_link+0x140>
    iunlockput(dp);
    80007c1a:	fe043503          	ld	a0,-32(s0)
    80007c1e:	ffffd097          	auipc	ra,0xffffd
    80007c22:	7d8080e7          	jalr	2008(ra) # 800053f6 <iunlockput>
    goto bad;
    80007c26:	a025                	j	80007c4e <sys_link+0x166>
  }
  iunlockput(dp);
    80007c28:	fe043503          	ld	a0,-32(s0)
    80007c2c:	ffffd097          	auipc	ra,0xffffd
    80007c30:	7ca080e7          	jalr	1994(ra) # 800053f6 <iunlockput>
  iput(ip);
    80007c34:	fe843503          	ld	a0,-24(s0)
    80007c38:	ffffd097          	auipc	ra,0xffffd
    80007c3c:	6f0080e7          	jalr	1776(ra) # 80005328 <iput>

  end_op();
    80007c40:	ffffe097          	auipc	ra,0xffffe
    80007c44:	68c080e7          	jalr	1676(ra) # 800062cc <end_op>

  return 0;
    80007c48:	4781                	li	a5,0
    80007c4a:	a891                	j	80007c9e <sys_link+0x1b6>
    goto bad;
    80007c4c:	0001                	nop

bad:
  ilock(ip);
    80007c4e:	fe843503          	ld	a0,-24(s0)
    80007c52:	ffffd097          	auipc	ra,0xffffd
    80007c56:	548080e7          	jalr	1352(ra) # 8000519a <ilock>
  ip->nlink--;
    80007c5a:	fe843783          	ld	a5,-24(s0)
    80007c5e:	04a79783          	lh	a5,74(a5)
    80007c62:	17c2                	slli	a5,a5,0x30
    80007c64:	93c1                	srli	a5,a5,0x30
    80007c66:	37fd                	addiw	a5,a5,-1
    80007c68:	17c2                	slli	a5,a5,0x30
    80007c6a:	93c1                	srli	a5,a5,0x30
    80007c6c:	0107971b          	slliw	a4,a5,0x10
    80007c70:	4107571b          	sraiw	a4,a4,0x10
    80007c74:	fe843783          	ld	a5,-24(s0)
    80007c78:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007c7c:	fe843503          	ld	a0,-24(s0)
    80007c80:	ffffd097          	auipc	ra,0xffffd
    80007c84:	2ca080e7          	jalr	714(ra) # 80004f4a <iupdate>
  iunlockput(ip);
    80007c88:	fe843503          	ld	a0,-24(s0)
    80007c8c:	ffffd097          	auipc	ra,0xffffd
    80007c90:	76a080e7          	jalr	1898(ra) # 800053f6 <iunlockput>
  end_op();
    80007c94:	ffffe097          	auipc	ra,0xffffe
    80007c98:	638080e7          	jalr	1592(ra) # 800062cc <end_op>
  return -1;
    80007c9c:	57fd                	li	a5,-1
}
    80007c9e:	853e                	mv	a0,a5
    80007ca0:	70b2                	ld	ra,296(sp)
    80007ca2:	7412                	ld	s0,288(sp)
    80007ca4:	6155                	addi	sp,sp,304
    80007ca6:	8082                	ret

0000000080007ca8 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007ca8:	7139                	addi	sp,sp,-64
    80007caa:	fc06                	sd	ra,56(sp)
    80007cac:	f822                	sd	s0,48(sp)
    80007cae:	0080                	addi	s0,sp,64
    80007cb0:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007cb4:	02000793          	li	a5,32
    80007cb8:	fef42623          	sw	a5,-20(s0)
    80007cbc:	a0b1                	j	80007d08 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007cbe:	fd840793          	addi	a5,s0,-40
    80007cc2:	fec42683          	lw	a3,-20(s0)
    80007cc6:	4741                	li	a4,16
    80007cc8:	863e                	mv	a2,a5
    80007cca:	4581                	li	a1,0
    80007ccc:	fc843503          	ld	a0,-56(s0)
    80007cd0:	ffffe097          	auipc	ra,0xffffe
    80007cd4:	a78080e7          	jalr	-1416(ra) # 80005748 <readi>
    80007cd8:	87aa                	mv	a5,a0
    80007cda:	873e                	mv	a4,a5
    80007cdc:	47c1                	li	a5,16
    80007cde:	00f70a63          	beq	a4,a5,80007cf2 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007ce2:	00004517          	auipc	a0,0x4
    80007ce6:	93e50513          	addi	a0,a0,-1730 # 8000b620 <etext+0x620>
    80007cea:	ffff9097          	auipc	ra,0xffff9
    80007cee:	fd6080e7          	jalr	-42(ra) # 80000cc0 <panic>
    if(de.inum != 0)
    80007cf2:	fd845783          	lhu	a5,-40(s0)
    80007cf6:	c399                	beqz	a5,80007cfc <isdirempty+0x54>
      return 0;
    80007cf8:	4781                	li	a5,0
    80007cfa:	a839                	j	80007d18 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007cfc:	fec42783          	lw	a5,-20(s0)
    80007d00:	27c1                	addiw	a5,a5,16
    80007d02:	2781                	sext.w	a5,a5
    80007d04:	fef42623          	sw	a5,-20(s0)
    80007d08:	fc843783          	ld	a5,-56(s0)
    80007d0c:	47f8                	lw	a4,76(a5)
    80007d0e:	fec42783          	lw	a5,-20(s0)
    80007d12:	fae7e6e3          	bltu	a5,a4,80007cbe <isdirempty+0x16>
  }
  return 1;
    80007d16:	4785                	li	a5,1
}
    80007d18:	853e                	mv	a0,a5
    80007d1a:	70e2                	ld	ra,56(sp)
    80007d1c:	7442                	ld	s0,48(sp)
    80007d1e:	6121                	addi	sp,sp,64
    80007d20:	8082                	ret

0000000080007d22 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007d22:	7155                	addi	sp,sp,-208
    80007d24:	e586                	sd	ra,200(sp)
    80007d26:	e1a2                	sd	s0,192(sp)
    80007d28:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007d2a:	f4040793          	addi	a5,s0,-192
    80007d2e:	08000613          	li	a2,128
    80007d32:	85be                	mv	a1,a5
    80007d34:	4501                	li	a0,0
    80007d36:	ffffc097          	auipc	ra,0xffffc
    80007d3a:	538080e7          	jalr	1336(ra) # 8000426e <argstr>
    80007d3e:	87aa                	mv	a5,a0
    80007d40:	0007d463          	bgez	a5,80007d48 <sys_unlink+0x26>
    return -1;
    80007d44:	57fd                	li	a5,-1
    80007d46:	a2c5                	j	80007f26 <sys_unlink+0x204>

  begin_op();
    80007d48:	ffffe097          	auipc	ra,0xffffe
    80007d4c:	4c2080e7          	jalr	1218(ra) # 8000620a <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007d50:	fc040713          	addi	a4,s0,-64
    80007d54:	f4040793          	addi	a5,s0,-192
    80007d58:	85ba                	mv	a1,a4
    80007d5a:	853e                	mv	a0,a5
    80007d5c:	ffffe097          	auipc	ra,0xffffe
    80007d60:	18a080e7          	jalr	394(ra) # 80005ee6 <nameiparent>
    80007d64:	fea43423          	sd	a0,-24(s0)
    80007d68:	fe843783          	ld	a5,-24(s0)
    80007d6c:	e799                	bnez	a5,80007d7a <sys_unlink+0x58>
    end_op();
    80007d6e:	ffffe097          	auipc	ra,0xffffe
    80007d72:	55e080e7          	jalr	1374(ra) # 800062cc <end_op>
    return -1;
    80007d76:	57fd                	li	a5,-1
    80007d78:	a27d                	j	80007f26 <sys_unlink+0x204>
  }

  ilock(dp);
    80007d7a:	fe843503          	ld	a0,-24(s0)
    80007d7e:	ffffd097          	auipc	ra,0xffffd
    80007d82:	41c080e7          	jalr	1052(ra) # 8000519a <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007d86:	fc040793          	addi	a5,s0,-64
    80007d8a:	00004597          	auipc	a1,0x4
    80007d8e:	8ae58593          	addi	a1,a1,-1874 # 8000b638 <etext+0x638>
    80007d92:	853e                	mv	a0,a5
    80007d94:	ffffe097          	auipc	ra,0xffffe
    80007d98:	d0a080e7          	jalr	-758(ra) # 80005a9e <namecmp>
    80007d9c:	87aa                	mv	a5,a0
    80007d9e:	16078663          	beqz	a5,80007f0a <sys_unlink+0x1e8>
    80007da2:	fc040793          	addi	a5,s0,-64
    80007da6:	00004597          	auipc	a1,0x4
    80007daa:	89a58593          	addi	a1,a1,-1894 # 8000b640 <etext+0x640>
    80007dae:	853e                	mv	a0,a5
    80007db0:	ffffe097          	auipc	ra,0xffffe
    80007db4:	cee080e7          	jalr	-786(ra) # 80005a9e <namecmp>
    80007db8:	87aa                	mv	a5,a0
    80007dba:	14078863          	beqz	a5,80007f0a <sys_unlink+0x1e8>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007dbe:	f3c40713          	addi	a4,s0,-196
    80007dc2:	fc040793          	addi	a5,s0,-64
    80007dc6:	863a                	mv	a2,a4
    80007dc8:	85be                	mv	a1,a5
    80007dca:	fe843503          	ld	a0,-24(s0)
    80007dce:	ffffe097          	auipc	ra,0xffffe
    80007dd2:	cfe080e7          	jalr	-770(ra) # 80005acc <dirlookup>
    80007dd6:	fea43023          	sd	a0,-32(s0)
    80007dda:	fe043783          	ld	a5,-32(s0)
    80007dde:	12078863          	beqz	a5,80007f0e <sys_unlink+0x1ec>
    goto bad;
  ilock(ip);
    80007de2:	fe043503          	ld	a0,-32(s0)
    80007de6:	ffffd097          	auipc	ra,0xffffd
    80007dea:	3b4080e7          	jalr	948(ra) # 8000519a <ilock>

  if(ip->nlink < 1)
    80007dee:	fe043783          	ld	a5,-32(s0)
    80007df2:	04a79783          	lh	a5,74(a5)
    80007df6:	00f04a63          	bgtz	a5,80007e0a <sys_unlink+0xe8>
    panic("unlink: nlink < 1");
    80007dfa:	00004517          	auipc	a0,0x4
    80007dfe:	84e50513          	addi	a0,a0,-1970 # 8000b648 <etext+0x648>
    80007e02:	ffff9097          	auipc	ra,0xffff9
    80007e06:	ebe080e7          	jalr	-322(ra) # 80000cc0 <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007e0a:	fe043783          	ld	a5,-32(s0)
    80007e0e:	04479703          	lh	a4,68(a5)
    80007e12:	4785                	li	a5,1
    80007e14:	02f71163          	bne	a4,a5,80007e36 <sys_unlink+0x114>
    80007e18:	fe043503          	ld	a0,-32(s0)
    80007e1c:	00000097          	auipc	ra,0x0
    80007e20:	e8c080e7          	jalr	-372(ra) # 80007ca8 <isdirempty>
    80007e24:	87aa                	mv	a5,a0
    80007e26:	eb81                	bnez	a5,80007e36 <sys_unlink+0x114>
    iunlockput(ip);
    80007e28:	fe043503          	ld	a0,-32(s0)
    80007e2c:	ffffd097          	auipc	ra,0xffffd
    80007e30:	5ca080e7          	jalr	1482(ra) # 800053f6 <iunlockput>
    goto bad;
    80007e34:	a8f1                	j	80007f10 <sys_unlink+0x1ee>
  }

  memset(&de, 0, sizeof(de));
    80007e36:	fd040793          	addi	a5,s0,-48
    80007e3a:	4641                	li	a2,16
    80007e3c:	4581                	li	a1,0
    80007e3e:	853e                	mv	a0,a5
    80007e40:	ffff9097          	auipc	ra,0xffff9
    80007e44:	658080e7          	jalr	1624(ra) # 80001498 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007e48:	fd040793          	addi	a5,s0,-48
    80007e4c:	f3c42683          	lw	a3,-196(s0)
    80007e50:	4741                	li	a4,16
    80007e52:	863e                	mv	a2,a5
    80007e54:	4581                	li	a1,0
    80007e56:	fe843503          	ld	a0,-24(s0)
    80007e5a:	ffffe097          	auipc	ra,0xffffe
    80007e5e:	a8a080e7          	jalr	-1398(ra) # 800058e4 <writei>
    80007e62:	87aa                	mv	a5,a0
    80007e64:	873e                	mv	a4,a5
    80007e66:	47c1                	li	a5,16
    80007e68:	00f70a63          	beq	a4,a5,80007e7c <sys_unlink+0x15a>
    panic("unlink: writei");
    80007e6c:	00003517          	auipc	a0,0x3
    80007e70:	7f450513          	addi	a0,a0,2036 # 8000b660 <etext+0x660>
    80007e74:	ffff9097          	auipc	ra,0xffff9
    80007e78:	e4c080e7          	jalr	-436(ra) # 80000cc0 <panic>
  if(ip->type == T_DIR){
    80007e7c:	fe043783          	ld	a5,-32(s0)
    80007e80:	04479703          	lh	a4,68(a5)
    80007e84:	4785                	li	a5,1
    80007e86:	02f71963          	bne	a4,a5,80007eb8 <sys_unlink+0x196>
    dp->nlink--;
    80007e8a:	fe843783          	ld	a5,-24(s0)
    80007e8e:	04a79783          	lh	a5,74(a5)
    80007e92:	17c2                	slli	a5,a5,0x30
    80007e94:	93c1                	srli	a5,a5,0x30
    80007e96:	37fd                	addiw	a5,a5,-1
    80007e98:	17c2                	slli	a5,a5,0x30
    80007e9a:	93c1                	srli	a5,a5,0x30
    80007e9c:	0107971b          	slliw	a4,a5,0x10
    80007ea0:	4107571b          	sraiw	a4,a4,0x10
    80007ea4:	fe843783          	ld	a5,-24(s0)
    80007ea8:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80007eac:	fe843503          	ld	a0,-24(s0)
    80007eb0:	ffffd097          	auipc	ra,0xffffd
    80007eb4:	09a080e7          	jalr	154(ra) # 80004f4a <iupdate>
  }
  iunlockput(dp);
    80007eb8:	fe843503          	ld	a0,-24(s0)
    80007ebc:	ffffd097          	auipc	ra,0xffffd
    80007ec0:	53a080e7          	jalr	1338(ra) # 800053f6 <iunlockput>

  ip->nlink--;
    80007ec4:	fe043783          	ld	a5,-32(s0)
    80007ec8:	04a79783          	lh	a5,74(a5)
    80007ecc:	17c2                	slli	a5,a5,0x30
    80007ece:	93c1                	srli	a5,a5,0x30
    80007ed0:	37fd                	addiw	a5,a5,-1
    80007ed2:	17c2                	slli	a5,a5,0x30
    80007ed4:	93c1                	srli	a5,a5,0x30
    80007ed6:	0107971b          	slliw	a4,a5,0x10
    80007eda:	4107571b          	sraiw	a4,a4,0x10
    80007ede:	fe043783          	ld	a5,-32(s0)
    80007ee2:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007ee6:	fe043503          	ld	a0,-32(s0)
    80007eea:	ffffd097          	auipc	ra,0xffffd
    80007eee:	060080e7          	jalr	96(ra) # 80004f4a <iupdate>
  iunlockput(ip);
    80007ef2:	fe043503          	ld	a0,-32(s0)
    80007ef6:	ffffd097          	auipc	ra,0xffffd
    80007efa:	500080e7          	jalr	1280(ra) # 800053f6 <iunlockput>

  end_op();
    80007efe:	ffffe097          	auipc	ra,0xffffe
    80007f02:	3ce080e7          	jalr	974(ra) # 800062cc <end_op>

  return 0;
    80007f06:	4781                	li	a5,0
    80007f08:	a839                	j	80007f26 <sys_unlink+0x204>
    goto bad;
    80007f0a:	0001                	nop
    80007f0c:	a011                	j	80007f10 <sys_unlink+0x1ee>
    goto bad;
    80007f0e:	0001                	nop

bad:
  iunlockput(dp);
    80007f10:	fe843503          	ld	a0,-24(s0)
    80007f14:	ffffd097          	auipc	ra,0xffffd
    80007f18:	4e2080e7          	jalr	1250(ra) # 800053f6 <iunlockput>
  end_op();
    80007f1c:	ffffe097          	auipc	ra,0xffffe
    80007f20:	3b0080e7          	jalr	944(ra) # 800062cc <end_op>
  return -1;
    80007f24:	57fd                	li	a5,-1
}
    80007f26:	853e                	mv	a0,a5
    80007f28:	60ae                	ld	ra,200(sp)
    80007f2a:	640e                	ld	s0,192(sp)
    80007f2c:	6169                	addi	sp,sp,208
    80007f2e:	8082                	ret

0000000080007f30 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80007f30:	7139                	addi	sp,sp,-64
    80007f32:	fc06                	sd	ra,56(sp)
    80007f34:	f822                	sd	s0,48(sp)
    80007f36:	0080                	addi	s0,sp,64
    80007f38:	fca43423          	sd	a0,-56(s0)
    80007f3c:	87ae                	mv	a5,a1
    80007f3e:	8736                	mv	a4,a3
    80007f40:	fcf41323          	sh	a5,-58(s0)
    80007f44:	87b2                	mv	a5,a2
    80007f46:	fcf41223          	sh	a5,-60(s0)
    80007f4a:	87ba                	mv	a5,a4
    80007f4c:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80007f50:	fd040793          	addi	a5,s0,-48
    80007f54:	85be                	mv	a1,a5
    80007f56:	fc843503          	ld	a0,-56(s0)
    80007f5a:	ffffe097          	auipc	ra,0xffffe
    80007f5e:	f8c080e7          	jalr	-116(ra) # 80005ee6 <nameiparent>
    80007f62:	fea43423          	sd	a0,-24(s0)
    80007f66:	fe843783          	ld	a5,-24(s0)
    80007f6a:	e399                	bnez	a5,80007f70 <create+0x40>
    return 0;
    80007f6c:	4781                	li	a5,0
    80007f6e:	a2cd                	j	80008150 <create+0x220>

  ilock(dp);
    80007f70:	fe843503          	ld	a0,-24(s0)
    80007f74:	ffffd097          	auipc	ra,0xffffd
    80007f78:	226080e7          	jalr	550(ra) # 8000519a <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80007f7c:	fd040793          	addi	a5,s0,-48
    80007f80:	4601                	li	a2,0
    80007f82:	85be                	mv	a1,a5
    80007f84:	fe843503          	ld	a0,-24(s0)
    80007f88:	ffffe097          	auipc	ra,0xffffe
    80007f8c:	b44080e7          	jalr	-1212(ra) # 80005acc <dirlookup>
    80007f90:	fea43023          	sd	a0,-32(s0)
    80007f94:	fe043783          	ld	a5,-32(s0)
    80007f98:	cfa9                	beqz	a5,80007ff2 <create+0xc2>
    iunlockput(dp);
    80007f9a:	fe843503          	ld	a0,-24(s0)
    80007f9e:	ffffd097          	auipc	ra,0xffffd
    80007fa2:	458080e7          	jalr	1112(ra) # 800053f6 <iunlockput>
    ilock(ip);
    80007fa6:	fe043503          	ld	a0,-32(s0)
    80007faa:	ffffd097          	auipc	ra,0xffffd
    80007fae:	1f0080e7          	jalr	496(ra) # 8000519a <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80007fb2:	fc641783          	lh	a5,-58(s0)
    80007fb6:	0007871b          	sext.w	a4,a5
    80007fba:	4789                	li	a5,2
    80007fbc:	02f71363          	bne	a4,a5,80007fe2 <create+0xb2>
    80007fc0:	fe043783          	ld	a5,-32(s0)
    80007fc4:	04479703          	lh	a4,68(a5)
    80007fc8:	4789                	li	a5,2
    80007fca:	00f70963          	beq	a4,a5,80007fdc <create+0xac>
    80007fce:	fe043783          	ld	a5,-32(s0)
    80007fd2:	04479703          	lh	a4,68(a5)
    80007fd6:	478d                	li	a5,3
    80007fd8:	00f71563          	bne	a4,a5,80007fe2 <create+0xb2>
      return ip;
    80007fdc:	fe043783          	ld	a5,-32(s0)
    80007fe0:	aa85                	j	80008150 <create+0x220>
    iunlockput(ip);
    80007fe2:	fe043503          	ld	a0,-32(s0)
    80007fe6:	ffffd097          	auipc	ra,0xffffd
    80007fea:	410080e7          	jalr	1040(ra) # 800053f6 <iunlockput>
    return 0;
    80007fee:	4781                	li	a5,0
    80007ff0:	a285                	j	80008150 <create+0x220>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    80007ff2:	fe843783          	ld	a5,-24(s0)
    80007ff6:	439c                	lw	a5,0(a5)
    80007ff8:	fc641703          	lh	a4,-58(s0)
    80007ffc:	85ba                	mv	a1,a4
    80007ffe:	853e                	mv	a0,a5
    80008000:	ffffd097          	auipc	ra,0xffffd
    80008004:	e4c080e7          	jalr	-436(ra) # 80004e4c <ialloc>
    80008008:	fea43023          	sd	a0,-32(s0)
    8000800c:	fe043783          	ld	a5,-32(s0)
    80008010:	eb89                	bnez	a5,80008022 <create+0xf2>
    iunlockput(dp);
    80008012:	fe843503          	ld	a0,-24(s0)
    80008016:	ffffd097          	auipc	ra,0xffffd
    8000801a:	3e0080e7          	jalr	992(ra) # 800053f6 <iunlockput>
    return 0;
    8000801e:	4781                	li	a5,0
    80008020:	aa05                	j	80008150 <create+0x220>
  }

  ilock(ip);
    80008022:	fe043503          	ld	a0,-32(s0)
    80008026:	ffffd097          	auipc	ra,0xffffd
    8000802a:	174080e7          	jalr	372(ra) # 8000519a <ilock>
  ip->major = major;
    8000802e:	fe043783          	ld	a5,-32(s0)
    80008032:	fc445703          	lhu	a4,-60(s0)
    80008036:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    8000803a:	fe043783          	ld	a5,-32(s0)
    8000803e:	fc245703          	lhu	a4,-62(s0)
    80008042:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80008046:	fe043783          	ld	a5,-32(s0)
    8000804a:	4705                	li	a4,1
    8000804c:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008050:	fe043503          	ld	a0,-32(s0)
    80008054:	ffffd097          	auipc	ra,0xffffd
    80008058:	ef6080e7          	jalr	-266(ra) # 80004f4a <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    8000805c:	fc641783          	lh	a5,-58(s0)
    80008060:	0007871b          	sext.w	a4,a5
    80008064:	4785                	li	a5,1
    80008066:	04f71463          	bne	a4,a5,800080ae <create+0x17e>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    8000806a:	fe043783          	ld	a5,-32(s0)
    8000806e:	43dc                	lw	a5,4(a5)
    80008070:	863e                	mv	a2,a5
    80008072:	00003597          	auipc	a1,0x3
    80008076:	5c658593          	addi	a1,a1,1478 # 8000b638 <etext+0x638>
    8000807a:	fe043503          	ld	a0,-32(s0)
    8000807e:	ffffe097          	auipc	ra,0xffffe
    80008082:	b32080e7          	jalr	-1230(ra) # 80005bb0 <dirlink>
    80008086:	87aa                	mv	a5,a0
    80008088:	0807ca63          	bltz	a5,8000811c <create+0x1ec>
    8000808c:	fe843783          	ld	a5,-24(s0)
    80008090:	43dc                	lw	a5,4(a5)
    80008092:	863e                	mv	a2,a5
    80008094:	00003597          	auipc	a1,0x3
    80008098:	5ac58593          	addi	a1,a1,1452 # 8000b640 <etext+0x640>
    8000809c:	fe043503          	ld	a0,-32(s0)
    800080a0:	ffffe097          	auipc	ra,0xffffe
    800080a4:	b10080e7          	jalr	-1264(ra) # 80005bb0 <dirlink>
    800080a8:	87aa                	mv	a5,a0
    800080aa:	0607c963          	bltz	a5,8000811c <create+0x1ec>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    800080ae:	fe043783          	ld	a5,-32(s0)
    800080b2:	43d8                	lw	a4,4(a5)
    800080b4:	fd040793          	addi	a5,s0,-48
    800080b8:	863a                	mv	a2,a4
    800080ba:	85be                	mv	a1,a5
    800080bc:	fe843503          	ld	a0,-24(s0)
    800080c0:	ffffe097          	auipc	ra,0xffffe
    800080c4:	af0080e7          	jalr	-1296(ra) # 80005bb0 <dirlink>
    800080c8:	87aa                	mv	a5,a0
    800080ca:	0407cb63          	bltz	a5,80008120 <create+0x1f0>
    goto fail;

  if(type == T_DIR){
    800080ce:	fc641783          	lh	a5,-58(s0)
    800080d2:	0007871b          	sext.w	a4,a5
    800080d6:	4785                	li	a5,1
    800080d8:	02f71963          	bne	a4,a5,8000810a <create+0x1da>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    800080dc:	fe843783          	ld	a5,-24(s0)
    800080e0:	04a79783          	lh	a5,74(a5)
    800080e4:	17c2                	slli	a5,a5,0x30
    800080e6:	93c1                	srli	a5,a5,0x30
    800080e8:	2785                	addiw	a5,a5,1
    800080ea:	17c2                	slli	a5,a5,0x30
    800080ec:	93c1                	srli	a5,a5,0x30
    800080ee:	0107971b          	slliw	a4,a5,0x10
    800080f2:	4107571b          	sraiw	a4,a4,0x10
    800080f6:	fe843783          	ld	a5,-24(s0)
    800080fa:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800080fe:	fe843503          	ld	a0,-24(s0)
    80008102:	ffffd097          	auipc	ra,0xffffd
    80008106:	e48080e7          	jalr	-440(ra) # 80004f4a <iupdate>
  }

  iunlockput(dp);
    8000810a:	fe843503          	ld	a0,-24(s0)
    8000810e:	ffffd097          	auipc	ra,0xffffd
    80008112:	2e8080e7          	jalr	744(ra) # 800053f6 <iunlockput>

  return ip;
    80008116:	fe043783          	ld	a5,-32(s0)
    8000811a:	a81d                	j	80008150 <create+0x220>
      goto fail;
    8000811c:	0001                	nop
    8000811e:	a011                	j	80008122 <create+0x1f2>
    goto fail;
    80008120:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    80008122:	fe043783          	ld	a5,-32(s0)
    80008126:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    8000812a:	fe043503          	ld	a0,-32(s0)
    8000812e:	ffffd097          	auipc	ra,0xffffd
    80008132:	e1c080e7          	jalr	-484(ra) # 80004f4a <iupdate>
  iunlockput(ip);
    80008136:	fe043503          	ld	a0,-32(s0)
    8000813a:	ffffd097          	auipc	ra,0xffffd
    8000813e:	2bc080e7          	jalr	700(ra) # 800053f6 <iunlockput>
  iunlockput(dp);
    80008142:	fe843503          	ld	a0,-24(s0)
    80008146:	ffffd097          	auipc	ra,0xffffd
    8000814a:	2b0080e7          	jalr	688(ra) # 800053f6 <iunlockput>
  return 0;
    8000814e:	4781                	li	a5,0
}
    80008150:	853e                	mv	a0,a5
    80008152:	70e2                	ld	ra,56(sp)
    80008154:	7442                	ld	s0,48(sp)
    80008156:	6121                	addi	sp,sp,64
    80008158:	8082                	ret

000000008000815a <sys_open>:

uint64
sys_open(void)
{
    8000815a:	7131                	addi	sp,sp,-192
    8000815c:	fd06                	sd	ra,184(sp)
    8000815e:	f922                	sd	s0,176(sp)
    80008160:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    80008162:	f4c40793          	addi	a5,s0,-180
    80008166:	85be                	mv	a1,a5
    80008168:	4505                	li	a0,1
    8000816a:	ffffc097          	auipc	ra,0xffffc
    8000816e:	09c080e7          	jalr	156(ra) # 80004206 <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    80008172:	f5040793          	addi	a5,s0,-176
    80008176:	08000613          	li	a2,128
    8000817a:	85be                	mv	a1,a5
    8000817c:	4501                	li	a0,0
    8000817e:	ffffc097          	auipc	ra,0xffffc
    80008182:	0f0080e7          	jalr	240(ra) # 8000426e <argstr>
    80008186:	87aa                	mv	a5,a0
    80008188:	fef42223          	sw	a5,-28(s0)
    8000818c:	fe442783          	lw	a5,-28(s0)
    80008190:	2781                	sext.w	a5,a5
    80008192:	0007d463          	bgez	a5,8000819a <sys_open+0x40>
    return -1;
    80008196:	57fd                	li	a5,-1
    80008198:	aad5                	j	8000838c <sys_open+0x232>

  begin_op();
    8000819a:	ffffe097          	auipc	ra,0xffffe
    8000819e:	070080e7          	jalr	112(ra) # 8000620a <begin_op>

  if(omode & O_CREATE){
    800081a2:	f4c42783          	lw	a5,-180(s0)
    800081a6:	2007f793          	andi	a5,a5,512
    800081aa:	2781                	sext.w	a5,a5
    800081ac:	c795                	beqz	a5,800081d8 <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    800081ae:	f5040793          	addi	a5,s0,-176
    800081b2:	4681                	li	a3,0
    800081b4:	4601                	li	a2,0
    800081b6:	4589                	li	a1,2
    800081b8:	853e                	mv	a0,a5
    800081ba:	00000097          	auipc	ra,0x0
    800081be:	d76080e7          	jalr	-650(ra) # 80007f30 <create>
    800081c2:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800081c6:	fe843783          	ld	a5,-24(s0)
    800081ca:	e7ad                	bnez	a5,80008234 <sys_open+0xda>
      end_op();
    800081cc:	ffffe097          	auipc	ra,0xffffe
    800081d0:	100080e7          	jalr	256(ra) # 800062cc <end_op>
      return -1;
    800081d4:	57fd                	li	a5,-1
    800081d6:	aa5d                	j	8000838c <sys_open+0x232>
    }
  } else {
    if((ip = namei(path)) == 0){
    800081d8:	f5040793          	addi	a5,s0,-176
    800081dc:	853e                	mv	a0,a5
    800081de:	ffffe097          	auipc	ra,0xffffe
    800081e2:	cdc080e7          	jalr	-804(ra) # 80005eba <namei>
    800081e6:	fea43423          	sd	a0,-24(s0)
    800081ea:	fe843783          	ld	a5,-24(s0)
    800081ee:	e799                	bnez	a5,800081fc <sys_open+0xa2>
      end_op();
    800081f0:	ffffe097          	auipc	ra,0xffffe
    800081f4:	0dc080e7          	jalr	220(ra) # 800062cc <end_op>
      return -1;
    800081f8:	57fd                	li	a5,-1
    800081fa:	aa49                	j	8000838c <sys_open+0x232>
    }
    ilock(ip);
    800081fc:	fe843503          	ld	a0,-24(s0)
    80008200:	ffffd097          	auipc	ra,0xffffd
    80008204:	f9a080e7          	jalr	-102(ra) # 8000519a <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    80008208:	fe843783          	ld	a5,-24(s0)
    8000820c:	04479703          	lh	a4,68(a5)
    80008210:	4785                	li	a5,1
    80008212:	02f71163          	bne	a4,a5,80008234 <sys_open+0xda>
    80008216:	f4c42783          	lw	a5,-180(s0)
    8000821a:	cf89                	beqz	a5,80008234 <sys_open+0xda>
      iunlockput(ip);
    8000821c:	fe843503          	ld	a0,-24(s0)
    80008220:	ffffd097          	auipc	ra,0xffffd
    80008224:	1d6080e7          	jalr	470(ra) # 800053f6 <iunlockput>
      end_op();
    80008228:	ffffe097          	auipc	ra,0xffffe
    8000822c:	0a4080e7          	jalr	164(ra) # 800062cc <end_op>
      return -1;
    80008230:	57fd                	li	a5,-1
    80008232:	aaa9                	j	8000838c <sys_open+0x232>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    80008234:	fe843783          	ld	a5,-24(s0)
    80008238:	04479703          	lh	a4,68(a5)
    8000823c:	478d                	li	a5,3
    8000823e:	02f71b63          	bne	a4,a5,80008274 <sys_open+0x11a>
    80008242:	fe843783          	ld	a5,-24(s0)
    80008246:	04679783          	lh	a5,70(a5)
    8000824a:	0007c963          	bltz	a5,8000825c <sys_open+0x102>
    8000824e:	fe843783          	ld	a5,-24(s0)
    80008252:	04679703          	lh	a4,70(a5)
    80008256:	47a5                	li	a5,9
    80008258:	00e7de63          	bge	a5,a4,80008274 <sys_open+0x11a>
    iunlockput(ip);
    8000825c:	fe843503          	ld	a0,-24(s0)
    80008260:	ffffd097          	auipc	ra,0xffffd
    80008264:	196080e7          	jalr	406(ra) # 800053f6 <iunlockput>
    end_op();
    80008268:	ffffe097          	auipc	ra,0xffffe
    8000826c:	064080e7          	jalr	100(ra) # 800062cc <end_op>
    return -1;
    80008270:	57fd                	li	a5,-1
    80008272:	aa29                	j	8000838c <sys_open+0x232>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008274:	ffffe097          	auipc	ra,0xffffe
    80008278:	536080e7          	jalr	1334(ra) # 800067aa <filealloc>
    8000827c:	fca43c23          	sd	a0,-40(s0)
    80008280:	fd843783          	ld	a5,-40(s0)
    80008284:	cf99                	beqz	a5,800082a2 <sys_open+0x148>
    80008286:	fd843503          	ld	a0,-40(s0)
    8000828a:	fffff097          	auipc	ra,0xfffff
    8000828e:	60c080e7          	jalr	1548(ra) # 80007896 <fdalloc>
    80008292:	87aa                	mv	a5,a0
    80008294:	fcf42a23          	sw	a5,-44(s0)
    80008298:	fd442783          	lw	a5,-44(s0)
    8000829c:	2781                	sext.w	a5,a5
    8000829e:	0207d763          	bgez	a5,800082cc <sys_open+0x172>
    if(f)
    800082a2:	fd843783          	ld	a5,-40(s0)
    800082a6:	c799                	beqz	a5,800082b4 <sys_open+0x15a>
      fileclose(f);
    800082a8:	fd843503          	ld	a0,-40(s0)
    800082ac:	ffffe097          	auipc	ra,0xffffe
    800082b0:	5e8080e7          	jalr	1512(ra) # 80006894 <fileclose>
    iunlockput(ip);
    800082b4:	fe843503          	ld	a0,-24(s0)
    800082b8:	ffffd097          	auipc	ra,0xffffd
    800082bc:	13e080e7          	jalr	318(ra) # 800053f6 <iunlockput>
    end_op();
    800082c0:	ffffe097          	auipc	ra,0xffffe
    800082c4:	00c080e7          	jalr	12(ra) # 800062cc <end_op>
    return -1;
    800082c8:	57fd                	li	a5,-1
    800082ca:	a0c9                	j	8000838c <sys_open+0x232>
  }

  if(ip->type == T_DEVICE){
    800082cc:	fe843783          	ld	a5,-24(s0)
    800082d0:	04479703          	lh	a4,68(a5)
    800082d4:	478d                	li	a5,3
    800082d6:	00f71f63          	bne	a4,a5,800082f4 <sys_open+0x19a>
    f->type = FD_DEVICE;
    800082da:	fd843783          	ld	a5,-40(s0)
    800082de:	470d                	li	a4,3
    800082e0:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800082e2:	fe843783          	ld	a5,-24(s0)
    800082e6:	04679703          	lh	a4,70(a5)
    800082ea:	fd843783          	ld	a5,-40(s0)
    800082ee:	02e79223          	sh	a4,36(a5)
    800082f2:	a809                	j	80008304 <sys_open+0x1aa>
  } else {
    f->type = FD_INODE;
    800082f4:	fd843783          	ld	a5,-40(s0)
    800082f8:	4709                	li	a4,2
    800082fa:	c398                	sw	a4,0(a5)
    f->off = 0;
    800082fc:	fd843783          	ld	a5,-40(s0)
    80008300:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    80008304:	fd843783          	ld	a5,-40(s0)
    80008308:	fe843703          	ld	a4,-24(s0)
    8000830c:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    8000830e:	f4c42783          	lw	a5,-180(s0)
    80008312:	8b85                	andi	a5,a5,1
    80008314:	2781                	sext.w	a5,a5
    80008316:	0017b793          	seqz	a5,a5
    8000831a:	0ff7f793          	zext.b	a5,a5
    8000831e:	873e                	mv	a4,a5
    80008320:	fd843783          	ld	a5,-40(s0)
    80008324:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008328:	f4c42783          	lw	a5,-180(s0)
    8000832c:	8b85                	andi	a5,a5,1
    8000832e:	2781                	sext.w	a5,a5
    80008330:	e791                	bnez	a5,8000833c <sys_open+0x1e2>
    80008332:	f4c42783          	lw	a5,-180(s0)
    80008336:	8b89                	andi	a5,a5,2
    80008338:	2781                	sext.w	a5,a5
    8000833a:	c399                	beqz	a5,80008340 <sys_open+0x1e6>
    8000833c:	4785                	li	a5,1
    8000833e:	a011                	j	80008342 <sys_open+0x1e8>
    80008340:	4781                	li	a5,0
    80008342:	0ff7f713          	zext.b	a4,a5
    80008346:	fd843783          	ld	a5,-40(s0)
    8000834a:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000834e:	f4c42783          	lw	a5,-180(s0)
    80008352:	4007f793          	andi	a5,a5,1024
    80008356:	2781                	sext.w	a5,a5
    80008358:	cf91                	beqz	a5,80008374 <sys_open+0x21a>
    8000835a:	fe843783          	ld	a5,-24(s0)
    8000835e:	04479703          	lh	a4,68(a5)
    80008362:	4789                	li	a5,2
    80008364:	00f71863          	bne	a4,a5,80008374 <sys_open+0x21a>
    itrunc(ip);
    80008368:	fe843503          	ld	a0,-24(s0)
    8000836c:	ffffd097          	auipc	ra,0xffffd
    80008370:	234080e7          	jalr	564(ra) # 800055a0 <itrunc>
  }

  iunlock(ip);
    80008374:	fe843503          	ld	a0,-24(s0)
    80008378:	ffffd097          	auipc	ra,0xffffd
    8000837c:	f56080e7          	jalr	-170(ra) # 800052ce <iunlock>
  end_op();
    80008380:	ffffe097          	auipc	ra,0xffffe
    80008384:	f4c080e7          	jalr	-180(ra) # 800062cc <end_op>

  return fd;
    80008388:	fd442783          	lw	a5,-44(s0)
}
    8000838c:	853e                	mv	a0,a5
    8000838e:	70ea                	ld	ra,184(sp)
    80008390:	744a                	ld	s0,176(sp)
    80008392:	6129                	addi	sp,sp,192
    80008394:	8082                	ret

0000000080008396 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008396:	7135                	addi	sp,sp,-160
    80008398:	ed06                	sd	ra,152(sp)
    8000839a:	e922                	sd	s0,144(sp)
    8000839c:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    8000839e:	ffffe097          	auipc	ra,0xffffe
    800083a2:	e6c080e7          	jalr	-404(ra) # 8000620a <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800083a6:	f6840793          	addi	a5,s0,-152
    800083aa:	08000613          	li	a2,128
    800083ae:	85be                	mv	a1,a5
    800083b0:	4501                	li	a0,0
    800083b2:	ffffc097          	auipc	ra,0xffffc
    800083b6:	ebc080e7          	jalr	-324(ra) # 8000426e <argstr>
    800083ba:	87aa                	mv	a5,a0
    800083bc:	0207c163          	bltz	a5,800083de <sys_mkdir+0x48>
    800083c0:	f6840793          	addi	a5,s0,-152
    800083c4:	4681                	li	a3,0
    800083c6:	4601                	li	a2,0
    800083c8:	4585                	li	a1,1
    800083ca:	853e                	mv	a0,a5
    800083cc:	00000097          	auipc	ra,0x0
    800083d0:	b64080e7          	jalr	-1180(ra) # 80007f30 <create>
    800083d4:	fea43423          	sd	a0,-24(s0)
    800083d8:	fe843783          	ld	a5,-24(s0)
    800083dc:	e799                	bnez	a5,800083ea <sys_mkdir+0x54>
    end_op();
    800083de:	ffffe097          	auipc	ra,0xffffe
    800083e2:	eee080e7          	jalr	-274(ra) # 800062cc <end_op>
    return -1;
    800083e6:	57fd                	li	a5,-1
    800083e8:	a821                	j	80008400 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800083ea:	fe843503          	ld	a0,-24(s0)
    800083ee:	ffffd097          	auipc	ra,0xffffd
    800083f2:	008080e7          	jalr	8(ra) # 800053f6 <iunlockput>
  end_op();
    800083f6:	ffffe097          	auipc	ra,0xffffe
    800083fa:	ed6080e7          	jalr	-298(ra) # 800062cc <end_op>
  return 0;
    800083fe:	4781                	li	a5,0
}
    80008400:	853e                	mv	a0,a5
    80008402:	60ea                	ld	ra,152(sp)
    80008404:	644a                	ld	s0,144(sp)
    80008406:	610d                	addi	sp,sp,160
    80008408:	8082                	ret

000000008000840a <sys_mknod>:

uint64
sys_mknod(void)
{
    8000840a:	7135                	addi	sp,sp,-160
    8000840c:	ed06                	sd	ra,152(sp)
    8000840e:	e922                	sd	s0,144(sp)
    80008410:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    80008412:	ffffe097          	auipc	ra,0xffffe
    80008416:	df8080e7          	jalr	-520(ra) # 8000620a <begin_op>
  argint(1, &major);
    8000841a:	f6440793          	addi	a5,s0,-156
    8000841e:	85be                	mv	a1,a5
    80008420:	4505                	li	a0,1
    80008422:	ffffc097          	auipc	ra,0xffffc
    80008426:	de4080e7          	jalr	-540(ra) # 80004206 <argint>
  argint(2, &minor);
    8000842a:	f6040793          	addi	a5,s0,-160
    8000842e:	85be                	mv	a1,a5
    80008430:	4509                	li	a0,2
    80008432:	ffffc097          	auipc	ra,0xffffc
    80008436:	dd4080e7          	jalr	-556(ra) # 80004206 <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    8000843a:	f6840793          	addi	a5,s0,-152
    8000843e:	08000613          	li	a2,128
    80008442:	85be                	mv	a1,a5
    80008444:	4501                	li	a0,0
    80008446:	ffffc097          	auipc	ra,0xffffc
    8000844a:	e28080e7          	jalr	-472(ra) # 8000426e <argstr>
    8000844e:	87aa                	mv	a5,a0
    80008450:	0207cc63          	bltz	a5,80008488 <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008454:	f6442783          	lw	a5,-156(s0)
    80008458:	0107971b          	slliw	a4,a5,0x10
    8000845c:	4107571b          	sraiw	a4,a4,0x10
    80008460:	f6042783          	lw	a5,-160(s0)
    80008464:	0107969b          	slliw	a3,a5,0x10
    80008468:	4106d69b          	sraiw	a3,a3,0x10
    8000846c:	f6840793          	addi	a5,s0,-152
    80008470:	863a                	mv	a2,a4
    80008472:	458d                	li	a1,3
    80008474:	853e                	mv	a0,a5
    80008476:	00000097          	auipc	ra,0x0
    8000847a:	aba080e7          	jalr	-1350(ra) # 80007f30 <create>
    8000847e:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008482:	fe843783          	ld	a5,-24(s0)
    80008486:	e799                	bnez	a5,80008494 <sys_mknod+0x8a>
    end_op();
    80008488:	ffffe097          	auipc	ra,0xffffe
    8000848c:	e44080e7          	jalr	-444(ra) # 800062cc <end_op>
    return -1;
    80008490:	57fd                	li	a5,-1
    80008492:	a821                	j	800084aa <sys_mknod+0xa0>
  }
  iunlockput(ip);
    80008494:	fe843503          	ld	a0,-24(s0)
    80008498:	ffffd097          	auipc	ra,0xffffd
    8000849c:	f5e080e7          	jalr	-162(ra) # 800053f6 <iunlockput>
  end_op();
    800084a0:	ffffe097          	auipc	ra,0xffffe
    800084a4:	e2c080e7          	jalr	-468(ra) # 800062cc <end_op>
  return 0;
    800084a8:	4781                	li	a5,0
}
    800084aa:	853e                	mv	a0,a5
    800084ac:	60ea                	ld	ra,152(sp)
    800084ae:	644a                	ld	s0,144(sp)
    800084b0:	610d                	addi	sp,sp,160
    800084b2:	8082                	ret

00000000800084b4 <sys_chdir>:

uint64
sys_chdir(void)
{
    800084b4:	7135                	addi	sp,sp,-160
    800084b6:	ed06                	sd	ra,152(sp)
    800084b8:	e922                	sd	s0,144(sp)
    800084ba:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800084bc:	ffffa097          	auipc	ra,0xffffa
    800084c0:	400080e7          	jalr	1024(ra) # 800028bc <myproc>
    800084c4:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800084c8:	ffffe097          	auipc	ra,0xffffe
    800084cc:	d42080e7          	jalr	-702(ra) # 8000620a <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800084d0:	f6040793          	addi	a5,s0,-160
    800084d4:	08000613          	li	a2,128
    800084d8:	85be                	mv	a1,a5
    800084da:	4501                	li	a0,0
    800084dc:	ffffc097          	auipc	ra,0xffffc
    800084e0:	d92080e7          	jalr	-622(ra) # 8000426e <argstr>
    800084e4:	87aa                	mv	a5,a0
    800084e6:	0007ce63          	bltz	a5,80008502 <sys_chdir+0x4e>
    800084ea:	f6040793          	addi	a5,s0,-160
    800084ee:	853e                	mv	a0,a5
    800084f0:	ffffe097          	auipc	ra,0xffffe
    800084f4:	9ca080e7          	jalr	-1590(ra) # 80005eba <namei>
    800084f8:	fea43023          	sd	a0,-32(s0)
    800084fc:	fe043783          	ld	a5,-32(s0)
    80008500:	e799                	bnez	a5,8000850e <sys_chdir+0x5a>
    end_op();
    80008502:	ffffe097          	auipc	ra,0xffffe
    80008506:	dca080e7          	jalr	-566(ra) # 800062cc <end_op>
    return -1;
    8000850a:	57fd                	li	a5,-1
    8000850c:	a0a5                	j	80008574 <sys_chdir+0xc0>
  }
  ilock(ip);
    8000850e:	fe043503          	ld	a0,-32(s0)
    80008512:	ffffd097          	auipc	ra,0xffffd
    80008516:	c88080e7          	jalr	-888(ra) # 8000519a <ilock>
  if(ip->type != T_DIR){
    8000851a:	fe043783          	ld	a5,-32(s0)
    8000851e:	04479703          	lh	a4,68(a5)
    80008522:	4785                	li	a5,1
    80008524:	00f70e63          	beq	a4,a5,80008540 <sys_chdir+0x8c>
    iunlockput(ip);
    80008528:	fe043503          	ld	a0,-32(s0)
    8000852c:	ffffd097          	auipc	ra,0xffffd
    80008530:	eca080e7          	jalr	-310(ra) # 800053f6 <iunlockput>
    end_op();
    80008534:	ffffe097          	auipc	ra,0xffffe
    80008538:	d98080e7          	jalr	-616(ra) # 800062cc <end_op>
    return -1;
    8000853c:	57fd                	li	a5,-1
    8000853e:	a81d                	j	80008574 <sys_chdir+0xc0>
  }
  iunlock(ip);
    80008540:	fe043503          	ld	a0,-32(s0)
    80008544:	ffffd097          	auipc	ra,0xffffd
    80008548:	d8a080e7          	jalr	-630(ra) # 800052ce <iunlock>
  iput(p->cwd);
    8000854c:	fe843783          	ld	a5,-24(s0)
    80008550:	1507b783          	ld	a5,336(a5)
    80008554:	853e                	mv	a0,a5
    80008556:	ffffd097          	auipc	ra,0xffffd
    8000855a:	dd2080e7          	jalr	-558(ra) # 80005328 <iput>
  end_op();
    8000855e:	ffffe097          	auipc	ra,0xffffe
    80008562:	d6e080e7          	jalr	-658(ra) # 800062cc <end_op>
  p->cwd = ip;
    80008566:	fe843783          	ld	a5,-24(s0)
    8000856a:	fe043703          	ld	a4,-32(s0)
    8000856e:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008572:	4781                	li	a5,0
}
    80008574:	853e                	mv	a0,a5
    80008576:	60ea                	ld	ra,152(sp)
    80008578:	644a                	ld	s0,144(sp)
    8000857a:	610d                	addi	sp,sp,160
    8000857c:	8082                	ret

000000008000857e <sys_exec>:

uint64
sys_exec(void)
{
    8000857e:	7161                	addi	sp,sp,-432
    80008580:	f706                	sd	ra,424(sp)
    80008582:	f322                	sd	s0,416(sp)
    80008584:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    80008586:	e6040793          	addi	a5,s0,-416
    8000858a:	85be                	mv	a1,a5
    8000858c:	4505                	li	a0,1
    8000858e:	ffffc097          	auipc	ra,0xffffc
    80008592:	cae080e7          	jalr	-850(ra) # 8000423c <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    80008596:	f6840793          	addi	a5,s0,-152
    8000859a:	08000613          	li	a2,128
    8000859e:	85be                	mv	a1,a5
    800085a0:	4501                	li	a0,0
    800085a2:	ffffc097          	auipc	ra,0xffffc
    800085a6:	ccc080e7          	jalr	-820(ra) # 8000426e <argstr>
    800085aa:	87aa                	mv	a5,a0
    800085ac:	0007d463          	bgez	a5,800085b4 <sys_exec+0x36>
    return -1;
    800085b0:	57fd                	li	a5,-1
    800085b2:	a2bd                	j	80008720 <sys_exec+0x1a2>
  }
  memset(argv, 0, sizeof(argv));
    800085b4:	e6840793          	addi	a5,s0,-408
    800085b8:	10000613          	li	a2,256
    800085bc:	4581                	li	a1,0
    800085be:	853e                	mv	a0,a5
    800085c0:	ffff9097          	auipc	ra,0xffff9
    800085c4:	ed8080e7          	jalr	-296(ra) # 80001498 <memset>
  for(i=0;; i++){
    800085c8:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800085cc:	fec42703          	lw	a4,-20(s0)
    800085d0:	47fd                	li	a5,31
    800085d2:	0ee7ee63          	bltu	a5,a4,800086ce <sys_exec+0x150>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    800085d6:	fec42783          	lw	a5,-20(s0)
    800085da:	00379713          	slli	a4,a5,0x3
    800085de:	e6043783          	ld	a5,-416(s0)
    800085e2:	97ba                	add	a5,a5,a4
    800085e4:	e5840713          	addi	a4,s0,-424
    800085e8:	85ba                	mv	a1,a4
    800085ea:	853e                	mv	a0,a5
    800085ec:	ffffc097          	auipc	ra,0xffffc
    800085f0:	aa8080e7          	jalr	-1368(ra) # 80004094 <fetchaddr>
    800085f4:	87aa                	mv	a5,a0
    800085f6:	0c07ce63          	bltz	a5,800086d2 <sys_exec+0x154>
      goto bad;
    }
    if(uarg == 0){
    800085fa:	e5843783          	ld	a5,-424(s0)
    800085fe:	eb95                	bnez	a5,80008632 <sys_exec+0xb4>
      argv[i] = 0;
    80008600:	fec42703          	lw	a4,-20(s0)
    80008604:	e6840793          	addi	a5,s0,-408
    80008608:	070e                	slli	a4,a4,0x3
    8000860a:	97ba                	add	a5,a5,a4
    8000860c:	0007b023          	sd	zero,0(a5)
      break;
    80008610:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008612:	e6840713          	addi	a4,s0,-408
    80008616:	f6840793          	addi	a5,s0,-152
    8000861a:	85ba                	mv	a1,a4
    8000861c:	853e                	mv	a0,a5
    8000861e:	fffff097          	auipc	ra,0xfffff
    80008622:	c54080e7          	jalr	-940(ra) # 80007272 <exec>
    80008626:	87aa                	mv	a5,a0
    80008628:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000862c:	fe042623          	sw	zero,-20(s0)
    80008630:	a8bd                	j	800086ae <sys_exec+0x130>
    argv[i] = kalloc();
    80008632:	ffff9097          	auipc	ra,0xffff9
    80008636:	b32080e7          	jalr	-1230(ra) # 80001164 <kalloc>
    8000863a:	86aa                	mv	a3,a0
    8000863c:	fec42703          	lw	a4,-20(s0)
    80008640:	e6840793          	addi	a5,s0,-408
    80008644:	070e                	slli	a4,a4,0x3
    80008646:	97ba                	add	a5,a5,a4
    80008648:	e394                	sd	a3,0(a5)
    if(argv[i] == 0)
    8000864a:	fec42703          	lw	a4,-20(s0)
    8000864e:	e6840793          	addi	a5,s0,-408
    80008652:	070e                	slli	a4,a4,0x3
    80008654:	97ba                	add	a5,a5,a4
    80008656:	639c                	ld	a5,0(a5)
    80008658:	cfbd                	beqz	a5,800086d6 <sys_exec+0x158>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8000865a:	e5843683          	ld	a3,-424(s0)
    8000865e:	fec42703          	lw	a4,-20(s0)
    80008662:	e6840793          	addi	a5,s0,-408
    80008666:	070e                	slli	a4,a4,0x3
    80008668:	97ba                	add	a5,a5,a4
    8000866a:	639c                	ld	a5,0(a5)
    8000866c:	6605                	lui	a2,0x1
    8000866e:	85be                	mv	a1,a5
    80008670:	8536                	mv	a0,a3
    80008672:	ffffc097          	auipc	ra,0xffffc
    80008676:	a90080e7          	jalr	-1392(ra) # 80004102 <fetchstr>
    8000867a:	87aa                	mv	a5,a0
    8000867c:	0407cf63          	bltz	a5,800086da <sys_exec+0x15c>
  for(i=0;; i++){
    80008680:	fec42783          	lw	a5,-20(s0)
    80008684:	2785                	addiw	a5,a5,1
    80008686:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    8000868a:	b789                	j	800085cc <sys_exec+0x4e>
    kfree(argv[i]);
    8000868c:	fec42703          	lw	a4,-20(s0)
    80008690:	e6840793          	addi	a5,s0,-408
    80008694:	070e                	slli	a4,a4,0x3
    80008696:	97ba                	add	a5,a5,a4
    80008698:	639c                	ld	a5,0(a5)
    8000869a:	853e                	mv	a0,a5
    8000869c:	ffff9097          	auipc	ra,0xffff9
    800086a0:	a24080e7          	jalr	-1500(ra) # 800010c0 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800086a4:	fec42783          	lw	a5,-20(s0)
    800086a8:	2785                	addiw	a5,a5,1
    800086aa:	fef42623          	sw	a5,-20(s0)
    800086ae:	fec42703          	lw	a4,-20(s0)
    800086b2:	47fd                	li	a5,31
    800086b4:	00e7ea63          	bltu	a5,a4,800086c8 <sys_exec+0x14a>
    800086b8:	fec42703          	lw	a4,-20(s0)
    800086bc:	e6840793          	addi	a5,s0,-408
    800086c0:	070e                	slli	a4,a4,0x3
    800086c2:	97ba                	add	a5,a5,a4
    800086c4:	639c                	ld	a5,0(a5)
    800086c6:	f3f9                	bnez	a5,8000868c <sys_exec+0x10e>

  return ret;
    800086c8:	fe842783          	lw	a5,-24(s0)
    800086cc:	a891                	j	80008720 <sys_exec+0x1a2>
      goto bad;
    800086ce:	0001                	nop
    800086d0:	a031                	j	800086dc <sys_exec+0x15e>
      goto bad;
    800086d2:	0001                	nop
    800086d4:	a021                	j	800086dc <sys_exec+0x15e>
      goto bad;
    800086d6:	0001                	nop
    800086d8:	a011                	j	800086dc <sys_exec+0x15e>
      goto bad;
    800086da:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800086dc:	fe042623          	sw	zero,-20(s0)
    800086e0:	a015                	j	80008704 <sys_exec+0x186>
    kfree(argv[i]);
    800086e2:	fec42703          	lw	a4,-20(s0)
    800086e6:	e6840793          	addi	a5,s0,-408
    800086ea:	070e                	slli	a4,a4,0x3
    800086ec:	97ba                	add	a5,a5,a4
    800086ee:	639c                	ld	a5,0(a5)
    800086f0:	853e                	mv	a0,a5
    800086f2:	ffff9097          	auipc	ra,0xffff9
    800086f6:	9ce080e7          	jalr	-1586(ra) # 800010c0 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800086fa:	fec42783          	lw	a5,-20(s0)
    800086fe:	2785                	addiw	a5,a5,1
    80008700:	fef42623          	sw	a5,-20(s0)
    80008704:	fec42703          	lw	a4,-20(s0)
    80008708:	47fd                	li	a5,31
    8000870a:	00e7ea63          	bltu	a5,a4,8000871e <sys_exec+0x1a0>
    8000870e:	fec42703          	lw	a4,-20(s0)
    80008712:	e6840793          	addi	a5,s0,-408
    80008716:	070e                	slli	a4,a4,0x3
    80008718:	97ba                	add	a5,a5,a4
    8000871a:	639c                	ld	a5,0(a5)
    8000871c:	f3f9                	bnez	a5,800086e2 <sys_exec+0x164>
  return -1;
    8000871e:	57fd                	li	a5,-1
}
    80008720:	853e                	mv	a0,a5
    80008722:	70ba                	ld	ra,424(sp)
    80008724:	741a                	ld	s0,416(sp)
    80008726:	615d                	addi	sp,sp,432
    80008728:	8082                	ret

000000008000872a <sys_pipe>:

uint64
sys_pipe(void)
{
    8000872a:	7139                	addi	sp,sp,-64
    8000872c:	fc06                	sd	ra,56(sp)
    8000872e:	f822                	sd	s0,48(sp)
    80008730:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008732:	ffffa097          	auipc	ra,0xffffa
    80008736:	18a080e7          	jalr	394(ra) # 800028bc <myproc>
    8000873a:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    8000873e:	fe040793          	addi	a5,s0,-32
    80008742:	85be                	mv	a1,a5
    80008744:	4501                	li	a0,0
    80008746:	ffffc097          	auipc	ra,0xffffc
    8000874a:	af6080e7          	jalr	-1290(ra) # 8000423c <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    8000874e:	fd040713          	addi	a4,s0,-48
    80008752:	fd840793          	addi	a5,s0,-40
    80008756:	85ba                	mv	a1,a4
    80008758:	853e                	mv	a0,a5
    8000875a:	ffffe097          	auipc	ra,0xffffe
    8000875e:	632080e7          	jalr	1586(ra) # 80006d8c <pipealloc>
    80008762:	87aa                	mv	a5,a0
    80008764:	0007d463          	bgez	a5,8000876c <sys_pipe+0x42>
    return -1;
    80008768:	57fd                	li	a5,-1
    8000876a:	a219                	j	80008870 <sys_pipe+0x146>
  fd0 = -1;
    8000876c:	57fd                	li	a5,-1
    8000876e:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008772:	fd843783          	ld	a5,-40(s0)
    80008776:	853e                	mv	a0,a5
    80008778:	fffff097          	auipc	ra,0xfffff
    8000877c:	11e080e7          	jalr	286(ra) # 80007896 <fdalloc>
    80008780:	87aa                	mv	a5,a0
    80008782:	fcf42623          	sw	a5,-52(s0)
    80008786:	fcc42783          	lw	a5,-52(s0)
    8000878a:	0207c063          	bltz	a5,800087aa <sys_pipe+0x80>
    8000878e:	fd043783          	ld	a5,-48(s0)
    80008792:	853e                	mv	a0,a5
    80008794:	fffff097          	auipc	ra,0xfffff
    80008798:	102080e7          	jalr	258(ra) # 80007896 <fdalloc>
    8000879c:	87aa                	mv	a5,a0
    8000879e:	fcf42423          	sw	a5,-56(s0)
    800087a2:	fc842783          	lw	a5,-56(s0)
    800087a6:	0207df63          	bgez	a5,800087e4 <sys_pipe+0xba>
    if(fd0 >= 0)
    800087aa:	fcc42783          	lw	a5,-52(s0)
    800087ae:	0007cb63          	bltz	a5,800087c4 <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    800087b2:	fcc42783          	lw	a5,-52(s0)
    800087b6:	fe843703          	ld	a4,-24(s0)
    800087ba:	07e9                	addi	a5,a5,26
    800087bc:	078e                	slli	a5,a5,0x3
    800087be:	97ba                	add	a5,a5,a4
    800087c0:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    800087c4:	fd843783          	ld	a5,-40(s0)
    800087c8:	853e                	mv	a0,a5
    800087ca:	ffffe097          	auipc	ra,0xffffe
    800087ce:	0ca080e7          	jalr	202(ra) # 80006894 <fileclose>
    fileclose(wf);
    800087d2:	fd043783          	ld	a5,-48(s0)
    800087d6:	853e                	mv	a0,a5
    800087d8:	ffffe097          	auipc	ra,0xffffe
    800087dc:	0bc080e7          	jalr	188(ra) # 80006894 <fileclose>
    return -1;
    800087e0:	57fd                	li	a5,-1
    800087e2:	a079                	j	80008870 <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800087e4:	fe843783          	ld	a5,-24(s0)
    800087e8:	6bbc                	ld	a5,80(a5)
    800087ea:	fe043703          	ld	a4,-32(s0)
    800087ee:	fcc40613          	addi	a2,s0,-52
    800087f2:	4691                	li	a3,4
    800087f4:	85ba                	mv	a1,a4
    800087f6:	853e                	mv	a0,a5
    800087f8:	ffffa097          	auipc	ra,0xffffa
    800087fc:	b82080e7          	jalr	-1150(ra) # 8000237a <copyout>
    80008800:	87aa                	mv	a5,a0
    80008802:	0207c463          	bltz	a5,8000882a <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008806:	fe843783          	ld	a5,-24(s0)
    8000880a:	6bb8                	ld	a4,80(a5)
    8000880c:	fe043783          	ld	a5,-32(s0)
    80008810:	0791                	addi	a5,a5,4
    80008812:	fc840613          	addi	a2,s0,-56
    80008816:	4691                	li	a3,4
    80008818:	85be                	mv	a1,a5
    8000881a:	853a                	mv	a0,a4
    8000881c:	ffffa097          	auipc	ra,0xffffa
    80008820:	b5e080e7          	jalr	-1186(ra) # 8000237a <copyout>
    80008824:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008826:	0407d463          	bgez	a5,8000886e <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    8000882a:	fcc42783          	lw	a5,-52(s0)
    8000882e:	fe843703          	ld	a4,-24(s0)
    80008832:	07e9                	addi	a5,a5,26
    80008834:	078e                	slli	a5,a5,0x3
    80008836:	97ba                	add	a5,a5,a4
    80008838:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    8000883c:	fc842783          	lw	a5,-56(s0)
    80008840:	fe843703          	ld	a4,-24(s0)
    80008844:	07e9                	addi	a5,a5,26
    80008846:	078e                	slli	a5,a5,0x3
    80008848:	97ba                	add	a5,a5,a4
    8000884a:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    8000884e:	fd843783          	ld	a5,-40(s0)
    80008852:	853e                	mv	a0,a5
    80008854:	ffffe097          	auipc	ra,0xffffe
    80008858:	040080e7          	jalr	64(ra) # 80006894 <fileclose>
    fileclose(wf);
    8000885c:	fd043783          	ld	a5,-48(s0)
    80008860:	853e                	mv	a0,a5
    80008862:	ffffe097          	auipc	ra,0xffffe
    80008866:	032080e7          	jalr	50(ra) # 80006894 <fileclose>
    return -1;
    8000886a:	57fd                	li	a5,-1
    8000886c:	a011                	j	80008870 <sys_pipe+0x146>
  }
  return 0;
    8000886e:	4781                	li	a5,0
}
    80008870:	853e                	mv	a0,a5
    80008872:	70e2                	ld	ra,56(sp)
    80008874:	7442                	ld	s0,48(sp)
    80008876:	6121                	addi	sp,sp,64
    80008878:	8082                	ret
    8000887a:	0000                	unimp
    8000887c:	0000                	unimp
	...

0000000080008880 <kernelvec>:
    80008880:	7111                	addi	sp,sp,-256
    80008882:	e006                	sd	ra,0(sp)
    80008884:	e40a                	sd	sp,8(sp)
    80008886:	e80e                	sd	gp,16(sp)
    80008888:	ec12                	sd	tp,24(sp)
    8000888a:	f016                	sd	t0,32(sp)
    8000888c:	f41a                	sd	t1,40(sp)
    8000888e:	f81e                	sd	t2,48(sp)
    80008890:	fc22                	sd	s0,56(sp)
    80008892:	e0a6                	sd	s1,64(sp)
    80008894:	e4aa                	sd	a0,72(sp)
    80008896:	e8ae                	sd	a1,80(sp)
    80008898:	ecb2                	sd	a2,88(sp)
    8000889a:	f0b6                	sd	a3,96(sp)
    8000889c:	f4ba                	sd	a4,104(sp)
    8000889e:	f8be                	sd	a5,112(sp)
    800088a0:	fcc2                	sd	a6,120(sp)
    800088a2:	e146                	sd	a7,128(sp)
    800088a4:	e54a                	sd	s2,136(sp)
    800088a6:	e94e                	sd	s3,144(sp)
    800088a8:	ed52                	sd	s4,152(sp)
    800088aa:	f156                	sd	s5,160(sp)
    800088ac:	f55a                	sd	s6,168(sp)
    800088ae:	f95e                	sd	s7,176(sp)
    800088b0:	fd62                	sd	s8,184(sp)
    800088b2:	e1e6                	sd	s9,192(sp)
    800088b4:	e5ea                	sd	s10,200(sp)
    800088b6:	e9ee                	sd	s11,208(sp)
    800088b8:	edf2                	sd	t3,216(sp)
    800088ba:	f1f6                	sd	t4,224(sp)
    800088bc:	f5fa                	sd	t5,232(sp)
    800088be:	f9fe                	sd	t6,240(sp)
    800088c0:	d6efb0ef          	jal	80003e2e <kerneltrap>
    800088c4:	6082                	ld	ra,0(sp)
    800088c6:	6122                	ld	sp,8(sp)
    800088c8:	61c2                	ld	gp,16(sp)
    800088ca:	7282                	ld	t0,32(sp)
    800088cc:	7322                	ld	t1,40(sp)
    800088ce:	73c2                	ld	t2,48(sp)
    800088d0:	7462                	ld	s0,56(sp)
    800088d2:	6486                	ld	s1,64(sp)
    800088d4:	6526                	ld	a0,72(sp)
    800088d6:	65c6                	ld	a1,80(sp)
    800088d8:	6666                	ld	a2,88(sp)
    800088da:	7686                	ld	a3,96(sp)
    800088dc:	7726                	ld	a4,104(sp)
    800088de:	77c6                	ld	a5,112(sp)
    800088e0:	7866                	ld	a6,120(sp)
    800088e2:	688a                	ld	a7,128(sp)
    800088e4:	692a                	ld	s2,136(sp)
    800088e6:	69ca                	ld	s3,144(sp)
    800088e8:	6a6a                	ld	s4,152(sp)
    800088ea:	7a8a                	ld	s5,160(sp)
    800088ec:	7b2a                	ld	s6,168(sp)
    800088ee:	7bca                	ld	s7,176(sp)
    800088f0:	7c6a                	ld	s8,184(sp)
    800088f2:	6c8e                	ld	s9,192(sp)
    800088f4:	6d2e                	ld	s10,200(sp)
    800088f6:	6dce                	ld	s11,208(sp)
    800088f8:	6e6e                	ld	t3,216(sp)
    800088fa:	7e8e                	ld	t4,224(sp)
    800088fc:	7f2e                	ld	t5,232(sp)
    800088fe:	7fce                	ld	t6,240(sp)
    80008900:	6111                	addi	sp,sp,256
    80008902:	10200073          	sret
    80008906:	00000013          	nop
    8000890a:	00000013          	nop
    8000890e:	0001                	nop

0000000080008910 <timervec>:
    80008910:	34051573          	csrrw	a0,mscratch,a0
    80008914:	e10c                	sd	a1,0(a0)
    80008916:	e510                	sd	a2,8(a0)
    80008918:	e914                	sd	a3,16(a0)
    8000891a:	6d0c                	ld	a1,24(a0)
    8000891c:	7110                	ld	a2,32(a0)
    8000891e:	6194                	ld	a3,0(a1)
    80008920:	96b2                	add	a3,a3,a2
    80008922:	e194                	sd	a3,0(a1)
    80008924:	4589                	li	a1,2
    80008926:	14459073          	csrw	sip,a1
    8000892a:	6914                	ld	a3,16(a0)
    8000892c:	6510                	ld	a2,8(a0)
    8000892e:	610c                	ld	a1,0(a0)
    80008930:	34051573          	csrrw	a0,mscratch,a0
    80008934:	30200073          	mret
	...

000000008000893a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    8000893a:	1141                	addi	sp,sp,-16
    8000893c:	e406                	sd	ra,8(sp)
    8000893e:	e022                	sd	s0,0(sp)
    80008940:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008942:	0c0007b7          	lui	a5,0xc000
    80008946:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    8000894a:	4705                	li	a4,1
    8000894c:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    8000894e:	0c0007b7          	lui	a5,0xc000
    80008952:	0791                	addi	a5,a5,4 # c000004 <_entry-0x73fffffc>
    80008954:	4705                	li	a4,1
    80008956:	c398                	sw	a4,0(a5)
}
    80008958:	0001                	nop
    8000895a:	60a2                	ld	ra,8(sp)
    8000895c:	6402                	ld	s0,0(sp)
    8000895e:	0141                	addi	sp,sp,16
    80008960:	8082                	ret

0000000080008962 <plicinithart>:

void
plicinithart(void)
{
    80008962:	1101                	addi	sp,sp,-32
    80008964:	ec06                	sd	ra,24(sp)
    80008966:	e822                	sd	s0,16(sp)
    80008968:	1000                	addi	s0,sp,32
  int hart = cpuid();
    8000896a:	ffffa097          	auipc	ra,0xffffa
    8000896e:	ef4080e7          	jalr	-268(ra) # 8000285e <cpuid>
    80008972:	87aa                	mv	a5,a0
    80008974:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80008978:	fec42783          	lw	a5,-20(s0)
    8000897c:	0087979b          	slliw	a5,a5,0x8
    80008980:	2781                	sext.w	a5,a5
    80008982:	873e                	mv	a4,a5
    80008984:	0c0027b7          	lui	a5,0xc002
    80008988:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    8000898c:	97ba                	add	a5,a5,a4
    8000898e:	873e                	mv	a4,a5
    80008990:	40200793          	li	a5,1026
    80008994:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008996:	fec42783          	lw	a5,-20(s0)
    8000899a:	00d7979b          	slliw	a5,a5,0xd
    8000899e:	2781                	sext.w	a5,a5
    800089a0:	873e                	mv	a4,a5
    800089a2:	0c2017b7          	lui	a5,0xc201
    800089a6:	97ba                	add	a5,a5,a4
    800089a8:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    800089ac:	0001                	nop
    800089ae:	60e2                	ld	ra,24(sp)
    800089b0:	6442                	ld	s0,16(sp)
    800089b2:	6105                	addi	sp,sp,32
    800089b4:	8082                	ret

00000000800089b6 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    800089b6:	1101                	addi	sp,sp,-32
    800089b8:	ec06                	sd	ra,24(sp)
    800089ba:	e822                	sd	s0,16(sp)
    800089bc:	1000                	addi	s0,sp,32
  int hart = cpuid();
    800089be:	ffffa097          	auipc	ra,0xffffa
    800089c2:	ea0080e7          	jalr	-352(ra) # 8000285e <cpuid>
    800089c6:	87aa                	mv	a5,a0
    800089c8:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    800089cc:	fec42783          	lw	a5,-20(s0)
    800089d0:	00d7979b          	slliw	a5,a5,0xd
    800089d4:	2781                	sext.w	a5,a5
    800089d6:	873e                	mv	a4,a5
    800089d8:	0c2017b7          	lui	a5,0xc201
    800089dc:	0791                	addi	a5,a5,4 # c201004 <_entry-0x73dfeffc>
    800089de:	97ba                	add	a5,a5,a4
    800089e0:	439c                	lw	a5,0(a5)
    800089e2:	fef42423          	sw	a5,-24(s0)
  return irq;
    800089e6:	fe842783          	lw	a5,-24(s0)
}
    800089ea:	853e                	mv	a0,a5
    800089ec:	60e2                	ld	ra,24(sp)
    800089ee:	6442                	ld	s0,16(sp)
    800089f0:	6105                	addi	sp,sp,32
    800089f2:	8082                	ret

00000000800089f4 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    800089f4:	7179                	addi	sp,sp,-48
    800089f6:	f406                	sd	ra,40(sp)
    800089f8:	f022                	sd	s0,32(sp)
    800089fa:	1800                	addi	s0,sp,48
    800089fc:	87aa                	mv	a5,a0
    800089fe:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008a02:	ffffa097          	auipc	ra,0xffffa
    80008a06:	e5c080e7          	jalr	-420(ra) # 8000285e <cpuid>
    80008a0a:	87aa                	mv	a5,a0
    80008a0c:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008a10:	fec42783          	lw	a5,-20(s0)
    80008a14:	00d7979b          	slliw	a5,a5,0xd
    80008a18:	2781                	sext.w	a5,a5
    80008a1a:	873e                	mv	a4,a5
    80008a1c:	0c2017b7          	lui	a5,0xc201
    80008a20:	0791                	addi	a5,a5,4 # c201004 <_entry-0x73dfeffc>
    80008a22:	97ba                	add	a5,a5,a4
    80008a24:	873e                	mv	a4,a5
    80008a26:	fdc42783          	lw	a5,-36(s0)
    80008a2a:	c31c                	sw	a5,0(a4)
}
    80008a2c:	0001                	nop
    80008a2e:	70a2                	ld	ra,40(sp)
    80008a30:	7402                	ld	s0,32(sp)
    80008a32:	6145                	addi	sp,sp,48
    80008a34:	8082                	ret

0000000080008a36 <virtio_disk_init>:
  
} disk;

void
virtio_disk_init(void)
{
    80008a36:	7179                	addi	sp,sp,-48
    80008a38:	f406                	sd	ra,40(sp)
    80008a3a:	f022                	sd	s0,32(sp)
    80008a3c:	1800                	addi	s0,sp,48
  uint32 status = 0;
    80008a3e:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    80008a42:	00003597          	auipc	a1,0x3
    80008a46:	c2e58593          	addi	a1,a1,-978 # 8000b670 <etext+0x670>
    80008a4a:	0001f517          	auipc	a0,0x1f
    80008a4e:	96650513          	addi	a0,a0,-1690 # 800273b0 <disk+0x128>
    80008a52:	ffff9097          	auipc	ra,0xffff9
    80008a56:	83e080e7          	jalr	-1986(ra) # 80001290 <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008a5a:	100017b7          	lui	a5,0x10001
    80008a5e:	439c                	lw	a5,0(a5)
    80008a60:	0007871b          	sext.w	a4,a5
    80008a64:	747277b7          	lui	a5,0x74727
    80008a68:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008a6c:	04f71063          	bne	a4,a5,80008aac <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 2 ||
    80008a70:	100017b7          	lui	a5,0x10001
    80008a74:	0791                	addi	a5,a5,4 # 10001004 <_entry-0x6fffeffc>
    80008a76:	439c                	lw	a5,0(a5)
    80008a78:	0007871b          	sext.w	a4,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008a7c:	4789                	li	a5,2
    80008a7e:	02f71763          	bne	a4,a5,80008aac <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008a82:	100017b7          	lui	a5,0x10001
    80008a86:	07a1                	addi	a5,a5,8 # 10001008 <_entry-0x6fffeff8>
    80008a88:	439c                	lw	a5,0(a5)
    80008a8a:	0007871b          	sext.w	a4,a5
     *R(VIRTIO_MMIO_VERSION) != 2 ||
    80008a8e:	4789                	li	a5,2
    80008a90:	00f71e63          	bne	a4,a5,80008aac <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008a94:	100017b7          	lui	a5,0x10001
    80008a98:	07b1                	addi	a5,a5,12 # 1000100c <_entry-0x6fffeff4>
    80008a9a:	439c                	lw	a5,0(a5)
    80008a9c:	0007871b          	sext.w	a4,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008aa0:	554d47b7          	lui	a5,0x554d4
    80008aa4:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008aa8:	00f70a63          	beq	a4,a5,80008abc <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80008aac:	00003517          	auipc	a0,0x3
    80008ab0:	bd450513          	addi	a0,a0,-1068 # 8000b680 <etext+0x680>
    80008ab4:	ffff8097          	auipc	ra,0xffff8
    80008ab8:	20c080e7          	jalr	524(ra) # 80000cc0 <panic>
  }
  
  // reset device
  *R(VIRTIO_MMIO_STATUS) = status;
    80008abc:	100017b7          	lui	a5,0x10001
    80008ac0:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008ac4:	fe842703          	lw	a4,-24(s0)
    80008ac8:	c398                	sw	a4,0(a5)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008aca:	fe842783          	lw	a5,-24(s0)
    80008ace:	0017e793          	ori	a5,a5,1
    80008ad2:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008ad6:	100017b7          	lui	a5,0x10001
    80008ada:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008ade:	fe842703          	lw	a4,-24(s0)
    80008ae2:	c398                	sw	a4,0(a5)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008ae4:	fe842783          	lw	a5,-24(s0)
    80008ae8:	0027e793          	ori	a5,a5,2
    80008aec:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008af0:	100017b7          	lui	a5,0x10001
    80008af4:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008af8:	fe842703          	lw	a4,-24(s0)
    80008afc:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80008afe:	100017b7          	lui	a5,0x10001
    80008b02:	07c1                	addi	a5,a5,16 # 10001010 <_entry-0x6fffeff0>
    80008b04:	439c                	lw	a5,0(a5)
    80008b06:	2781                	sext.w	a5,a5
    80008b08:	1782                	slli	a5,a5,0x20
    80008b0a:	9381                	srli	a5,a5,0x20
    80008b0c:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008b10:	fe043783          	ld	a5,-32(s0)
    80008b14:	fdf7f793          	andi	a5,a5,-33
    80008b18:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008b1c:	fe043783          	ld	a5,-32(s0)
    80008b20:	f7f7f793          	andi	a5,a5,-129
    80008b24:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008b28:	fe043703          	ld	a4,-32(s0)
    80008b2c:	77fd                	lui	a5,0xfffff
    80008b2e:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd8437>
    80008b32:	8ff9                	and	a5,a5,a4
    80008b34:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008b38:	fe043703          	ld	a4,-32(s0)
    80008b3c:	77fd                	lui	a5,0xfffff
    80008b3e:	17fd                	addi	a5,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd7c37>
    80008b40:	8ff9                	and	a5,a5,a4
    80008b42:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008b46:	fe043703          	ld	a4,-32(s0)
    80008b4a:	f80007b7          	lui	a5,0xf8000
    80008b4e:	17fd                	addi	a5,a5,-1 # fffffffff7ffffff <end+0xffffffff77fd8c37>
    80008b50:	8ff9                	and	a5,a5,a4
    80008b52:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008b56:	fe043703          	ld	a4,-32(s0)
    80008b5a:	e00007b7          	lui	a5,0xe0000
    80008b5e:	17fd                	addi	a5,a5,-1 # ffffffffdfffffff <end+0xffffffff5ffd8c37>
    80008b60:	8ff9                	and	a5,a5,a4
    80008b62:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008b66:	fe043703          	ld	a4,-32(s0)
    80008b6a:	f00007b7          	lui	a5,0xf0000
    80008b6e:	17fd                	addi	a5,a5,-1 # ffffffffefffffff <end+0xffffffff6ffd8c37>
    80008b70:	8ff9                	and	a5,a5,a4
    80008b72:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008b76:	100017b7          	lui	a5,0x10001
    80008b7a:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80008b7e:	fe043703          	ld	a4,-32(s0)
    80008b82:	2701                	sext.w	a4,a4
    80008b84:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008b86:	fe842783          	lw	a5,-24(s0)
    80008b8a:	0087e793          	ori	a5,a5,8
    80008b8e:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008b92:	100017b7          	lui	a5,0x10001
    80008b96:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008b9a:	fe842703          	lw	a4,-24(s0)
    80008b9e:	c398                	sw	a4,0(a5)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(VIRTIO_MMIO_STATUS);
    80008ba0:	100017b7          	lui	a5,0x10001
    80008ba4:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008ba8:	439c                	lw	a5,0(a5)
    80008baa:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80008bae:	fe842783          	lw	a5,-24(s0)
    80008bb2:	8ba1                	andi	a5,a5,8
    80008bb4:	2781                	sext.w	a5,a5
    80008bb6:	eb89                	bnez	a5,80008bc8 <virtio_disk_init+0x192>
    panic("virtio disk FEATURES_OK unset");
    80008bb8:	00003517          	auipc	a0,0x3
    80008bbc:	ae850513          	addi	a0,a0,-1304 # 8000b6a0 <etext+0x6a0>
    80008bc0:	ffff8097          	auipc	ra,0xffff8
    80008bc4:	100080e7          	jalr	256(ra) # 80000cc0 <panic>

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008bc8:	100017b7          	lui	a5,0x10001
    80008bcc:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    80008bd0:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(VIRTIO_MMIO_QUEUE_READY))
    80008bd4:	100017b7          	lui	a5,0x10001
    80008bd8:	04478793          	addi	a5,a5,68 # 10001044 <_entry-0x6fffefbc>
    80008bdc:	439c                	lw	a5,0(a5)
    80008bde:	2781                	sext.w	a5,a5
    80008be0:	cb89                	beqz	a5,80008bf2 <virtio_disk_init+0x1bc>
    panic("virtio disk should not be ready");
    80008be2:	00003517          	auipc	a0,0x3
    80008be6:	ade50513          	addi	a0,a0,-1314 # 8000b6c0 <etext+0x6c0>
    80008bea:	ffff8097          	auipc	ra,0xffff8
    80008bee:	0d6080e7          	jalr	214(ra) # 80000cc0 <panic>

  // check maximum queue size.
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008bf2:	100017b7          	lui	a5,0x10001
    80008bf6:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    80008bfa:	439c                	lw	a5,0(a5)
    80008bfc:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008c00:	fdc42783          	lw	a5,-36(s0)
    80008c04:	2781                	sext.w	a5,a5
    80008c06:	eb89                	bnez	a5,80008c18 <virtio_disk_init+0x1e2>
    panic("virtio disk has no queue 0");
    80008c08:	00003517          	auipc	a0,0x3
    80008c0c:	ad850513          	addi	a0,a0,-1320 # 8000b6e0 <etext+0x6e0>
    80008c10:	ffff8097          	auipc	ra,0xffff8
    80008c14:	0b0080e7          	jalr	176(ra) # 80000cc0 <panic>
  if(max < NUM)
    80008c18:	fdc42783          	lw	a5,-36(s0)
    80008c1c:	0007871b          	sext.w	a4,a5
    80008c20:	479d                	li	a5,7
    80008c22:	00e7ea63          	bltu	a5,a4,80008c36 <virtio_disk_init+0x200>
    panic("virtio disk max queue too short");
    80008c26:	00003517          	auipc	a0,0x3
    80008c2a:	ada50513          	addi	a0,a0,-1318 # 8000b700 <etext+0x700>
    80008c2e:	ffff8097          	auipc	ra,0xffff8
    80008c32:	092080e7          	jalr	146(ra) # 80000cc0 <panic>

  // allocate and zero queue memory.
  disk.desc = kalloc();
    80008c36:	ffff8097          	auipc	ra,0xffff8
    80008c3a:	52e080e7          	jalr	1326(ra) # 80001164 <kalloc>
    80008c3e:	872a                	mv	a4,a0
    80008c40:	0001e797          	auipc	a5,0x1e
    80008c44:	64878793          	addi	a5,a5,1608 # 80027288 <disk>
    80008c48:	e398                	sd	a4,0(a5)
  disk.avail = kalloc();
    80008c4a:	ffff8097          	auipc	ra,0xffff8
    80008c4e:	51a080e7          	jalr	1306(ra) # 80001164 <kalloc>
    80008c52:	872a                	mv	a4,a0
    80008c54:	0001e797          	auipc	a5,0x1e
    80008c58:	63478793          	addi	a5,a5,1588 # 80027288 <disk>
    80008c5c:	e798                	sd	a4,8(a5)
  disk.used = kalloc();
    80008c5e:	ffff8097          	auipc	ra,0xffff8
    80008c62:	506080e7          	jalr	1286(ra) # 80001164 <kalloc>
    80008c66:	872a                	mv	a4,a0
    80008c68:	0001e797          	auipc	a5,0x1e
    80008c6c:	62078793          	addi	a5,a5,1568 # 80027288 <disk>
    80008c70:	eb98                	sd	a4,16(a5)
  if(!disk.desc || !disk.avail || !disk.used)
    80008c72:	0001e797          	auipc	a5,0x1e
    80008c76:	61678793          	addi	a5,a5,1558 # 80027288 <disk>
    80008c7a:	639c                	ld	a5,0(a5)
    80008c7c:	cf89                	beqz	a5,80008c96 <virtio_disk_init+0x260>
    80008c7e:	0001e797          	auipc	a5,0x1e
    80008c82:	60a78793          	addi	a5,a5,1546 # 80027288 <disk>
    80008c86:	679c                	ld	a5,8(a5)
    80008c88:	c799                	beqz	a5,80008c96 <virtio_disk_init+0x260>
    80008c8a:	0001e797          	auipc	a5,0x1e
    80008c8e:	5fe78793          	addi	a5,a5,1534 # 80027288 <disk>
    80008c92:	6b9c                	ld	a5,16(a5)
    80008c94:	eb89                	bnez	a5,80008ca6 <virtio_disk_init+0x270>
    panic("virtio disk kalloc");
    80008c96:	00003517          	auipc	a0,0x3
    80008c9a:	a8a50513          	addi	a0,a0,-1398 # 8000b720 <etext+0x720>
    80008c9e:	ffff8097          	auipc	ra,0xffff8
    80008ca2:	022080e7          	jalr	34(ra) # 80000cc0 <panic>
  memset(disk.desc, 0, PGSIZE);
    80008ca6:	0001e797          	auipc	a5,0x1e
    80008caa:	5e278793          	addi	a5,a5,1506 # 80027288 <disk>
    80008cae:	639c                	ld	a5,0(a5)
    80008cb0:	6605                	lui	a2,0x1
    80008cb2:	4581                	li	a1,0
    80008cb4:	853e                	mv	a0,a5
    80008cb6:	ffff8097          	auipc	ra,0xffff8
    80008cba:	7e2080e7          	jalr	2018(ra) # 80001498 <memset>
  memset(disk.avail, 0, PGSIZE);
    80008cbe:	0001e797          	auipc	a5,0x1e
    80008cc2:	5ca78793          	addi	a5,a5,1482 # 80027288 <disk>
    80008cc6:	679c                	ld	a5,8(a5)
    80008cc8:	6605                	lui	a2,0x1
    80008cca:	4581                	li	a1,0
    80008ccc:	853e                	mv	a0,a5
    80008cce:	ffff8097          	auipc	ra,0xffff8
    80008cd2:	7ca080e7          	jalr	1994(ra) # 80001498 <memset>
  memset(disk.used, 0, PGSIZE);
    80008cd6:	0001e797          	auipc	a5,0x1e
    80008cda:	5b278793          	addi	a5,a5,1458 # 80027288 <disk>
    80008cde:	6b9c                	ld	a5,16(a5)
    80008ce0:	6605                	lui	a2,0x1
    80008ce2:	4581                	li	a1,0
    80008ce4:	853e                	mv	a0,a5
    80008ce6:	ffff8097          	auipc	ra,0xffff8
    80008cea:	7b2080e7          	jalr	1970(ra) # 80001498 <memset>

  // set queue size.
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008cee:	100017b7          	lui	a5,0x10001
    80008cf2:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    80008cf6:	4721                	li	a4,8
    80008cf8:	c398                	sw	a4,0(a5)

  // write physical addresses.
  *R(VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk.desc;
    80008cfa:	0001e797          	auipc	a5,0x1e
    80008cfe:	58e78793          	addi	a5,a5,1422 # 80027288 <disk>
    80008d02:	639c                	ld	a5,0(a5)
    80008d04:	873e                	mv	a4,a5
    80008d06:	100017b7          	lui	a5,0x10001
    80008d0a:	08078793          	addi	a5,a5,128 # 10001080 <_entry-0x6fffef80>
    80008d0e:	2701                	sext.w	a4,a4
    80008d10:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk.desc >> 32;
    80008d12:	0001e797          	auipc	a5,0x1e
    80008d16:	57678793          	addi	a5,a5,1398 # 80027288 <disk>
    80008d1a:	639c                	ld	a5,0(a5)
    80008d1c:	0207d713          	srli	a4,a5,0x20
    80008d20:	100017b7          	lui	a5,0x10001
    80008d24:	08478793          	addi	a5,a5,132 # 10001084 <_entry-0x6fffef7c>
    80008d28:	2701                	sext.w	a4,a4
    80008d2a:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk.avail;
    80008d2c:	0001e797          	auipc	a5,0x1e
    80008d30:	55c78793          	addi	a5,a5,1372 # 80027288 <disk>
    80008d34:	679c                	ld	a5,8(a5)
    80008d36:	873e                	mv	a4,a5
    80008d38:	100017b7          	lui	a5,0x10001
    80008d3c:	09078793          	addi	a5,a5,144 # 10001090 <_entry-0x6fffef70>
    80008d40:	2701                	sext.w	a4,a4
    80008d42:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk.avail >> 32;
    80008d44:	0001e797          	auipc	a5,0x1e
    80008d48:	54478793          	addi	a5,a5,1348 # 80027288 <disk>
    80008d4c:	679c                	ld	a5,8(a5)
    80008d4e:	0207d713          	srli	a4,a5,0x20
    80008d52:	100017b7          	lui	a5,0x10001
    80008d56:	09478793          	addi	a5,a5,148 # 10001094 <_entry-0x6fffef6c>
    80008d5a:	2701                	sext.w	a4,a4
    80008d5c:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk.used;
    80008d5e:	0001e797          	auipc	a5,0x1e
    80008d62:	52a78793          	addi	a5,a5,1322 # 80027288 <disk>
    80008d66:	6b9c                	ld	a5,16(a5)
    80008d68:	873e                	mv	a4,a5
    80008d6a:	100017b7          	lui	a5,0x10001
    80008d6e:	0a078793          	addi	a5,a5,160 # 100010a0 <_entry-0x6fffef60>
    80008d72:	2701                	sext.w	a4,a4
    80008d74:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk.used >> 32;
    80008d76:	0001e797          	auipc	a5,0x1e
    80008d7a:	51278793          	addi	a5,a5,1298 # 80027288 <disk>
    80008d7e:	6b9c                	ld	a5,16(a5)
    80008d80:	0207d713          	srli	a4,a5,0x20
    80008d84:	100017b7          	lui	a5,0x10001
    80008d88:	0a478793          	addi	a5,a5,164 # 100010a4 <_entry-0x6fffef5c>
    80008d8c:	2701                	sext.w	a4,a4
    80008d8e:	c398                	sw	a4,0(a5)

  // queue is ready.
  *R(VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80008d90:	100017b7          	lui	a5,0x10001
    80008d94:	04478793          	addi	a5,a5,68 # 10001044 <_entry-0x6fffefbc>
    80008d98:	4705                	li	a4,1
    80008d9a:	c398                	sw	a4,0(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80008d9c:	fe042623          	sw	zero,-20(s0)
    80008da0:	a005                	j	80008dc0 <virtio_disk_init+0x38a>
    disk.free[i] = 1;
    80008da2:	0001e717          	auipc	a4,0x1e
    80008da6:	4e670713          	addi	a4,a4,1254 # 80027288 <disk>
    80008daa:	fec42783          	lw	a5,-20(s0)
    80008dae:	97ba                	add	a5,a5,a4
    80008db0:	4705                	li	a4,1
    80008db2:	00e78c23          	sb	a4,24(a5)
  for(int i = 0; i < NUM; i++)
    80008db6:	fec42783          	lw	a5,-20(s0)
    80008dba:	2785                	addiw	a5,a5,1
    80008dbc:	fef42623          	sw	a5,-20(s0)
    80008dc0:	fec42783          	lw	a5,-20(s0)
    80008dc4:	0007871b          	sext.w	a4,a5
    80008dc8:	479d                	li	a5,7
    80008dca:	fce7dce3          	bge	a5,a4,80008da2 <virtio_disk_init+0x36c>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80008dce:	fe842783          	lw	a5,-24(s0)
    80008dd2:	0047e793          	ori	a5,a5,4
    80008dd6:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008dda:	100017b7          	lui	a5,0x10001
    80008dde:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008de2:	fe842703          	lw	a4,-24(s0)
    80008de6:	c398                	sw	a4,0(a5)

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    80008de8:	0001                	nop
    80008dea:	70a2                	ld	ra,40(sp)
    80008dec:	7402                	ld	s0,32(sp)
    80008dee:	6145                	addi	sp,sp,48
    80008df0:	8082                	ret

0000000080008df2 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    80008df2:	1101                	addi	sp,sp,-32
    80008df4:	ec06                	sd	ra,24(sp)
    80008df6:	e822                	sd	s0,16(sp)
    80008df8:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    80008dfa:	fe042623          	sw	zero,-20(s0)
    80008dfe:	a825                	j	80008e36 <alloc_desc+0x44>
    if(disk.free[i]){
    80008e00:	0001e717          	auipc	a4,0x1e
    80008e04:	48870713          	addi	a4,a4,1160 # 80027288 <disk>
    80008e08:	fec42783          	lw	a5,-20(s0)
    80008e0c:	97ba                	add	a5,a5,a4
    80008e0e:	0187c783          	lbu	a5,24(a5)
    80008e12:	cf89                	beqz	a5,80008e2c <alloc_desc+0x3a>
      disk.free[i] = 0;
    80008e14:	0001e717          	auipc	a4,0x1e
    80008e18:	47470713          	addi	a4,a4,1140 # 80027288 <disk>
    80008e1c:	fec42783          	lw	a5,-20(s0)
    80008e20:	97ba                	add	a5,a5,a4
    80008e22:	00078c23          	sb	zero,24(a5)
      return i;
    80008e26:	fec42783          	lw	a5,-20(s0)
    80008e2a:	a831                	j	80008e46 <alloc_desc+0x54>
  for(int i = 0; i < NUM; i++){
    80008e2c:	fec42783          	lw	a5,-20(s0)
    80008e30:	2785                	addiw	a5,a5,1
    80008e32:	fef42623          	sw	a5,-20(s0)
    80008e36:	fec42783          	lw	a5,-20(s0)
    80008e3a:	0007871b          	sext.w	a4,a5
    80008e3e:	479d                	li	a5,7
    80008e40:	fce7d0e3          	bge	a5,a4,80008e00 <alloc_desc+0xe>
    }
  }
  return -1;
    80008e44:	57fd                	li	a5,-1
}
    80008e46:	853e                	mv	a0,a5
    80008e48:	60e2                	ld	ra,24(sp)
    80008e4a:	6442                	ld	s0,16(sp)
    80008e4c:	6105                	addi	sp,sp,32
    80008e4e:	8082                	ret

0000000080008e50 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80008e50:	1101                	addi	sp,sp,-32
    80008e52:	ec06                	sd	ra,24(sp)
    80008e54:	e822                	sd	s0,16(sp)
    80008e56:	1000                	addi	s0,sp,32
    80008e58:	87aa                	mv	a5,a0
    80008e5a:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80008e5e:	fec42783          	lw	a5,-20(s0)
    80008e62:	0007871b          	sext.w	a4,a5
    80008e66:	479d                	li	a5,7
    80008e68:	00e7da63          	bge	a5,a4,80008e7c <free_desc+0x2c>
    panic("free_desc 1");
    80008e6c:	00003517          	auipc	a0,0x3
    80008e70:	8cc50513          	addi	a0,a0,-1844 # 8000b738 <etext+0x738>
    80008e74:	ffff8097          	auipc	ra,0xffff8
    80008e78:	e4c080e7          	jalr	-436(ra) # 80000cc0 <panic>
  if(disk.free[i])
    80008e7c:	0001e717          	auipc	a4,0x1e
    80008e80:	40c70713          	addi	a4,a4,1036 # 80027288 <disk>
    80008e84:	fec42783          	lw	a5,-20(s0)
    80008e88:	97ba                	add	a5,a5,a4
    80008e8a:	0187c783          	lbu	a5,24(a5)
    80008e8e:	cb89                	beqz	a5,80008ea0 <free_desc+0x50>
    panic("free_desc 2");
    80008e90:	00003517          	auipc	a0,0x3
    80008e94:	8b850513          	addi	a0,a0,-1864 # 8000b748 <etext+0x748>
    80008e98:	ffff8097          	auipc	ra,0xffff8
    80008e9c:	e28080e7          	jalr	-472(ra) # 80000cc0 <panic>
  disk.desc[i].addr = 0;
    80008ea0:	0001e797          	auipc	a5,0x1e
    80008ea4:	3e878793          	addi	a5,a5,1000 # 80027288 <disk>
    80008ea8:	6398                	ld	a4,0(a5)
    80008eaa:	fec42783          	lw	a5,-20(s0)
    80008eae:	0792                	slli	a5,a5,0x4
    80008eb0:	97ba                	add	a5,a5,a4
    80008eb2:	0007b023          	sd	zero,0(a5)
  disk.desc[i].len = 0;
    80008eb6:	0001e797          	auipc	a5,0x1e
    80008eba:	3d278793          	addi	a5,a5,978 # 80027288 <disk>
    80008ebe:	6398                	ld	a4,0(a5)
    80008ec0:	fec42783          	lw	a5,-20(s0)
    80008ec4:	0792                	slli	a5,a5,0x4
    80008ec6:	97ba                	add	a5,a5,a4
    80008ec8:	0007a423          	sw	zero,8(a5)
  disk.desc[i].flags = 0;
    80008ecc:	0001e797          	auipc	a5,0x1e
    80008ed0:	3bc78793          	addi	a5,a5,956 # 80027288 <disk>
    80008ed4:	6398                	ld	a4,0(a5)
    80008ed6:	fec42783          	lw	a5,-20(s0)
    80008eda:	0792                	slli	a5,a5,0x4
    80008edc:	97ba                	add	a5,a5,a4
    80008ede:	00079623          	sh	zero,12(a5)
  disk.desc[i].next = 0;
    80008ee2:	0001e797          	auipc	a5,0x1e
    80008ee6:	3a678793          	addi	a5,a5,934 # 80027288 <disk>
    80008eea:	6398                	ld	a4,0(a5)
    80008eec:	fec42783          	lw	a5,-20(s0)
    80008ef0:	0792                	slli	a5,a5,0x4
    80008ef2:	97ba                	add	a5,a5,a4
    80008ef4:	00079723          	sh	zero,14(a5)
  disk.free[i] = 1;
    80008ef8:	0001e717          	auipc	a4,0x1e
    80008efc:	39070713          	addi	a4,a4,912 # 80027288 <disk>
    80008f00:	fec42783          	lw	a5,-20(s0)
    80008f04:	97ba                	add	a5,a5,a4
    80008f06:	4705                	li	a4,1
    80008f08:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    80008f0c:	0001e517          	auipc	a0,0x1e
    80008f10:	39450513          	addi	a0,a0,916 # 800272a0 <disk+0x18>
    80008f14:	ffffa097          	auipc	ra,0xffffa
    80008f18:	5de080e7          	jalr	1502(ra) # 800034f2 <wakeup>
}
    80008f1c:	0001                	nop
    80008f1e:	60e2                	ld	ra,24(sp)
    80008f20:	6442                	ld	s0,16(sp)
    80008f22:	6105                	addi	sp,sp,32
    80008f24:	8082                	ret

0000000080008f26 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80008f26:	7179                	addi	sp,sp,-48
    80008f28:	f406                	sd	ra,40(sp)
    80008f2a:	f022                	sd	s0,32(sp)
    80008f2c:	1800                	addi	s0,sp,48
    80008f2e:	87aa                	mv	a5,a0
    80008f30:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    80008f34:	0001e797          	auipc	a5,0x1e
    80008f38:	35478793          	addi	a5,a5,852 # 80027288 <disk>
    80008f3c:	6398                	ld	a4,0(a5)
    80008f3e:	fdc42783          	lw	a5,-36(s0)
    80008f42:	0792                	slli	a5,a5,0x4
    80008f44:	97ba                	add	a5,a5,a4
    80008f46:	00c7d783          	lhu	a5,12(a5)
    80008f4a:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    80008f4e:	0001e797          	auipc	a5,0x1e
    80008f52:	33a78793          	addi	a5,a5,826 # 80027288 <disk>
    80008f56:	6398                	ld	a4,0(a5)
    80008f58:	fdc42783          	lw	a5,-36(s0)
    80008f5c:	0792                	slli	a5,a5,0x4
    80008f5e:	97ba                	add	a5,a5,a4
    80008f60:	00e7d783          	lhu	a5,14(a5)
    80008f64:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    80008f68:	fdc42783          	lw	a5,-36(s0)
    80008f6c:	853e                	mv	a0,a5
    80008f6e:	00000097          	auipc	ra,0x0
    80008f72:	ee2080e7          	jalr	-286(ra) # 80008e50 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    80008f76:	fec42783          	lw	a5,-20(s0)
    80008f7a:	8b85                	andi	a5,a5,1
    80008f7c:	2781                	sext.w	a5,a5
    80008f7e:	c791                	beqz	a5,80008f8a <free_chain+0x64>
      i = nxt;
    80008f80:	fe842783          	lw	a5,-24(s0)
    80008f84:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    80008f88:	b775                	j	80008f34 <free_chain+0xe>
    else
      break;
    80008f8a:	0001                	nop
  }
}
    80008f8c:	0001                	nop
    80008f8e:	70a2                	ld	ra,40(sp)
    80008f90:	7402                	ld	s0,32(sp)
    80008f92:	6145                	addi	sp,sp,48
    80008f94:	8082                	ret

0000000080008f96 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    80008f96:	7139                	addi	sp,sp,-64
    80008f98:	fc06                	sd	ra,56(sp)
    80008f9a:	f822                	sd	s0,48(sp)
    80008f9c:	f426                	sd	s1,40(sp)
    80008f9e:	0080                	addi	s0,sp,64
    80008fa0:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    80008fa4:	fc042e23          	sw	zero,-36(s0)
    80008fa8:	a89d                	j	8000901e <alloc3_desc+0x88>
    idx[i] = alloc_desc();
    80008faa:	fdc42783          	lw	a5,-36(s0)
    80008fae:	078a                	slli	a5,a5,0x2
    80008fb0:	fc843703          	ld	a4,-56(s0)
    80008fb4:	00f704b3          	add	s1,a4,a5
    80008fb8:	00000097          	auipc	ra,0x0
    80008fbc:	e3a080e7          	jalr	-454(ra) # 80008df2 <alloc_desc>
    80008fc0:	87aa                	mv	a5,a0
    80008fc2:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80008fc4:	fdc42783          	lw	a5,-36(s0)
    80008fc8:	078a                	slli	a5,a5,0x2
    80008fca:	fc843703          	ld	a4,-56(s0)
    80008fce:	97ba                	add	a5,a5,a4
    80008fd0:	439c                	lw	a5,0(a5)
    80008fd2:	0407d163          	bgez	a5,80009014 <alloc3_desc+0x7e>
      for(int j = 0; j < i; j++)
    80008fd6:	fc042c23          	sw	zero,-40(s0)
    80008fda:	a015                	j	80008ffe <alloc3_desc+0x68>
        free_desc(idx[j]);
    80008fdc:	fd842783          	lw	a5,-40(s0)
    80008fe0:	078a                	slli	a5,a5,0x2
    80008fe2:	fc843703          	ld	a4,-56(s0)
    80008fe6:	97ba                	add	a5,a5,a4
    80008fe8:	439c                	lw	a5,0(a5)
    80008fea:	853e                	mv	a0,a5
    80008fec:	00000097          	auipc	ra,0x0
    80008ff0:	e64080e7          	jalr	-412(ra) # 80008e50 <free_desc>
      for(int j = 0; j < i; j++)
    80008ff4:	fd842783          	lw	a5,-40(s0)
    80008ff8:	2785                	addiw	a5,a5,1
    80008ffa:	fcf42c23          	sw	a5,-40(s0)
    80008ffe:	fd842783          	lw	a5,-40(s0)
    80009002:	873e                	mv	a4,a5
    80009004:	fdc42783          	lw	a5,-36(s0)
    80009008:	2701                	sext.w	a4,a4
    8000900a:	2781                	sext.w	a5,a5
    8000900c:	fcf748e3          	blt	a4,a5,80008fdc <alloc3_desc+0x46>
      return -1;
    80009010:	57fd                	li	a5,-1
    80009012:	a831                	j	8000902e <alloc3_desc+0x98>
  for(int i = 0; i < 3; i++){
    80009014:	fdc42783          	lw	a5,-36(s0)
    80009018:	2785                	addiw	a5,a5,1
    8000901a:	fcf42e23          	sw	a5,-36(s0)
    8000901e:	fdc42783          	lw	a5,-36(s0)
    80009022:	0007871b          	sext.w	a4,a5
    80009026:	4789                	li	a5,2
    80009028:	f8e7d1e3          	bge	a5,a4,80008faa <alloc3_desc+0x14>
    }
  }
  return 0;
    8000902c:	4781                	li	a5,0
}
    8000902e:	853e                	mv	a0,a5
    80009030:	70e2                	ld	ra,56(sp)
    80009032:	7442                	ld	s0,48(sp)
    80009034:	74a2                	ld	s1,40(sp)
    80009036:	6121                	addi	sp,sp,64
    80009038:	8082                	ret

000000008000903a <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    8000903a:	7139                	addi	sp,sp,-64
    8000903c:	fc06                	sd	ra,56(sp)
    8000903e:	f822                	sd	s0,48(sp)
    80009040:	0080                	addi	s0,sp,64
    80009042:	fca43423          	sd	a0,-56(s0)
    80009046:	87ae                	mv	a5,a1
    80009048:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    8000904c:	fc843783          	ld	a5,-56(s0)
    80009050:	47dc                	lw	a5,12(a5)
    80009052:	0017979b          	slliw	a5,a5,0x1
    80009056:	2781                	sext.w	a5,a5
    80009058:	1782                	slli	a5,a5,0x20
    8000905a:	9381                	srli	a5,a5,0x20
    8000905c:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    80009060:	0001e517          	auipc	a0,0x1e
    80009064:	35050513          	addi	a0,a0,848 # 800273b0 <disk+0x128>
    80009068:	ffff8097          	auipc	ra,0xffff8
    8000906c:	25c080e7          	jalr	604(ra) # 800012c4 <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    80009070:	fd040793          	addi	a5,s0,-48
    80009074:	853e                	mv	a0,a5
    80009076:	00000097          	auipc	ra,0x0
    8000907a:	f20080e7          	jalr	-224(ra) # 80008f96 <alloc3_desc>
    8000907e:	87aa                	mv	a5,a0
    80009080:	cf91                	beqz	a5,8000909c <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80009082:	0001e597          	auipc	a1,0x1e
    80009086:	32e58593          	addi	a1,a1,814 # 800273b0 <disk+0x128>
    8000908a:	0001e517          	auipc	a0,0x1e
    8000908e:	21650513          	addi	a0,a0,534 # 800272a0 <disk+0x18>
    80009092:	ffffa097          	auipc	ra,0xffffa
    80009096:	3e4080e7          	jalr	996(ra) # 80003476 <sleep>
    if(alloc3_desc(idx) == 0) {
    8000909a:	bfd9                	j	80009070 <virtio_disk_rw+0x36>
      break;
    8000909c:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    8000909e:	fd042783          	lw	a5,-48(s0)
    800090a2:	07a9                	addi	a5,a5,10
    800090a4:	00479713          	slli	a4,a5,0x4
    800090a8:	0001e797          	auipc	a5,0x1e
    800090ac:	1e078793          	addi	a5,a5,480 # 80027288 <disk>
    800090b0:	97ba                	add	a5,a5,a4
    800090b2:	07a1                	addi	a5,a5,8
    800090b4:	fef43023          	sd	a5,-32(s0)

  if(write)
    800090b8:	fc442783          	lw	a5,-60(s0)
    800090bc:	2781                	sext.w	a5,a5
    800090be:	c791                	beqz	a5,800090ca <virtio_disk_rw+0x90>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    800090c0:	fe043783          	ld	a5,-32(s0)
    800090c4:	4705                	li	a4,1
    800090c6:	c398                	sw	a4,0(a5)
    800090c8:	a029                	j	800090d2 <virtio_disk_rw+0x98>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    800090ca:	fe043783          	ld	a5,-32(s0)
    800090ce:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    800090d2:	fe043783          	ld	a5,-32(s0)
    800090d6:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    800090da:	fe043783          	ld	a5,-32(s0)
    800090de:	fe843703          	ld	a4,-24(s0)
    800090e2:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    800090e4:	0001e797          	auipc	a5,0x1e
    800090e8:	1a478793          	addi	a5,a5,420 # 80027288 <disk>
    800090ec:	6398                	ld	a4,0(a5)
    800090ee:	fd042783          	lw	a5,-48(s0)
    800090f2:	0792                	slli	a5,a5,0x4
    800090f4:	97ba                	add	a5,a5,a4
    800090f6:	fe043703          	ld	a4,-32(s0)
    800090fa:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    800090fc:	0001e797          	auipc	a5,0x1e
    80009100:	18c78793          	addi	a5,a5,396 # 80027288 <disk>
    80009104:	6398                	ld	a4,0(a5)
    80009106:	fd042783          	lw	a5,-48(s0)
    8000910a:	0792                	slli	a5,a5,0x4
    8000910c:	97ba                	add	a5,a5,a4
    8000910e:	4741                	li	a4,16
    80009110:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80009112:	0001e797          	auipc	a5,0x1e
    80009116:	17678793          	addi	a5,a5,374 # 80027288 <disk>
    8000911a:	6398                	ld	a4,0(a5)
    8000911c:	fd042783          	lw	a5,-48(s0)
    80009120:	0792                	slli	a5,a5,0x4
    80009122:	97ba                	add	a5,a5,a4
    80009124:	4705                	li	a4,1
    80009126:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    8000912a:	fd442683          	lw	a3,-44(s0)
    8000912e:	0001e797          	auipc	a5,0x1e
    80009132:	15a78793          	addi	a5,a5,346 # 80027288 <disk>
    80009136:	6398                	ld	a4,0(a5)
    80009138:	fd042783          	lw	a5,-48(s0)
    8000913c:	0792                	slli	a5,a5,0x4
    8000913e:	97ba                	add	a5,a5,a4
    80009140:	03069713          	slli	a4,a3,0x30
    80009144:	9341                	srli	a4,a4,0x30
    80009146:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    8000914a:	fc843783          	ld	a5,-56(s0)
    8000914e:	05878693          	addi	a3,a5,88
    80009152:	0001e797          	auipc	a5,0x1e
    80009156:	13678793          	addi	a5,a5,310 # 80027288 <disk>
    8000915a:	6398                	ld	a4,0(a5)
    8000915c:	fd442783          	lw	a5,-44(s0)
    80009160:	0792                	slli	a5,a5,0x4
    80009162:	97ba                	add	a5,a5,a4
    80009164:	8736                	mv	a4,a3
    80009166:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80009168:	0001e797          	auipc	a5,0x1e
    8000916c:	12078793          	addi	a5,a5,288 # 80027288 <disk>
    80009170:	6398                	ld	a4,0(a5)
    80009172:	fd442783          	lw	a5,-44(s0)
    80009176:	0792                	slli	a5,a5,0x4
    80009178:	97ba                	add	a5,a5,a4
    8000917a:	40000713          	li	a4,1024
    8000917e:	c798                	sw	a4,8(a5)
  if(write)
    80009180:	fc442783          	lw	a5,-60(s0)
    80009184:	2781                	sext.w	a5,a5
    80009186:	cf89                	beqz	a5,800091a0 <virtio_disk_rw+0x166>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80009188:	0001e797          	auipc	a5,0x1e
    8000918c:	10078793          	addi	a5,a5,256 # 80027288 <disk>
    80009190:	6398                	ld	a4,0(a5)
    80009192:	fd442783          	lw	a5,-44(s0)
    80009196:	0792                	slli	a5,a5,0x4
    80009198:	97ba                	add	a5,a5,a4
    8000919a:	00079623          	sh	zero,12(a5)
    8000919e:	a829                	j	800091b8 <virtio_disk_rw+0x17e>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    800091a0:	0001e797          	auipc	a5,0x1e
    800091a4:	0e878793          	addi	a5,a5,232 # 80027288 <disk>
    800091a8:	6398                	ld	a4,0(a5)
    800091aa:	fd442783          	lw	a5,-44(s0)
    800091ae:	0792                	slli	a5,a5,0x4
    800091b0:	97ba                	add	a5,a5,a4
    800091b2:	4709                	li	a4,2
    800091b4:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    800091b8:	0001e797          	auipc	a5,0x1e
    800091bc:	0d078793          	addi	a5,a5,208 # 80027288 <disk>
    800091c0:	6398                	ld	a4,0(a5)
    800091c2:	fd442783          	lw	a5,-44(s0)
    800091c6:	0792                	slli	a5,a5,0x4
    800091c8:	97ba                	add	a5,a5,a4
    800091ca:	00c7d703          	lhu	a4,12(a5)
    800091ce:	0001e797          	auipc	a5,0x1e
    800091d2:	0ba78793          	addi	a5,a5,186 # 80027288 <disk>
    800091d6:	6394                	ld	a3,0(a5)
    800091d8:	fd442783          	lw	a5,-44(s0)
    800091dc:	0792                	slli	a5,a5,0x4
    800091de:	97b6                	add	a5,a5,a3
    800091e0:	00176713          	ori	a4,a4,1
    800091e4:	1742                	slli	a4,a4,0x30
    800091e6:	9341                	srli	a4,a4,0x30
    800091e8:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[1]].next = idx[2];
    800091ec:	fd842683          	lw	a3,-40(s0)
    800091f0:	0001e797          	auipc	a5,0x1e
    800091f4:	09878793          	addi	a5,a5,152 # 80027288 <disk>
    800091f8:	6398                	ld	a4,0(a5)
    800091fa:	fd442783          	lw	a5,-44(s0)
    800091fe:	0792                	slli	a5,a5,0x4
    80009200:	97ba                	add	a5,a5,a4
    80009202:	03069713          	slli	a4,a3,0x30
    80009206:	9341                	srli	a4,a4,0x30
    80009208:	00e79723          	sh	a4,14(a5)

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    8000920c:	fd042783          	lw	a5,-48(s0)
    80009210:	0001e717          	auipc	a4,0x1e
    80009214:	07870713          	addi	a4,a4,120 # 80027288 <disk>
    80009218:	0789                	addi	a5,a5,2
    8000921a:	0792                	slli	a5,a5,0x4
    8000921c:	97ba                	add	a5,a5,a4
    8000921e:	577d                	li	a4,-1
    80009220:	00e78823          	sb	a4,16(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80009224:	fd042783          	lw	a5,-48(s0)
    80009228:	0789                	addi	a5,a5,2
    8000922a:	00479713          	slli	a4,a5,0x4
    8000922e:	0001e797          	auipc	a5,0x1e
    80009232:	05a78793          	addi	a5,a5,90 # 80027288 <disk>
    80009236:	97ba                	add	a5,a5,a4
    80009238:	01078693          	addi	a3,a5,16
    8000923c:	0001e797          	auipc	a5,0x1e
    80009240:	04c78793          	addi	a5,a5,76 # 80027288 <disk>
    80009244:	6398                	ld	a4,0(a5)
    80009246:	fd842783          	lw	a5,-40(s0)
    8000924a:	0792                	slli	a5,a5,0x4
    8000924c:	97ba                	add	a5,a5,a4
    8000924e:	8736                	mv	a4,a3
    80009250:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    80009252:	0001e797          	auipc	a5,0x1e
    80009256:	03678793          	addi	a5,a5,54 # 80027288 <disk>
    8000925a:	6398                	ld	a4,0(a5)
    8000925c:	fd842783          	lw	a5,-40(s0)
    80009260:	0792                	slli	a5,a5,0x4
    80009262:	97ba                	add	a5,a5,a4
    80009264:	4705                	li	a4,1
    80009266:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009268:	0001e797          	auipc	a5,0x1e
    8000926c:	02078793          	addi	a5,a5,32 # 80027288 <disk>
    80009270:	6398                	ld	a4,0(a5)
    80009272:	fd842783          	lw	a5,-40(s0)
    80009276:	0792                	slli	a5,a5,0x4
    80009278:	97ba                	add	a5,a5,a4
    8000927a:	4709                	li	a4,2
    8000927c:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[2]].next = 0;
    80009280:	0001e797          	auipc	a5,0x1e
    80009284:	00878793          	addi	a5,a5,8 # 80027288 <disk>
    80009288:	6398                	ld	a4,0(a5)
    8000928a:	fd842783          	lw	a5,-40(s0)
    8000928e:	0792                	slli	a5,a5,0x4
    80009290:	97ba                	add	a5,a5,a4
    80009292:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80009296:	fc843783          	ld	a5,-56(s0)
    8000929a:	4705                	li	a4,1
    8000929c:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    8000929e:	fd042783          	lw	a5,-48(s0)
    800092a2:	0001e717          	auipc	a4,0x1e
    800092a6:	fe670713          	addi	a4,a4,-26 # 80027288 <disk>
    800092aa:	0789                	addi	a5,a5,2
    800092ac:	0792                	slli	a5,a5,0x4
    800092ae:	97ba                	add	a5,a5,a4
    800092b0:	fc843703          	ld	a4,-56(s0)
    800092b4:	e798                	sd	a4,8(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    800092b6:	fd042703          	lw	a4,-48(s0)
    800092ba:	0001e797          	auipc	a5,0x1e
    800092be:	fce78793          	addi	a5,a5,-50 # 80027288 <disk>
    800092c2:	6794                	ld	a3,8(a5)
    800092c4:	0001e797          	auipc	a5,0x1e
    800092c8:	fc478793          	addi	a5,a5,-60 # 80027288 <disk>
    800092cc:	679c                	ld	a5,8(a5)
    800092ce:	0027d783          	lhu	a5,2(a5)
    800092d2:	2781                	sext.w	a5,a5
    800092d4:	8b9d                	andi	a5,a5,7
    800092d6:	2781                	sext.w	a5,a5
    800092d8:	1742                	slli	a4,a4,0x30
    800092da:	9341                	srli	a4,a4,0x30
    800092dc:	0786                	slli	a5,a5,0x1
    800092de:	97b6                	add	a5,a5,a3
    800092e0:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    800092e4:	0330000f          	fence	rw,rw

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    800092e8:	0001e797          	auipc	a5,0x1e
    800092ec:	fa078793          	addi	a5,a5,-96 # 80027288 <disk>
    800092f0:	679c                	ld	a5,8(a5)
    800092f2:	0027d703          	lhu	a4,2(a5)
    800092f6:	0001e797          	auipc	a5,0x1e
    800092fa:	f9278793          	addi	a5,a5,-110 # 80027288 <disk>
    800092fe:	679c                	ld	a5,8(a5)
    80009300:	2705                	addiw	a4,a4,1
    80009302:	1742                	slli	a4,a4,0x30
    80009304:	9341                	srli	a4,a4,0x30
    80009306:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    8000930a:	0330000f          	fence	rw,rw

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    8000930e:	100017b7          	lui	a5,0x10001
    80009312:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    80009316:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    8000931a:	a819                	j	80009330 <virtio_disk_rw+0x2f6>
    sleep(b, &disk.vdisk_lock);
    8000931c:	0001e597          	auipc	a1,0x1e
    80009320:	09458593          	addi	a1,a1,148 # 800273b0 <disk+0x128>
    80009324:	fc843503          	ld	a0,-56(s0)
    80009328:	ffffa097          	auipc	ra,0xffffa
    8000932c:	14e080e7          	jalr	334(ra) # 80003476 <sleep>
  while(b->disk == 1) {
    80009330:	fc843783          	ld	a5,-56(s0)
    80009334:	43d8                	lw	a4,4(a5)
    80009336:	4785                	li	a5,1
    80009338:	fef702e3          	beq	a4,a5,8000931c <virtio_disk_rw+0x2e2>
  }

  disk.info[idx[0]].b = 0;
    8000933c:	fd042783          	lw	a5,-48(s0)
    80009340:	0001e717          	auipc	a4,0x1e
    80009344:	f4870713          	addi	a4,a4,-184 # 80027288 <disk>
    80009348:	0789                	addi	a5,a5,2
    8000934a:	0792                	slli	a5,a5,0x4
    8000934c:	97ba                	add	a5,a5,a4
    8000934e:	0007b423          	sd	zero,8(a5)
  free_chain(idx[0]);
    80009352:	fd042783          	lw	a5,-48(s0)
    80009356:	853e                	mv	a0,a5
    80009358:	00000097          	auipc	ra,0x0
    8000935c:	bce080e7          	jalr	-1074(ra) # 80008f26 <free_chain>

  release(&disk.vdisk_lock);
    80009360:	0001e517          	auipc	a0,0x1e
    80009364:	05050513          	addi	a0,a0,80 # 800273b0 <disk+0x128>
    80009368:	ffff8097          	auipc	ra,0xffff8
    8000936c:	fc0080e7          	jalr	-64(ra) # 80001328 <release>
}
    80009370:	0001                	nop
    80009372:	70e2                	ld	ra,56(sp)
    80009374:	7442                	ld	s0,48(sp)
    80009376:	6121                	addi	sp,sp,64
    80009378:	8082                	ret

000000008000937a <virtio_disk_intr>:

void
virtio_disk_intr()
{
    8000937a:	1101                	addi	sp,sp,-32
    8000937c:	ec06                	sd	ra,24(sp)
    8000937e:	e822                	sd	s0,16(sp)
    80009380:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80009382:	0001e517          	auipc	a0,0x1e
    80009386:	02e50513          	addi	a0,a0,46 # 800273b0 <disk+0x128>
    8000938a:	ffff8097          	auipc	ra,0xffff8
    8000938e:	f3a080e7          	jalr	-198(ra) # 800012c4 <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80009392:	100017b7          	lui	a5,0x10001
    80009396:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    8000939a:	439c                	lw	a5,0(a5)
    8000939c:	0007871b          	sext.w	a4,a5
    800093a0:	100017b7          	lui	a5,0x10001
    800093a4:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    800093a8:	8b0d                	andi	a4,a4,3
    800093aa:	2701                	sext.w	a4,a4
    800093ac:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    800093ae:	0330000f          	fence	rw,rw

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    800093b2:	a045                	j	80009452 <virtio_disk_intr+0xd8>
    __sync_synchronize();
    800093b4:	0330000f          	fence	rw,rw
    int id = disk.used->ring[disk.used_idx % NUM].id;
    800093b8:	0001e797          	auipc	a5,0x1e
    800093bc:	ed078793          	addi	a5,a5,-304 # 80027288 <disk>
    800093c0:	6b98                	ld	a4,16(a5)
    800093c2:	0001e797          	auipc	a5,0x1e
    800093c6:	ec678793          	addi	a5,a5,-314 # 80027288 <disk>
    800093ca:	0207d783          	lhu	a5,32(a5)
    800093ce:	2781                	sext.w	a5,a5
    800093d0:	8b9d                	andi	a5,a5,7
    800093d2:	2781                	sext.w	a5,a5
    800093d4:	078e                	slli	a5,a5,0x3
    800093d6:	97ba                	add	a5,a5,a4
    800093d8:	43dc                	lw	a5,4(a5)
    800093da:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    800093de:	0001e717          	auipc	a4,0x1e
    800093e2:	eaa70713          	addi	a4,a4,-342 # 80027288 <disk>
    800093e6:	fec42783          	lw	a5,-20(s0)
    800093ea:	0789                	addi	a5,a5,2
    800093ec:	0792                	slli	a5,a5,0x4
    800093ee:	97ba                	add	a5,a5,a4
    800093f0:	0107c783          	lbu	a5,16(a5)
    800093f4:	cb89                	beqz	a5,80009406 <virtio_disk_intr+0x8c>
      panic("virtio_disk_intr status");
    800093f6:	00002517          	auipc	a0,0x2
    800093fa:	36250513          	addi	a0,a0,866 # 8000b758 <etext+0x758>
    800093fe:	ffff8097          	auipc	ra,0xffff8
    80009402:	8c2080e7          	jalr	-1854(ra) # 80000cc0 <panic>

    struct buf *b = disk.info[id].b;
    80009406:	0001e717          	auipc	a4,0x1e
    8000940a:	e8270713          	addi	a4,a4,-382 # 80027288 <disk>
    8000940e:	fec42783          	lw	a5,-20(s0)
    80009412:	0789                	addi	a5,a5,2
    80009414:	0792                	slli	a5,a5,0x4
    80009416:	97ba                	add	a5,a5,a4
    80009418:	679c                	ld	a5,8(a5)
    8000941a:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    8000941e:	fe043783          	ld	a5,-32(s0)
    80009422:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    80009426:	fe043503          	ld	a0,-32(s0)
    8000942a:	ffffa097          	auipc	ra,0xffffa
    8000942e:	0c8080e7          	jalr	200(ra) # 800034f2 <wakeup>

    disk.used_idx += 1;
    80009432:	0001e797          	auipc	a5,0x1e
    80009436:	e5678793          	addi	a5,a5,-426 # 80027288 <disk>
    8000943a:	0207d783          	lhu	a5,32(a5)
    8000943e:	2785                	addiw	a5,a5,1
    80009440:	03079713          	slli	a4,a5,0x30
    80009444:	9341                	srli	a4,a4,0x30
    80009446:	0001e797          	auipc	a5,0x1e
    8000944a:	e4278793          	addi	a5,a5,-446 # 80027288 <disk>
    8000944e:	02e79023          	sh	a4,32(a5)
  while(disk.used_idx != disk.used->idx){
    80009452:	0001e797          	auipc	a5,0x1e
    80009456:	e3678793          	addi	a5,a5,-458 # 80027288 <disk>
    8000945a:	0207d703          	lhu	a4,32(a5)
    8000945e:	0001e797          	auipc	a5,0x1e
    80009462:	e2a78793          	addi	a5,a5,-470 # 80027288 <disk>
    80009466:	6b9c                	ld	a5,16(a5)
    80009468:	0027d783          	lhu	a5,2(a5)
    8000946c:	2701                	sext.w	a4,a4
    8000946e:	2781                	sext.w	a5,a5
    80009470:	f4f712e3          	bne	a4,a5,800093b4 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    80009474:	0001e517          	auipc	a0,0x1e
    80009478:	f3c50513          	addi	a0,a0,-196 # 800273b0 <disk+0x128>
    8000947c:	ffff8097          	auipc	ra,0xffff8
    80009480:	eac080e7          	jalr	-340(ra) # 80001328 <release>
}
    80009484:	0001                	nop
    80009486:	60e2                	ld	ra,24(sp)
    80009488:	6442                	ld	s0,16(sp)
    8000948a:	6105                	addi	sp,sp,32
    8000948c:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051073          	csrw	sscratch,a0
    8000a004:	02000537          	lui	a0,0x2000
    8000a008:	357d                	addiw	a0,a0,-1 # 1ffffff <_entry-0x7e000001>
    8000a00a:	0536                	slli	a0,a0,0xd
    8000a00c:	02153423          	sd	ra,40(a0)
    8000a010:	02253823          	sd	sp,48(a0)
    8000a014:	02353c23          	sd	gp,56(a0)
    8000a018:	04453023          	sd	tp,64(a0)
    8000a01c:	04553423          	sd	t0,72(a0)
    8000a020:	04653823          	sd	t1,80(a0)
    8000a024:	04753c23          	sd	t2,88(a0)
    8000a028:	f120                	sd	s0,96(a0)
    8000a02a:	f524                	sd	s1,104(a0)
    8000a02c:	fd2c                	sd	a1,120(a0)
    8000a02e:	e150                	sd	a2,128(a0)
    8000a030:	e554                	sd	a3,136(a0)
    8000a032:	e958                	sd	a4,144(a0)
    8000a034:	ed5c                	sd	a5,152(a0)
    8000a036:	0b053023          	sd	a6,160(a0)
    8000a03a:	0b153423          	sd	a7,168(a0)
    8000a03e:	0b253823          	sd	s2,176(a0)
    8000a042:	0b353c23          	sd	s3,184(a0)
    8000a046:	0d453023          	sd	s4,192(a0)
    8000a04a:	0d553423          	sd	s5,200(a0)
    8000a04e:	0d653823          	sd	s6,208(a0)
    8000a052:	0d753c23          	sd	s7,216(a0)
    8000a056:	0f853023          	sd	s8,224(a0)
    8000a05a:	0f953423          	sd	s9,232(a0)
    8000a05e:	0fa53823          	sd	s10,240(a0)
    8000a062:	0fb53c23          	sd	s11,248(a0)
    8000a066:	11c53023          	sd	t3,256(a0)
    8000a06a:	11d53423          	sd	t4,264(a0)
    8000a06e:	11e53823          	sd	t5,272(a0)
    8000a072:	11f53c23          	sd	t6,280(a0)
    8000a076:	140022f3          	csrr	t0,sscratch
    8000a07a:	06553823          	sd	t0,112(a0)
    8000a07e:	00853103          	ld	sp,8(a0)
    8000a082:	02053203          	ld	tp,32(a0)
    8000a086:	01053283          	ld	t0,16(a0)
    8000a08a:	00053303          	ld	t1,0(a0)
    8000a08e:	12000073          	sfence.vma
    8000a092:	18031073          	csrw	satp,t1
    8000a096:	12000073          	sfence.vma
    8000a09a:	8282                	jr	t0

000000008000a09c <userret>:
    8000a09c:	12000073          	sfence.vma
    8000a0a0:	18051073          	csrw	satp,a0
    8000a0a4:	12000073          	sfence.vma
    8000a0a8:	02000537          	lui	a0,0x2000
    8000a0ac:	357d                	addiw	a0,a0,-1 # 1ffffff <_entry-0x7e000001>
    8000a0ae:	0536                	slli	a0,a0,0xd
    8000a0b0:	02853083          	ld	ra,40(a0)
    8000a0b4:	03053103          	ld	sp,48(a0)
    8000a0b8:	03853183          	ld	gp,56(a0)
    8000a0bc:	04053203          	ld	tp,64(a0)
    8000a0c0:	04853283          	ld	t0,72(a0)
    8000a0c4:	05053303          	ld	t1,80(a0)
    8000a0c8:	05853383          	ld	t2,88(a0)
    8000a0cc:	7120                	ld	s0,96(a0)
    8000a0ce:	7524                	ld	s1,104(a0)
    8000a0d0:	7d2c                	ld	a1,120(a0)
    8000a0d2:	6150                	ld	a2,128(a0)
    8000a0d4:	6554                	ld	a3,136(a0)
    8000a0d6:	6958                	ld	a4,144(a0)
    8000a0d8:	6d5c                	ld	a5,152(a0)
    8000a0da:	0a053803          	ld	a6,160(a0)
    8000a0de:	0a853883          	ld	a7,168(a0)
    8000a0e2:	0b053903          	ld	s2,176(a0)
    8000a0e6:	0b853983          	ld	s3,184(a0)
    8000a0ea:	0c053a03          	ld	s4,192(a0)
    8000a0ee:	0c853a83          	ld	s5,200(a0)
    8000a0f2:	0d053b03          	ld	s6,208(a0)
    8000a0f6:	0d853b83          	ld	s7,216(a0)
    8000a0fa:	0e053c03          	ld	s8,224(a0)
    8000a0fe:	0e853c83          	ld	s9,232(a0)
    8000a102:	0f053d03          	ld	s10,240(a0)
    8000a106:	0f853d83          	ld	s11,248(a0)
    8000a10a:	10053e03          	ld	t3,256(a0)
    8000a10e:	10853e83          	ld	t4,264(a0)
    8000a112:	11053f03          	ld	t5,272(a0)
    8000a116:	11853f83          	ld	t6,280(a0)
    8000a11a:	7928                	ld	a0,112(a0)
    8000a11c:	10200073          	sret
	...
