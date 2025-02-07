
user/_hello:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
   0:	711d                	addi	sp,sp,-96
   2:	ec86                	sd	ra,88(sp)
   4:	e8a2                	sd	s0,80(sp)
   6:	e4a6                	sd	s1,72(sp)
   8:	1080                	addi	s0,sp,96
   a:	87aa                	mv	a5,a0
   c:	fab43023          	sd	a1,-96(s0)
  10:	faf42623          	sw	a5,-84(s0)
    char hello[] = "Hello ";
  14:	6c6c67b7          	lui	a5,0x6c6c6
  18:	54878793          	addi	a5,a5,1352 # 6c6c6548 <freep+0x6c6c5188>
  1c:	fcf42c23          	sw	a5,-40(s0)
  20:	6789                	lui	a5,0x2
  22:	06f78793          	addi	a5,a5,111 # 206f <freep+0xcaf>
  26:	fcf41e23          	sh	a5,-36(s0)
  2a:	fc040f23          	sb	zero,-34(s0)
    char world[] = "World\n";
  2e:	6c7277b7          	lui	a5,0x6c727
  32:	f5778793          	addi	a5,a5,-169 # 6c726f57 <freep+0x6c725b97>
  36:	fcf42823          	sw	a5,-48(s0)
  3a:	6785                	lui	a5,0x1
  3c:	a6478793          	addi	a5,a5,-1436 # a64 <vprintf+0x212>
  40:	fcf41a23          	sh	a5,-44(s0)
  44:	fc040b23          	sb	zero,-42(s0)
    char nice[] = ", nice to meet you!\n";
  48:	00001797          	auipc	a5,0x1
  4c:	df878793          	addi	a5,a5,-520 # e40 <malloc+0x13c>
  50:	6394                	ld	a3,0(a5)
  52:	6798                	ld	a4,8(a5)
  54:	fad43c23          	sd	a3,-72(s0)
  58:	fce43023          	sd	a4,-64(s0)
  5c:	4b98                	lw	a4,16(a5)
  5e:	fce42423          	sw	a4,-56(s0)
  62:	0147c783          	lbu	a5,20(a5)
  66:	fcf40623          	sb	a5,-52(s0)


    write(1, hello, strlen(hello));
  6a:	fd840793          	addi	a5,s0,-40
  6e:	853e                	mv	a0,a5
  70:	00000097          	auipc	ra,0x0
  74:	17c080e7          	jalr	380(ra) # 1ec <strlen>
  78:	87aa                	mv	a5,a0
  7a:	873e                	mv	a4,a5
  7c:	fd840793          	addi	a5,s0,-40
  80:	863a                	mv	a2,a4
  82:	85be                	mv	a1,a5
  84:	4505                	li	a0,1
  86:	00000097          	auipc	ra,0x0
  8a:	57e080e7          	jalr	1406(ra) # 604 <write>

    if (argc == 1)
  8e:	fac42783          	lw	a5,-84(s0)
  92:	0007871b          	sext.w	a4,a5
  96:	4785                	li	a5,1
  98:	02f71563          	bne	a4,a5,c2 <main+0xc2>
    {
        write(1, world, strlen(world));
  9c:	fd040793          	addi	a5,s0,-48
  a0:	853e                	mv	a0,a5
  a2:	00000097          	auipc	ra,0x0
  a6:	14a080e7          	jalr	330(ra) # 1ec <strlen>
  aa:	87aa                	mv	a5,a0
  ac:	873e                	mv	a4,a5
  ae:	fd040793          	addi	a5,s0,-48
  b2:	863a                	mv	a2,a4
  b4:	85be                	mv	a1,a5
  b6:	4505                	li	a0,1
  b8:	00000097          	auipc	ra,0x0
  bc:	54c080e7          	jalr	1356(ra) # 604 <write>
  c0:	a881                	j	110 <main+0x110>
    }
    else
    {
        write(1, argv[1], strlen(argv[1]));
  c2:	fa043783          	ld	a5,-96(s0)
  c6:	07a1                	addi	a5,a5,8
  c8:	6384                	ld	s1,0(a5)
  ca:	fa043783          	ld	a5,-96(s0)
  ce:	07a1                	addi	a5,a5,8
  d0:	639c                	ld	a5,0(a5)
  d2:	853e                	mv	a0,a5
  d4:	00000097          	auipc	ra,0x0
  d8:	118080e7          	jalr	280(ra) # 1ec <strlen>
  dc:	87aa                	mv	a5,a0
  de:	863e                	mv	a2,a5
  e0:	85a6                	mv	a1,s1
  e2:	4505                	li	a0,1
  e4:	00000097          	auipc	ra,0x0
  e8:	520080e7          	jalr	1312(ra) # 604 <write>
        write(1, nice, strlen(nice));
  ec:	fb840793          	addi	a5,s0,-72
  f0:	853e                	mv	a0,a5
  f2:	00000097          	auipc	ra,0x0
  f6:	0fa080e7          	jalr	250(ra) # 1ec <strlen>
  fa:	87aa                	mv	a5,a0
  fc:	873e                	mv	a4,a5
  fe:	fb840793          	addi	a5,s0,-72
 102:	863a                	mv	a2,a4
 104:	85be                	mv	a1,a5
 106:	4505                	li	a0,1
 108:	00000097          	auipc	ra,0x0
 10c:	4fc080e7          	jalr	1276(ra) # 604 <write>
    }

    exit(0);
 110:	4501                	li	a0,0
 112:	00000097          	auipc	ra,0x0
 116:	4d2080e7          	jalr	1234(ra) # 5e4 <exit>

000000000000011a <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 11a:	1141                	addi	sp,sp,-16
 11c:	e406                	sd	ra,8(sp)
 11e:	e022                	sd	s0,0(sp)
 120:	0800                	addi	s0,sp,16
  extern int main();
  main();
 122:	00000097          	auipc	ra,0x0
 126:	ede080e7          	jalr	-290(ra) # 0 <main>
  exit(0);
 12a:	4501                	li	a0,0
 12c:	00000097          	auipc	ra,0x0
 130:	4b8080e7          	jalr	1208(ra) # 5e4 <exit>

0000000000000134 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 134:	7179                	addi	sp,sp,-48
 136:	f406                	sd	ra,40(sp)
 138:	f022                	sd	s0,32(sp)
 13a:	1800                	addi	s0,sp,48
 13c:	fca43c23          	sd	a0,-40(s0)
 140:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
 144:	fd843783          	ld	a5,-40(s0)
 148:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
 14c:	0001                	nop
 14e:	fd043703          	ld	a4,-48(s0)
 152:	00170793          	addi	a5,a4,1
 156:	fcf43823          	sd	a5,-48(s0)
 15a:	fd843783          	ld	a5,-40(s0)
 15e:	00178693          	addi	a3,a5,1
 162:	fcd43c23          	sd	a3,-40(s0)
 166:	00074703          	lbu	a4,0(a4)
 16a:	00e78023          	sb	a4,0(a5)
 16e:	0007c783          	lbu	a5,0(a5)
 172:	fff1                	bnez	a5,14e <strcpy+0x1a>
    ;
  return os;
 174:	fe843783          	ld	a5,-24(s0)
}
 178:	853e                	mv	a0,a5
 17a:	70a2                	ld	ra,40(sp)
 17c:	7402                	ld	s0,32(sp)
 17e:	6145                	addi	sp,sp,48
 180:	8082                	ret

0000000000000182 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 182:	1101                	addi	sp,sp,-32
 184:	ec06                	sd	ra,24(sp)
 186:	e822                	sd	s0,16(sp)
 188:	1000                	addi	s0,sp,32
 18a:	fea43423          	sd	a0,-24(s0)
 18e:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
 192:	a819                	j	1a8 <strcmp+0x26>
    p++, q++;
 194:	fe843783          	ld	a5,-24(s0)
 198:	0785                	addi	a5,a5,1
 19a:	fef43423          	sd	a5,-24(s0)
 19e:	fe043783          	ld	a5,-32(s0)
 1a2:	0785                	addi	a5,a5,1
 1a4:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 1a8:	fe843783          	ld	a5,-24(s0)
 1ac:	0007c783          	lbu	a5,0(a5)
 1b0:	cb99                	beqz	a5,1c6 <strcmp+0x44>
 1b2:	fe843783          	ld	a5,-24(s0)
 1b6:	0007c703          	lbu	a4,0(a5)
 1ba:	fe043783          	ld	a5,-32(s0)
 1be:	0007c783          	lbu	a5,0(a5)
 1c2:	fcf709e3          	beq	a4,a5,194 <strcmp+0x12>
  return (uchar)*p - (uchar)*q;
 1c6:	fe843783          	ld	a5,-24(s0)
 1ca:	0007c783          	lbu	a5,0(a5)
 1ce:	0007871b          	sext.w	a4,a5
 1d2:	fe043783          	ld	a5,-32(s0)
 1d6:	0007c783          	lbu	a5,0(a5)
 1da:	2781                	sext.w	a5,a5
 1dc:	40f707bb          	subw	a5,a4,a5
 1e0:	2781                	sext.w	a5,a5
}
 1e2:	853e                	mv	a0,a5
 1e4:	60e2                	ld	ra,24(sp)
 1e6:	6442                	ld	s0,16(sp)
 1e8:	6105                	addi	sp,sp,32
 1ea:	8082                	ret

