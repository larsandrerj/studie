
user/_ps:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "user/user.h"
#include "kernel/syscall.h"

int
main(int argc, char *argv[])
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
   8:	87aa                	mv	a5,a0
   a:	feb43023          	sd	a1,-32(s0)
   e:	fef42623          	sw	a5,-20(s0)
    ps();
  12:	00000097          	auipc	ra,0x0
  16:	57c080e7          	jalr	1404(ra) # 58e <ps>
    exit(0);
  1a:	4501                	li	a0,0
  1c:	00000097          	auipc	ra,0x0
  20:	4d2080e7          	jalr	1234(ra) # 4ee <exit>

0000000000000024 <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
  24:	1141                	addi	sp,sp,-16
  26:	e406                	sd	ra,8(sp)
  28:	e022                	sd	s0,0(sp)
  2a:	0800                	addi	s0,sp,16
  extern int main();
  main();
  2c:	00000097          	auipc	ra,0x0
  30:	fd4080e7          	jalr	-44(ra) # 0 <main>
  exit(0);
  34:	4501                	li	a0,0
  36:	00000097          	auipc	ra,0x0
  3a:	4b8080e7          	jalr	1208(ra) # 4ee <exit>

000000000000003e <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
  3e:	7179                	addi	sp,sp,-48
  40:	f406                	sd	ra,40(sp)
  42:	f022                	sd	s0,32(sp)
  44:	1800                	addi	s0,sp,48
  46:	fca43c23          	sd	a0,-40(s0)
  4a:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  4e:	fd843783          	ld	a5,-40(s0)
  52:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  56:	0001                	nop
  58:	fd043703          	ld	a4,-48(s0)
  5c:	00170793          	addi	a5,a4,1
  60:	fcf43823          	sd	a5,-48(s0)
  64:	fd843783          	ld	a5,-40(s0)
  68:	00178693          	addi	a3,a5,1
  6c:	fcd43c23          	sd	a3,-40(s0)
  70:	00074703          	lbu	a4,0(a4)
  74:	00e78023          	sb	a4,0(a5)
  78:	0007c783          	lbu	a5,0(a5)
  7c:	fff1                	bnez	a5,58 <strcpy+0x1a>
    ;
  return os;
  7e:	fe843783          	ld	a5,-24(s0)
}
  82:	853e                	mv	a0,a5
  84:	70a2                	ld	ra,40(sp)
  86:	7402                	ld	s0,32(sp)
  88:	6145                	addi	sp,sp,48
  8a:	8082                	ret

000000000000008c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  8c:	1101                	addi	sp,sp,-32
  8e:	ec06                	sd	ra,24(sp)
  90:	e822                	sd	s0,16(sp)
  92:	1000                	addi	s0,sp,32
  94:	fea43423          	sd	a0,-24(s0)
  98:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  9c:	a819                	j	b2 <strcmp+0x26>
    p++, q++;
  9e:	fe843783          	ld	a5,-24(s0)
  a2:	0785                	addi	a5,a5,1
  a4:	fef43423          	sd	a5,-24(s0)
  a8:	fe043783          	ld	a5,-32(s0)
  ac:	0785                	addi	a5,a5,1
  ae:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
  b2:	fe843783          	ld	a5,-24(s0)
  b6:	0007c783          	lbu	a5,0(a5)
  ba:	cb99                	beqz	a5,d0 <strcmp+0x44>
  bc:	fe843783          	ld	a5,-24(s0)
  c0:	0007c703          	lbu	a4,0(a5)
  c4:	fe043783          	ld	a5,-32(s0)
  c8:	0007c783          	lbu	a5,0(a5)
  cc:	fcf709e3          	beq	a4,a5,9e <strcmp+0x12>
  return (uchar)*p - (uchar)*q;
  d0:	fe843783          	ld	a5,-24(s0)
  d4:	0007c783          	lbu	a5,0(a5)
  d8:	0007871b          	sext.w	a4,a5
  dc:	fe043783          	ld	a5,-32(s0)
  e0:	0007c783          	lbu	a5,0(a5)
  e4:	2781                	sext.w	a5,a5
  e6:	40f707bb          	subw	a5,a4,a5
  ea:	2781                	sext.w	a5,a5
}
  ec:	853e                	mv	a0,a5
  ee:	60e2                	ld	ra,24(sp)
  f0:	6442                	ld	s0,16(sp)
  f2:	6105                	addi	sp,sp,32
  f4:	8082                	ret

00000000000000f6 <strlen>:

uint
strlen(const char *s)
{
  f6:	7179                	addi	sp,sp,-48
  f8:	f406                	sd	ra,40(sp)
  fa:	f022                	sd	s0,32(sp)
  fc:	1800                	addi	s0,sp,48
  fe:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 102:	fe042623          	sw	zero,-20(s0)
 106:	a031                	j	112 <strlen+0x1c>
 108:	fec42783          	lw	a5,-20(s0)
 10c:	2785                	addiw	a5,a5,1
 10e:	fef42623          	sw	a5,-20(s0)
 112:	fec42783          	lw	a5,-20(s0)
 116:	fd843703          	ld	a4,-40(s0)
 11a:	97ba                	add	a5,a5,a4
 11c:	0007c783          	lbu	a5,0(a5)
 120:	f7e5                	bnez	a5,108 <strlen+0x12>
    ;
  return n;
 122:	fec42783          	lw	a5,-20(s0)
}
 126:	853e                	mv	a0,a5
 128:	70a2                	ld	ra,40(sp)
 12a:	7402                	ld	s0,32(sp)
 12c:	6145                	addi	sp,sp,48
 12e:	8082                	ret

0000000000000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	7179                	addi	sp,sp,-48
 132:	f406                	sd	ra,40(sp)
 134:	f022                	sd	s0,32(sp)
 136:	1800                	addi	s0,sp,48
 138:	fca43c23          	sd	a0,-40(s0)
 13c:	87ae                	mv	a5,a1
 13e:	8732                	mv	a4,a2
 140:	fcf42a23          	sw	a5,-44(s0)
 144:	87ba                	mv	a5,a4
 146:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 14a:	fd843783          	ld	a5,-40(s0)
 14e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 152:	fe042623          	sw	zero,-20(s0)
 156:	a00d                	j	178 <memset+0x48>
    cdst[i] = c;
 158:	fec42783          	lw	a5,-20(s0)
 15c:	fe043703          	ld	a4,-32(s0)
 160:	97ba                	add	a5,a5,a4
 162:	fd442703          	lw	a4,-44(s0)
 166:	0ff77713          	zext.b	a4,a4
 16a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 16e:	fec42783          	lw	a5,-20(s0)
 172:	2785                	addiw	a5,a5,1
 174:	fef42623          	sw	a5,-20(s0)
 178:	fec42783          	lw	a5,-20(s0)
 17c:	fd042703          	lw	a4,-48(s0)
 180:	2701                	sext.w	a4,a4
 182:	fce7ebe3          	bltu	a5,a4,158 <memset+0x28>
  }
  return dst;
 186:	fd843783          	ld	a5,-40(s0)
}
 18a:	853e                	mv	a0,a5
 18c:	70a2                	ld	ra,40(sp)
 18e:	7402                	ld	s0,32(sp)
 190:	6145                	addi	sp,sp,48
 192:	8082                	ret

0000000000000194 <strchr>:

char*
strchr(const char *s, char c)
{
 194:	1101                	addi	sp,sp,-32
 196:	ec06                	sd	ra,24(sp)
 198:	e822                	sd	s0,16(sp)
 19a:	1000                	addi	s0,sp,32
 19c:	fea43423          	sd	a0,-24(s0)
 1a0:	87ae                	mv	a5,a1
 1a2:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 1a6:	a01d                	j	1cc <strchr+0x38>
    if(*s == c)
 1a8:	fe843783          	ld	a5,-24(s0)
 1ac:	0007c703          	lbu	a4,0(a5)
 1b0:	fe744783          	lbu	a5,-25(s0)
 1b4:	0ff7f793          	zext.b	a5,a5
 1b8:	00e79563          	bne	a5,a4,1c2 <strchr+0x2e>
      return (char*)s;
 1bc:	fe843783          	ld	a5,-24(s0)
 1c0:	a821                	j	1d8 <strchr+0x44>
  for(; *s; s++)
 1c2:	fe843783          	ld	a5,-24(s0)
 1c6:	0785                	addi	a5,a5,1
 1c8:	fef43423          	sd	a5,-24(s0)
 1cc:	fe843783          	ld	a5,-24(s0)
 1d0:	0007c783          	lbu	a5,0(a5)
 1d4:	fbf1                	bnez	a5,1a8 <strchr+0x14>
  return 0;
 1d6:	4781                	li	a5,0
}
 1d8:	853e                	mv	a0,a5
 1da:	60e2                	ld	ra,24(sp)
 1dc:	6442                	ld	s0,16(sp)
 1de:	6105                	addi	sp,sp,32
 1e0:	8082                	ret

00000000000001e2 <gets>:

char*
gets(char *buf, int max)
{
 1e2:	7179                	addi	sp,sp,-48
 1e4:	f406                	sd	ra,40(sp)
 1e6:	f022                	sd	s0,32(sp)
 1e8:	1800                	addi	s0,sp,48
 1ea:	fca43c23          	sd	a0,-40(s0)
 1ee:	87ae                	mv	a5,a1
 1f0:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f4:	fe042623          	sw	zero,-20(s0)
 1f8:	a8a1                	j	250 <gets+0x6e>
    cc = read(0, &c, 1);
 1fa:	fe740793          	addi	a5,s0,-25
 1fe:	4605                	li	a2,1
 200:	85be                	mv	a1,a5
 202:	4501                	li	a0,0
 204:	00000097          	auipc	ra,0x0
 208:	302080e7          	jalr	770(ra) # 506 <read>
 20c:	87aa                	mv	a5,a0
 20e:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 212:	fe842783          	lw	a5,-24(s0)
 216:	2781                	sext.w	a5,a5
 218:	04f05663          	blez	a5,264 <gets+0x82>
      break;
    buf[i++] = c;
 21c:	fec42783          	lw	a5,-20(s0)
 220:	0017871b          	addiw	a4,a5,1
 224:	fee42623          	sw	a4,-20(s0)
 228:	873e                	mv	a4,a5
 22a:	fd843783          	ld	a5,-40(s0)
 22e:	97ba                	add	a5,a5,a4
 230:	fe744703          	lbu	a4,-25(s0)
 234:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 238:	fe744783          	lbu	a5,-25(s0)
 23c:	873e                	mv	a4,a5
 23e:	47a9                	li	a5,10
 240:	02f70363          	beq	a4,a5,266 <gets+0x84>
 244:	fe744783          	lbu	a5,-25(s0)
 248:	873e                	mv	a4,a5
 24a:	47b5                	li	a5,13
 24c:	00f70d63          	beq	a4,a5,266 <gets+0x84>
  for(i=0; i+1 < max; ){
 250:	fec42783          	lw	a5,-20(s0)
 254:	2785                	addiw	a5,a5,1
 256:	2781                	sext.w	a5,a5
 258:	fd442703          	lw	a4,-44(s0)
 25c:	2701                	sext.w	a4,a4
 25e:	f8e7cee3          	blt	a5,a4,1fa <gets+0x18>
 262:	a011                	j	266 <gets+0x84>
      break;
 264:	0001                	nop
      break;
  }
  buf[i] = '\0';
 266:	fec42783          	lw	a5,-20(s0)
 26a:	fd843703          	ld	a4,-40(s0)
 26e:	97ba                	add	a5,a5,a4
 270:	00078023          	sb	zero,0(a5)
  return buf;
 274:	fd843783          	ld	a5,-40(s0)
}
 278:	853e                	mv	a0,a5
 27a:	70a2                	ld	ra,40(sp)
 27c:	7402                	ld	s0,32(sp)
 27e:	6145                	addi	sp,sp,48
 280:	8082                	ret

0000000000000282 <stat>:

int
stat(const char *n, struct stat *st)
{
 282:	7179                	addi	sp,sp,-48
 284:	f406                	sd	ra,40(sp)
 286:	f022                	sd	s0,32(sp)
 288:	1800                	addi	s0,sp,48
 28a:	fca43c23          	sd	a0,-40(s0)
 28e:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 292:	4581                	li	a1,0
 294:	fd843503          	ld	a0,-40(s0)
 298:	00000097          	auipc	ra,0x0
 29c:	296080e7          	jalr	662(ra) # 52e <open>
 2a0:	87aa                	mv	a5,a0
 2a2:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 2a6:	fec42783          	lw	a5,-20(s0)
 2aa:	2781                	sext.w	a5,a5
 2ac:	0007d463          	bgez	a5,2b4 <stat+0x32>
    return -1;
 2b0:	57fd                	li	a5,-1
 2b2:	a035                	j	2de <stat+0x5c>
  r = fstat(fd, st);
 2b4:	fec42783          	lw	a5,-20(s0)
 2b8:	fd043583          	ld	a1,-48(s0)
 2bc:	853e                	mv	a0,a5
 2be:	00000097          	auipc	ra,0x0
 2c2:	288080e7          	jalr	648(ra) # 546 <fstat>
 2c6:	87aa                	mv	a5,a0
 2c8:	fef42423          	sw	a5,-24(s0)
  close(fd);
 2cc:	fec42783          	lw	a5,-20(s0)
 2d0:	853e                	mv	a0,a5
 2d2:	00000097          	auipc	ra,0x0
 2d6:	244080e7          	jalr	580(ra) # 516 <close>
  return r;
 2da:	fe842783          	lw	a5,-24(s0)
}
 2de:	853e                	mv	a0,a5
 2e0:	70a2                	ld	ra,40(sp)
 2e2:	7402                	ld	s0,32(sp)
 2e4:	6145                	addi	sp,sp,48
 2e6:	8082                	ret

00000000000002e8 <atoi>:

int
atoi(const char *s)
{
 2e8:	7179                	addi	sp,sp,-48
 2ea:	f406                	sd	ra,40(sp)
 2ec:	f022                	sd	s0,32(sp)
 2ee:	1800                	addi	s0,sp,48
 2f0:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 2f4:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 2f8:	a81d                	j	32e <atoi+0x46>
    n = n*10 + *s++ - '0';
 2fa:	fec42783          	lw	a5,-20(s0)
 2fe:	873e                	mv	a4,a5
 300:	87ba                	mv	a5,a4
 302:	0027979b          	slliw	a5,a5,0x2
 306:	9fb9                	addw	a5,a5,a4
 308:	0017979b          	slliw	a5,a5,0x1
 30c:	0007871b          	sext.w	a4,a5
 310:	fd843783          	ld	a5,-40(s0)
 314:	00178693          	addi	a3,a5,1
 318:	fcd43c23          	sd	a3,-40(s0)
 31c:	0007c783          	lbu	a5,0(a5)
 320:	2781                	sext.w	a5,a5
 322:	9fb9                	addw	a5,a5,a4
 324:	2781                	sext.w	a5,a5
 326:	fd07879b          	addiw	a5,a5,-48
 32a:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 32e:	fd843783          	ld	a5,-40(s0)
 332:	0007c783          	lbu	a5,0(a5)
 336:	873e                	mv	a4,a5
 338:	02f00793          	li	a5,47
 33c:	00e7fb63          	bgeu	a5,a4,352 <atoi+0x6a>
 340:	fd843783          	ld	a5,-40(s0)
 344:	0007c783          	lbu	a5,0(a5)
 348:	873e                	mv	a4,a5
 34a:	03900793          	li	a5,57
 34e:	fae7f6e3          	bgeu	a5,a4,2fa <atoi+0x12>
  return n;
 352:	fec42783          	lw	a5,-20(s0)
}
 356:	853e                	mv	a0,a5
 358:	70a2                	ld	ra,40(sp)
 35a:	7402                	ld	s0,32(sp)
 35c:	6145                	addi	sp,sp,48
 35e:	8082                	ret