00000000000001ec <strlen>:

uint
strlen(const char *s)
{
 1ec:	7179                	addi	sp,sp,-48
 1ee:	f406                	sd	ra,40(sp)
 1f0:	f022                	sd	s0,32(sp)
 1f2:	1800                	addi	s0,sp,48
 1f4:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 1f8:	fe042623          	sw	zero,-20(s0)
 1fc:	a031                	j	208 <strlen+0x1c>
 1fe:	fec42783          	lw	a5,-20(s0)
 202:	2785                	addiw	a5,a5,1
 204:	fef42623          	sw	a5,-20(s0)
 208:	fec42783          	lw	a5,-20(s0)
 20c:	fd843703          	ld	a4,-40(s0)
 210:	97ba                	add	a5,a5,a4
 212:	0007c783          	lbu	a5,0(a5)
 216:	f7e5                	bnez	a5,1fe <strlen+0x12>
    ;
  return n;
 218:	fec42783          	lw	a5,-20(s0)
}
 21c:	853e                	mv	a0,a5
 21e:	70a2                	ld	ra,40(sp)
 220:	7402                	ld	s0,32(sp)
 222:	6145                	addi	sp,sp,48
 224:	8082                	ret

0000000000000226 <memset>:

void*
memset(void *dst, int c, uint n)
{
 226:	7179                	addi	sp,sp,-48
 228:	f406                	sd	ra,40(sp)
 22a:	f022                	sd	s0,32(sp)
 22c:	1800                	addi	s0,sp,48
 22e:	fca43c23          	sd	a0,-40(s0)
 232:	87ae                	mv	a5,a1
 234:	8732                	mv	a4,a2
 236:	fcf42a23          	sw	a5,-44(s0)
 23a:	87ba                	mv	a5,a4
 23c:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 240:	fd843783          	ld	a5,-40(s0)
 244:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 248:	fe042623          	sw	zero,-20(s0)
 24c:	a00d                	j	26e <memset+0x48>
    cdst[i] = c;
 24e:	fec42783          	lw	a5,-20(s0)
 252:	fe043703          	ld	a4,-32(s0)
 256:	97ba                	add	a5,a5,a4
 258:	fd442703          	lw	a4,-44(s0)
 25c:	0ff77713          	zext.b	a4,a4
 260:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 264:	fec42783          	lw	a5,-20(s0)
 268:	2785                	addiw	a5,a5,1
 26a:	fef42623          	sw	a5,-20(s0)
 26e:	fec42783          	lw	a5,-20(s0)
 272:	fd042703          	lw	a4,-48(s0)
 276:	2701                	sext.w	a4,a4
 278:	fce7ebe3          	bltu	a5,a4,24e <memset+0x28>
  }
  return dst;
 27c:	fd843783          	ld	a5,-40(s0)
}
 280:	853e                	mv	a0,a5
 282:	70a2                	ld	ra,40(sp)
 284:	7402                	ld	s0,32(sp)
 286:	6145                	addi	sp,sp,48
 288:	8082                	ret

000000000000028a <strchr>:

char*
strchr(const char *s, char c)
{
 28a:	1101                	addi	sp,sp,-32
 28c:	ec06                	sd	ra,24(sp)
 28e:	e822                	sd	s0,16(sp)
 290:	1000                	addi	s0,sp,32
 292:	fea43423          	sd	a0,-24(s0)
 296:	87ae                	mv	a5,a1
 298:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 29c:	a01d                	j	2c2 <strchr+0x38>
    if(*s == c)
 29e:	fe843783          	ld	a5,-24(s0)
 2a2:	0007c703          	lbu	a4,0(a5)
 2a6:	fe744783          	lbu	a5,-25(s0)
 2aa:	0ff7f793          	zext.b	a5,a5
 2ae:	00e79563          	bne	a5,a4,2b8 <strchr+0x2e>
      return (char*)s;
 2b2:	fe843783          	ld	a5,-24(s0)
 2b6:	a821                	j	2ce <strchr+0x44>
  for(; *s; s++)
 2b8:	fe843783          	ld	a5,-24(s0)
 2bc:	0785                	addi	a5,a5,1
 2be:	fef43423          	sd	a5,-24(s0)
 2c2:	fe843783          	ld	a5,-24(s0)
 2c6:	0007c783          	lbu	a5,0(a5)
 2ca:	fbf1                	bnez	a5,29e <strchr+0x14>
  return 0;
 2cc:	4781                	li	a5,0
}
 2ce:	853e                	mv	a0,a5
 2d0:	60e2                	ld	ra,24(sp)
 2d2:	6442                	ld	s0,16(sp)
 2d4:	6105                	addi	sp,sp,32
 2d6:	8082                	ret

00000000000002d8 <gets>:

char*
gets(char *buf, int max)
{
 2d8:	7179                	addi	sp,sp,-48
 2da:	f406                	sd	ra,40(sp)
 2dc:	f022                	sd	s0,32(sp)
 2de:	1800                	addi	s0,sp,48
 2e0:	fca43c23          	sd	a0,-40(s0)
 2e4:	87ae                	mv	a5,a1
 2e6:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ea:	fe042623          	sw	zero,-20(s0)
 2ee:	a8a1                	j	346 <gets+0x6e>
    cc = read(0, &c, 1);
 2f0:	fe740793          	addi	a5,s0,-25
 2f4:	4605                	li	a2,1
 2f6:	85be                	mv	a1,a5
 2f8:	4501                	li	a0,0
 2fa:	00000097          	auipc	ra,0x0
 2fe:	302080e7          	jalr	770(ra) # 5fc <read>
 302:	87aa                	mv	a5,a0
 304:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 308:	fe842783          	lw	a5,-24(s0)
 30c:	2781                	sext.w	a5,a5
 30e:	04f05663          	blez	a5,35a <gets+0x82>
      break;
    buf[i++] = c;
 312:	fec42783          	lw	a5,-20(s0)
 316:	0017871b          	addiw	a4,a5,1
 31a:	fee42623          	sw	a4,-20(s0)
 31e:	873e                	mv	a4,a5
 320:	fd843783          	ld	a5,-40(s0)
 324:	97ba                	add	a5,a5,a4
 326:	fe744703          	lbu	a4,-25(s0)
 32a:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 32e:	fe744783          	lbu	a5,-25(s0)
 332:	873e                	mv	a4,a5
 334:	47a9                	li	a5,10
 336:	02f70363          	beq	a4,a5,35c <gets+0x84>
 33a:	fe744783          	lbu	a5,-25(s0)
 33e:	873e                	mv	a4,a5
 340:	47b5                	li	a5,13
 342:	00f70d63          	beq	a4,a5,35c <gets+0x84>
  for(i=0; i+1 < max; ){
 346:	fec42783          	lw	a5,-20(s0)
 34a:	2785                	addiw	a5,a5,1
 34c:	2781                	sext.w	a5,a5
 34e:	fd442703          	lw	a4,-44(s0)
 352:	2701                	sext.w	a4,a4
 354:	f8e7cee3          	blt	a5,a4,2f0 <gets+0x18>
 358:	a011                	j	35c <gets+0x84>
      break;
 35a:	0001                	nop
      break;
  }
  buf[i] = '\0';
 35c:	fec42783          	lw	a5,-20(s0)
 360:	fd843703          	ld	a4,-40(s0)
 364:	97ba                	add	a5,a5,a4
 366:	00078023          	sb	zero,0(a5)
  return buf;
 36a:	fd843783          	ld	a5,-40(s0)
}
 36e:	853e                	mv	a0,a5
 370:	70a2                	ld	ra,40(sp)
 372:	7402                	ld	s0,32(sp)
 374:	6145                	addi	sp,sp,48
 376:	8082                	ret

0000000000000378 <stat>:

int
stat(const char *n, struct stat *st)
{
 378:	7179                	addi	sp,sp,-48
 37a:	f406                	sd	ra,40(sp)
 37c:	f022                	sd	s0,32(sp)
 37e:	1800                	addi	s0,sp,48
 380:	fca43c23          	sd	a0,-40(s0)
 384:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 388:	4581                	li	a1,0
 38a:	fd843503          	ld	a0,-40(s0)
 38e:	00000097          	auipc	ra,0x0
 392:	296080e7          	jalr	662(ra) # 624 <open>
 396:	87aa                	mv	a5,a0
 398:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 39c:	fec42783          	lw	a5,-20(s0)
 3a0:	2781                	sext.w	a5,a5
 3a2:	0007d463          	bgez	a5,3aa <stat+0x32>
    return -1;
 3a6:	57fd                	li	a5,-1
 3a8:	a035                	j	3d4 <stat+0x5c>
  r = fstat(fd, st);
 3aa:	fec42783          	lw	a5,-20(s0)
 3ae:	fd043583          	ld	a1,-48(s0)
 3b2:	853e                	mv	a0,a5
 3b4:	00000097          	auipc	ra,0x0
 3b8:	288080e7          	jalr	648(ra) # 63c <fstat>
 3bc:	87aa                	mv	a5,a0
 3be:	fef42423          	sw	a5,-24(s0)
  close(fd);
 3c2:	fec42783          	lw	a5,-20(s0)
 3c6:	853e                	mv	a0,a5
 3c8:	00000097          	auipc	ra,0x0
 3cc:	244080e7          	jalr	580(ra) # 60c <close>
  return r;
 3d0:	fe842783          	lw	a5,-24(s0)
}
 3d4:	853e                	mv	a0,a5
 3d6:	70a2                	ld	ra,40(sp)
 3d8:	7402                	ld	s0,32(sp)
 3da:	6145                	addi	sp,sp,48
 3dc:	8082                	ret

00000000000003de <atoi>:

int
atoi(const char *s)
{
 3de:	7179                	addi	sp,sp,-48
 3e0:	f406                	sd	ra,40(sp)
 3e2:	f022                	sd	s0,32(sp)
 3e4:	1800                	addi	s0,sp,48
 3e6:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 3ea:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 3ee:	a81d                	j	424 <atoi+0x46>
    n = n*10 + *s++ - '0';
 3f0:	fec42783          	lw	a5,-20(s0)
 3f4:	873e                	mv	a4,a5
 3f6:	87ba                	mv	a5,a4
 3f8:	0027979b          	slliw	a5,a5,0x2
 3fc:	9fb9                	addw	a5,a5,a4
 3fe:	0017979b          	slliw	a5,a5,0x1
 402:	0007871b          	sext.w	a4,a5
 406:	fd843783          	ld	a5,-40(s0)
 40a:	00178693          	addi	a3,a5,1
 40e:	fcd43c23          	sd	a3,-40(s0)
 412:	0007c783          	lbu	a5,0(a5)
 416:	2781                	sext.w	a5,a5
 418:	9fb9                	addw	a5,a5,a4
 41a:	2781                	sext.w	a5,a5
 41c:	fd07879b          	addiw	a5,a5,-48
 420:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 424:	fd843783          	ld	a5,-40(s0)
 428:	0007c783          	lbu	a5,0(a5)
 42c:	873e                	mv	a4,a5
 42e:	02f00793          	li	a5,47
 432:	00e7fb63          	bgeu	a5,a4,448 <atoi+0x6a>
 436:	fd843783          	ld	a5,-40(s0)
 43a:	0007c783          	lbu	a5,0(a5)
 43e:	873e                	mv	a4,a5
 440:	03900793          	li	a5,57
 444:	fae7f6e3          	bgeu	a5,a4,3f0 <atoi+0x12>
  return n;
 448:	fec42783          	lw	a5,-20(s0)
}
 44c:	853e                	mv	a0,a5
 44e:	70a2                	ld	ra,40(sp)
 450:	7402                	ld	s0,32(sp)
 452:	6145                	addi	sp,sp,48
 454:	8082                	ret

0000000000000456 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 456:	7139                	addi	sp,sp,-64
 458:	fc06                	sd	ra,56(sp)
 45a:	f822                	sd	s0,48(sp)
 45c:	0080                	addi	s0,sp,64
 45e:	fca43c23          	sd	a0,-40(s0)
 462:	fcb43823          	sd	a1,-48(s0)
 466:	87b2                	mv	a5,a2
 468:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 46c:	fd843783          	ld	a5,-40(s0)
 470:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 474:	fd043783          	ld	a5,-48(s0)
 478:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 47c:	fe043703          	ld	a4,-32(s0)
 480:	fe843783          	ld	a5,-24(s0)
 484:	02e7fc63          	bgeu	a5,a4,4bc <memmove+0x66>
    while(n-- > 0)
 488:	a00d                	j	4aa <memmove+0x54>
      *dst++ = *src++;
 48a:	fe043703          	ld	a4,-32(s0)
 48e:	00170793          	addi	a5,a4,1
 492:	fef43023          	sd	a5,-32(s0)
 496:	fe843783          	ld	a5,-24(s0)
 49a:	00178693          	addi	a3,a5,1
 49e:	fed43423          	sd	a3,-24(s0)
 4a2:	00074703          	lbu	a4,0(a4)
 4a6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 4aa:	fcc42783          	lw	a5,-52(s0)
 4ae:	fff7871b          	addiw	a4,a5,-1
 4b2:	fce42623          	sw	a4,-52(s0)
 4b6:	fcf04ae3          	bgtz	a5,48a <memmove+0x34>
 4ba:	a891                	j	50e <memmove+0xb8>
  } else {
    dst += n;
 4bc:	fcc42783          	lw	a5,-52(s0)
 4c0:	fe843703          	ld	a4,-24(s0)
 4c4:	97ba                	add	a5,a5,a4
 4c6:	fef43423          	sd	a5,-24(s0)
    src += n;
 4ca:	fcc42783          	lw	a5,-52(s0)
 4ce:	fe043703          	ld	a4,-32(s0)
 4d2:	97ba                	add	a5,a5,a4
 4d4:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 4d8:	a01d                	j	4fe <memmove+0xa8>
      *--dst = *--src;
 4da:	fe043783          	ld	a5,-32(s0)
 4de:	17fd                	addi	a5,a5,-1
 4e0:	fef43023          	sd	a5,-32(s0)
 4e4:	fe843783          	ld	a5,-24(s0)
 4e8:	17fd                	addi	a5,a5,-1
 4ea:	fef43423          	sd	a5,-24(s0)
 4ee:	fe043783          	ld	a5,-32(s0)
 4f2:	0007c703          	lbu	a4,0(a5)
 4f6:	fe843783          	ld	a5,-24(s0)
 4fa:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 4fe:	fcc42783          	lw	a5,-52(s0)
 502:	fff7871b          	addiw	a4,a5,-1
 506:	fce42623          	sw	a4,-52(s0)
 50a:	fcf048e3          	bgtz	a5,4da <memmove+0x84>
  }
  return vdst;
 50e:	fd843783          	ld	a5,-40(s0)
}
 512:	853e                	mv	a0,a5
 514:	70e2                	ld	ra,56(sp)
 516:	7442                	ld	s0,48(sp)
 518:	6121                	addi	sp,sp,64
 51a:	8082                	ret