0000000000000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	7139                	addi	sp,sp,-64
 362:	fc06                	sd	ra,56(sp)
 364:	f822                	sd	s0,48(sp)
 366:	0080                	addi	s0,sp,64
 368:	fca43c23          	sd	a0,-40(s0)
 36c:	fcb43823          	sd	a1,-48(s0)
 370:	87b2                	mv	a5,a2
 372:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 376:	fd843783          	ld	a5,-40(s0)
 37a:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 37e:	fd043783          	ld	a5,-48(s0)
 382:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 386:	fe043703          	ld	a4,-32(s0)
 38a:	fe843783          	ld	a5,-24(s0)
 38e:	02e7fc63          	bgeu	a5,a4,3c6 <memmove+0x66>
    while(n-- > 0)
 392:	a00d                	j	3b4 <memmove+0x54>
      *dst++ = *src++;
 394:	fe043703          	ld	a4,-32(s0)
 398:	00170793          	addi	a5,a4,1
 39c:	fef43023          	sd	a5,-32(s0)
 3a0:	fe843783          	ld	a5,-24(s0)
 3a4:	00178693          	addi	a3,a5,1
 3a8:	fed43423          	sd	a3,-24(s0)
 3ac:	00074703          	lbu	a4,0(a4)
 3b0:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 3b4:	fcc42783          	lw	a5,-52(s0)
 3b8:	fff7871b          	addiw	a4,a5,-1
 3bc:	fce42623          	sw	a4,-52(s0)
 3c0:	fcf04ae3          	bgtz	a5,394 <memmove+0x34>
 3c4:	a891                	j	418 <memmove+0xb8>
  } else {
    dst += n;
 3c6:	fcc42783          	lw	a5,-52(s0)
 3ca:	fe843703          	ld	a4,-24(s0)
 3ce:	97ba                	add	a5,a5,a4
 3d0:	fef43423          	sd	a5,-24(s0)
    src += n;
 3d4:	fcc42783          	lw	a5,-52(s0)
 3d8:	fe043703          	ld	a4,-32(s0)
 3dc:	97ba                	add	a5,a5,a4
 3de:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 3e2:	a01d                	j	408 <memmove+0xa8>
      *--dst = *--src;
 3e4:	fe043783          	ld	a5,-32(s0)
 3e8:	17fd                	addi	a5,a5,-1
 3ea:	fef43023          	sd	a5,-32(s0)
 3ee:	fe843783          	ld	a5,-24(s0)
 3f2:	17fd                	addi	a5,a5,-1
 3f4:	fef43423          	sd	a5,-24(s0)
 3f8:	fe043783          	ld	a5,-32(s0)
 3fc:	0007c703          	lbu	a4,0(a5)
 400:	fe843783          	ld	a5,-24(s0)
 404:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 408:	fcc42783          	lw	a5,-52(s0)
 40c:	fff7871b          	addiw	a4,a5,-1
 410:	fce42623          	sw	a4,-52(s0)
 414:	fcf048e3          	bgtz	a5,3e4 <memmove+0x84>
  }
  return vdst;
 418:	fd843783          	ld	a5,-40(s0)
}
 41c:	853e                	mv	a0,a5
 41e:	70e2                	ld	ra,56(sp)
 420:	7442                	ld	s0,48(sp)
 422:	6121                	addi	sp,sp,64
 424:	8082                	ret

0000000000000426 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 426:	7139                	addi	sp,sp,-64
 428:	fc06                	sd	ra,56(sp)
 42a:	f822                	sd	s0,48(sp)
 42c:	0080                	addi	s0,sp,64
 42e:	fca43c23          	sd	a0,-40(s0)
 432:	fcb43823          	sd	a1,-48(s0)
 436:	87b2                	mv	a5,a2
 438:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 43c:	fd843783          	ld	a5,-40(s0)
 440:	fef43423          	sd	a5,-24(s0)
 444:	fd043783          	ld	a5,-48(s0)
 448:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 44c:	a0a1                	j	494 <memcmp+0x6e>
    if (*p1 != *p2) {
 44e:	fe843783          	ld	a5,-24(s0)
 452:	0007c703          	lbu	a4,0(a5)
 456:	fe043783          	ld	a5,-32(s0)
 45a:	0007c783          	lbu	a5,0(a5)
 45e:	02f70163          	beq	a4,a5,480 <memcmp+0x5a>
      return *p1 - *p2;
 462:	fe843783          	ld	a5,-24(s0)
 466:	0007c783          	lbu	a5,0(a5)
 46a:	0007871b          	sext.w	a4,a5
 46e:	fe043783          	ld	a5,-32(s0)
 472:	0007c783          	lbu	a5,0(a5)
 476:	2781                	sext.w	a5,a5
 478:	40f707bb          	subw	a5,a4,a5
 47c:	2781                	sext.w	a5,a5
 47e:	a01d                	j	4a4 <memcmp+0x7e>
    }
    p1++;
 480:	fe843783          	ld	a5,-24(s0)
 484:	0785                	addi	a5,a5,1
 486:	fef43423          	sd	a5,-24(s0)
    p2++;
 48a:	fe043783          	ld	a5,-32(s0)
 48e:	0785                	addi	a5,a5,1
 490:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 494:	fcc42783          	lw	a5,-52(s0)
 498:	fff7871b          	addiw	a4,a5,-1
 49c:	fce42623          	sw	a4,-52(s0)
 4a0:	f7dd                	bnez	a5,44e <memcmp+0x28>
  }
  return 0;
 4a2:	4781                	li	a5,0
}
 4a4:	853e                	mv	a0,a5
 4a6:	70e2                	ld	ra,56(sp)
 4a8:	7442                	ld	s0,48(sp)
 4aa:	6121                	addi	sp,sp,64
 4ac:	8082                	ret

00000000000004ae <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4ae:	7179                	addi	sp,sp,-48
 4b0:	f406                	sd	ra,40(sp)
 4b2:	f022                	sd	s0,32(sp)
 4b4:	1800                	addi	s0,sp,48
 4b6:	fea43423          	sd	a0,-24(s0)
 4ba:	feb43023          	sd	a1,-32(s0)
 4be:	87b2                	mv	a5,a2
 4c0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 4c4:	fdc42783          	lw	a5,-36(s0)
 4c8:	863e                	mv	a2,a5
 4ca:	fe043583          	ld	a1,-32(s0)
 4ce:	fe843503          	ld	a0,-24(s0)
 4d2:	00000097          	auipc	ra,0x0
 4d6:	e8e080e7          	jalr	-370(ra) # 360 <memmove>
 4da:	87aa                	mv	a5,a0
}
 4dc:	853e                	mv	a0,a5
 4de:	70a2                	ld	ra,40(sp)
 4e0:	7402                	ld	s0,32(sp)
 4e2:	6145                	addi	sp,sp,48
 4e4:	8082                	ret

00000000000004e6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4e6:	4885                	li	a7,1
 ecall
 4e8:	00000073          	ecall
 ret
 4ec:	8082                	ret