000000000000051c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 51c:	7139                	addi	sp,sp,-64
 51e:	fc06                	sd	ra,56(sp)
 520:	f822                	sd	s0,48(sp)
 522:	0080                	addi	s0,sp,64
 524:	fca43c23          	sd	a0,-40(s0)
 528:	fcb43823          	sd	a1,-48(s0)
 52c:	87b2                	mv	a5,a2
 52e:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 532:	fd843783          	ld	a5,-40(s0)
 536:	fef43423          	sd	a5,-24(s0)
 53a:	fd043783          	ld	a5,-48(s0)
 53e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 542:	a0a1                	j	58a <memcmp+0x6e>
    if (*p1 != *p2) {
 544:	fe843783          	ld	a5,-24(s0)
 548:	0007c703          	lbu	a4,0(a5)
 54c:	fe043783          	ld	a5,-32(s0)
 550:	0007c783          	lbu	a5,0(a5)
 554:	02f70163          	beq	a4,a5,576 <memcmp+0x5a>
      return *p1 - *p2;
 558:	fe843783          	ld	a5,-24(s0)
 55c:	0007c783          	lbu	a5,0(a5)
 560:	0007871b          	sext.w	a4,a5
 564:	fe043783          	ld	a5,-32(s0)
 568:	0007c783          	lbu	a5,0(a5)
 56c:	2781                	sext.w	a5,a5
 56e:	40f707bb          	subw	a5,a4,a5
 572:	2781                	sext.w	a5,a5
 574:	a01d                	j	59a <memcmp+0x7e>
    }
    p1++;
 576:	fe843783          	ld	a5,-24(s0)
 57a:	0785                	addi	a5,a5,1
 57c:	fef43423          	sd	a5,-24(s0)
    p2++;
 580:	fe043783          	ld	a5,-32(s0)
 584:	0785                	addi	a5,a5,1
 586:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 58a:	fcc42783          	lw	a5,-52(s0)
 58e:	fff7871b          	addiw	a4,a5,-1
 592:	fce42623          	sw	a4,-52(s0)
 596:	f7dd                	bnez	a5,544 <memcmp+0x28>
  }
  return 0;
 598:	4781                	li	a5,0
}
 59a:	853e                	mv	a0,a5
 59c:	70e2                	ld	ra,56(sp)
 59e:	7442                	ld	s0,48(sp)
 5a0:	6121                	addi	sp,sp,64
 5a2:	8082                	ret

00000000000005a4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 5a4:	7179                	addi	sp,sp,-48
 5a6:	f406                	sd	ra,40(sp)
 5a8:	f022                	sd	s0,32(sp)
 5aa:	1800                	addi	s0,sp,48
 5ac:	fea43423          	sd	a0,-24(s0)
 5b0:	feb43023          	sd	a1,-32(s0)
 5b4:	87b2                	mv	a5,a2
 5b6:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 5ba:	fdc42783          	lw	a5,-36(s0)
 5be:	863e                	mv	a2,a5
 5c0:	fe043583          	ld	a1,-32(s0)
 5c4:	fe843503          	ld	a0,-24(s0)
 5c8:	00000097          	auipc	ra,0x0
 5cc:	e8e080e7          	jalr	-370(ra) # 456 <memmove>
 5d0:	87aa                	mv	a5,a0
}
 5d2:	853e                	mv	a0,a5
 5d4:	70a2                	ld	ra,40(sp)
 5d6:	7402                	ld	s0,32(sp)
 5d8:	6145                	addi	sp,sp,48
 5da:	8082                	ret

00000000000005dc <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 5dc:	4885                	li	a7,1
 ecall
 5de:	00000073          	ecall
 ret
 5e2:	8082                	ret

00000000000005e4 <exit>:
.global exit
exit:
 li a7, SYS_exit
 5e4:	4889                	li	a7,2
 ecall
 5e6:	00000073          	ecall
 ret
 5ea:	8082                	ret

00000000000005ec <wait>:
.global wait
wait:
 li a7, SYS_wait
 5ec:	488d                	li	a7,3
 ecall
 5ee:	00000073          	ecall
 ret
 5f2:	8082                	ret

00000000000005f4 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 5f4:	4891                	li	a7,4
 ecall
 5f6:	00000073          	ecall
 ret
 5fa:	8082                	ret

00000000000005fc <read>:
.global read
read:
 li a7, SYS_read
 5fc:	4895                	li	a7,5
 ecall
 5fe:	00000073          	ecall
 ret
 602:	8082                	ret

0000000000000604 <write>:
.global write
write:
 li a7, SYS_write
 604:	48c1                	li	a7,16
 ecall
 606:	00000073          	ecall
 ret
 60a:	8082                	ret

000000000000060c <close>:
.global close
close:
 li a7, SYS_close
 60c:	48d5                	li	a7,21
 ecall
 60e:	00000073          	ecall
 ret
 612:	8082                	ret

0000000000000614 <kill>:
.global kill
kill:
 li a7, SYS_kill
 614:	4899                	li	a7,6
 ecall
 616:	00000073          	ecall
 ret
 61a:	8082                	ret

000000000000061c <exec>:
.global exec
exec:
 li a7, SYS_exec
 61c:	489d                	li	a7,7
 ecall
 61e:	00000073          	ecall
 ret
 622:	8082                	ret

0000000000000624 <open>:
.global open
open:
 li a7, SYS_open
 624:	48bd                	li	a7,15
 ecall
 626:	00000073          	ecall
 ret
 62a:	8082                	ret

000000000000062c <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 62c:	48c5                	li	a7,17
 ecall
 62e:	00000073          	ecall
 ret
 632:	8082                	ret

0000000000000634 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 634:	48c9                	li	a7,18
 ecall
 636:	00000073          	ecall
 ret
 63a:	8082                	ret

000000000000063c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 63c:	48a1                	li	a7,8
 ecall
 63e:	00000073          	ecall
 ret
 642:	8082                	ret

0000000000000644 <link>:
.global link
link:
 li a7, SYS_link
 644:	48cd                	li	a7,19
 ecall
 646:	00000073          	ecall
 ret
 64a:	8082                	ret

000000000000064c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 64c:	48d1                	li	a7,20
 ecall
 64e:	00000073          	ecall
 ret
 652:	8082                	ret

0000000000000654 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 654:	48a5                	li	a7,9
 ecall
 656:	00000073          	ecall
 ret
 65a:	8082                	ret

000000000000065c <dup>:
.global dup
dup:
 li a7, SYS_dup
 65c:	48a9                	li	a7,10
 ecall
 65e:	00000073          	ecall
 ret
 662:	8082                	ret

0000000000000664 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 664:	48ad                	li	a7,11
 ecall
 666:	00000073          	ecall
 ret
 66a:	8082                	ret

000000000000066c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 66c:	48b1                	li	a7,12
 ecall
 66e:	00000073          	ecall
 ret
 672:	8082                	ret

0000000000000674 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 674:	48b5                	li	a7,13
 ecall
 676:	00000073          	ecall
 ret
 67a:	8082                	ret

000000000000067c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 67c:	48b9                	li	a7,14
 ecall
 67e:	00000073          	ecall
 ret
 682:	8082                	ret

0000000000000684 <ps>:
.global ps
ps:
 li a7, SYS_ps
 684:	48d9                	li	a7,22
 ecall
 686:	00000073          	ecall
 ret
 68a:	8082                	ret

000000000000068c <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 68c:	1101                	addi	sp,sp,-32
 68e:	ec06                	sd	ra,24(sp)
 690:	e822                	sd	s0,16(sp)
 692:	1000                	addi	s0,sp,32
 694:	87aa                	mv	a5,a0
 696:	872e                	mv	a4,a1
 698:	fef42623          	sw	a5,-20(s0)
 69c:	87ba                	mv	a5,a4
 69e:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 6a2:	feb40713          	addi	a4,s0,-21
 6a6:	fec42783          	lw	a5,-20(s0)
 6aa:	4605                	li	a2,1
 6ac:	85ba                	mv	a1,a4
 6ae:	853e                	mv	a0,a5
 6b0:	00000097          	auipc	ra,0x0
 6b4:	f54080e7          	jalr	-172(ra) # 604 <write>
}
 6b8:	0001                	nop
 6ba:	60e2                	ld	ra,24(sp)
 6bc:	6442                	ld	s0,16(sp)
 6be:	6105                	addi	sp,sp,32
 6c0:	8082                	ret

00000000000006c2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6c2:	7139                	addi	sp,sp,-64
 6c4:	fc06                	sd	ra,56(sp)
 6c6:	f822                	sd	s0,48(sp)
 6c8:	0080                	addi	s0,sp,64
 6ca:	87aa                	mv	a5,a0
 6cc:	8736                	mv	a4,a3
 6ce:	fcf42623          	sw	a5,-52(s0)
 6d2:	87ae                	mv	a5,a1
 6d4:	fcf42423          	sw	a5,-56(s0)
 6d8:	87b2                	mv	a5,a2
 6da:	fcf42223          	sw	a5,-60(s0)
 6de:	87ba                	mv	a5,a4
 6e0:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6e4:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 6e8:	fc042783          	lw	a5,-64(s0)
 6ec:	2781                	sext.w	a5,a5
 6ee:	c38d                	beqz	a5,710 <printint+0x4e>
 6f0:	fc842783          	lw	a5,-56(s0)
 6f4:	2781                	sext.w	a5,a5
 6f6:	0007dd63          	bgez	a5,710 <printint+0x4e>
    neg = 1;
 6fa:	4785                	li	a5,1
 6fc:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 700:	fc842783          	lw	a5,-56(s0)
 704:	40f007bb          	negw	a5,a5
 708:	2781                	sext.w	a5,a5
 70a:	fef42223          	sw	a5,-28(s0)
 70e:	a029                	j	718 <printint+0x56>
  } else {
    x = xx;
 710:	fc842783          	lw	a5,-56(s0)
 714:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 718:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 71c:	fc442783          	lw	a5,-60(s0)
 720:	fe442703          	lw	a4,-28(s0)
 724:	02f777bb          	remuw	a5,a4,a5
 728:	0007871b          	sext.w	a4,a5
 72c:	fec42783          	lw	a5,-20(s0)
 730:	0017869b          	addiw	a3,a5,1
 734:	fed42623          	sw	a3,-20(s0)
 738:	00001697          	auipc	a3,0x1
 73c:	c5868693          	addi	a3,a3,-936 # 1390 <digits>
 740:	1702                	slli	a4,a4,0x20
 742:	9301                	srli	a4,a4,0x20
 744:	9736                	add	a4,a4,a3
 746:	00074703          	lbu	a4,0(a4)
 74a:	17c1                	addi	a5,a5,-16
 74c:	97a2                	add	a5,a5,s0
 74e:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 752:	fc442783          	lw	a5,-60(s0)
 756:	fe442703          	lw	a4,-28(s0)
 75a:	02f757bb          	divuw	a5,a4,a5
 75e:	fef42223          	sw	a5,-28(s0)
 762:	fe442783          	lw	a5,-28(s0)
 766:	2781                	sext.w	a5,a5
 768:	fbd5                	bnez	a5,71c <printint+0x5a>
  if(neg)
 76a:	fe842783          	lw	a5,-24(s0)
 76e:	2781                	sext.w	a5,a5
 770:	cf85                	beqz	a5,7a8 <printint+0xe6>
    buf[i++] = '-';
 772:	fec42783          	lw	a5,-20(s0)
 776:	0017871b          	addiw	a4,a5,1
 77a:	fee42623          	sw	a4,-20(s0)
 77e:	17c1                	addi	a5,a5,-16
 780:	97a2                	add	a5,a5,s0
 782:	02d00713          	li	a4,45
 786:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 78a:	a839                	j	7a8 <printint+0xe6>
    putc(fd, buf[i]);
 78c:	fec42783          	lw	a5,-20(s0)
 790:	17c1                	addi	a5,a5,-16
 792:	97a2                	add	a5,a5,s0
 794:	fe07c703          	lbu	a4,-32(a5)
 798:	fcc42783          	lw	a5,-52(s0)
 79c:	85ba                	mv	a1,a4
 79e:	853e                	mv	a0,a5
 7a0:	00000097          	auipc	ra,0x0
 7a4:	eec080e7          	jalr	-276(ra) # 68c <putc>
  while(--i >= 0)
 7a8:	fec42783          	lw	a5,-20(s0)
 7ac:	37fd                	addiw	a5,a5,-1
 7ae:	fef42623          	sw	a5,-20(s0)
 7b2:	fec42783          	lw	a5,-20(s0)
 7b6:	2781                	sext.w	a5,a5
 7b8:	fc07dae3          	bgez	a5,78c <printint+0xca>
}
 7bc:	0001                	nop
 7be:	0001                	nop
 7c0:	70e2                	ld	ra,56(sp)
 7c2:	7442                	ld	s0,48(sp)
 7c4:	6121                	addi	sp,sp,64
 7c6:	8082                	ret

00000000000007c8 <printptr>:

static void
printptr(int fd, uint64 x) {
 7c8:	7179                	addi	sp,sp,-48
 7ca:	f406                	sd	ra,40(sp)
 7cc:	f022                	sd	s0,32(sp)
 7ce:	1800                	addi	s0,sp,48
 7d0:	87aa                	mv	a5,a0
 7d2:	fcb43823          	sd	a1,-48(s0)
 7d6:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 7da:	fdc42783          	lw	a5,-36(s0)
 7de:	03000593          	li	a1,48
 7e2:	853e                	mv	a0,a5
 7e4:	00000097          	auipc	ra,0x0
 7e8:	ea8080e7          	jalr	-344(ra) # 68c <putc>
  putc(fd, 'x');
 7ec:	fdc42783          	lw	a5,-36(s0)
 7f0:	07800593          	li	a1,120
 7f4:	853e                	mv	a0,a5
 7f6:	00000097          	auipc	ra,0x0
 7fa:	e96080e7          	jalr	-362(ra) # 68c <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7fe:	fe042623          	sw	zero,-20(s0)
 802:	a82d                	j	83c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 804:	fd043783          	ld	a5,-48(s0)
 808:	93f1                	srli	a5,a5,0x3c
 80a:	00001717          	auipc	a4,0x1
 80e:	b8670713          	addi	a4,a4,-1146 # 1390 <digits>
 812:	97ba                	add	a5,a5,a4
 814:	0007c703          	lbu	a4,0(a5)
 818:	fdc42783          	lw	a5,-36(s0)
 81c:	85ba                	mv	a1,a4
 81e:	853e                	mv	a0,a5
 820:	00000097          	auipc	ra,0x0
 824:	e6c080e7          	jalr	-404(ra) # 68c <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 828:	fec42783          	lw	a5,-20(s0)
 82c:	2785                	addiw	a5,a5,1
 82e:	fef42623          	sw	a5,-20(s0)
 832:	fd043783          	ld	a5,-48(s0)
 836:	0792                	slli	a5,a5,0x4
 838:	fcf43823          	sd	a5,-48(s0)
 83c:	fec42703          	lw	a4,-20(s0)
 840:	47bd                	li	a5,15
 842:	fce7f1e3          	bgeu	a5,a4,804 <printptr+0x3c>
}
 846:	0001                	nop
 848:	0001                	nop
 84a:	70a2                	ld	ra,40(sp)
 84c:	7402                	ld	s0,32(sp)
 84e:	6145                	addi	sp,sp,48
 850:	8082                	ret