00000000000004ee <exit>:
.global exit
exit:
 li a7, SYS_exit
 4ee:	4889                	li	a7,2
 ecall
 4f0:	00000073          	ecall
 ret
 4f4:	8082                	ret

00000000000004f6 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4f6:	488d                	li	a7,3
 ecall
 4f8:	00000073          	ecall
 ret
 4fc:	8082                	ret

00000000000004fe <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4fe:	4891                	li	a7,4
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <read>:
.global read
read:
 li a7, SYS_read
 506:	4895                	li	a7,5
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <write>:
.global write
write:
 li a7, SYS_write
 50e:	48c1                	li	a7,16
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <close>:
.global close
close:
 li a7, SYS_close
 516:	48d5                	li	a7,21
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <kill>:
.global kill
kill:
 li a7, SYS_kill
 51e:	4899                	li	a7,6
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <exec>:
.global exec
exec:
 li a7, SYS_exec
 526:	489d                	li	a7,7
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <open>:
.global open
open:
 li a7, SYS_open
 52e:	48bd                	li	a7,15
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 536:	48c5                	li	a7,17
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 53e:	48c9                	li	a7,18
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 546:	48a1                	li	a7,8
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <link>:
.global link
link:
 li a7, SYS_link
 54e:	48cd                	li	a7,19
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 556:	48d1                	li	a7,20
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 55e:	48a5                	li	a7,9
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <dup>:
.global dup
dup:
 li a7, SYS_dup
 566:	48a9                	li	a7,10
 ecall
 568:	00000073          	ecall
 ret
 56c:	8082                	ret

000000000000056e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 56e:	48ad                	li	a7,11
 ecall
 570:	00000073          	ecall
 ret
 574:	8082                	ret

0000000000000576 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 576:	48b1                	li	a7,12
 ecall
 578:	00000073          	ecall
 ret
 57c:	8082                	ret

000000000000057e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 57e:	48b5                	li	a7,13
 ecall
 580:	00000073          	ecall
 ret
 584:	8082                	ret

0000000000000586 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 586:	48b9                	li	a7,14
 ecall
 588:	00000073          	ecall
 ret
 58c:	8082                	ret

000000000000058e <ps>:
.global ps
ps:
 li a7, SYS_ps
 58e:	48d9                	li	a7,22
 ecall
 590:	00000073          	ecall
 ret
 594:	8082                	ret

0000000000000596 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 596:	1101                	addi	sp,sp,-32
 598:	ec06                	sd	ra,24(sp)
 59a:	e822                	sd	s0,16(sp)
 59c:	1000                	addi	s0,sp,32
 59e:	87aa                	mv	a5,a0
 5a0:	872e                	mv	a4,a1
 5a2:	fef42623          	sw	a5,-20(s0)
 5a6:	87ba                	mv	a5,a4
 5a8:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5ac:	feb40713          	addi	a4,s0,-21
 5b0:	fec42783          	lw	a5,-20(s0)
 5b4:	4605                	li	a2,1
 5b6:	85ba                	mv	a1,a4
 5b8:	853e                	mv	a0,a5
 5ba:	00000097          	auipc	ra,0x0
 5be:	f54080e7          	jalr	-172(ra) # 50e <write>
}
 5c2:	0001                	nop
 5c4:	60e2                	ld	ra,24(sp)
 5c6:	6442                	ld	s0,16(sp)
 5c8:	6105                	addi	sp,sp,32
 5ca:	8082                	ret

00000000000005cc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5cc:	7139                	addi	sp,sp,-64
 5ce:	fc06                	sd	ra,56(sp)
 5d0:	f822                	sd	s0,48(sp)
 5d2:	0080                	addi	s0,sp,64
 5d4:	87aa                	mv	a5,a0
 5d6:	8736                	mv	a4,a3
 5d8:	fcf42623          	sw	a5,-52(s0)
 5dc:	87ae                	mv	a5,a1
 5de:	fcf42423          	sw	a5,-56(s0)
 5e2:	87b2                	mv	a5,a2
 5e4:	fcf42223          	sw	a5,-60(s0)
 5e8:	87ba                	mv	a5,a4
 5ea:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5ee:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 5f2:	fc042783          	lw	a5,-64(s0)
 5f6:	2781                	sext.w	a5,a5
 5f8:	c38d                	beqz	a5,61a <printint+0x4e>
 5fa:	fc842783          	lw	a5,-56(s0)
 5fe:	2781                	sext.w	a5,a5
 600:	0007dd63          	bgez	a5,61a <printint+0x4e>
    neg = 1;
 604:	4785                	li	a5,1
 606:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 60a:	fc842783          	lw	a5,-56(s0)
 60e:	40f007bb          	negw	a5,a5
 612:	2781                	sext.w	a5,a5
 614:	fef42223          	sw	a5,-28(s0)
 618:	a029                	j	622 <printint+0x56>
  } else {
    x = xx;
 61a:	fc842783          	lw	a5,-56(s0)
 61e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 622:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 626:	fc442783          	lw	a5,-60(s0)
 62a:	fe442703          	lw	a4,-28(s0)
 62e:	02f777bb          	remuw	a5,a4,a5
 632:	0007871b          	sext.w	a4,a5
 636:	fec42783          	lw	a5,-20(s0)
 63a:	0017869b          	addiw	a3,a5,1
 63e:	fed42623          	sw	a3,-20(s0)
 642:	00001697          	auipc	a3,0x1
 646:	d4e68693          	addi	a3,a3,-690 # 1390 <digits>
 64a:	1702                	slli	a4,a4,0x20
 64c:	9301                	srli	a4,a4,0x20
 64e:	9736                	add	a4,a4,a3
 650:	00074703          	lbu	a4,0(a4)
 654:	17c1                	addi	a5,a5,-16
 656:	97a2                	add	a5,a5,s0
 658:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 65c:	fc442783          	lw	a5,-60(s0)
 660:	fe442703          	lw	a4,-28(s0)
 664:	02f757bb          	divuw	a5,a4,a5
 668:	fef42223          	sw	a5,-28(s0)
 66c:	fe442783          	lw	a5,-28(s0)
 670:	2781                	sext.w	a5,a5
 672:	fbd5                	bnez	a5,626 <printint+0x5a>
  if(neg)
 674:	fe842783          	lw	a5,-24(s0)
 678:	2781                	sext.w	a5,a5
 67a:	cf85                	beqz	a5,6b2 <printint+0xe6>
    buf[i++] = '-';
 67c:	fec42783          	lw	a5,-20(s0)
 680:	0017871b          	addiw	a4,a5,1
 684:	fee42623          	sw	a4,-20(s0)
 688:	17c1                	addi	a5,a5,-16
 68a:	97a2                	add	a5,a5,s0
 68c:	02d00713          	li	a4,45
 690:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 694:	a839                	j	6b2 <printint+0xe6>
    putc(fd, buf[i]);
 696:	fec42783          	lw	a5,-20(s0)
 69a:	17c1                	addi	a5,a5,-16
 69c:	97a2                	add	a5,a5,s0
 69e:	fe07c703          	lbu	a4,-32(a5)
 6a2:	fcc42783          	lw	a5,-52(s0)
 6a6:	85ba                	mv	a1,a4
 6a8:	853e                	mv	a0,a5
 6aa:	00000097          	auipc	ra,0x0
 6ae:	eec080e7          	jalr	-276(ra) # 596 <putc>
  while(--i >= 0)
 6b2:	fec42783          	lw	a5,-20(s0)
 6b6:	37fd                	addiw	a5,a5,-1
 6b8:	fef42623          	sw	a5,-20(s0)
 6bc:	fec42783          	lw	a5,-20(s0)
 6c0:	2781                	sext.w	a5,a5
 6c2:	fc07dae3          	bgez	a5,696 <printint+0xca>
}
 6c6:	0001                	nop
 6c8:	0001                	nop
 6ca:	70e2                	ld	ra,56(sp)
 6cc:	7442                	ld	s0,48(sp)
 6ce:	6121                	addi	sp,sp,64
 6d0:	8082                	ret