0000000000000852 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 852:	715d                	addi	sp,sp,-80
 854:	e486                	sd	ra,72(sp)
 856:	e0a2                	sd	s0,64(sp)
 858:	0880                	addi	s0,sp,80
 85a:	87aa                	mv	a5,a0
 85c:	fcb43023          	sd	a1,-64(s0)
 860:	fac43c23          	sd	a2,-72(s0)
 864:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 868:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 86c:	fe042223          	sw	zero,-28(s0)
 870:	a42d                	j	a9a <vprintf+0x248>
    c = fmt[i] & 0xff;
 872:	fe442783          	lw	a5,-28(s0)
 876:	fc043703          	ld	a4,-64(s0)
 87a:	97ba                	add	a5,a5,a4
 87c:	0007c783          	lbu	a5,0(a5)
 880:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 884:	fe042783          	lw	a5,-32(s0)
 888:	2781                	sext.w	a5,a5
 88a:	eb9d                	bnez	a5,8c0 <vprintf+0x6e>
      if(c == '%'){
 88c:	fdc42783          	lw	a5,-36(s0)
 890:	0007871b          	sext.w	a4,a5
 894:	02500793          	li	a5,37
 898:	00f71763          	bne	a4,a5,8a6 <vprintf+0x54>
        state = '%';
 89c:	02500793          	li	a5,37
 8a0:	fef42023          	sw	a5,-32(s0)
 8a4:	a2f5                	j	a90 <vprintf+0x23e>
      } else {
        putc(fd, c);
 8a6:	fdc42783          	lw	a5,-36(s0)
 8aa:	0ff7f713          	zext.b	a4,a5
 8ae:	fcc42783          	lw	a5,-52(s0)
 8b2:	85ba                	mv	a1,a4
 8b4:	853e                	mv	a0,a5
 8b6:	00000097          	auipc	ra,0x0
 8ba:	dd6080e7          	jalr	-554(ra) # 68c <putc>
 8be:	aac9                	j	a90 <vprintf+0x23e>
      }
    } else if(state == '%'){
 8c0:	fe042783          	lw	a5,-32(s0)
 8c4:	0007871b          	sext.w	a4,a5
 8c8:	02500793          	li	a5,37
 8cc:	1cf71263          	bne	a4,a5,a90 <vprintf+0x23e>
      if(c == 'd'){
 8d0:	fdc42783          	lw	a5,-36(s0)
 8d4:	0007871b          	sext.w	a4,a5
 8d8:	06400793          	li	a5,100
 8dc:	02f71463          	bne	a4,a5,904 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 8e0:	fb843783          	ld	a5,-72(s0)
 8e4:	00878713          	addi	a4,a5,8
 8e8:	fae43c23          	sd	a4,-72(s0)
 8ec:	4398                	lw	a4,0(a5)
 8ee:	fcc42783          	lw	a5,-52(s0)
 8f2:	4685                	li	a3,1
 8f4:	4629                	li	a2,10
 8f6:	85ba                	mv	a1,a4
 8f8:	853e                	mv	a0,a5
 8fa:	00000097          	auipc	ra,0x0
 8fe:	dc8080e7          	jalr	-568(ra) # 6c2 <printint>
 902:	a269                	j	a8c <vprintf+0x23a>
      } else if(c == 'l') {
 904:	fdc42783          	lw	a5,-36(s0)
 908:	0007871b          	sext.w	a4,a5
 90c:	06c00793          	li	a5,108
 910:	02f71663          	bne	a4,a5,93c <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 914:	fb843783          	ld	a5,-72(s0)
 918:	00878713          	addi	a4,a5,8
 91c:	fae43c23          	sd	a4,-72(s0)
 920:	639c                	ld	a5,0(a5)
 922:	0007871b          	sext.w	a4,a5
 926:	fcc42783          	lw	a5,-52(s0)
 92a:	4681                	li	a3,0
 92c:	4629                	li	a2,10
 92e:	85ba                	mv	a1,a4
 930:	853e                	mv	a0,a5
 932:	00000097          	auipc	ra,0x0
 936:	d90080e7          	jalr	-624(ra) # 6c2 <printint>
 93a:	aa89                	j	a8c <vprintf+0x23a>
      } else if(c == 'x') {
 93c:	fdc42783          	lw	a5,-36(s0)
 940:	0007871b          	sext.w	a4,a5
 944:	07800793          	li	a5,120
 948:	02f71463          	bne	a4,a5,970 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 94c:	fb843783          	ld	a5,-72(s0)
 950:	00878713          	addi	a4,a5,8
 954:	fae43c23          	sd	a4,-72(s0)
 958:	4398                	lw	a4,0(a5)
 95a:	fcc42783          	lw	a5,-52(s0)
 95e:	4681                	li	a3,0
 960:	4641                	li	a2,16
 962:	85ba                	mv	a1,a4
 964:	853e                	mv	a0,a5
 966:	00000097          	auipc	ra,0x0
 96a:	d5c080e7          	jalr	-676(ra) # 6c2 <printint>
 96e:	aa39                	j	a8c <vprintf+0x23a>
      } else if(c == 'p') {
 970:	fdc42783          	lw	a5,-36(s0)
 974:	0007871b          	sext.w	a4,a5
 978:	07000793          	li	a5,112
 97c:	02f71263          	bne	a4,a5,9a0 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 980:	fb843783          	ld	a5,-72(s0)
 984:	00878713          	addi	a4,a5,8
 988:	fae43c23          	sd	a4,-72(s0)
 98c:	6398                	ld	a4,0(a5)
 98e:	fcc42783          	lw	a5,-52(s0)
 992:	85ba                	mv	a1,a4
 994:	853e                	mv	a0,a5
 996:	00000097          	auipc	ra,0x0
 99a:	e32080e7          	jalr	-462(ra) # 7c8 <printptr>
 99e:	a0fd                	j	a8c <vprintf+0x23a>
      } else if(c == 's'){
 9a0:	fdc42783          	lw	a5,-36(s0)
 9a4:	0007871b          	sext.w	a4,a5
 9a8:	07300793          	li	a5,115
 9ac:	04f71c63          	bne	a4,a5,a04 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 9b0:	fb843783          	ld	a5,-72(s0)
 9b4:	00878713          	addi	a4,a5,8
 9b8:	fae43c23          	sd	a4,-72(s0)
 9bc:	639c                	ld	a5,0(a5)
 9be:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 9c2:	fe843783          	ld	a5,-24(s0)
 9c6:	eb8d                	bnez	a5,9f8 <vprintf+0x1a6>
          s = "(null)";
 9c8:	00000797          	auipc	a5,0x0
 9cc:	49078793          	addi	a5,a5,1168 # e58 <malloc+0x154>
 9d0:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 9d4:	a015                	j	9f8 <vprintf+0x1a6>
          putc(fd, *s);
 9d6:	fe843783          	ld	a5,-24(s0)
 9da:	0007c703          	lbu	a4,0(a5)
 9de:	fcc42783          	lw	a5,-52(s0)
 9e2:	85ba                	mv	a1,a4
 9e4:	853e                	mv	a0,a5
 9e6:	00000097          	auipc	ra,0x0
 9ea:	ca6080e7          	jalr	-858(ra) # 68c <putc>
          s++;
 9ee:	fe843783          	ld	a5,-24(s0)
 9f2:	0785                	addi	a5,a5,1
 9f4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 9f8:	fe843783          	ld	a5,-24(s0)
 9fc:	0007c783          	lbu	a5,0(a5)
 a00:	fbf9                	bnez	a5,9d6 <vprintf+0x184>
 a02:	a069                	j	a8c <vprintf+0x23a>
        }
      } else if(c == 'c'){
 a04:	fdc42783          	lw	a5,-36(s0)
 a08:	0007871b          	sext.w	a4,a5
 a0c:	06300793          	li	a5,99
 a10:	02f71463          	bne	a4,a5,a38 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 a14:	fb843783          	ld	a5,-72(s0)
 a18:	00878713          	addi	a4,a5,8
 a1c:	fae43c23          	sd	a4,-72(s0)
 a20:	439c                	lw	a5,0(a5)
 a22:	0ff7f713          	zext.b	a4,a5
 a26:	fcc42783          	lw	a5,-52(s0)
 a2a:	85ba                	mv	a1,a4
 a2c:	853e                	mv	a0,a5
 a2e:	00000097          	auipc	ra,0x0
 a32:	c5e080e7          	jalr	-930(ra) # 68c <putc>
 a36:	a899                	j	a8c <vprintf+0x23a>
      } else if(c == '%'){
 a38:	fdc42783          	lw	a5,-36(s0)
 a3c:	0007871b          	sext.w	a4,a5
 a40:	02500793          	li	a5,37
 a44:	00f71f63          	bne	a4,a5,a62 <vprintf+0x210>
        putc(fd, c);
 a48:	fdc42783          	lw	a5,-36(s0)
 a4c:	0ff7f713          	zext.b	a4,a5
 a50:	fcc42783          	lw	a5,-52(s0)
 a54:	85ba                	mv	a1,a4
 a56:	853e                	mv	a0,a5
 a58:	00000097          	auipc	ra,0x0
 a5c:	c34080e7          	jalr	-972(ra) # 68c <putc>
 a60:	a035                	j	a8c <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a62:	fcc42783          	lw	a5,-52(s0)
 a66:	02500593          	li	a1,37
 a6a:	853e                	mv	a0,a5
 a6c:	00000097          	auipc	ra,0x0
 a70:	c20080e7          	jalr	-992(ra) # 68c <putc>
        putc(fd, c);
 a74:	fdc42783          	lw	a5,-36(s0)
 a78:	0ff7f713          	zext.b	a4,a5
 a7c:	fcc42783          	lw	a5,-52(s0)
 a80:	85ba                	mv	a1,a4
 a82:	853e                	mv	a0,a5
 a84:	00000097          	auipc	ra,0x0
 a88:	c08080e7          	jalr	-1016(ra) # 68c <putc>
      }
      state = 0;
 a8c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 a90:	fe442783          	lw	a5,-28(s0)
 a94:	2785                	addiw	a5,a5,1
 a96:	fef42223          	sw	a5,-28(s0)
 a9a:	fe442783          	lw	a5,-28(s0)
 a9e:	fc043703          	ld	a4,-64(s0)
 aa2:	97ba                	add	a5,a5,a4
 aa4:	0007c783          	lbu	a5,0(a5)
 aa8:	dc0795e3          	bnez	a5,872 <vprintf+0x20>
    }
  }
}
 aac:	0001                	nop
 aae:	0001                	nop
 ab0:	60a6                	ld	ra,72(sp)
 ab2:	6406                	ld	s0,64(sp)
 ab4:	6161                	addi	sp,sp,80
 ab6:	8082                	ret

0000000000000ab8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 ab8:	7159                	addi	sp,sp,-112
 aba:	fc06                	sd	ra,56(sp)
 abc:	f822                	sd	s0,48(sp)
 abe:	0080                	addi	s0,sp,64
 ac0:	fcb43823          	sd	a1,-48(s0)
 ac4:	e010                	sd	a2,0(s0)
 ac6:	e414                	sd	a3,8(s0)
 ac8:	e818                	sd	a4,16(s0)
 aca:	ec1c                	sd	a5,24(s0)
 acc:	03043023          	sd	a6,32(s0)
 ad0:	03143423          	sd	a7,40(s0)
 ad4:	87aa                	mv	a5,a0
 ad6:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 ada:	03040793          	addi	a5,s0,48
 ade:	fcf43423          	sd	a5,-56(s0)
 ae2:	fc843783          	ld	a5,-56(s0)
 ae6:	fd078793          	addi	a5,a5,-48
 aea:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 aee:	fe843703          	ld	a4,-24(s0)
 af2:	fdc42783          	lw	a5,-36(s0)
 af6:	863a                	mv	a2,a4
 af8:	fd043583          	ld	a1,-48(s0)
 afc:	853e                	mv	a0,a5
 afe:	00000097          	auipc	ra,0x0
 b02:	d54080e7          	jalr	-684(ra) # 852 <vprintf>
}
 b06:	0001                	nop
 b08:	70e2                	ld	ra,56(sp)
 b0a:	7442                	ld	s0,48(sp)
 b0c:	6165                	addi	sp,sp,112
 b0e:	8082                	ret

0000000000000b10 <printf>:

void
printf(const char *fmt, ...)
{
 b10:	7159                	addi	sp,sp,-112
 b12:	f406                	sd	ra,40(sp)
 b14:	f022                	sd	s0,32(sp)
 b16:	1800                	addi	s0,sp,48
 b18:	fca43c23          	sd	a0,-40(s0)
 b1c:	e40c                	sd	a1,8(s0)
 b1e:	e810                	sd	a2,16(s0)
 b20:	ec14                	sd	a3,24(s0)
 b22:	f018                	sd	a4,32(s0)
 b24:	f41c                	sd	a5,40(s0)
 b26:	03043823          	sd	a6,48(s0)
 b2a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 b2e:	04040793          	addi	a5,s0,64
 b32:	fcf43823          	sd	a5,-48(s0)
 b36:	fd043783          	ld	a5,-48(s0)
 b3a:	fc878793          	addi	a5,a5,-56
 b3e:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 b42:	fe843783          	ld	a5,-24(s0)
 b46:	863e                	mv	a2,a5
 b48:	fd843583          	ld	a1,-40(s0)
 b4c:	4505                	li	a0,1
 b4e:	00000097          	auipc	ra,0x0
 b52:	d04080e7          	jalr	-764(ra) # 852 <vprintf>
}
 b56:	0001                	nop
 b58:	70a2                	ld	ra,40(sp)
 b5a:	7402                	ld	s0,32(sp)
 b5c:	6165                	addi	sp,sp,112
 b5e:	8082                	ret

0000000000000b60 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b60:	7179                	addi	sp,sp,-48
 b62:	f406                	sd	ra,40(sp)
 b64:	f022                	sd	s0,32(sp)
 b66:	1800                	addi	s0,sp,48
 b68:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b6c:	fd843783          	ld	a5,-40(s0)
 b70:	17c1                	addi	a5,a5,-16
 b72:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b76:	00001797          	auipc	a5,0x1
 b7a:	84a78793          	addi	a5,a5,-1974 # 13c0 <freep>
 b7e:	639c                	ld	a5,0(a5)
 b80:	fef43423          	sd	a5,-24(s0)
 b84:	a815                	j	bb8 <free+0x58>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b86:	fe843783          	ld	a5,-24(s0)
 b8a:	639c                	ld	a5,0(a5)
 b8c:	fe843703          	ld	a4,-24(s0)
 b90:	00f76f63          	bltu	a4,a5,bae <free+0x4e>
 b94:	fe043703          	ld	a4,-32(s0)
 b98:	fe843783          	ld	a5,-24(s0)
 b9c:	02e7eb63          	bltu	a5,a4,bd2 <free+0x72>
 ba0:	fe843783          	ld	a5,-24(s0)
 ba4:	639c                	ld	a5,0(a5)
 ba6:	fe043703          	ld	a4,-32(s0)
 baa:	02f76463          	bltu	a4,a5,bd2 <free+0x72>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bae:	fe843783          	ld	a5,-24(s0)
 bb2:	639c                	ld	a5,0(a5)
 bb4:	fef43423          	sd	a5,-24(s0)
 bb8:	fe043703          	ld	a4,-32(s0)
 bbc:	fe843783          	ld	a5,-24(s0)
 bc0:	fce7f3e3          	bgeu	a5,a4,b86 <free+0x26>
 bc4:	fe843783          	ld	a5,-24(s0)
 bc8:	639c                	ld	a5,0(a5)
 bca:	fe043703          	ld	a4,-32(s0)
 bce:	faf77ce3          	bgeu	a4,a5,b86 <free+0x26>
      break;
  if(bp + bp->s.size == p->s.ptr){
 bd2:	fe043783          	ld	a5,-32(s0)
 bd6:	479c                	lw	a5,8(a5)
 bd8:	1782                	slli	a5,a5,0x20
 bda:	9381                	srli	a5,a5,0x20
 bdc:	0792                	slli	a5,a5,0x4
 bde:	fe043703          	ld	a4,-32(s0)
 be2:	973e                	add	a4,a4,a5
 be4:	fe843783          	ld	a5,-24(s0)
 be8:	639c                	ld	a5,0(a5)
 bea:	02f71763          	bne	a4,a5,c18 <free+0xb8>
    bp->s.size += p->s.ptr->s.size;
 bee:	fe043783          	ld	a5,-32(s0)
 bf2:	4798                	lw	a4,8(a5)
 bf4:	fe843783          	ld	a5,-24(s0)
 bf8:	639c                	ld	a5,0(a5)
 bfa:	479c                	lw	a5,8(a5)
 bfc:	9fb9                	addw	a5,a5,a4
 bfe:	0007871b          	sext.w	a4,a5
 c02:	fe043783          	ld	a5,-32(s0)
 c06:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 c08:	fe843783          	ld	a5,-24(s0)
 c0c:	639c                	ld	a5,0(a5)
 c0e:	6398                	ld	a4,0(a5)
 c10:	fe043783          	ld	a5,-32(s0)
 c14:	e398                	sd	a4,0(a5)
 c16:	a039                	j	c24 <free+0xc4>
  } else
    bp->s.ptr = p->s.ptr;
 c18:	fe843783          	ld	a5,-24(s0)
 c1c:	6398                	ld	a4,0(a5)
 c1e:	fe043783          	ld	a5,-32(s0)
 c22:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 c24:	fe843783          	ld	a5,-24(s0)
 c28:	479c                	lw	a5,8(a5)
 c2a:	1782                	slli	a5,a5,0x20
 c2c:	9381                	srli	a5,a5,0x20
 c2e:	0792                	slli	a5,a5,0x4
 c30:	fe843703          	ld	a4,-24(s0)
 c34:	97ba                	add	a5,a5,a4
 c36:	fe043703          	ld	a4,-32(s0)
 c3a:	02f71563          	bne	a4,a5,c64 <free+0x104>
    p->s.size += bp->s.size;
 c3e:	fe843783          	ld	a5,-24(s0)
 c42:	4798                	lw	a4,8(a5)
 c44:	fe043783          	ld	a5,-32(s0)
 c48:	479c                	lw	a5,8(a5)
 c4a:	9fb9                	addw	a5,a5,a4
 c4c:	0007871b          	sext.w	a4,a5
 c50:	fe843783          	ld	a5,-24(s0)
 c54:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 c56:	fe043783          	ld	a5,-32(s0)
 c5a:	6398                	ld	a4,0(a5)
 c5c:	fe843783          	ld	a5,-24(s0)
 c60:	e398                	sd	a4,0(a5)
 c62:	a031                	j	c6e <free+0x10e>
  } else
    p->s.ptr = bp;
 c64:	fe843783          	ld	a5,-24(s0)
 c68:	fe043703          	ld	a4,-32(s0)
 c6c:	e398                	sd	a4,0(a5)
  freep = p;
 c6e:	00000797          	auipc	a5,0x0
 c72:	75278793          	addi	a5,a5,1874 # 13c0 <freep>
 c76:	fe843703          	ld	a4,-24(s0)
 c7a:	e398                	sd	a4,0(a5)
}
 c7c:	0001                	nop
 c7e:	70a2                	ld	ra,40(sp)
 c80:	7402                	ld	s0,32(sp)
 c82:	6145                	addi	sp,sp,48
 c84:	8082                	ret