00000000000006d2 <printptr>:

static void
printptr(int fd, uint64 x) {
 6d2:	7179                	addi	sp,sp,-48
 6d4:	f406                	sd	ra,40(sp)
 6d6:	f022                	sd	s0,32(sp)
 6d8:	1800                	addi	s0,sp,48
 6da:	87aa                	mv	a5,a0
 6dc:	fcb43823          	sd	a1,-48(s0)
 6e0:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 6e4:	fdc42783          	lw	a5,-36(s0)
 6e8:	03000593          	li	a1,48
 6ec:	853e                	mv	a0,a5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	ea8080e7          	jalr	-344(ra) # 596 <putc>
  putc(fd, 'x');
 6f6:	fdc42783          	lw	a5,-36(s0)
 6fa:	07800593          	li	a1,120
 6fe:	853e                	mv	a0,a5
 700:	00000097          	auipc	ra,0x0
 704:	e96080e7          	jalr	-362(ra) # 596 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 708:	fe042623          	sw	zero,-20(s0)
 70c:	a82d                	j	746 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 70e:	fd043783          	ld	a5,-48(s0)
 712:	93f1                	srli	a5,a5,0x3c
 714:	00001717          	auipc	a4,0x1
 718:	c7c70713          	addi	a4,a4,-900 # 1390 <digits>
 71c:	97ba                	add	a5,a5,a4
 71e:	0007c703          	lbu	a4,0(a5)
 722:	fdc42783          	lw	a5,-36(s0)
 726:	85ba                	mv	a1,a4
 728:	853e                	mv	a0,a5
 72a:	00000097          	auipc	ra,0x0
 72e:	e6c080e7          	jalr	-404(ra) # 596 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 732:	fec42783          	lw	a5,-20(s0)
 736:	2785                	addiw	a5,a5,1
 738:	fef42623          	sw	a5,-20(s0)
 73c:	fd043783          	ld	a5,-48(s0)
 740:	0792                	slli	a5,a5,0x4
 742:	fcf43823          	sd	a5,-48(s0)
 746:	fec42703          	lw	a4,-20(s0)
 74a:	47bd                	li	a5,15
 74c:	fce7f1e3          	bgeu	a5,a4,70e <printptr+0x3c>
}
 750:	0001                	nop
 752:	0001                	nop
 754:	70a2                	ld	ra,40(sp)
 756:	7402                	ld	s0,32(sp)
 758:	6145                	addi	sp,sp,48
 75a:	8082                	ret