0000000000000c86 <morecore>:

static Header*
morecore(uint nu)
{
 c86:	7179                	addi	sp,sp,-48
 c88:	f406                	sd	ra,40(sp)
 c8a:	f022                	sd	s0,32(sp)
 c8c:	1800                	addi	s0,sp,48
 c8e:	87aa                	mv	a5,a0
 c90:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 c94:	fdc42783          	lw	a5,-36(s0)
 c98:	0007871b          	sext.w	a4,a5
 c9c:	6785                	lui	a5,0x1
 c9e:	00f77563          	bgeu	a4,a5,ca8 <morecore+0x22>
    nu = 4096;
 ca2:	6785                	lui	a5,0x1
 ca4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 ca8:	fdc42783          	lw	a5,-36(s0)
 cac:	0047979b          	slliw	a5,a5,0x4
 cb0:	2781                	sext.w	a5,a5
 cb2:	853e                	mv	a0,a5
 cb4:	00000097          	auipc	ra,0x0
 cb8:	9b8080e7          	jalr	-1608(ra) # 66c <sbrk>
 cbc:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 cc0:	fe843703          	ld	a4,-24(s0)
 cc4:	57fd                	li	a5,-1
 cc6:	00f71463          	bne	a4,a5,cce <morecore+0x48>
    return 0;
 cca:	4781                	li	a5,0
 ccc:	a03d                	j	cfa <morecore+0x74>
  hp = (Header*)p;
 cce:	fe843783          	ld	a5,-24(s0)
 cd2:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 cd6:	fe043783          	ld	a5,-32(s0)
 cda:	fdc42703          	lw	a4,-36(s0)
 cde:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 ce0:	fe043783          	ld	a5,-32(s0)
 ce4:	07c1                	addi	a5,a5,16 # 1010 <malloc+0x30c>
 ce6:	853e                	mv	a0,a5
 ce8:	00000097          	auipc	ra,0x0
 cec:	e78080e7          	jalr	-392(ra) # b60 <free>
  return freep;
 cf0:	00000797          	auipc	a5,0x0
 cf4:	6d078793          	addi	a5,a5,1744 # 13c0 <freep>
 cf8:	639c                	ld	a5,0(a5)
}
 cfa:	853e                	mv	a0,a5
 cfc:	70a2                	ld	ra,40(sp)
 cfe:	7402                	ld	s0,32(sp)
 d00:	6145                	addi	sp,sp,48
 d02:	8082                	ret

0000000000000d04 <malloc>:

void*
malloc(uint nbytes)
{
 d04:	7139                	addi	sp,sp,-64
 d06:	fc06                	sd	ra,56(sp)
 d08:	f822                	sd	s0,48(sp)
 d0a:	0080                	addi	s0,sp,64
 d0c:	87aa                	mv	a5,a0
 d0e:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d12:	fcc46783          	lwu	a5,-52(s0)
 d16:	07bd                	addi	a5,a5,15
 d18:	8391                	srli	a5,a5,0x4
 d1a:	2781                	sext.w	a5,a5
 d1c:	2785                	addiw	a5,a5,1
 d1e:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 d22:	00000797          	auipc	a5,0x0
 d26:	69e78793          	addi	a5,a5,1694 # 13c0 <freep>
 d2a:	639c                	ld	a5,0(a5)
 d2c:	fef43023          	sd	a5,-32(s0)
 d30:	fe043783          	ld	a5,-32(s0)
 d34:	ef95                	bnez	a5,d70 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 d36:	00000797          	auipc	a5,0x0
 d3a:	67a78793          	addi	a5,a5,1658 # 13b0 <base>
 d3e:	fef43023          	sd	a5,-32(s0)
 d42:	00000797          	auipc	a5,0x0
 d46:	67e78793          	addi	a5,a5,1662 # 13c0 <freep>
 d4a:	fe043703          	ld	a4,-32(s0)
 d4e:	e398                	sd	a4,0(a5)
 d50:	00000797          	auipc	a5,0x0
 d54:	67078793          	addi	a5,a5,1648 # 13c0 <freep>
 d58:	6398                	ld	a4,0(a5)
 d5a:	00000797          	auipc	a5,0x0
 d5e:	65678793          	addi	a5,a5,1622 # 13b0 <base>
 d62:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 d64:	00000797          	auipc	a5,0x0
 d68:	64c78793          	addi	a5,a5,1612 # 13b0 <base>
 d6c:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d70:	fe043783          	ld	a5,-32(s0)
 d74:	639c                	ld	a5,0(a5)
 d76:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d7a:	fe843783          	ld	a5,-24(s0)
 d7e:	479c                	lw	a5,8(a5)
 d80:	fdc42703          	lw	a4,-36(s0)
 d84:	2701                	sext.w	a4,a4
 d86:	06e7e763          	bltu	a5,a4,df4 <malloc+0xf0>
      if(p->s.size == nunits)
 d8a:	fe843783          	ld	a5,-24(s0)
 d8e:	479c                	lw	a5,8(a5)
 d90:	fdc42703          	lw	a4,-36(s0)
 d94:	2701                	sext.w	a4,a4
 d96:	00f71963          	bne	a4,a5,da8 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 d9a:	fe843783          	ld	a5,-24(s0)
 d9e:	6398                	ld	a4,0(a5)
 da0:	fe043783          	ld	a5,-32(s0)
 da4:	e398                	sd	a4,0(a5)
 da6:	a825                	j	dde <malloc+0xda>
      else {
        p->s.size -= nunits;
 da8:	fe843783          	ld	a5,-24(s0)
 dac:	479c                	lw	a5,8(a5)
 dae:	fdc42703          	lw	a4,-36(s0)
 db2:	9f99                	subw	a5,a5,a4
 db4:	0007871b          	sext.w	a4,a5
 db8:	fe843783          	ld	a5,-24(s0)
 dbc:	c798                	sw	a4,8(a5)
        p += p->s.size;
 dbe:	fe843783          	ld	a5,-24(s0)
 dc2:	479c                	lw	a5,8(a5)
 dc4:	1782                	slli	a5,a5,0x20
 dc6:	9381                	srli	a5,a5,0x20
 dc8:	0792                	slli	a5,a5,0x4
 dca:	fe843703          	ld	a4,-24(s0)
 dce:	97ba                	add	a5,a5,a4
 dd0:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 dd4:	fe843783          	ld	a5,-24(s0)
 dd8:	fdc42703          	lw	a4,-36(s0)
 ddc:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 dde:	00000797          	auipc	a5,0x0
 de2:	5e278793          	addi	a5,a5,1506 # 13c0 <freep>
 de6:	fe043703          	ld	a4,-32(s0)
 dea:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 dec:	fe843783          	ld	a5,-24(s0)
 df0:	07c1                	addi	a5,a5,16
 df2:	a091                	j	e36 <malloc+0x132>
    }
    if(p == freep)
 df4:	00000797          	auipc	a5,0x0
 df8:	5cc78793          	addi	a5,a5,1484 # 13c0 <freep>
 dfc:	639c                	ld	a5,0(a5)
 dfe:	fe843703          	ld	a4,-24(s0)
 e02:	02f71063          	bne	a4,a5,e22 <malloc+0x11e>
      if((p = morecore(nunits)) == 0)
 e06:	fdc42783          	lw	a5,-36(s0)
 e0a:	853e                	mv	a0,a5
 e0c:	00000097          	auipc	ra,0x0
 e10:	e7a080e7          	jalr	-390(ra) # c86 <morecore>
 e14:	fea43423          	sd	a0,-24(s0)
 e18:	fe843783          	ld	a5,-24(s0)
 e1c:	e399                	bnez	a5,e22 <malloc+0x11e>
        return 0;
 e1e:	4781                	li	a5,0
 e20:	a819                	j	e36 <malloc+0x132>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e22:	fe843783          	ld	a5,-24(s0)
 e26:	fef43023          	sd	a5,-32(s0)
 e2a:	fe843783          	ld	a5,-24(s0)
 e2e:	639c                	ld	a5,0(a5)
 e30:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 e34:	b799                	j	d7a <malloc+0x76>
  }
}
 e36:	853e                	mv	a0,a5
 e38:	70e2                	ld	ra,56(sp)
 e3a:	7442                	ld	s0,48(sp)
 e3c:	6121                	addi	sp,sp,64
 e3e:	8082                	ret