000000000000075c <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 75c:	715d                	addi	sp,sp,-80
 75e:	e486                	sd	ra,72(sp)
 760:	e0a2                	sd	s0,64(sp)
 762:	0880                	addi	s0,sp,80
 764:	87aa                	mv	a5,a0
 766:	fcb43023          	sd	a1,-64(s0)
 76a:	fac43c23          	sd	a2,-72(s0)
 76e:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 772:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 776:	fe042223          	sw	zero,-28(s0)
 77a:	a42d                	j	9a4 <vprintf+0x248>
    c = fmt[i] & 0xff;
 77c:	fe442783          	lw	a5,-28(s0)
 780:	fc043703          	ld	a4,-64(s0)
 784:	97ba                	add	a5,a5,a4
 786:	0007c783          	lbu	a5,0(a5)
 78a:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 78e:	fe042783          	lw	a5,-32(s0)
 792:	2781                	sext.w	a5,a5
 794:	eb9d                	bnez	a5,7ca <vprintf+0x6e>
      if(c == '%'){
 796:	fdc42783          	lw	a5,-36(s0)
 79a:	0007871b          	sext.w	a4,a5
 79e:	02500793          	li	a5,37
 7a2:	00f71763          	bne	a4,a5,7b0 <vprintf+0x54>
        state = '%';
 7a6:	02500793          	li	a5,37
 7aa:	fef42023          	sw	a5,-32(s0)
 7ae:	a2f5                	j	99a <vprintf+0x23e>
      } else {
        putc(fd, c);
 7b0:	fdc42783          	lw	a5,-36(s0)
 7b4:	0ff7f713          	zext.b	a4,a5
 7b8:	fcc42783          	lw	a5,-52(s0)
 7bc:	85ba                	mv	a1,a4
 7be:	853e                	mv	a0,a5
 7c0:	00000097          	auipc	ra,0x0
 7c4:	dd6080e7          	jalr	-554(ra) # 596 <putc>
 7c8:	aac9                	j	99a <vprintf+0x23e>
      }
    } else if(state == '%'){
 7ca:	fe042783          	lw	a5,-32(s0)
 7ce:	0007871b          	sext.w	a4,a5
 7d2:	02500793          	li	a5,37
 7d6:	1cf71263          	bne	a4,a5,99a <vprintf+0x23e>
      if(c == 'd'){
 7da:	fdc42783          	lw	a5,-36(s0)
 7de:	0007871b          	sext.w	a4,a5
 7e2:	06400793          	li	a5,100
 7e6:	02f71463          	bne	a4,a5,80e <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 7ea:	fb843783          	ld	a5,-72(s0)
 7ee:	00878713          	addi	a4,a5,8
 7f2:	fae43c23          	sd	a4,-72(s0)
 7f6:	4398                	lw	a4,0(a5)
 7f8:	fcc42783          	lw	a5,-52(s0)
 7fc:	4685                	li	a3,1
 7fe:	4629                	li	a2,10
 800:	85ba                	mv	a1,a4
 802:	853e                	mv	a0,a5
 804:	00000097          	auipc	ra,0x0
 808:	dc8080e7          	jalr	-568(ra) # 5cc <printint>
 80c:	a269                	j	996 <vprintf+0x23a>
      } else if(c == 'l') {
 80e:	fdc42783          	lw	a5,-36(s0)
 812:	0007871b          	sext.w	a4,a5
 816:	06c00793          	li	a5,108
 81a:	02f71663          	bne	a4,a5,846 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 81e:	fb843783          	ld	a5,-72(s0)
 822:	00878713          	addi	a4,a5,8
 826:	fae43c23          	sd	a4,-72(s0)
 82a:	639c                	ld	a5,0(a5)
 82c:	0007871b          	sext.w	a4,a5
 830:	fcc42783          	lw	a5,-52(s0)
 834:	4681                	li	a3,0
 836:	4629                	li	a2,10
 838:	85ba                	mv	a1,a4
 83a:	853e                	mv	a0,a5
 83c:	00000097          	auipc	ra,0x0
 840:	d90080e7          	jalr	-624(ra) # 5cc <printint>
 844:	aa89                	j	996 <vprintf+0x23a>
      } else if(c == 'x') {
 846:	fdc42783          	lw	a5,-36(s0)
 84a:	0007871b          	sext.w	a4,a5
 84e:	07800793          	li	a5,120
 852:	02f71463          	bne	a4,a5,87a <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 856:	fb843783          	ld	a5,-72(s0)
 85a:	00878713          	addi	a4,a5,8
 85e:	fae43c23          	sd	a4,-72(s0)
 862:	4398                	lw	a4,0(a5)
 864:	fcc42783          	lw	a5,-52(s0)
 868:	4681                	li	a3,0
 86a:	4641                	li	a2,16
 86c:	85ba                	mv	a1,a4
 86e:	853e                	mv	a0,a5
 870:	00000097          	auipc	ra,0x0
 874:	d5c080e7          	jalr	-676(ra) # 5cc <printint>
 878:	aa39                	j	996 <vprintf+0x23a>
      } else if(c == 'p') {
 87a:	fdc42783          	lw	a5,-36(s0)
 87e:	0007871b          	sext.w	a4,a5
 882:	07000793          	li	a5,112
 886:	02f71263          	bne	a4,a5,8aa <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 88a:	fb843783          	ld	a5,-72(s0)
 88e:	00878713          	addi	a4,a5,8
 892:	fae43c23          	sd	a4,-72(s0)
 896:	6398                	ld	a4,0(a5)
 898:	fcc42783          	lw	a5,-52(s0)
 89c:	85ba                	mv	a1,a4
 89e:	853e                	mv	a0,a5
 8a0:	00000097          	auipc	ra,0x0
 8a4:	e32080e7          	jalr	-462(ra) # 6d2 <printptr>
 8a8:	a0fd                	j	996 <vprintf+0x23a>
      } else if(c == 's'){
 8aa:	fdc42783          	lw	a5,-36(s0)
 8ae:	0007871b          	sext.w	a4,a5
 8b2:	07300793          	li	a5,115
 8b6:	04f71c63          	bne	a4,a5,90e <vprintf+0x1b2>
        s = va_arg(ap, char*);
 8ba:	fb843783          	ld	a5,-72(s0)
 8be:	00878713          	addi	a4,a5,8
 8c2:	fae43c23          	sd	a4,-72(s0)
 8c6:	639c                	ld	a5,0(a5)
 8c8:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 8cc:	fe843783          	ld	a5,-24(s0)
 8d0:	eb8d                	bnez	a5,902 <vprintf+0x1a6>
          s = "(null)";
 8d2:	00000797          	auipc	a5,0x0
 8d6:	47e78793          	addi	a5,a5,1150 # d50 <malloc+0x142>
 8da:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 8de:	a015                	j	902 <vprintf+0x1a6>
          putc(fd, *s);
 8e0:	fe843783          	ld	a5,-24(s0)
 8e4:	0007c703          	lbu	a4,0(a5)
 8e8:	fcc42783          	lw	a5,-52(s0)
 8ec:	85ba                	mv	a1,a4
 8ee:	853e                	mv	a0,a5
 8f0:	00000097          	auipc	ra,0x0
 8f4:	ca6080e7          	jalr	-858(ra) # 596 <putc>
          s++;
 8f8:	fe843783          	ld	a5,-24(s0)
 8fc:	0785                	addi	a5,a5,1
 8fe:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 902:	fe843783          	ld	a5,-24(s0)
 906:	0007c783          	lbu	a5,0(a5)
 90a:	fbf9                	bnez	a5,8e0 <vprintf+0x184>
 90c:	a069                	j	996 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 90e:	fdc42783          	lw	a5,-36(s0)
 912:	0007871b          	sext.w	a4,a5
 916:	06300793          	li	a5,99
 91a:	02f71463          	bne	a4,a5,942 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 91e:	fb843783          	ld	a5,-72(s0)
 922:	00878713          	addi	a4,a5,8
 926:	fae43c23          	sd	a4,-72(s0)
 92a:	439c                	lw	a5,0(a5)
 92c:	0ff7f713          	zext.b	a4,a5
 930:	fcc42783          	lw	a5,-52(s0)
 934:	85ba                	mv	a1,a4
 936:	853e                	mv	a0,a5
 938:	00000097          	auipc	ra,0x0
 93c:	c5e080e7          	jalr	-930(ra) # 596 <putc>
 940:	a899                	j	996 <vprintf+0x23a>
      } else if(c == '%'){
 942:	fdc42783          	lw	a5,-36(s0)
 946:	0007871b          	sext.w	a4,a5
 94a:	02500793          	li	a5,37
 94e:	00f71f63          	bne	a4,a5,96c <vprintf+0x210>
        putc(fd, c);
 952:	fdc42783          	lw	a5,-36(s0)
 956:	0ff7f713          	zext.b	a4,a5
 95a:	fcc42783          	lw	a5,-52(s0)
 95e:	85ba                	mv	a1,a4
 960:	853e                	mv	a0,a5
 962:	00000097          	auipc	ra,0x0
 966:	c34080e7          	jalr	-972(ra) # 596 <putc>
 96a:	a035                	j	996 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 96c:	fcc42783          	lw	a5,-52(s0)
 970:	02500593          	li	a1,37
 974:	853e                	mv	a0,a5
 976:	00000097          	auipc	ra,0x0
 97a:	c20080e7          	jalr	-992(ra) # 596 <putc>
        putc(fd, c);
 97e:	fdc42783          	lw	a5,-36(s0)
 982:	0ff7f713          	zext.b	a4,a5
 986:	fcc42783          	lw	a5,-52(s0)
 98a:	85ba                	mv	a1,a4
 98c:	853e                	mv	a0,a5
 98e:	00000097          	auipc	ra,0x0
 992:	c08080e7          	jalr	-1016(ra) # 596 <putc>
      }
      state = 0;
 996:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 99a:	fe442783          	lw	a5,-28(s0)
 99e:	2785                	addiw	a5,a5,1
 9a0:	fef42223          	sw	a5,-28(s0)
 9a4:	fe442783          	lw	a5,-28(s0)
 9a8:	fc043703          	ld	a4,-64(s0)
 9ac:	97ba                	add	a5,a5,a4
 9ae:	0007c783          	lbu	a5,0(a5)
 9b2:	dc0795e3          	bnez	a5,77c <vprintf+0x20>
    }
  }
}
 9b6:	0001                	nop
 9b8:	0001                	nop
 9ba:	60a6                	ld	ra,72(sp)
 9bc:	6406                	ld	s0,64(sp)
 9be:	6161                	addi	sp,sp,80
 9c0:	8082                	ret

00000000000009c2 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 9c2:	7159                	addi	sp,sp,-112
 9c4:	fc06                	sd	ra,56(sp)
 9c6:	f822                	sd	s0,48(sp)
 9c8:	0080                	addi	s0,sp,64
 9ca:	fcb43823          	sd	a1,-48(s0)
 9ce:	e010                	sd	a2,0(s0)
 9d0:	e414                	sd	a3,8(s0)
 9d2:	e818                	sd	a4,16(s0)
 9d4:	ec1c                	sd	a5,24(s0)
 9d6:	03043023          	sd	a6,32(s0)
 9da:	03143423          	sd	a7,40(s0)
 9de:	87aa                	mv	a5,a0
 9e0:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 9e4:	03040793          	addi	a5,s0,48
 9e8:	fcf43423          	sd	a5,-56(s0)
 9ec:	fc843783          	ld	a5,-56(s0)
 9f0:	fd078793          	addi	a5,a5,-48
 9f4:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 9f8:	fe843703          	ld	a4,-24(s0)
 9fc:	fdc42783          	lw	a5,-36(s0)
 a00:	863a                	mv	a2,a4
 a02:	fd043583          	ld	a1,-48(s0)
 a06:	853e                	mv	a0,a5
 a08:	00000097          	auipc	ra,0x0
 a0c:	d54080e7          	jalr	-684(ra) # 75c <vprintf>
}
 a10:	0001                	nop
 a12:	70e2                	ld	ra,56(sp)
 a14:	7442                	ld	s0,48(sp)
 a16:	6165                	addi	sp,sp,112
 a18:	8082                	ret

0000000000000a1a <printf>:

void
printf(const char *fmt, ...)
{
 a1a:	7159                	addi	sp,sp,-112
 a1c:	f406                	sd	ra,40(sp)
 a1e:	f022                	sd	s0,32(sp)
 a20:	1800                	addi	s0,sp,48
 a22:	fca43c23          	sd	a0,-40(s0)
 a26:	e40c                	sd	a1,8(s0)
 a28:	e810                	sd	a2,16(s0)
 a2a:	ec14                	sd	a3,24(s0)
 a2c:	f018                	sd	a4,32(s0)
 a2e:	f41c                	sd	a5,40(s0)
 a30:	03043823          	sd	a6,48(s0)
 a34:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a38:	04040793          	addi	a5,s0,64
 a3c:	fcf43823          	sd	a5,-48(s0)
 a40:	fd043783          	ld	a5,-48(s0)
 a44:	fc878793          	addi	a5,a5,-56
 a48:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a4c:	fe843783          	ld	a5,-24(s0)
 a50:	863e                	mv	a2,a5
 a52:	fd843583          	ld	a1,-40(s0)
 a56:	4505                	li	a0,1
 a58:	00000097          	auipc	ra,0x0
 a5c:	d04080e7          	jalr	-764(ra) # 75c <vprintf>
}
 a60:	0001                	nop
 a62:	70a2                	ld	ra,40(sp)
 a64:	7402                	ld	s0,32(sp)
 a66:	6165                	addi	sp,sp,112
 a68:	8082                	ret

0000000000000a6a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a6a:	7179                	addi	sp,sp,-48
 a6c:	f406                	sd	ra,40(sp)
 a6e:	f022                	sd	s0,32(sp)
 a70:	1800                	addi	s0,sp,48
 a72:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a76:	fd843783          	ld	a5,-40(s0)
 a7a:	17c1                	addi	a5,a5,-16
 a7c:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a80:	00001797          	auipc	a5,0x1
 a84:	94078793          	addi	a5,a5,-1728 # 13c0 <freep>
 a88:	639c                	ld	a5,0(a5)
 a8a:	fef43423          	sd	a5,-24(s0)
 a8e:	a815                	j	ac2 <free+0x58>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a90:	fe843783          	ld	a5,-24(s0)
 a94:	639c                	ld	a5,0(a5)
 a96:	fe843703          	ld	a4,-24(s0)
 a9a:	00f76f63          	bltu	a4,a5,ab8 <free+0x4e>
 a9e:	fe043703          	ld	a4,-32(s0)
 aa2:	fe843783          	ld	a5,-24(s0)
 aa6:	02e7eb63          	bltu	a5,a4,adc <free+0x72>
 aaa:	fe843783          	ld	a5,-24(s0)
 aae:	639c                	ld	a5,0(a5)
 ab0:	fe043703          	ld	a4,-32(s0)
 ab4:	02f76463          	bltu	a4,a5,adc <free+0x72>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab8:	fe843783          	ld	a5,-24(s0)
 abc:	639c                	ld	a5,0(a5)
 abe:	fef43423          	sd	a5,-24(s0)
 ac2:	fe043703          	ld	a4,-32(s0)
 ac6:	fe843783          	ld	a5,-24(s0)
 aca:	fce7f3e3          	bgeu	a5,a4,a90 <free+0x26>
 ace:	fe843783          	ld	a5,-24(s0)
 ad2:	639c                	ld	a5,0(a5)
 ad4:	fe043703          	ld	a4,-32(s0)
 ad8:	faf77ce3          	bgeu	a4,a5,a90 <free+0x26>
      break;
  if(bp + bp->s.size == p->s.ptr){
 adc:	fe043783          	ld	a5,-32(s0)
 ae0:	479c                	lw	a5,8(a5)
 ae2:	1782                	slli	a5,a5,0x20
 ae4:	9381                	srli	a5,a5,0x20
 ae6:	0792                	slli	a5,a5,0x4
 ae8:	fe043703          	ld	a4,-32(s0)
 aec:	973e                	add	a4,a4,a5
 aee:	fe843783          	ld	a5,-24(s0)
 af2:	639c                	ld	a5,0(a5)
 af4:	02f71763          	bne	a4,a5,b22 <free+0xb8>
    bp->s.size += p->s.ptr->s.size;
 af8:	fe043783          	ld	a5,-32(s0)
 afc:	4798                	lw	a4,8(a5)
 afe:	fe843783          	ld	a5,-24(s0)
 b02:	639c                	ld	a5,0(a5)
 b04:	479c                	lw	a5,8(a5)
 b06:	9fb9                	addw	a5,a5,a4
 b08:	0007871b          	sext.w	a4,a5
 b0c:	fe043783          	ld	a5,-32(s0)
 b10:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b12:	fe843783          	ld	a5,-24(s0)
 b16:	639c                	ld	a5,0(a5)
 b18:	6398                	ld	a4,0(a5)
 b1a:	fe043783          	ld	a5,-32(s0)
 b1e:	e398                	sd	a4,0(a5)
 b20:	a039                	j	b2e <free+0xc4>
  } else
    bp->s.ptr = p->s.ptr;
 b22:	fe843783          	ld	a5,-24(s0)
 b26:	6398                	ld	a4,0(a5)
 b28:	fe043783          	ld	a5,-32(s0)
 b2c:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b2e:	fe843783          	ld	a5,-24(s0)
 b32:	479c                	lw	a5,8(a5)
 b34:	1782                	slli	a5,a5,0x20
 b36:	9381                	srli	a5,a5,0x20
 b38:	0792                	slli	a5,a5,0x4
 b3a:	fe843703          	ld	a4,-24(s0)
 b3e:	97ba                	add	a5,a5,a4
 b40:	fe043703          	ld	a4,-32(s0)
 b44:	02f71563          	bne	a4,a5,b6e <free+0x104>
    p->s.size += bp->s.size;
 b48:	fe843783          	ld	a5,-24(s0)
 b4c:	4798                	lw	a4,8(a5)
 b4e:	fe043783          	ld	a5,-32(s0)
 b52:	479c                	lw	a5,8(a5)
 b54:	9fb9                	addw	a5,a5,a4
 b56:	0007871b          	sext.w	a4,a5
 b5a:	fe843783          	ld	a5,-24(s0)
 b5e:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 b60:	fe043783          	ld	a5,-32(s0)
 b64:	6398                	ld	a4,0(a5)
 b66:	fe843783          	ld	a5,-24(s0)
 b6a:	e398                	sd	a4,0(a5)
 b6c:	a031                	j	b78 <free+0x10e>
  } else
    p->s.ptr = bp;
 b6e:	fe843783          	ld	a5,-24(s0)
 b72:	fe043703          	ld	a4,-32(s0)
 b76:	e398                	sd	a4,0(a5)
  freep = p;
 b78:	00001797          	auipc	a5,0x1
 b7c:	84878793          	addi	a5,a5,-1976 # 13c0 <freep>
 b80:	fe843703          	ld	a4,-24(s0)
 b84:	e398                	sd	a4,0(a5)
}
 b86:	0001                	nop
 b88:	70a2                	ld	ra,40(sp)
 b8a:	7402                	ld	s0,32(sp)
 b8c:	6145                	addi	sp,sp,48
 b8e:	8082                	ret

0000000000000b90 <morecore>:

static Header*
morecore(uint nu)
{
 b90:	7179                	addi	sp,sp,-48
 b92:	f406                	sd	ra,40(sp)
 b94:	f022                	sd	s0,32(sp)
 b96:	1800                	addi	s0,sp,48
 b98:	87aa                	mv	a5,a0
 b9a:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 b9e:	fdc42783          	lw	a5,-36(s0)
 ba2:	0007871b          	sext.w	a4,a5
 ba6:	6785                	lui	a5,0x1
 ba8:	00f77563          	bgeu	a4,a5,bb2 <morecore+0x22>
    nu = 4096;
 bac:	6785                	lui	a5,0x1
 bae:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 bb2:	fdc42783          	lw	a5,-36(s0)
 bb6:	0047979b          	slliw	a5,a5,0x4
 bba:	2781                	sext.w	a5,a5
 bbc:	853e                	mv	a0,a5
 bbe:	00000097          	auipc	ra,0x0
 bc2:	9b8080e7          	jalr	-1608(ra) # 576 <sbrk>
 bc6:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 bca:	fe843703          	ld	a4,-24(s0)
 bce:	57fd                	li	a5,-1
 bd0:	00f71463          	bne	a4,a5,bd8 <morecore+0x48>
    return 0;
 bd4:	4781                	li	a5,0
 bd6:	a03d                	j	c04 <morecore+0x74>
  hp = (Header*)p;
 bd8:	fe843783          	ld	a5,-24(s0)
 bdc:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 be0:	fe043783          	ld	a5,-32(s0)
 be4:	fdc42703          	lw	a4,-36(s0)
 be8:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 bea:	fe043783          	ld	a5,-32(s0)
 bee:	07c1                	addi	a5,a5,16 # 1010 <malloc+0x402>
 bf0:	853e                	mv	a0,a5
 bf2:	00000097          	auipc	ra,0x0
 bf6:	e78080e7          	jalr	-392(ra) # a6a <free>
  return freep;
 bfa:	00000797          	auipc	a5,0x0
 bfe:	7c678793          	addi	a5,a5,1990 # 13c0 <freep>
 c02:	639c                	ld	a5,0(a5)
}
 c04:	853e                	mv	a0,a5
 c06:	70a2                	ld	ra,40(sp)
 c08:	7402                	ld	s0,32(sp)
 c0a:	6145                	addi	sp,sp,48
 c0c:	8082                	ret

0000000000000c0e <malloc>:

void*
malloc(uint nbytes)
{
 c0e:	7139                	addi	sp,sp,-64
 c10:	fc06                	sd	ra,56(sp)
 c12:	f822                	sd	s0,48(sp)
 c14:	0080                	addi	s0,sp,64
 c16:	87aa                	mv	a5,a0
 c18:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c1c:	fcc46783          	lwu	a5,-52(s0)
 c20:	07bd                	addi	a5,a5,15
 c22:	8391                	srli	a5,a5,0x4
 c24:	2781                	sext.w	a5,a5
 c26:	2785                	addiw	a5,a5,1
 c28:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c2c:	00000797          	auipc	a5,0x0
 c30:	79478793          	addi	a5,a5,1940 # 13c0 <freep>
 c34:	639c                	ld	a5,0(a5)
 c36:	fef43023          	sd	a5,-32(s0)
 c3a:	fe043783          	ld	a5,-32(s0)
 c3e:	ef95                	bnez	a5,c7a <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c40:	00000797          	auipc	a5,0x0
 c44:	77078793          	addi	a5,a5,1904 # 13b0 <base>
 c48:	fef43023          	sd	a5,-32(s0)
 c4c:	00000797          	auipc	a5,0x0
 c50:	77478793          	addi	a5,a5,1908 # 13c0 <freep>
 c54:	fe043703          	ld	a4,-32(s0)
 c58:	e398                	sd	a4,0(a5)
 c5a:	00000797          	auipc	a5,0x0
 c5e:	76678793          	addi	a5,a5,1894 # 13c0 <freep>
 c62:	6398                	ld	a4,0(a5)
 c64:	00000797          	auipc	a5,0x0
 c68:	74c78793          	addi	a5,a5,1868 # 13b0 <base>
 c6c:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 c6e:	00000797          	auipc	a5,0x0
 c72:	74278793          	addi	a5,a5,1858 # 13b0 <base>
 c76:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c7a:	fe043783          	ld	a5,-32(s0)
 c7e:	639c                	ld	a5,0(a5)
 c80:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 c84:	fe843783          	ld	a5,-24(s0)
 c88:	479c                	lw	a5,8(a5)
 c8a:	fdc42703          	lw	a4,-36(s0)
 c8e:	2701                	sext.w	a4,a4
 c90:	06e7e763          	bltu	a5,a4,cfe <malloc+0xf0>
      if(p->s.size == nunits)
 c94:	fe843783          	ld	a5,-24(s0)
 c98:	479c                	lw	a5,8(a5)
 c9a:	fdc42703          	lw	a4,-36(s0)
 c9e:	2701                	sext.w	a4,a4
 ca0:	00f71963          	bne	a4,a5,cb2 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 ca4:	fe843783          	ld	a5,-24(s0)
 ca8:	6398                	ld	a4,0(a5)
 caa:	fe043783          	ld	a5,-32(s0)
 cae:	e398                	sd	a4,0(a5)
 cb0:	a825                	j	ce8 <malloc+0xda>
      else {
        p->s.size -= nunits;
 cb2:	fe843783          	ld	a5,-24(s0)
 cb6:	479c                	lw	a5,8(a5)
 cb8:	fdc42703          	lw	a4,-36(s0)
 cbc:	9f99                	subw	a5,a5,a4
 cbe:	0007871b          	sext.w	a4,a5
 cc2:	fe843783          	ld	a5,-24(s0)
 cc6:	c798                	sw	a4,8(a5)
        p += p->s.size;
 cc8:	fe843783          	ld	a5,-24(s0)
 ccc:	479c                	lw	a5,8(a5)
 cce:	1782                	slli	a5,a5,0x20
 cd0:	9381                	srli	a5,a5,0x20
 cd2:	0792                	slli	a5,a5,0x4
 cd4:	fe843703          	ld	a4,-24(s0)
 cd8:	97ba                	add	a5,a5,a4
 cda:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 cde:	fe843783          	ld	a5,-24(s0)
 ce2:	fdc42703          	lw	a4,-36(s0)
 ce6:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 ce8:	00000797          	auipc	a5,0x0
 cec:	6d878793          	addi	a5,a5,1752 # 13c0 <freep>
 cf0:	fe043703          	ld	a4,-32(s0)
 cf4:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 cf6:	fe843783          	ld	a5,-24(s0)
 cfa:	07c1                	addi	a5,a5,16
 cfc:	a091                	j	d40 <malloc+0x132>
    }
    if(p == freep)
 cfe:	00000797          	auipc	a5,0x0
 d02:	6c278793          	addi	a5,a5,1730 # 13c0 <freep>
 d06:	639c                	ld	a5,0(a5)
 d08:	fe843703          	ld	a4,-24(s0)
 d0c:	02f71063          	bne	a4,a5,d2c <malloc+0x11e>
      if((p = morecore(nunits)) == 0)
 d10:	fdc42783          	lw	a5,-36(s0)
 d14:	853e                	mv	a0,a5
 d16:	00000097          	auipc	ra,0x0
 d1a:	e7a080e7          	jalr	-390(ra) # b90 <morecore>
 d1e:	fea43423          	sd	a0,-24(s0)
 d22:	fe843783          	ld	a5,-24(s0)
 d26:	e399                	bnez	a5,d2c <malloc+0x11e>
        return 0;
 d28:	4781                	li	a5,0
 d2a:	a819                	j	d40 <malloc+0x132>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d2c:	fe843783          	ld	a5,-24(s0)
 d30:	fef43023          	sd	a5,-32(s0)
 d34:	fe843783          	ld	a5,-24(s0)
 d38:	639c                	ld	a5,0(a5)
 d3a:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d3e:	b799                	j	c84 <malloc+0x76>
  }
}
 d40:	853e                	mv	a0,a5
 d42:	70e2                	ld	ra,56(sp)
 d44:	7442                	ld	s0,48(sp)
 d46:	6121                	addi	sp,sp,64
 d48:	8082                	ret
