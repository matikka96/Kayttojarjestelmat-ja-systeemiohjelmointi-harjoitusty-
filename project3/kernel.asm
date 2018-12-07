
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp
8010002d:	b8 60 2e 10 80       	mov    $0x80102e60,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 80 6f 10 80       	push   $0x80106f80
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 65 41 00 00       	call   801041c0 <initlock>
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
80100092:	68 87 6f 10 80       	push   $0x80106f87
80100097:	50                   	push   %eax
80100098:	e8 f3 3f 00 00       	call   80104090 <initsleeplock>
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 37 42 00 00       	call   80104320 <acquire>
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 69 42 00 00       	call   801043d0 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 5e 3f 00 00       	call   801040d0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 6d 1f 00 00       	call   801020f0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 8e 6f 10 80       	push   $0x80106f8e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 bd 3f 00 00       	call   80104170 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 27 1f 00 00       	jmp    801020f0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 9f 6f 10 80       	push   $0x80106f9f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 7c 3f 00 00       	call   80104170 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 2c 3f 00 00       	call   80104130 <releasesleep>
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 10 41 00 00       	call   80104320 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 6f 41 00 00       	jmp    801043d0 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 a6 6f 10 80       	push   $0x80106fa6
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 cb 14 00 00       	call   80101750 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 8f 40 00 00       	call   80104320 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002a6:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 a0 ff 10 80       	push   $0x8010ffa0
801002bd:	e8 6e 3a 00 00       	call   80103d30 <sleep>
801002c2:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	e8 a9 34 00 00       	call   80103780 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a5 10 80       	push   $0x8010a520
801002e6:	e8 e5 40 00 00       	call   801043d0 <release>
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 7d 13 00 00       	call   80101670 <ilock>
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 20 ff 10 80 	movsbl -0x7fef00e0(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 85 40 00 00       	call   801043d0 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 1d 13 00 00       	call   80101670 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
80100378:	fa                   	cli    
80100379:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100380:	00 00 00 
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100389:	e8 62 23 00 00       	call   801026f0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 ad 6f 10 80       	push   $0x80106fad
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
801003a5:	c7 04 24 ff 78 10 80 	movl   $0x801078ff,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 23 3e 00 00       	call   801041e0 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 c1 6f 10 80       	push   $0x80106fc1
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
801003d9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 11 57 00 00       	call   80105b30 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 58 56 00 00       	call   80105b30 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 4c 56 00 00       	call   80105b30 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 40 56 00 00       	call   80105b30 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100514:	e8 b7 3f 00 00       	call   801044d0 <memmove>
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 f2 3e 00 00       	call   80104420 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 c5 6f 10 80       	push   $0x80106fc5
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 f0 6f 10 80 	movzbl -0x7fef9010(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 3c 11 00 00       	call   80101750 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 00 3d 00 00       	call   80104320 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 84 3d 00 00       	call   801043d0 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 1b 10 00 00       	call   80101670 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 be 3c 00 00       	call   801043d0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 d8 6f 10 80       	mov    $0x80106fd8,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 53 3b 00 00       	call   80104320 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 df 6f 10 80       	push   $0x80106fdf
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
801007f6:	31 f6                	xor    %esi,%esi
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 18 3b 00 00       	call   80104320 <acquire>
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
80100831:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100836:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 63 3b 00 00       	call   801043d0 <release>
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
801008a5:	83 ff 0d             	cmp    $0xd,%edi
801008a8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
801008e9:	83 ec 0c             	sub    $0xc,%esp
801008ec:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
801008f1:	68 a0 ff 10 80       	push   $0x8010ffa0
801008f6:	e8 e5 35 00 00       	call   80103ee0 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100908:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010090d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100920:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
8010092f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100934:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
80100948:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
80100977:	e9 54 36 00 00       	jmp    80103fd0 <procdump>
8010097c:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
801009a6:	68 e8 6f 10 80       	push   $0x80106fe8
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 0b 38 00 00       	call   801041c0 <initlock>
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
801009bb:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009c2:	06 10 80 
801009c5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009cc:	02 10 80 
801009cf:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d6:	00 00 00 
801009d9:	e8 c2 18 00 00       	call   801022a0 <ioapicenable>
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801009fc:	e8 7f 2d 00 00       	call   80103780 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a07:	e8 44 21 00 00       	call   80102b50 <begin_op>
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 a9 14 00 00       	call   80101ec0 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 9c 01 00 00    	je     80100bbe <exec+0x1ce>
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 43 0c 00 00       	call   80101670 <ilock>
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 12 0f 00 00       	call   80101950 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 b1 0e 00 00       	call   80101900 <iunlockput>
80100a4f:	e8 6c 21 00 00       	call   80102bc0 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
80100a74:	e8 47 62 00 00       	call   80106cc0 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 83 0e 00 00       	call   80101950 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 07 60 00 00       	call   80106b10 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 11 5f 00 00       	call   80106a50 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 e2 60 00 00       	call   80106c40 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 91 0d 00 00       	call   80101900 <iunlockput>
80100b6f:	e8 4c 20 00 00       	call   80102bc0 <end_op>
80100b74:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b7a:	83 c4 0c             	add    $0xc,%esp
80100b7d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100b87:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b8d:	52                   	push   %edx
80100b8e:	50                   	push   %eax
80100b8f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b95:	e8 76 5f 00 00       	call   80106b10 <allocuvm>
80100b9a:	83 c4 10             	add    $0x10,%esp
80100b9d:	85 c0                	test   %eax,%eax
80100b9f:	89 c6                	mov    %eax,%esi
80100ba1:	75 3a                	jne    80100bdd <exec+0x1ed>
80100ba3:	83 ec 0c             	sub    $0xc,%esp
80100ba6:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bac:	e8 8f 60 00 00       	call   80106c40 <freevm>
80100bb1:	83 c4 10             	add    $0x10,%esp
80100bb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb9:	e9 9e fe ff ff       	jmp    80100a5c <exec+0x6c>
80100bbe:	e8 fd 1f 00 00       	call   80102bc0 <end_op>
80100bc3:	83 ec 0c             	sub    $0xc,%esp
80100bc6:	68 01 70 10 80       	push   $0x80107001
80100bcb:	e8 90 fa ff ff       	call   80100660 <cprintf>
80100bd0:	83 c4 10             	add    $0x10,%esp
80100bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd8:	e9 7f fe ff ff       	jmp    80100a5c <exec+0x6c>
80100bdd:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100be3:	83 ec 08             	sub    $0x8,%esp
80100be6:	31 ff                	xor    %edi,%edi
80100be8:	89 f3                	mov    %esi,%ebx
80100bea:	50                   	push   %eax
80100beb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf1:	e8 6a 61 00 00       	call   80106d60 <clearpteu>
80100bf6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bf9:	83 c4 10             	add    $0x10,%esp
80100bfc:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c02:	8b 00                	mov    (%eax),%eax
80100c04:	85 c0                	test   %eax,%eax
80100c06:	74 79                	je     80100c81 <exec+0x291>
80100c08:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c0e:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c14:	eb 13                	jmp    80100c29 <exec+0x239>
80100c16:	8d 76 00             	lea    0x0(%esi),%esi
80100c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100c20:	83 ff 20             	cmp    $0x20,%edi
80100c23:	0f 84 7a ff ff ff    	je     80100ba3 <exec+0x1b3>
80100c29:	83 ec 0c             	sub    $0xc,%esp
80100c2c:	50                   	push   %eax
80100c2d:	e8 2e 3a 00 00       	call   80104660 <strlen>
80100c32:	f7 d0                	not    %eax
80100c34:	01 c3                	add    %eax,%ebx
80100c36:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c39:	5a                   	pop    %edx
80100c3a:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c3d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c40:	e8 1b 3a 00 00       	call   80104660 <strlen>
80100c45:	83 c0 01             	add    $0x1,%eax
80100c48:	50                   	push   %eax
80100c49:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4f:	53                   	push   %ebx
80100c50:	56                   	push   %esi
80100c51:	e8 7a 62 00 00       	call   80106ed0 <copyout>
80100c56:	83 c4 20             	add    $0x20,%esp
80100c59:	85 c0                	test   %eax,%eax
80100c5b:	0f 88 42 ff ff ff    	js     80100ba3 <exec+0x1b3>
80100c61:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c64:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c6b:	83 c7 01             	add    $0x1,%edi
80100c6e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c74:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c77:	85 c0                	test   %eax,%eax
80100c79:	75 a5                	jne    80100c20 <exec+0x230>
80100c7b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c81:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c88:	89 d9                	mov    %ebx,%ecx
80100c8a:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c91:	00 00 00 00 
80100c95:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c9c:	ff ff ff 
80100c9f:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100ca5:	29 c1                	sub    %eax,%ecx
80100ca7:	83 c0 0c             	add    $0xc,%eax
80100caa:	29 c3                	sub    %eax,%ebx
80100cac:	50                   	push   %eax
80100cad:	52                   	push   %edx
80100cae:	53                   	push   %ebx
80100caf:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100cb5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100cbb:	e8 10 62 00 00       	call   80106ed0 <copyout>
80100cc0:	83 c4 10             	add    $0x10,%esp
80100cc3:	85 c0                	test   %eax,%eax
80100cc5:	0f 88 d8 fe ff ff    	js     80100ba3 <exec+0x1b3>
80100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cce:	0f b6 10             	movzbl (%eax),%edx
80100cd1:	84 d2                	test   %dl,%dl
80100cd3:	74 19                	je     80100cee <exec+0x2fe>
80100cd5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cd8:	83 c0 01             	add    $0x1,%eax
80100cdb:	80 fa 2f             	cmp    $0x2f,%dl
80100cde:	0f b6 10             	movzbl (%eax),%edx
80100ce1:	0f 44 c8             	cmove  %eax,%ecx
80100ce4:	83 c0 01             	add    $0x1,%eax
80100ce7:	84 d2                	test   %dl,%dl
80100ce9:	75 f0                	jne    80100cdb <exec+0x2eb>
80100ceb:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100cee:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cf4:	50                   	push   %eax
80100cf5:	6a 10                	push   $0x10
80100cf7:	ff 75 08             	pushl  0x8(%ebp)
80100cfa:	89 f8                	mov    %edi,%eax
80100cfc:	83 c0 6c             	add    $0x6c,%eax
80100cff:	50                   	push   %eax
80100d00:	e8 1b 39 00 00       	call   80104620 <safestrcpy>
80100d05:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100d0b:	89 f8                	mov    %edi,%eax
80100d0d:	8b 7f 04             	mov    0x4(%edi),%edi
80100d10:	89 30                	mov    %esi,(%eax)
80100d12:	89 48 04             	mov    %ecx,0x4(%eax)
80100d15:	89 c1                	mov    %eax,%ecx
80100d17:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d1d:	8b 40 18             	mov    0x18(%eax),%eax
80100d20:	89 50 38             	mov    %edx,0x38(%eax)
80100d23:	8b 41 18             	mov    0x18(%ecx),%eax
80100d26:	89 58 44             	mov    %ebx,0x44(%eax)
80100d29:	89 0c 24             	mov    %ecx,(%esp)
80100d2c:	e8 8f 5b 00 00       	call   801068c0 <switchuvm>
80100d31:	89 3c 24             	mov    %edi,(%esp)
80100d34:	e8 07 5f 00 00       	call   80106c40 <freevm>
80100d39:	83 c4 10             	add    $0x10,%esp
80100d3c:	31 c0                	xor    %eax,%eax
80100d3e:	e9 19 fd ff ff       	jmp    80100a5c <exec+0x6c>
80100d43:	66 90                	xchg   %ax,%ax
80100d45:	66 90                	xchg   %ax,%ax
80100d47:	66 90                	xchg   %ax,%ax
80100d49:	66 90                	xchg   %ax,%ax
80100d4b:	66 90                	xchg   %ax,%ax
80100d4d:	66 90                	xchg   %ax,%ax
80100d4f:	90                   	nop

80100d50 <fileinit>:
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	83 ec 10             	sub    $0x10,%esp
80100d56:	68 0d 70 10 80       	push   $0x8010700d
80100d5b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d60:	e8 5b 34 00 00       	call   801041c0 <initlock>
80100d65:	83 c4 10             	add    $0x10,%esp
80100d68:	c9                   	leave  
80100d69:	c3                   	ret    
80100d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d70 <filealloc>:
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	53                   	push   %ebx
80100d74:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
80100d79:	83 ec 10             	sub    $0x10,%esp
80100d7c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d81:	e8 9a 35 00 00       	call   80104320 <acquire>
80100d86:	83 c4 10             	add    $0x10,%esp
80100d89:	eb 10                	jmp    80100d9b <filealloc+0x2b>
80100d8b:	90                   	nop
80100d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d90:	83 c3 18             	add    $0x18,%ebx
80100d93:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100d99:	74 25                	je     80100dc0 <filealloc+0x50>
80100d9b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d9e:	85 c0                	test   %eax,%eax
80100da0:	75 ee                	jne    80100d90 <filealloc+0x20>
80100da2:	83 ec 0c             	sub    $0xc,%esp
80100da5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dac:	68 c0 ff 10 80       	push   $0x8010ffc0
80100db1:	e8 1a 36 00 00       	call   801043d0 <release>
80100db6:	89 d8                	mov    %ebx,%eax
80100db8:	83 c4 10             	add    $0x10,%esp
80100dbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dbe:	c9                   	leave  
80100dbf:	c3                   	ret    
80100dc0:	83 ec 0c             	sub    $0xc,%esp
80100dc3:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dc8:	e8 03 36 00 00       	call   801043d0 <release>
80100dcd:	83 c4 10             	add    $0x10,%esp
80100dd0:	31 c0                	xor    %eax,%eax
80100dd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dd5:	c9                   	leave  
80100dd6:	c3                   	ret    
80100dd7:	89 f6                	mov    %esi,%esi
80100dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100de0 <filedup>:
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	53                   	push   %ebx
80100de4:	83 ec 10             	sub    $0x10,%esp
80100de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dea:	68 c0 ff 10 80       	push   $0x8010ffc0
80100def:	e8 2c 35 00 00       	call   80104320 <acquire>
80100df4:	8b 43 04             	mov    0x4(%ebx),%eax
80100df7:	83 c4 10             	add    $0x10,%esp
80100dfa:	85 c0                	test   %eax,%eax
80100dfc:	7e 1a                	jle    80100e18 <filedup+0x38>
80100dfe:	83 c0 01             	add    $0x1,%eax
80100e01:	83 ec 0c             	sub    $0xc,%esp
80100e04:	89 43 04             	mov    %eax,0x4(%ebx)
80100e07:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e0c:	e8 bf 35 00 00       	call   801043d0 <release>
80100e11:	89 d8                	mov    %ebx,%eax
80100e13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e16:	c9                   	leave  
80100e17:	c3                   	ret    
80100e18:	83 ec 0c             	sub    $0xc,%esp
80100e1b:	68 14 70 10 80       	push   $0x80107014
80100e20:	e8 4b f5 ff ff       	call   80100370 <panic>
80100e25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e30 <fileclose>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	57                   	push   %edi
80100e34:	56                   	push   %esi
80100e35:	53                   	push   %ebx
80100e36:	83 ec 28             	sub    $0x28,%esp
80100e39:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e3c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e41:	e8 da 34 00 00       	call   80104320 <acquire>
80100e46:	8b 47 04             	mov    0x4(%edi),%eax
80100e49:	83 c4 10             	add    $0x10,%esp
80100e4c:	85 c0                	test   %eax,%eax
80100e4e:	0f 8e 9b 00 00 00    	jle    80100eef <fileclose+0xbf>
80100e54:	83 e8 01             	sub    $0x1,%eax
80100e57:	85 c0                	test   %eax,%eax
80100e59:	89 47 04             	mov    %eax,0x4(%edi)
80100e5c:	74 1a                	je     80100e78 <fileclose+0x48>
80100e5e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
80100e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e68:	5b                   	pop    %ebx
80100e69:	5e                   	pop    %esi
80100e6a:	5f                   	pop    %edi
80100e6b:	5d                   	pop    %ebp
80100e6c:	e9 5f 35 00 00       	jmp    801043d0 <release>
80100e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e78:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e7c:	8b 1f                	mov    (%edi),%ebx
80100e7e:	83 ec 0c             	sub    $0xc,%esp
80100e81:	8b 77 0c             	mov    0xc(%edi),%esi
80100e84:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e8a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e8d:	8b 47 10             	mov    0x10(%edi),%eax
80100e90:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e95:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e98:	e8 33 35 00 00       	call   801043d0 <release>
80100e9d:	83 c4 10             	add    $0x10,%esp
80100ea0:	83 fb 01             	cmp    $0x1,%ebx
80100ea3:	74 13                	je     80100eb8 <fileclose+0x88>
80100ea5:	83 fb 02             	cmp    $0x2,%ebx
80100ea8:	74 26                	je     80100ed0 <fileclose+0xa0>
80100eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ead:	5b                   	pop    %ebx
80100eae:	5e                   	pop    %esi
80100eaf:	5f                   	pop    %edi
80100eb0:	5d                   	pop    %ebp
80100eb1:	c3                   	ret    
80100eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100eb8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ebc:	83 ec 08             	sub    $0x8,%esp
80100ebf:	53                   	push   %ebx
80100ec0:	56                   	push   %esi
80100ec1:	e8 2a 24 00 00       	call   801032f0 <pipeclose>
80100ec6:	83 c4 10             	add    $0x10,%esp
80100ec9:	eb df                	jmp    80100eaa <fileclose+0x7a>
80100ecb:	90                   	nop
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ed0:	e8 7b 1c 00 00       	call   80102b50 <begin_op>
80100ed5:	83 ec 0c             	sub    $0xc,%esp
80100ed8:	ff 75 e0             	pushl  -0x20(%ebp)
80100edb:	e8 c0 08 00 00       	call   801017a0 <iput>
80100ee0:	83 c4 10             	add    $0x10,%esp
80100ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee6:	5b                   	pop    %ebx
80100ee7:	5e                   	pop    %esi
80100ee8:	5f                   	pop    %edi
80100ee9:	5d                   	pop    %ebp
80100eea:	e9 d1 1c 00 00       	jmp    80102bc0 <end_op>
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	68 1c 70 10 80       	push   $0x8010701c
80100ef7:	e8 74 f4 ff ff       	call   80100370 <panic>
80100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f00 <filestat>:
80100f00:	55                   	push   %ebp
80100f01:	89 e5                	mov    %esp,%ebp
80100f03:	53                   	push   %ebx
80100f04:	83 ec 04             	sub    $0x4,%esp
80100f07:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f0a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0d:	75 31                	jne    80100f40 <filestat+0x40>
80100f0f:	83 ec 0c             	sub    $0xc,%esp
80100f12:	ff 73 10             	pushl  0x10(%ebx)
80100f15:	e8 56 07 00 00       	call   80101670 <ilock>
80100f1a:	58                   	pop    %eax
80100f1b:	5a                   	pop    %edx
80100f1c:	ff 75 0c             	pushl  0xc(%ebp)
80100f1f:	ff 73 10             	pushl  0x10(%ebx)
80100f22:	e8 f9 09 00 00       	call   80101920 <stati>
80100f27:	59                   	pop    %ecx
80100f28:	ff 73 10             	pushl  0x10(%ebx)
80100f2b:	e8 20 08 00 00       	call   80101750 <iunlock>
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	31 c0                	xor    %eax,%eax
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f50 <fileread>:
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	57                   	push   %edi
80100f54:	56                   	push   %esi
80100f55:	53                   	push   %ebx
80100f56:	83 ec 0c             	sub    $0xc,%esp
80100f59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f5f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f62:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f66:	74 60                	je     80100fc8 <fileread+0x78>
80100f68:	8b 03                	mov    (%ebx),%eax
80100f6a:	83 f8 01             	cmp    $0x1,%eax
80100f6d:	74 41                	je     80100fb0 <fileread+0x60>
80100f6f:	83 f8 02             	cmp    $0x2,%eax
80100f72:	75 5b                	jne    80100fcf <fileread+0x7f>
80100f74:	83 ec 0c             	sub    $0xc,%esp
80100f77:	ff 73 10             	pushl  0x10(%ebx)
80100f7a:	e8 f1 06 00 00       	call   80101670 <ilock>
80100f7f:	57                   	push   %edi
80100f80:	ff 73 14             	pushl  0x14(%ebx)
80100f83:	56                   	push   %esi
80100f84:	ff 73 10             	pushl  0x10(%ebx)
80100f87:	e8 c4 09 00 00       	call   80101950 <readi>
80100f8c:	83 c4 20             	add    $0x20,%esp
80100f8f:	85 c0                	test   %eax,%eax
80100f91:	89 c6                	mov    %eax,%esi
80100f93:	7e 03                	jle    80100f98 <fileread+0x48>
80100f95:	01 43 14             	add    %eax,0x14(%ebx)
80100f98:	83 ec 0c             	sub    $0xc,%esp
80100f9b:	ff 73 10             	pushl  0x10(%ebx)
80100f9e:	e8 ad 07 00 00       	call   80101750 <iunlock>
80100fa3:	83 c4 10             	add    $0x10,%esp
80100fa6:	89 f0                	mov    %esi,%eax
80100fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fab:	5b                   	pop    %ebx
80100fac:	5e                   	pop    %esi
80100fad:	5f                   	pop    %edi
80100fae:	5d                   	pop    %ebp
80100faf:	c3                   	ret    
80100fb0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fb3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	5b                   	pop    %ebx
80100fba:	5e                   	pop    %esi
80100fbb:	5f                   	pop    %edi
80100fbc:	5d                   	pop    %ebp
80100fbd:	e9 ce 24 00 00       	jmp    80103490 <piperead>
80100fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fcd:	eb d9                	jmp    80100fa8 <fileread+0x58>
80100fcf:	83 ec 0c             	sub    $0xc,%esp
80100fd2:	68 26 70 10 80       	push   $0x80107026
80100fd7:	e8 94 f3 ff ff       	call   80100370 <panic>
80100fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fe0 <filewrite>:
80100fe0:	55                   	push   %ebp
80100fe1:	89 e5                	mov    %esp,%ebp
80100fe3:	57                   	push   %edi
80100fe4:	56                   	push   %esi
80100fe5:	53                   	push   %ebx
80100fe6:	83 ec 1c             	sub    $0x1c,%esp
80100fe9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fec:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fef:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100ff3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100ff6:	8b 45 10             	mov    0x10(%ebp),%eax
80100ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100ffc:	0f 84 aa 00 00 00    	je     801010ac <filewrite+0xcc>
80101002:	8b 06                	mov    (%esi),%eax
80101004:	83 f8 01             	cmp    $0x1,%eax
80101007:	0f 84 c2 00 00 00    	je     801010cf <filewrite+0xef>
8010100d:	83 f8 02             	cmp    $0x2,%eax
80101010:	0f 85 d8 00 00 00    	jne    801010ee <filewrite+0x10e>
80101016:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101019:	31 ff                	xor    %edi,%edi
8010101b:	85 c0                	test   %eax,%eax
8010101d:	7f 34                	jg     80101053 <filewrite+0x73>
8010101f:	e9 9c 00 00 00       	jmp    801010c0 <filewrite+0xe0>
80101024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101028:	01 46 14             	add    %eax,0x14(%esi)
8010102b:	83 ec 0c             	sub    $0xc,%esp
8010102e:	ff 76 10             	pushl  0x10(%esi)
80101031:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101034:	e8 17 07 00 00       	call   80101750 <iunlock>
80101039:	e8 82 1b 00 00       	call   80102bc0 <end_op>
8010103e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101041:	83 c4 10             	add    $0x10,%esp
80101044:	39 d8                	cmp    %ebx,%eax
80101046:	0f 85 95 00 00 00    	jne    801010e1 <filewrite+0x101>
8010104c:	01 c7                	add    %eax,%edi
8010104e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101051:	7e 6d                	jle    801010c0 <filewrite+0xe0>
80101053:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101056:	b8 00 06 00 00       	mov    $0x600,%eax
8010105b:	29 fb                	sub    %edi,%ebx
8010105d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101063:	0f 4f d8             	cmovg  %eax,%ebx
80101066:	e8 e5 1a 00 00       	call   80102b50 <begin_op>
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	e8 fa 05 00 00       	call   80101670 <ilock>
80101076:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101079:	53                   	push   %ebx
8010107a:	ff 76 14             	pushl  0x14(%esi)
8010107d:	01 f8                	add    %edi,%eax
8010107f:	50                   	push   %eax
80101080:	ff 76 10             	pushl  0x10(%esi)
80101083:	e8 c8 09 00 00       	call   80101a50 <writei>
80101088:	83 c4 20             	add    $0x20,%esp
8010108b:	85 c0                	test   %eax,%eax
8010108d:	7f 99                	jg     80101028 <filewrite+0x48>
8010108f:	83 ec 0c             	sub    $0xc,%esp
80101092:	ff 76 10             	pushl  0x10(%esi)
80101095:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101098:	e8 b3 06 00 00       	call   80101750 <iunlock>
8010109d:	e8 1e 1b 00 00       	call   80102bc0 <end_op>
801010a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010a5:	83 c4 10             	add    $0x10,%esp
801010a8:	85 c0                	test   %eax,%eax
801010aa:	74 98                	je     80101044 <filewrite+0x64>
801010ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010b4:	5b                   	pop    %ebx
801010b5:	5e                   	pop    %esi
801010b6:	5f                   	pop    %edi
801010b7:	5d                   	pop    %ebp
801010b8:	c3                   	ret    
801010b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010c0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010c3:	75 e7                	jne    801010ac <filewrite+0xcc>
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	89 f8                	mov    %edi,%eax
801010ca:	5b                   	pop    %ebx
801010cb:	5e                   	pop    %esi
801010cc:	5f                   	pop    %edi
801010cd:	5d                   	pop    %ebp
801010ce:	c3                   	ret    
801010cf:	8b 46 0c             	mov    0xc(%esi),%eax
801010d2:	89 45 08             	mov    %eax,0x8(%ebp)
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
801010dc:	e9 af 22 00 00       	jmp    80103390 <pipewrite>
801010e1:	83 ec 0c             	sub    $0xc,%esp
801010e4:	68 2f 70 10 80       	push   $0x8010702f
801010e9:	e8 82 f2 ff ff       	call   80100370 <panic>
801010ee:	83 ec 0c             	sub    $0xc,%esp
801010f1:	68 35 70 10 80       	push   $0x80107035
801010f6:	e8 75 f2 ff ff       	call   80100370 <panic>
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <balloc>:
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	57                   	push   %edi
80101104:	56                   	push   %esi
80101105:	53                   	push   %ebx
80101106:	83 ec 1c             	sub    $0x1c,%esp
80101109:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
8010110f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101112:	85 c9                	test   %ecx,%ecx
80101114:	0f 84 85 00 00 00    	je     8010119f <balloc+0x9f>
8010111a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101121:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101124:	83 ec 08             	sub    $0x8,%esp
80101127:	89 f0                	mov    %esi,%eax
80101129:	c1 f8 0c             	sar    $0xc,%eax
8010112c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101132:	50                   	push   %eax
80101133:	ff 75 d8             	pushl  -0x28(%ebp)
80101136:	e8 95 ef ff ff       	call   801000d0 <bread>
8010113b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010113e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101143:	83 c4 10             	add    $0x10,%esp
80101146:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101149:	31 c0                	xor    %eax,%eax
8010114b:	eb 2d                	jmp    8010117a <balloc+0x7a>
8010114d:	8d 76 00             	lea    0x0(%esi),%esi
80101150:	89 c1                	mov    %eax,%ecx
80101152:	ba 01 00 00 00       	mov    $0x1,%edx
80101157:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010115a:	83 e1 07             	and    $0x7,%ecx
8010115d:	d3 e2                	shl    %cl,%edx
8010115f:	89 c1                	mov    %eax,%ecx
80101161:	c1 f9 03             	sar    $0x3,%ecx
80101164:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101169:	85 d7                	test   %edx,%edi
8010116b:	74 43                	je     801011b0 <balloc+0xb0>
8010116d:	83 c0 01             	add    $0x1,%eax
80101170:	83 c6 01             	add    $0x1,%esi
80101173:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101178:	74 05                	je     8010117f <balloc+0x7f>
8010117a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010117d:	72 d1                	jb     80101150 <balloc+0x50>
8010117f:	83 ec 0c             	sub    $0xc,%esp
80101182:	ff 75 e4             	pushl  -0x1c(%ebp)
80101185:	e8 56 f0 ff ff       	call   801001e0 <brelse>
8010118a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101191:	83 c4 10             	add    $0x10,%esp
80101194:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101197:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
8010119d:	77 82                	ja     80101121 <balloc+0x21>
8010119f:	83 ec 0c             	sub    $0xc,%esp
801011a2:	68 3f 70 10 80       	push   $0x8010703f
801011a7:	e8 c4 f1 ff ff       	call   80100370 <panic>
801011ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801011b0:	09 fa                	or     %edi,%edx
801011b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011b5:	83 ec 0c             	sub    $0xc,%esp
801011b8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011bc:	57                   	push   %edi
801011bd:	e8 6e 1b 00 00       	call   80102d30 <log_write>
801011c2:	89 3c 24             	mov    %edi,(%esp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
801011ca:	58                   	pop    %eax
801011cb:	5a                   	pop    %edx
801011cc:	56                   	push   %esi
801011cd:	ff 75 d8             	pushl  -0x28(%ebp)
801011d0:	e8 fb ee ff ff       	call   801000d0 <bread>
801011d5:	89 c3                	mov    %eax,%ebx
801011d7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011da:	83 c4 0c             	add    $0xc,%esp
801011dd:	68 00 02 00 00       	push   $0x200
801011e2:	6a 00                	push   $0x0
801011e4:	50                   	push   %eax
801011e5:	e8 36 32 00 00       	call   80104420 <memset>
801011ea:	89 1c 24             	mov    %ebx,(%esp)
801011ed:	e8 3e 1b 00 00       	call   80102d30 <log_write>
801011f2:	89 1c 24             	mov    %ebx,(%esp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
801011fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011fd:	89 f0                	mov    %esi,%eax
801011ff:	5b                   	pop    %ebx
80101200:	5e                   	pop    %esi
80101201:	5f                   	pop    %edi
80101202:	5d                   	pop    %ebp
80101203:	c3                   	ret    
80101204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010120a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101210 <iget>:
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	56                   	push   %esi
80101215:	53                   	push   %ebx
80101216:	89 c7                	mov    %eax,%edi
80101218:	31 f6                	xor    %esi,%esi
8010121a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
8010121f:	83 ec 28             	sub    $0x28,%esp
80101222:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101225:	68 e0 09 11 80       	push   $0x801109e0
8010122a:	e8 f1 30 00 00       	call   80104320 <acquire>
8010122f:	83 c4 10             	add    $0x10,%esp
80101232:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101235:	eb 1b                	jmp    80101252 <iget+0x42>
80101237:	89 f6                	mov    %esi,%esi
80101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101240:	85 f6                	test   %esi,%esi
80101242:	74 44                	je     80101288 <iget+0x78>
80101244:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010124a:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101250:	74 4e                	je     801012a0 <iget+0x90>
80101252:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101255:	85 c9                	test   %ecx,%ecx
80101257:	7e e7                	jle    80101240 <iget+0x30>
80101259:	39 3b                	cmp    %edi,(%ebx)
8010125b:	75 e3                	jne    80101240 <iget+0x30>
8010125d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101260:	75 de                	jne    80101240 <iget+0x30>
80101262:	83 ec 0c             	sub    $0xc,%esp
80101265:	83 c1 01             	add    $0x1,%ecx
80101268:	89 de                	mov    %ebx,%esi
8010126a:	68 e0 09 11 80       	push   $0x801109e0
8010126f:	89 4b 08             	mov    %ecx,0x8(%ebx)
80101272:	e8 59 31 00 00       	call   801043d0 <release>
80101277:	83 c4 10             	add    $0x10,%esp
8010127a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010127d:	89 f0                	mov    %esi,%eax
8010127f:	5b                   	pop    %ebx
80101280:	5e                   	pop    %esi
80101281:	5f                   	pop    %edi
80101282:	5d                   	pop    %ebp
80101283:	c3                   	ret    
80101284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101288:	85 c9                	test   %ecx,%ecx
8010128a:	0f 44 f3             	cmove  %ebx,%esi
8010128d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101293:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101299:	75 b7                	jne    80101252 <iget+0x42>
8010129b:	90                   	nop
8010129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012a0:	85 f6                	test   %esi,%esi
801012a2:	74 2d                	je     801012d1 <iget+0xc1>
801012a4:	83 ec 0c             	sub    $0xc,%esp
801012a7:	89 3e                	mov    %edi,(%esi)
801012a9:	89 56 04             	mov    %edx,0x4(%esi)
801012ac:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
801012b3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801012ba:	68 e0 09 11 80       	push   $0x801109e0
801012bf:	e8 0c 31 00 00       	call   801043d0 <release>
801012c4:	83 c4 10             	add    $0x10,%esp
801012c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ca:	89 f0                	mov    %esi,%eax
801012cc:	5b                   	pop    %ebx
801012cd:	5e                   	pop    %esi
801012ce:	5f                   	pop    %edi
801012cf:	5d                   	pop    %ebp
801012d0:	c3                   	ret    
801012d1:	83 ec 0c             	sub    $0xc,%esp
801012d4:	68 55 70 10 80       	push   $0x80107055
801012d9:	e8 92 f0 ff ff       	call   80100370 <panic>
801012de:	66 90                	xchg   %ax,%ax

801012e0 <bmap>:
801012e0:	55                   	push   %ebp
801012e1:	89 e5                	mov    %esp,%ebp
801012e3:	57                   	push   %edi
801012e4:	56                   	push   %esi
801012e5:	53                   	push   %ebx
801012e6:	89 c6                	mov    %eax,%esi
801012e8:	83 ec 1c             	sub    $0x1c,%esp
801012eb:	83 fa 0b             	cmp    $0xb,%edx
801012ee:	77 18                	ja     80101308 <bmap+0x28>
801012f0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801012f3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012f6:	85 c0                	test   %eax,%eax
801012f8:	74 76                	je     80101370 <bmap+0x90>
801012fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012fd:	5b                   	pop    %ebx
801012fe:	5e                   	pop    %esi
801012ff:	5f                   	pop    %edi
80101300:	5d                   	pop    %ebp
80101301:	c3                   	ret    
80101302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101308:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010130b:	83 fb 7f             	cmp    $0x7f,%ebx
8010130e:	0f 87 83 00 00 00    	ja     80101397 <bmap+0xb7>
80101314:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010131a:	85 c0                	test   %eax,%eax
8010131c:	74 6a                	je     80101388 <bmap+0xa8>
8010131e:	83 ec 08             	sub    $0x8,%esp
80101321:	50                   	push   %eax
80101322:	ff 36                	pushl  (%esi)
80101324:	e8 a7 ed ff ff       	call   801000d0 <bread>
80101329:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010132d:	83 c4 10             	add    $0x10,%esp
80101330:	89 c7                	mov    %eax,%edi
80101332:	8b 1a                	mov    (%edx),%ebx
80101334:	85 db                	test   %ebx,%ebx
80101336:	75 1d                	jne    80101355 <bmap+0x75>
80101338:	8b 06                	mov    (%esi),%eax
8010133a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010133d:	e8 be fd ff ff       	call   80101100 <balloc>
80101342:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101345:	83 ec 0c             	sub    $0xc,%esp
80101348:	89 c3                	mov    %eax,%ebx
8010134a:	89 02                	mov    %eax,(%edx)
8010134c:	57                   	push   %edi
8010134d:	e8 de 19 00 00       	call   80102d30 <log_write>
80101352:	83 c4 10             	add    $0x10,%esp
80101355:	83 ec 0c             	sub    $0xc,%esp
80101358:	57                   	push   %edi
80101359:	e8 82 ee ff ff       	call   801001e0 <brelse>
8010135e:	83 c4 10             	add    $0x10,%esp
80101361:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101364:	89 d8                	mov    %ebx,%eax
80101366:	5b                   	pop    %ebx
80101367:	5e                   	pop    %esi
80101368:	5f                   	pop    %edi
80101369:	5d                   	pop    %ebp
8010136a:	c3                   	ret    
8010136b:	90                   	nop
8010136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101370:	8b 06                	mov    (%esi),%eax
80101372:	e8 89 fd ff ff       	call   80101100 <balloc>
80101377:	89 43 5c             	mov    %eax,0x5c(%ebx)
8010137a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010137d:	5b                   	pop    %ebx
8010137e:	5e                   	pop    %esi
8010137f:	5f                   	pop    %edi
80101380:	5d                   	pop    %ebp
80101381:	c3                   	ret    
80101382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101388:	8b 06                	mov    (%esi),%eax
8010138a:	e8 71 fd ff ff       	call   80101100 <balloc>
8010138f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101395:	eb 87                	jmp    8010131e <bmap+0x3e>
80101397:	83 ec 0c             	sub    $0xc,%esp
8010139a:	68 65 70 10 80       	push   $0x80107065
8010139f:	e8 cc ef ff ff       	call   80100370 <panic>
801013a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013b0 <readsb>:
801013b0:	55                   	push   %ebp
801013b1:	89 e5                	mov    %esp,%ebp
801013b3:	56                   	push   %esi
801013b4:	53                   	push   %ebx
801013b5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013b8:	83 ec 08             	sub    $0x8,%esp
801013bb:	6a 01                	push   $0x1
801013bd:	ff 75 08             	pushl  0x8(%ebp)
801013c0:	e8 0b ed ff ff       	call   801000d0 <bread>
801013c5:	89 c3                	mov    %eax,%ebx
801013c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ca:	83 c4 0c             	add    $0xc,%esp
801013cd:	6a 1c                	push   $0x1c
801013cf:	50                   	push   %eax
801013d0:	56                   	push   %esi
801013d1:	e8 fa 30 00 00       	call   801044d0 <memmove>
801013d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013d9:	83 c4 10             	add    $0x10,%esp
801013dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013df:	5b                   	pop    %ebx
801013e0:	5e                   	pop    %esi
801013e1:	5d                   	pop    %ebp
801013e2:	e9 f9 ed ff ff       	jmp    801001e0 <brelse>
801013e7:	89 f6                	mov    %esi,%esi
801013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013f0 <bfree>:
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	56                   	push   %esi
801013f4:	53                   	push   %ebx
801013f5:	89 d3                	mov    %edx,%ebx
801013f7:	89 c6                	mov    %eax,%esi
801013f9:	83 ec 08             	sub    $0x8,%esp
801013fc:	68 c0 09 11 80       	push   $0x801109c0
80101401:	50                   	push   %eax
80101402:	e8 a9 ff ff ff       	call   801013b0 <readsb>
80101407:	58                   	pop    %eax
80101408:	5a                   	pop    %edx
80101409:	89 da                	mov    %ebx,%edx
8010140b:	c1 ea 0c             	shr    $0xc,%edx
8010140e:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101414:	52                   	push   %edx
80101415:	56                   	push   %esi
80101416:	e8 b5 ec ff ff       	call   801000d0 <bread>
8010141b:	89 d9                	mov    %ebx,%ecx
8010141d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80101423:	ba 01 00 00 00       	mov    $0x1,%edx
80101428:	83 e1 07             	and    $0x7,%ecx
8010142b:	c1 fb 03             	sar    $0x3,%ebx
8010142e:	83 c4 10             	add    $0x10,%esp
80101431:	d3 e2                	shl    %cl,%edx
80101433:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101438:	85 d1                	test   %edx,%ecx
8010143a:	74 27                	je     80101463 <bfree+0x73>
8010143c:	89 c6                	mov    %eax,%esi
8010143e:	f7 d2                	not    %edx
80101440:	89 c8                	mov    %ecx,%eax
80101442:	83 ec 0c             	sub    $0xc,%esp
80101445:	21 d0                	and    %edx,%eax
80101447:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010144b:	56                   	push   %esi
8010144c:	e8 df 18 00 00       	call   80102d30 <log_write>
80101451:	89 34 24             	mov    %esi,(%esp)
80101454:	e8 87 ed ff ff       	call   801001e0 <brelse>
80101459:	83 c4 10             	add    $0x10,%esp
8010145c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010145f:	5b                   	pop    %ebx
80101460:	5e                   	pop    %esi
80101461:	5d                   	pop    %ebp
80101462:	c3                   	ret    
80101463:	83 ec 0c             	sub    $0xc,%esp
80101466:	68 78 70 10 80       	push   $0x80107078
8010146b:	e8 00 ef ff ff       	call   80100370 <panic>

80101470 <iinit>:
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101479:	83 ec 0c             	sub    $0xc,%esp
8010147c:	68 8b 70 10 80       	push   $0x8010708b
80101481:	68 e0 09 11 80       	push   $0x801109e0
80101486:	e8 35 2d 00 00       	call   801041c0 <initlock>
8010148b:	83 c4 10             	add    $0x10,%esp
8010148e:	66 90                	xchg   %ax,%ax
80101490:	83 ec 08             	sub    $0x8,%esp
80101493:	68 92 70 10 80       	push   $0x80107092
80101498:	53                   	push   %ebx
80101499:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010149f:	e8 ec 2b 00 00       	call   80104090 <initsleeplock>
801014a4:	83 c4 10             	add    $0x10,%esp
801014a7:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
801014ad:	75 e1                	jne    80101490 <iinit+0x20>
801014af:	83 ec 08             	sub    $0x8,%esp
801014b2:	68 c0 09 11 80       	push   $0x801109c0
801014b7:	ff 75 08             	pushl  0x8(%ebp)
801014ba:	e8 f1 fe ff ff       	call   801013b0 <readsb>
801014bf:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014c5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014cb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014d1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014d7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014dd:	ff 35 c4 09 11 80    	pushl  0x801109c4
801014e3:	ff 35 c0 09 11 80    	pushl  0x801109c0
801014e9:	68 f8 70 10 80       	push   $0x801070f8
801014ee:	e8 6d f1 ff ff       	call   80100660 <cprintf>
801014f3:	83 c4 30             	add    $0x30,%esp
801014f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014f9:	c9                   	leave  
801014fa:	c3                   	ret    
801014fb:	90                   	nop
801014fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101500 <ialloc>:
80101500:	55                   	push   %ebp
80101501:	89 e5                	mov    %esp,%ebp
80101503:	57                   	push   %edi
80101504:	56                   	push   %esi
80101505:	53                   	push   %ebx
80101506:	83 ec 1c             	sub    $0x1c,%esp
80101509:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
80101510:	8b 45 0c             	mov    0xc(%ebp),%eax
80101513:	8b 75 08             	mov    0x8(%ebp),%esi
80101516:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101519:	0f 86 91 00 00 00    	jbe    801015b0 <ialloc+0xb0>
8010151f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101524:	eb 21                	jmp    80101547 <ialloc+0x47>
80101526:	8d 76 00             	lea    0x0(%esi),%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101530:	83 ec 0c             	sub    $0xc,%esp
80101533:	83 c3 01             	add    $0x1,%ebx
80101536:	57                   	push   %edi
80101537:	e8 a4 ec ff ff       	call   801001e0 <brelse>
8010153c:	83 c4 10             	add    $0x10,%esp
8010153f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101545:	76 69                	jbe    801015b0 <ialloc+0xb0>
80101547:	89 d8                	mov    %ebx,%eax
80101549:	83 ec 08             	sub    $0x8,%esp
8010154c:	c1 e8 03             	shr    $0x3,%eax
8010154f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101555:	50                   	push   %eax
80101556:	56                   	push   %esi
80101557:	e8 74 eb ff ff       	call   801000d0 <bread>
8010155c:	89 c7                	mov    %eax,%edi
8010155e:	89 d8                	mov    %ebx,%eax
80101560:	83 c4 10             	add    $0x10,%esp
80101563:	83 e0 07             	and    $0x7,%eax
80101566:	c1 e0 06             	shl    $0x6,%eax
80101569:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010156d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101571:	75 bd                	jne    80101530 <ialloc+0x30>
80101573:	83 ec 04             	sub    $0x4,%esp
80101576:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101579:	6a 40                	push   $0x40
8010157b:	6a 00                	push   $0x0
8010157d:	51                   	push   %ecx
8010157e:	e8 9d 2e 00 00       	call   80104420 <memset>
80101583:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101587:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010158a:	66 89 01             	mov    %ax,(%ecx)
8010158d:	89 3c 24             	mov    %edi,(%esp)
80101590:	e8 9b 17 00 00       	call   80102d30 <log_write>
80101595:	89 3c 24             	mov    %edi,(%esp)
80101598:	e8 43 ec ff ff       	call   801001e0 <brelse>
8010159d:	83 c4 10             	add    $0x10,%esp
801015a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015a3:	89 da                	mov    %ebx,%edx
801015a5:	89 f0                	mov    %esi,%eax
801015a7:	5b                   	pop    %ebx
801015a8:	5e                   	pop    %esi
801015a9:	5f                   	pop    %edi
801015aa:	5d                   	pop    %ebp
801015ab:	e9 60 fc ff ff       	jmp    80101210 <iget>
801015b0:	83 ec 0c             	sub    $0xc,%esp
801015b3:	68 98 70 10 80       	push   $0x80107098
801015b8:	e8 b3 ed ff ff       	call   80100370 <panic>
801015bd:	8d 76 00             	lea    0x0(%esi),%esi

801015c0 <iupdate>:
801015c0:	55                   	push   %ebp
801015c1:	89 e5                	mov    %esp,%ebp
801015c3:	56                   	push   %esi
801015c4:	53                   	push   %ebx
801015c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015c8:	83 ec 08             	sub    $0x8,%esp
801015cb:	8b 43 04             	mov    0x4(%ebx),%eax
801015ce:	83 c3 5c             	add    $0x5c,%ebx
801015d1:	c1 e8 03             	shr    $0x3,%eax
801015d4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015da:	50                   	push   %eax
801015db:	ff 73 a4             	pushl  -0x5c(%ebx)
801015de:	e8 ed ea ff ff       	call   801000d0 <bread>
801015e3:	89 c6                	mov    %eax,%esi
801015e5:	8b 43 a8             	mov    -0x58(%ebx),%eax
801015e8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801015ec:	83 c4 0c             	add    $0xc,%esp
801015ef:	83 e0 07             	and    $0x7,%eax
801015f2:	c1 e0 06             	shl    $0x6,%eax
801015f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801015f9:	66 89 10             	mov    %dx,(%eax)
801015fc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101600:	83 c0 0c             	add    $0xc,%eax
80101603:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101607:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010160b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010160f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101613:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101617:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010161a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010161d:	6a 34                	push   $0x34
8010161f:	53                   	push   %ebx
80101620:	50                   	push   %eax
80101621:	e8 aa 2e 00 00       	call   801044d0 <memmove>
80101626:	89 34 24             	mov    %esi,(%esp)
80101629:	e8 02 17 00 00       	call   80102d30 <log_write>
8010162e:	89 75 08             	mov    %esi,0x8(%ebp)
80101631:	83 c4 10             	add    $0x10,%esp
80101634:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101637:	5b                   	pop    %ebx
80101638:	5e                   	pop    %esi
80101639:	5d                   	pop    %ebp
8010163a:	e9 a1 eb ff ff       	jmp    801001e0 <brelse>
8010163f:	90                   	nop

80101640 <idup>:
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	53                   	push   %ebx
80101644:	83 ec 10             	sub    $0x10,%esp
80101647:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010164a:	68 e0 09 11 80       	push   $0x801109e0
8010164f:	e8 cc 2c 00 00       	call   80104320 <acquire>
80101654:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101658:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010165f:	e8 6c 2d 00 00       	call   801043d0 <release>
80101664:	89 d8                	mov    %ebx,%eax
80101666:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101669:	c9                   	leave  
8010166a:	c3                   	ret    
8010166b:	90                   	nop
8010166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101670 <ilock>:
80101670:	55                   	push   %ebp
80101671:	89 e5                	mov    %esp,%ebp
80101673:	56                   	push   %esi
80101674:	53                   	push   %ebx
80101675:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101678:	85 db                	test   %ebx,%ebx
8010167a:	0f 84 b7 00 00 00    	je     80101737 <ilock+0xc7>
80101680:	8b 53 08             	mov    0x8(%ebx),%edx
80101683:	85 d2                	test   %edx,%edx
80101685:	0f 8e ac 00 00 00    	jle    80101737 <ilock+0xc7>
8010168b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010168e:	83 ec 0c             	sub    $0xc,%esp
80101691:	50                   	push   %eax
80101692:	e8 39 2a 00 00       	call   801040d0 <acquiresleep>
80101697:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010169a:	83 c4 10             	add    $0x10,%esp
8010169d:	85 c0                	test   %eax,%eax
8010169f:	74 0f                	je     801016b0 <ilock+0x40>
801016a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016a4:	5b                   	pop    %ebx
801016a5:	5e                   	pop    %esi
801016a6:	5d                   	pop    %ebp
801016a7:	c3                   	ret    
801016a8:	90                   	nop
801016a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016b0:	8b 43 04             	mov    0x4(%ebx),%eax
801016b3:	83 ec 08             	sub    $0x8,%esp
801016b6:	c1 e8 03             	shr    $0x3,%eax
801016b9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016bf:	50                   	push   %eax
801016c0:	ff 33                	pushl  (%ebx)
801016c2:	e8 09 ea ff ff       	call   801000d0 <bread>
801016c7:	89 c6                	mov    %eax,%esi
801016c9:	8b 43 04             	mov    0x4(%ebx),%eax
801016cc:	83 c4 0c             	add    $0xc,%esp
801016cf:	83 e0 07             	and    $0x7,%eax
801016d2:	c1 e0 06             	shl    $0x6,%eax
801016d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016d9:	0f b7 10             	movzwl (%eax),%edx
801016dc:	83 c0 0c             	add    $0xc,%eax
801016df:	66 89 53 50          	mov    %dx,0x50(%ebx)
801016e3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016e7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801016eb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016ef:	66 89 53 54          	mov    %dx,0x54(%ebx)
801016f3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016f7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801016fb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016fe:	89 53 58             	mov    %edx,0x58(%ebx)
80101701:	6a 34                	push   $0x34
80101703:	50                   	push   %eax
80101704:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101707:	50                   	push   %eax
80101708:	e8 c3 2d 00 00       	call   801044d0 <memmove>
8010170d:	89 34 24             	mov    %esi,(%esp)
80101710:	e8 cb ea ff ff       	call   801001e0 <brelse>
80101715:	83 c4 10             	add    $0x10,%esp
80101718:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010171d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101724:	0f 85 77 ff ff ff    	jne    801016a1 <ilock+0x31>
8010172a:	83 ec 0c             	sub    $0xc,%esp
8010172d:	68 b0 70 10 80       	push   $0x801070b0
80101732:	e8 39 ec ff ff       	call   80100370 <panic>
80101737:	83 ec 0c             	sub    $0xc,%esp
8010173a:	68 aa 70 10 80       	push   $0x801070aa
8010173f:	e8 2c ec ff ff       	call   80100370 <panic>
80101744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010174a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101750 <iunlock>:
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	56                   	push   %esi
80101754:	53                   	push   %ebx
80101755:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101758:	85 db                	test   %ebx,%ebx
8010175a:	74 28                	je     80101784 <iunlock+0x34>
8010175c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010175f:	83 ec 0c             	sub    $0xc,%esp
80101762:	56                   	push   %esi
80101763:	e8 08 2a 00 00       	call   80104170 <holdingsleep>
80101768:	83 c4 10             	add    $0x10,%esp
8010176b:	85 c0                	test   %eax,%eax
8010176d:	74 15                	je     80101784 <iunlock+0x34>
8010176f:	8b 43 08             	mov    0x8(%ebx),%eax
80101772:	85 c0                	test   %eax,%eax
80101774:	7e 0e                	jle    80101784 <iunlock+0x34>
80101776:	89 75 08             	mov    %esi,0x8(%ebp)
80101779:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010177c:	5b                   	pop    %ebx
8010177d:	5e                   	pop    %esi
8010177e:	5d                   	pop    %ebp
8010177f:	e9 ac 29 00 00       	jmp    80104130 <releasesleep>
80101784:	83 ec 0c             	sub    $0xc,%esp
80101787:	68 bf 70 10 80       	push   $0x801070bf
8010178c:	e8 df eb ff ff       	call   80100370 <panic>
80101791:	eb 0d                	jmp    801017a0 <iput>
80101793:	90                   	nop
80101794:	90                   	nop
80101795:	90                   	nop
80101796:	90                   	nop
80101797:	90                   	nop
80101798:	90                   	nop
80101799:	90                   	nop
8010179a:	90                   	nop
8010179b:	90                   	nop
8010179c:	90                   	nop
8010179d:	90                   	nop
8010179e:	90                   	nop
8010179f:	90                   	nop

801017a0 <iput>:
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	57                   	push   %edi
801017a4:	56                   	push   %esi
801017a5:	53                   	push   %ebx
801017a6:	83 ec 28             	sub    $0x28,%esp
801017a9:	8b 75 08             	mov    0x8(%ebp),%esi
801017ac:	8d 7e 0c             	lea    0xc(%esi),%edi
801017af:	57                   	push   %edi
801017b0:	e8 1b 29 00 00       	call   801040d0 <acquiresleep>
801017b5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 d2                	test   %edx,%edx
801017bd:	74 07                	je     801017c6 <iput+0x26>
801017bf:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017c4:	74 32                	je     801017f8 <iput+0x58>
801017c6:	83 ec 0c             	sub    $0xc,%esp
801017c9:	57                   	push   %edi
801017ca:	e8 61 29 00 00       	call   80104130 <releasesleep>
801017cf:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017d6:	e8 45 2b 00 00       	call   80104320 <acquire>
801017db:	83 6e 08 01          	subl   $0x1,0x8(%esi)
801017df:	83 c4 10             	add    $0x10,%esp
801017e2:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
801017e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017ec:	5b                   	pop    %ebx
801017ed:	5e                   	pop    %esi
801017ee:	5f                   	pop    %edi
801017ef:	5d                   	pop    %ebp
801017f0:	e9 db 2b 00 00       	jmp    801043d0 <release>
801017f5:	8d 76 00             	lea    0x0(%esi),%esi
801017f8:	83 ec 0c             	sub    $0xc,%esp
801017fb:	68 e0 09 11 80       	push   $0x801109e0
80101800:	e8 1b 2b 00 00       	call   80104320 <acquire>
80101805:	8b 5e 08             	mov    0x8(%esi),%ebx
80101808:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010180f:	e8 bc 2b 00 00       	call   801043d0 <release>
80101814:	83 c4 10             	add    $0x10,%esp
80101817:	83 fb 01             	cmp    $0x1,%ebx
8010181a:	75 aa                	jne    801017c6 <iput+0x26>
8010181c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101822:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101825:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101828:	89 cf                	mov    %ecx,%edi
8010182a:	eb 0b                	jmp    80101837 <iput+0x97>
8010182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101830:	83 c3 04             	add    $0x4,%ebx
80101833:	39 fb                	cmp    %edi,%ebx
80101835:	74 19                	je     80101850 <iput+0xb0>
80101837:	8b 13                	mov    (%ebx),%edx
80101839:	85 d2                	test   %edx,%edx
8010183b:	74 f3                	je     80101830 <iput+0x90>
8010183d:	8b 06                	mov    (%esi),%eax
8010183f:	e8 ac fb ff ff       	call   801013f0 <bfree>
80101844:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010184a:	eb e4                	jmp    80101830 <iput+0x90>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101856:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101859:	85 c0                	test   %eax,%eax
8010185b:	75 33                	jne    80101890 <iput+0xf0>
8010185d:	83 ec 0c             	sub    $0xc,%esp
80101860:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101867:	56                   	push   %esi
80101868:	e8 53 fd ff ff       	call   801015c0 <iupdate>
8010186d:	31 c0                	xor    %eax,%eax
8010186f:	66 89 46 50          	mov    %ax,0x50(%esi)
80101873:	89 34 24             	mov    %esi,(%esp)
80101876:	e8 45 fd ff ff       	call   801015c0 <iupdate>
8010187b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101882:	83 c4 10             	add    $0x10,%esp
80101885:	e9 3c ff ff ff       	jmp    801017c6 <iput+0x26>
8010188a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101890:	83 ec 08             	sub    $0x8,%esp
80101893:	50                   	push   %eax
80101894:	ff 36                	pushl  (%esi)
80101896:	e8 35 e8 ff ff       	call   801000d0 <bread>
8010189b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018a1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018a7:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018aa:	83 c4 10             	add    $0x10,%esp
801018ad:	89 cf                	mov    %ecx,%edi
801018af:	eb 0e                	jmp    801018bf <iput+0x11f>
801018b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018b8:	83 c3 04             	add    $0x4,%ebx
801018bb:	39 fb                	cmp    %edi,%ebx
801018bd:	74 0f                	je     801018ce <iput+0x12e>
801018bf:	8b 13                	mov    (%ebx),%edx
801018c1:	85 d2                	test   %edx,%edx
801018c3:	74 f3                	je     801018b8 <iput+0x118>
801018c5:	8b 06                	mov    (%esi),%eax
801018c7:	e8 24 fb ff ff       	call   801013f0 <bfree>
801018cc:	eb ea                	jmp    801018b8 <iput+0x118>
801018ce:	83 ec 0c             	sub    $0xc,%esp
801018d1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018d4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018d7:	e8 04 e9 ff ff       	call   801001e0 <brelse>
801018dc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018e2:	8b 06                	mov    (%esi),%eax
801018e4:	e8 07 fb ff ff       	call   801013f0 <bfree>
801018e9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018f0:	00 00 00 
801018f3:	83 c4 10             	add    $0x10,%esp
801018f6:	e9 62 ff ff ff       	jmp    8010185d <iput+0xbd>
801018fb:	90                   	nop
801018fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101900 <iunlockput>:
80101900:	55                   	push   %ebp
80101901:	89 e5                	mov    %esp,%ebp
80101903:	53                   	push   %ebx
80101904:	83 ec 10             	sub    $0x10,%esp
80101907:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010190a:	53                   	push   %ebx
8010190b:	e8 40 fe ff ff       	call   80101750 <iunlock>
80101910:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101913:	83 c4 10             	add    $0x10,%esp
80101916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101919:	c9                   	leave  
8010191a:	e9 81 fe ff ff       	jmp    801017a0 <iput>
8010191f:	90                   	nop

80101920 <stati>:
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	8b 55 08             	mov    0x8(%ebp),%edx
80101926:	8b 45 0c             	mov    0xc(%ebp),%eax
80101929:	8b 0a                	mov    (%edx),%ecx
8010192b:	89 48 04             	mov    %ecx,0x4(%eax)
8010192e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101931:	89 48 08             	mov    %ecx,0x8(%eax)
80101934:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101938:	66 89 08             	mov    %cx,(%eax)
8010193b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010193f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101943:	8b 52 58             	mov    0x58(%edx),%edx
80101946:	89 50 10             	mov    %edx,0x10(%eax)
80101949:	5d                   	pop    %ebp
8010194a:	c3                   	ret    
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <readi>:
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	57                   	push   %edi
80101954:	56                   	push   %esi
80101955:	53                   	push   %ebx
80101956:	83 ec 1c             	sub    $0x1c,%esp
80101959:	8b 45 08             	mov    0x8(%ebp),%eax
8010195c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010195f:	8b 75 10             	mov    0x10(%ebp),%esi
80101962:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101967:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010196a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010196d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101970:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101973:	0f 84 a7 00 00 00    	je     80101a20 <readi+0xd0>
80101979:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010197c:	8b 40 58             	mov    0x58(%eax),%eax
8010197f:	39 f0                	cmp    %esi,%eax
80101981:	0f 82 c1 00 00 00    	jb     80101a48 <readi+0xf8>
80101987:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010198a:	89 fa                	mov    %edi,%edx
8010198c:	01 f2                	add    %esi,%edx
8010198e:	0f 82 b4 00 00 00    	jb     80101a48 <readi+0xf8>
80101994:	89 c1                	mov    %eax,%ecx
80101996:	29 f1                	sub    %esi,%ecx
80101998:	39 d0                	cmp    %edx,%eax
8010199a:	0f 43 cf             	cmovae %edi,%ecx
8010199d:	31 ff                	xor    %edi,%edi
8010199f:	85 c9                	test   %ecx,%ecx
801019a1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801019a4:	74 6d                	je     80101a13 <readi+0xc3>
801019a6:	8d 76 00             	lea    0x0(%esi),%esi
801019a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019b0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019b3:	89 f2                	mov    %esi,%edx
801019b5:	c1 ea 09             	shr    $0x9,%edx
801019b8:	89 d8                	mov    %ebx,%eax
801019ba:	e8 21 f9 ff ff       	call   801012e0 <bmap>
801019bf:	83 ec 08             	sub    $0x8,%esp
801019c2:	50                   	push   %eax
801019c3:	ff 33                	pushl  (%ebx)
801019c5:	bb 00 02 00 00       	mov    $0x200,%ebx
801019ca:	e8 01 e7 ff ff       	call   801000d0 <bread>
801019cf:	89 c2                	mov    %eax,%edx
801019d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019d4:	89 f1                	mov    %esi,%ecx
801019d6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019dc:	83 c4 0c             	add    $0xc,%esp
801019df:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019e2:	29 cb                	sub    %ecx,%ebx
801019e4:	29 f8                	sub    %edi,%eax
801019e6:	39 c3                	cmp    %eax,%ebx
801019e8:	0f 47 d8             	cmova  %eax,%ebx
801019eb:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019ef:	53                   	push   %ebx
801019f0:	01 df                	add    %ebx,%edi
801019f2:	01 de                	add    %ebx,%esi
801019f4:	50                   	push   %eax
801019f5:	ff 75 e0             	pushl  -0x20(%ebp)
801019f8:	e8 d3 2a 00 00       	call   801044d0 <memmove>
801019fd:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a00:	89 14 24             	mov    %edx,(%esp)
80101a03:	e8 d8 e7 ff ff       	call   801001e0 <brelse>
80101a08:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a0b:	83 c4 10             	add    $0x10,%esp
80101a0e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a11:	77 9d                	ja     801019b0 <readi+0x60>
80101a13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a19:	5b                   	pop    %ebx
80101a1a:	5e                   	pop    %esi
80101a1b:	5f                   	pop    %edi
80101a1c:	5d                   	pop    %ebp
80101a1d:	c3                   	ret    
80101a1e:	66 90                	xchg   %ax,%ax
80101a20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a24:	66 83 f8 09          	cmp    $0x9,%ax
80101a28:	77 1e                	ja     80101a48 <readi+0xf8>
80101a2a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a31:	85 c0                	test   %eax,%eax
80101a33:	74 13                	je     80101a48 <readi+0xf8>
80101a35:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a3b:	5b                   	pop    %ebx
80101a3c:	5e                   	pop    %esi
80101a3d:	5f                   	pop    %edi
80101a3e:	5d                   	pop    %ebp
80101a3f:	ff e0                	jmp    *%eax
80101a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a4d:	eb c7                	jmp    80101a16 <readi+0xc6>
80101a4f:	90                   	nop

80101a50 <writei>:
80101a50:	55                   	push   %ebp
80101a51:	89 e5                	mov    %esp,%ebp
80101a53:	57                   	push   %edi
80101a54:	56                   	push   %esi
80101a55:	53                   	push   %ebx
80101a56:	83 ec 1c             	sub    $0x1c,%esp
80101a59:	8b 45 08             	mov    0x8(%ebp),%eax
80101a5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a5f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a62:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a67:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a6d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a70:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a73:	0f 84 b7 00 00 00    	je     80101b30 <writei+0xe0>
80101a79:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a7c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a7f:	0f 82 eb 00 00 00    	jb     80101b70 <writei+0x120>
80101a85:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a88:	89 f8                	mov    %edi,%eax
80101a8a:	01 f0                	add    %esi,%eax
80101a8c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a91:	0f 87 d9 00 00 00    	ja     80101b70 <writei+0x120>
80101a97:	39 c6                	cmp    %eax,%esi
80101a99:	0f 87 d1 00 00 00    	ja     80101b70 <writei+0x120>
80101a9f:	85 ff                	test   %edi,%edi
80101aa1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101aa8:	74 78                	je     80101b22 <writei+0xd2>
80101aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101ab0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ab3:	89 f2                	mov    %esi,%edx
80101ab5:	bb 00 02 00 00       	mov    $0x200,%ebx
80101aba:	c1 ea 09             	shr    $0x9,%edx
80101abd:	89 f8                	mov    %edi,%eax
80101abf:	e8 1c f8 ff ff       	call   801012e0 <bmap>
80101ac4:	83 ec 08             	sub    $0x8,%esp
80101ac7:	50                   	push   %eax
80101ac8:	ff 37                	pushl  (%edi)
80101aca:	e8 01 e6 ff ff       	call   801000d0 <bread>
80101acf:	89 c7                	mov    %eax,%edi
80101ad1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ad4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101ad7:	89 f1                	mov    %esi,%ecx
80101ad9:	83 c4 0c             	add    $0xc,%esp
80101adc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ae2:	29 cb                	sub    %ecx,%ebx
80101ae4:	39 c3                	cmp    %eax,%ebx
80101ae6:	0f 47 d8             	cmova  %eax,%ebx
80101ae9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101aed:	53                   	push   %ebx
80101aee:	ff 75 dc             	pushl  -0x24(%ebp)
80101af1:	01 de                	add    %ebx,%esi
80101af3:	50                   	push   %eax
80101af4:	e8 d7 29 00 00       	call   801044d0 <memmove>
80101af9:	89 3c 24             	mov    %edi,(%esp)
80101afc:	e8 2f 12 00 00       	call   80102d30 <log_write>
80101b01:	89 3c 24             	mov    %edi,(%esp)
80101b04:	e8 d7 e6 ff ff       	call   801001e0 <brelse>
80101b09:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b0c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b0f:	83 c4 10             	add    $0x10,%esp
80101b12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b15:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b18:	77 96                	ja     80101ab0 <writei+0x60>
80101b1a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b20:	77 36                	ja     80101b58 <writei+0x108>
80101b22:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b28:	5b                   	pop    %ebx
80101b29:	5e                   	pop    %esi
80101b2a:	5f                   	pop    %edi
80101b2b:	5d                   	pop    %ebp
80101b2c:	c3                   	ret    
80101b2d:	8d 76 00             	lea    0x0(%esi),%esi
80101b30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b34:	66 83 f8 09          	cmp    $0x9,%ax
80101b38:	77 36                	ja     80101b70 <writei+0x120>
80101b3a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b41:	85 c0                	test   %eax,%eax
80101b43:	74 2b                	je     80101b70 <writei+0x120>
80101b45:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b4b:	5b                   	pop    %ebx
80101b4c:	5e                   	pop    %esi
80101b4d:	5f                   	pop    %edi
80101b4e:	5d                   	pop    %ebp
80101b4f:	ff e0                	jmp    *%eax
80101b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b58:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b5b:	83 ec 0c             	sub    $0xc,%esp
80101b5e:	89 70 58             	mov    %esi,0x58(%eax)
80101b61:	50                   	push   %eax
80101b62:	e8 59 fa ff ff       	call   801015c0 <iupdate>
80101b67:	83 c4 10             	add    $0x10,%esp
80101b6a:	eb b6                	jmp    80101b22 <writei+0xd2>
80101b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b75:	eb ae                	jmp    80101b25 <writei+0xd5>
80101b77:	89 f6                	mov    %esi,%esi
80101b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b80 <namecmp>:
80101b80:	55                   	push   %ebp
80101b81:	89 e5                	mov    %esp,%ebp
80101b83:	83 ec 0c             	sub    $0xc,%esp
80101b86:	6a 0e                	push   $0xe
80101b88:	ff 75 0c             	pushl  0xc(%ebp)
80101b8b:	ff 75 08             	pushl  0x8(%ebp)
80101b8e:	e8 bd 29 00 00       	call   80104550 <strncmp>
80101b93:	c9                   	leave  
80101b94:	c3                   	ret    
80101b95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <dirlookup>:
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	57                   	push   %edi
80101ba4:	56                   	push   %esi
80101ba5:	53                   	push   %ebx
80101ba6:	83 ec 1c             	sub    $0x1c,%esp
80101ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bac:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bb1:	0f 85 80 00 00 00    	jne    80101c37 <dirlookup+0x97>
80101bb7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bba:	31 ff                	xor    %edi,%edi
80101bbc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bbf:	85 d2                	test   %edx,%edx
80101bc1:	75 0d                	jne    80101bd0 <dirlookup+0x30>
80101bc3:	eb 5b                	jmp    80101c20 <dirlookup+0x80>
80101bc5:	8d 76 00             	lea    0x0(%esi),%esi
80101bc8:	83 c7 10             	add    $0x10,%edi
80101bcb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bce:	76 50                	jbe    80101c20 <dirlookup+0x80>
80101bd0:	6a 10                	push   $0x10
80101bd2:	57                   	push   %edi
80101bd3:	56                   	push   %esi
80101bd4:	53                   	push   %ebx
80101bd5:	e8 76 fd ff ff       	call   80101950 <readi>
80101bda:	83 c4 10             	add    $0x10,%esp
80101bdd:	83 f8 10             	cmp    $0x10,%eax
80101be0:	75 48                	jne    80101c2a <dirlookup+0x8a>
80101be2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101be7:	74 df                	je     80101bc8 <dirlookup+0x28>
80101be9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bec:	83 ec 04             	sub    $0x4,%esp
80101bef:	6a 0e                	push   $0xe
80101bf1:	50                   	push   %eax
80101bf2:	ff 75 0c             	pushl  0xc(%ebp)
80101bf5:	e8 56 29 00 00       	call   80104550 <strncmp>
80101bfa:	83 c4 10             	add    $0x10,%esp
80101bfd:	85 c0                	test   %eax,%eax
80101bff:	75 c7                	jne    80101bc8 <dirlookup+0x28>
80101c01:	8b 45 10             	mov    0x10(%ebp),%eax
80101c04:	85 c0                	test   %eax,%eax
80101c06:	74 05                	je     80101c0d <dirlookup+0x6d>
80101c08:	8b 45 10             	mov    0x10(%ebp),%eax
80101c0b:	89 38                	mov    %edi,(%eax)
80101c0d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c11:	8b 03                	mov    (%ebx),%eax
80101c13:	e8 f8 f5 ff ff       	call   80101210 <iget>
80101c18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c1b:	5b                   	pop    %ebx
80101c1c:	5e                   	pop    %esi
80101c1d:	5f                   	pop    %edi
80101c1e:	5d                   	pop    %ebp
80101c1f:	c3                   	ret    
80101c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c23:	31 c0                	xor    %eax,%eax
80101c25:	5b                   	pop    %ebx
80101c26:	5e                   	pop    %esi
80101c27:	5f                   	pop    %edi
80101c28:	5d                   	pop    %ebp
80101c29:	c3                   	ret    
80101c2a:	83 ec 0c             	sub    $0xc,%esp
80101c2d:	68 d9 70 10 80       	push   $0x801070d9
80101c32:	e8 39 e7 ff ff       	call   80100370 <panic>
80101c37:	83 ec 0c             	sub    $0xc,%esp
80101c3a:	68 c7 70 10 80       	push   $0x801070c7
80101c3f:	e8 2c e7 ff ff       	call   80100370 <panic>
80101c44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c50 <namex>:
80101c50:	55                   	push   %ebp
80101c51:	89 e5                	mov    %esp,%ebp
80101c53:	57                   	push   %edi
80101c54:	56                   	push   %esi
80101c55:	53                   	push   %ebx
80101c56:	89 cf                	mov    %ecx,%edi
80101c58:	89 c3                	mov    %eax,%ebx
80101c5a:	83 ec 1c             	sub    $0x1c,%esp
80101c5d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c60:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c63:	0f 84 53 01 00 00    	je     80101dbc <namex+0x16c>
80101c69:	e8 12 1b 00 00       	call   80103780 <myproc>
80101c6e:	83 ec 0c             	sub    $0xc,%esp
80101c71:	8b 70 68             	mov    0x68(%eax),%esi
80101c74:	68 e0 09 11 80       	push   $0x801109e0
80101c79:	e8 a2 26 00 00       	call   80104320 <acquire>
80101c7e:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101c82:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101c89:	e8 42 27 00 00       	call   801043d0 <release>
80101c8e:	83 c4 10             	add    $0x10,%esp
80101c91:	eb 08                	jmp    80101c9b <namex+0x4b>
80101c93:	90                   	nop
80101c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c98:	83 c3 01             	add    $0x1,%ebx
80101c9b:	0f b6 03             	movzbl (%ebx),%eax
80101c9e:	3c 2f                	cmp    $0x2f,%al
80101ca0:	74 f6                	je     80101c98 <namex+0x48>
80101ca2:	84 c0                	test   %al,%al
80101ca4:	0f 84 e3 00 00 00    	je     80101d8d <namex+0x13d>
80101caa:	0f b6 03             	movzbl (%ebx),%eax
80101cad:	89 da                	mov    %ebx,%edx
80101caf:	84 c0                	test   %al,%al
80101cb1:	0f 84 ac 00 00 00    	je     80101d63 <namex+0x113>
80101cb7:	3c 2f                	cmp    $0x2f,%al
80101cb9:	75 09                	jne    80101cc4 <namex+0x74>
80101cbb:	e9 a3 00 00 00       	jmp    80101d63 <namex+0x113>
80101cc0:	84 c0                	test   %al,%al
80101cc2:	74 0a                	je     80101cce <namex+0x7e>
80101cc4:	83 c2 01             	add    $0x1,%edx
80101cc7:	0f b6 02             	movzbl (%edx),%eax
80101cca:	3c 2f                	cmp    $0x2f,%al
80101ccc:	75 f2                	jne    80101cc0 <namex+0x70>
80101cce:	89 d1                	mov    %edx,%ecx
80101cd0:	29 d9                	sub    %ebx,%ecx
80101cd2:	83 f9 0d             	cmp    $0xd,%ecx
80101cd5:	0f 8e 8d 00 00 00    	jle    80101d68 <namex+0x118>
80101cdb:	83 ec 04             	sub    $0x4,%esp
80101cde:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ce1:	6a 0e                	push   $0xe
80101ce3:	53                   	push   %ebx
80101ce4:	57                   	push   %edi
80101ce5:	e8 e6 27 00 00       	call   801044d0 <memmove>
80101cea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ced:	83 c4 10             	add    $0x10,%esp
80101cf0:	89 d3                	mov    %edx,%ebx
80101cf2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cf5:	75 11                	jne    80101d08 <namex+0xb8>
80101cf7:	89 f6                	mov    %esi,%esi
80101cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d00:	83 c3 01             	add    $0x1,%ebx
80101d03:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d06:	74 f8                	je     80101d00 <namex+0xb0>
80101d08:	83 ec 0c             	sub    $0xc,%esp
80101d0b:	56                   	push   %esi
80101d0c:	e8 5f f9 ff ff       	call   80101670 <ilock>
80101d11:	83 c4 10             	add    $0x10,%esp
80101d14:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d19:	0f 85 7f 00 00 00    	jne    80101d9e <namex+0x14e>
80101d1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d22:	85 d2                	test   %edx,%edx
80101d24:	74 09                	je     80101d2f <namex+0xdf>
80101d26:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d29:	0f 84 a3 00 00 00    	je     80101dd2 <namex+0x182>
80101d2f:	83 ec 04             	sub    $0x4,%esp
80101d32:	6a 00                	push   $0x0
80101d34:	57                   	push   %edi
80101d35:	56                   	push   %esi
80101d36:	e8 65 fe ff ff       	call   80101ba0 <dirlookup>
80101d3b:	83 c4 10             	add    $0x10,%esp
80101d3e:	85 c0                	test   %eax,%eax
80101d40:	74 5c                	je     80101d9e <namex+0x14e>
80101d42:	83 ec 0c             	sub    $0xc,%esp
80101d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d48:	56                   	push   %esi
80101d49:	e8 02 fa ff ff       	call   80101750 <iunlock>
80101d4e:	89 34 24             	mov    %esi,(%esp)
80101d51:	e8 4a fa ff ff       	call   801017a0 <iput>
80101d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d59:	83 c4 10             	add    $0x10,%esp
80101d5c:	89 c6                	mov    %eax,%esi
80101d5e:	e9 38 ff ff ff       	jmp    80101c9b <namex+0x4b>
80101d63:	31 c9                	xor    %ecx,%ecx
80101d65:	8d 76 00             	lea    0x0(%esi),%esi
80101d68:	83 ec 04             	sub    $0x4,%esp
80101d6b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d6e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d71:	51                   	push   %ecx
80101d72:	53                   	push   %ebx
80101d73:	57                   	push   %edi
80101d74:	e8 57 27 00 00       	call   801044d0 <memmove>
80101d79:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d7c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d7f:	83 c4 10             	add    $0x10,%esp
80101d82:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d86:	89 d3                	mov    %edx,%ebx
80101d88:	e9 65 ff ff ff       	jmp    80101cf2 <namex+0xa2>
80101d8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d90:	85 c0                	test   %eax,%eax
80101d92:	75 54                	jne    80101de8 <namex+0x198>
80101d94:	89 f0                	mov    %esi,%eax
80101d96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d99:	5b                   	pop    %ebx
80101d9a:	5e                   	pop    %esi
80101d9b:	5f                   	pop    %edi
80101d9c:	5d                   	pop    %ebp
80101d9d:	c3                   	ret    
80101d9e:	83 ec 0c             	sub    $0xc,%esp
80101da1:	56                   	push   %esi
80101da2:	e8 a9 f9 ff ff       	call   80101750 <iunlock>
80101da7:	89 34 24             	mov    %esi,(%esp)
80101daa:	e8 f1 f9 ff ff       	call   801017a0 <iput>
80101daf:	83 c4 10             	add    $0x10,%esp
80101db2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101db5:	31 c0                	xor    %eax,%eax
80101db7:	5b                   	pop    %ebx
80101db8:	5e                   	pop    %esi
80101db9:	5f                   	pop    %edi
80101dba:	5d                   	pop    %ebp
80101dbb:	c3                   	ret    
80101dbc:	ba 01 00 00 00       	mov    $0x1,%edx
80101dc1:	b8 01 00 00 00       	mov    $0x1,%eax
80101dc6:	e8 45 f4 ff ff       	call   80101210 <iget>
80101dcb:	89 c6                	mov    %eax,%esi
80101dcd:	e9 c9 fe ff ff       	jmp    80101c9b <namex+0x4b>
80101dd2:	83 ec 0c             	sub    $0xc,%esp
80101dd5:	56                   	push   %esi
80101dd6:	e8 75 f9 ff ff       	call   80101750 <iunlock>
80101ddb:	83 c4 10             	add    $0x10,%esp
80101dde:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de1:	89 f0                	mov    %esi,%eax
80101de3:	5b                   	pop    %ebx
80101de4:	5e                   	pop    %esi
80101de5:	5f                   	pop    %edi
80101de6:	5d                   	pop    %ebp
80101de7:	c3                   	ret    
80101de8:	83 ec 0c             	sub    $0xc,%esp
80101deb:	56                   	push   %esi
80101dec:	e8 af f9 ff ff       	call   801017a0 <iput>
80101df1:	83 c4 10             	add    $0x10,%esp
80101df4:	31 c0                	xor    %eax,%eax
80101df6:	eb 9e                	jmp    80101d96 <namex+0x146>
80101df8:	90                   	nop
80101df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e00 <dirlink>:
80101e00:	55                   	push   %ebp
80101e01:	89 e5                	mov    %esp,%ebp
80101e03:	57                   	push   %edi
80101e04:	56                   	push   %esi
80101e05:	53                   	push   %ebx
80101e06:	83 ec 20             	sub    $0x20,%esp
80101e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e0c:	6a 00                	push   $0x0
80101e0e:	ff 75 0c             	pushl  0xc(%ebp)
80101e11:	53                   	push   %ebx
80101e12:	e8 89 fd ff ff       	call   80101ba0 <dirlookup>
80101e17:	83 c4 10             	add    $0x10,%esp
80101e1a:	85 c0                	test   %eax,%eax
80101e1c:	75 67                	jne    80101e85 <dirlink+0x85>
80101e1e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e21:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e24:	85 ff                	test   %edi,%edi
80101e26:	74 29                	je     80101e51 <dirlink+0x51>
80101e28:	31 ff                	xor    %edi,%edi
80101e2a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e2d:	eb 09                	jmp    80101e38 <dirlink+0x38>
80101e2f:	90                   	nop
80101e30:	83 c7 10             	add    $0x10,%edi
80101e33:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e36:	76 19                	jbe    80101e51 <dirlink+0x51>
80101e38:	6a 10                	push   $0x10
80101e3a:	57                   	push   %edi
80101e3b:	56                   	push   %esi
80101e3c:	53                   	push   %ebx
80101e3d:	e8 0e fb ff ff       	call   80101950 <readi>
80101e42:	83 c4 10             	add    $0x10,%esp
80101e45:	83 f8 10             	cmp    $0x10,%eax
80101e48:	75 4e                	jne    80101e98 <dirlink+0x98>
80101e4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e4f:	75 df                	jne    80101e30 <dirlink+0x30>
80101e51:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e54:	83 ec 04             	sub    $0x4,%esp
80101e57:	6a 0e                	push   $0xe
80101e59:	ff 75 0c             	pushl  0xc(%ebp)
80101e5c:	50                   	push   %eax
80101e5d:	e8 5e 27 00 00       	call   801045c0 <strncpy>
80101e62:	8b 45 10             	mov    0x10(%ebp),%eax
80101e65:	6a 10                	push   $0x10
80101e67:	57                   	push   %edi
80101e68:	56                   	push   %esi
80101e69:	53                   	push   %ebx
80101e6a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e6e:	e8 dd fb ff ff       	call   80101a50 <writei>
80101e73:	83 c4 20             	add    $0x20,%esp
80101e76:	83 f8 10             	cmp    $0x10,%eax
80101e79:	75 2a                	jne    80101ea5 <dirlink+0xa5>
80101e7b:	31 c0                	xor    %eax,%eax
80101e7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e80:	5b                   	pop    %ebx
80101e81:	5e                   	pop    %esi
80101e82:	5f                   	pop    %edi
80101e83:	5d                   	pop    %ebp
80101e84:	c3                   	ret    
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	50                   	push   %eax
80101e89:	e8 12 f9 ff ff       	call   801017a0 <iput>
80101e8e:	83 c4 10             	add    $0x10,%esp
80101e91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e96:	eb e5                	jmp    80101e7d <dirlink+0x7d>
80101e98:	83 ec 0c             	sub    $0xc,%esp
80101e9b:	68 e8 70 10 80       	push   $0x801070e8
80101ea0:	e8 cb e4 ff ff       	call   80100370 <panic>
80101ea5:	83 ec 0c             	sub    $0xc,%esp
80101ea8:	68 e6 76 10 80       	push   $0x801076e6
80101ead:	e8 be e4 ff ff       	call   80100370 <panic>
80101eb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ec0 <namei>:
80101ec0:	55                   	push   %ebp
80101ec1:	31 d2                	xor    %edx,%edx
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	83 ec 18             	sub    $0x18,%esp
80101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ecb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ece:	e8 7d fd ff ff       	call   80101c50 <namex>
80101ed3:	c9                   	leave  
80101ed4:	c3                   	ret    
80101ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <nameiparent>:
80101ee0:	55                   	push   %ebp
80101ee1:	ba 01 00 00 00       	mov    $0x1,%edx
80101ee6:	89 e5                	mov    %esp,%ebp
80101ee8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eeb:	8b 45 08             	mov    0x8(%ebp),%eax
80101eee:	5d                   	pop    %ebp
80101eef:	e9 5c fd ff ff       	jmp    80101c50 <namex>
80101ef4:	66 90                	xchg   %ax,%ax
80101ef6:	66 90                	xchg   %ax,%ax
80101ef8:	66 90                	xchg   %ax,%ax
80101efa:	66 90                	xchg   %ax,%ax
80101efc:	66 90                	xchg   %ax,%ax
80101efe:	66 90                	xchg   %ax,%ax

80101f00 <idestart>:
80101f00:	55                   	push   %ebp
80101f01:	85 c0                	test   %eax,%eax
80101f03:	89 e5                	mov    %esp,%ebp
80101f05:	56                   	push   %esi
80101f06:	53                   	push   %ebx
80101f07:	0f 84 ad 00 00 00    	je     80101fba <idestart+0xba>
80101f0d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f10:	89 c1                	mov    %eax,%ecx
80101f12:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f18:	0f 87 8f 00 00 00    	ja     80101fad <idestart+0xad>
80101f1e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f23:	90                   	nop
80101f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f28:	ec                   	in     (%dx),%al
80101f29:	83 e0 c0             	and    $0xffffffc0,%eax
80101f2c:	3c 40                	cmp    $0x40,%al
80101f2e:	75 f8                	jne    80101f28 <idestart+0x28>
80101f30:	31 f6                	xor    %esi,%esi
80101f32:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f37:	89 f0                	mov    %esi,%eax
80101f39:	ee                   	out    %al,(%dx)
80101f3a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f3f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f44:	ee                   	out    %al,(%dx)
80101f45:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f4a:	89 d8                	mov    %ebx,%eax
80101f4c:	ee                   	out    %al,(%dx)
80101f4d:	89 d8                	mov    %ebx,%eax
80101f4f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f54:	c1 f8 08             	sar    $0x8,%eax
80101f57:	ee                   	out    %al,(%dx)
80101f58:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f5d:	89 f0                	mov    %esi,%eax
80101f5f:	ee                   	out    %al,(%dx)
80101f60:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f64:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f69:	83 e0 01             	and    $0x1,%eax
80101f6c:	c1 e0 04             	shl    $0x4,%eax
80101f6f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f72:	ee                   	out    %al,(%dx)
80101f73:	f6 01 04             	testb  $0x4,(%ecx)
80101f76:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f7b:	75 13                	jne    80101f90 <idestart+0x90>
80101f7d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f82:	ee                   	out    %al,(%dx)
80101f83:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f86:	5b                   	pop    %ebx
80101f87:	5e                   	pop    %esi
80101f88:	5d                   	pop    %ebp
80101f89:	c3                   	ret    
80101f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f90:	b8 30 00 00 00       	mov    $0x30,%eax
80101f95:	ee                   	out    %al,(%dx)
80101f96:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f9b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f9e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fa3:	fc                   	cld    
80101fa4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101fa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fa9:	5b                   	pop    %ebx
80101faa:	5e                   	pop    %esi
80101fab:	5d                   	pop    %ebp
80101fac:	c3                   	ret    
80101fad:	83 ec 0c             	sub    $0xc,%esp
80101fb0:	68 54 71 10 80       	push   $0x80107154
80101fb5:	e8 b6 e3 ff ff       	call   80100370 <panic>
80101fba:	83 ec 0c             	sub    $0xc,%esp
80101fbd:	68 4b 71 10 80       	push   $0x8010714b
80101fc2:	e8 a9 e3 ff ff       	call   80100370 <panic>
80101fc7:	89 f6                	mov    %esi,%esi
80101fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fd0 <ideinit>:
80101fd0:	55                   	push   %ebp
80101fd1:	89 e5                	mov    %esp,%ebp
80101fd3:	83 ec 10             	sub    $0x10,%esp
80101fd6:	68 66 71 10 80       	push   $0x80107166
80101fdb:	68 80 a5 10 80       	push   $0x8010a580
80101fe0:	e8 db 21 00 00       	call   801041c0 <initlock>
80101fe5:	58                   	pop    %eax
80101fe6:	a1 00 2d 11 80       	mov    0x80112d00,%eax
80101feb:	5a                   	pop    %edx
80101fec:	83 e8 01             	sub    $0x1,%eax
80101fef:	50                   	push   %eax
80101ff0:	6a 0e                	push   $0xe
80101ff2:	e8 a9 02 00 00       	call   801022a0 <ioapicenable>
80101ff7:	83 c4 10             	add    $0x10,%esp
80101ffa:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fff:	90                   	nop
80102000:	ec                   	in     (%dx),%al
80102001:	83 e0 c0             	and    $0xffffffc0,%eax
80102004:	3c 40                	cmp    $0x40,%al
80102006:	75 f8                	jne    80102000 <ideinit+0x30>
80102008:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010200d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102012:	ee                   	out    %al,(%dx)
80102013:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102018:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010201d:	eb 06                	jmp    80102025 <ideinit+0x55>
8010201f:	90                   	nop
80102020:	83 e9 01             	sub    $0x1,%ecx
80102023:	74 0f                	je     80102034 <ideinit+0x64>
80102025:	ec                   	in     (%dx),%al
80102026:	84 c0                	test   %al,%al
80102028:	74 f6                	je     80102020 <ideinit+0x50>
8010202a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102031:	00 00 00 
80102034:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102039:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010203e:	ee                   	out    %al,(%dx)
8010203f:	c9                   	leave  
80102040:	c3                   	ret    
80102041:	eb 0d                	jmp    80102050 <ideintr>
80102043:	90                   	nop
80102044:	90                   	nop
80102045:	90                   	nop
80102046:	90                   	nop
80102047:	90                   	nop
80102048:	90                   	nop
80102049:	90                   	nop
8010204a:	90                   	nop
8010204b:	90                   	nop
8010204c:	90                   	nop
8010204d:	90                   	nop
8010204e:	90                   	nop
8010204f:	90                   	nop

80102050 <ideintr>:
80102050:	55                   	push   %ebp
80102051:	89 e5                	mov    %esp,%ebp
80102053:	57                   	push   %edi
80102054:	56                   	push   %esi
80102055:	53                   	push   %ebx
80102056:	83 ec 18             	sub    $0x18,%esp
80102059:	68 80 a5 10 80       	push   $0x8010a580
8010205e:	e8 bd 22 00 00       	call   80104320 <acquire>
80102063:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102069:	83 c4 10             	add    $0x10,%esp
8010206c:	85 db                	test   %ebx,%ebx
8010206e:	74 34                	je     801020a4 <ideintr+0x54>
80102070:	8b 43 58             	mov    0x58(%ebx),%eax
80102073:	a3 64 a5 10 80       	mov    %eax,0x8010a564
80102078:	8b 33                	mov    (%ebx),%esi
8010207a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102080:	74 3e                	je     801020c0 <ideintr+0x70>
80102082:	83 e6 fb             	and    $0xfffffffb,%esi
80102085:	83 ec 0c             	sub    $0xc,%esp
80102088:	83 ce 02             	or     $0x2,%esi
8010208b:	89 33                	mov    %esi,(%ebx)
8010208d:	53                   	push   %ebx
8010208e:	e8 4d 1e 00 00       	call   80103ee0 <wakeup>
80102093:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102098:	83 c4 10             	add    $0x10,%esp
8010209b:	85 c0                	test   %eax,%eax
8010209d:	74 05                	je     801020a4 <ideintr+0x54>
8010209f:	e8 5c fe ff ff       	call   80101f00 <idestart>
801020a4:	83 ec 0c             	sub    $0xc,%esp
801020a7:	68 80 a5 10 80       	push   $0x8010a580
801020ac:	e8 1f 23 00 00       	call   801043d0 <release>
801020b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020b4:	5b                   	pop    %ebx
801020b5:	5e                   	pop    %esi
801020b6:	5f                   	pop    %edi
801020b7:	5d                   	pop    %ebp
801020b8:	c3                   	ret    
801020b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020c0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c5:	8d 76 00             	lea    0x0(%esi),%esi
801020c8:	ec                   	in     (%dx),%al
801020c9:	89 c1                	mov    %eax,%ecx
801020cb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ce:	80 f9 40             	cmp    $0x40,%cl
801020d1:	75 f5                	jne    801020c8 <ideintr+0x78>
801020d3:	a8 21                	test   $0x21,%al
801020d5:	75 ab                	jne    80102082 <ideintr+0x32>
801020d7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020da:	b9 80 00 00 00       	mov    $0x80,%ecx
801020df:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020e4:	fc                   	cld    
801020e5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020e7:	8b 33                	mov    (%ebx),%esi
801020e9:	eb 97                	jmp    80102082 <ideintr+0x32>
801020eb:	90                   	nop
801020ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020f0 <iderw>:
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	53                   	push   %ebx
801020f4:	83 ec 10             	sub    $0x10,%esp
801020f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801020fa:	8d 43 0c             	lea    0xc(%ebx),%eax
801020fd:	50                   	push   %eax
801020fe:	e8 6d 20 00 00       	call   80104170 <holdingsleep>
80102103:	83 c4 10             	add    $0x10,%esp
80102106:	85 c0                	test   %eax,%eax
80102108:	0f 84 ad 00 00 00    	je     801021bb <iderw+0xcb>
8010210e:	8b 03                	mov    (%ebx),%eax
80102110:	83 e0 06             	and    $0x6,%eax
80102113:	83 f8 02             	cmp    $0x2,%eax
80102116:	0f 84 b9 00 00 00    	je     801021d5 <iderw+0xe5>
8010211c:	8b 53 04             	mov    0x4(%ebx),%edx
8010211f:	85 d2                	test   %edx,%edx
80102121:	74 0d                	je     80102130 <iderw+0x40>
80102123:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102128:	85 c0                	test   %eax,%eax
8010212a:	0f 84 98 00 00 00    	je     801021c8 <iderw+0xd8>
80102130:	83 ec 0c             	sub    $0xc,%esp
80102133:	68 80 a5 10 80       	push   $0x8010a580
80102138:	e8 e3 21 00 00       	call   80104320 <acquire>
8010213d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102143:	83 c4 10             	add    $0x10,%esp
80102146:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010214d:	85 d2                	test   %edx,%edx
8010214f:	75 09                	jne    8010215a <iderw+0x6a>
80102151:	eb 58                	jmp    801021ab <iderw+0xbb>
80102153:	90                   	nop
80102154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102158:	89 c2                	mov    %eax,%edx
8010215a:	8b 42 58             	mov    0x58(%edx),%eax
8010215d:	85 c0                	test   %eax,%eax
8010215f:	75 f7                	jne    80102158 <iderw+0x68>
80102161:	83 c2 58             	add    $0x58,%edx
80102164:	89 1a                	mov    %ebx,(%edx)
80102166:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010216c:	74 44                	je     801021b2 <iderw+0xc2>
8010216e:	8b 03                	mov    (%ebx),%eax
80102170:	83 e0 06             	and    $0x6,%eax
80102173:	83 f8 02             	cmp    $0x2,%eax
80102176:	74 23                	je     8010219b <iderw+0xab>
80102178:	90                   	nop
80102179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102180:	83 ec 08             	sub    $0x8,%esp
80102183:	68 80 a5 10 80       	push   $0x8010a580
80102188:	53                   	push   %ebx
80102189:	e8 a2 1b 00 00       	call   80103d30 <sleep>
8010218e:	8b 03                	mov    (%ebx),%eax
80102190:	83 c4 10             	add    $0x10,%esp
80102193:	83 e0 06             	and    $0x6,%eax
80102196:	83 f8 02             	cmp    $0x2,%eax
80102199:	75 e5                	jne    80102180 <iderw+0x90>
8010219b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
801021a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021a5:	c9                   	leave  
801021a6:	e9 25 22 00 00       	jmp    801043d0 <release>
801021ab:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021b0:	eb b2                	jmp    80102164 <iderw+0x74>
801021b2:	89 d8                	mov    %ebx,%eax
801021b4:	e8 47 fd ff ff       	call   80101f00 <idestart>
801021b9:	eb b3                	jmp    8010216e <iderw+0x7e>
801021bb:	83 ec 0c             	sub    $0xc,%esp
801021be:	68 6a 71 10 80       	push   $0x8010716a
801021c3:	e8 a8 e1 ff ff       	call   80100370 <panic>
801021c8:	83 ec 0c             	sub    $0xc,%esp
801021cb:	68 95 71 10 80       	push   $0x80107195
801021d0:	e8 9b e1 ff ff       	call   80100370 <panic>
801021d5:	83 ec 0c             	sub    $0xc,%esp
801021d8:	68 80 71 10 80       	push   $0x80107180
801021dd:	e8 8e e1 ff ff       	call   80100370 <panic>
801021e2:	66 90                	xchg   %ax,%ax
801021e4:	66 90                	xchg   %ax,%ax
801021e6:	66 90                	xchg   %ax,%ax
801021e8:	66 90                	xchg   %ax,%ax
801021ea:	66 90                	xchg   %ax,%ax
801021ec:	66 90                	xchg   %ax,%ax
801021ee:	66 90                	xchg   %ax,%ax

801021f0 <ioapicinit>:
801021f0:	55                   	push   %ebp
801021f1:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
801021f8:	00 c0 fe 
801021fb:	89 e5                	mov    %esp,%ebp
801021fd:	56                   	push   %esi
801021fe:	53                   	push   %ebx
801021ff:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102206:	00 00 00 
80102209:	8b 15 34 26 11 80    	mov    0x80112634,%edx
8010220f:	8b 72 10             	mov    0x10(%edx),%esi
80102212:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102218:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010221e:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
80102225:	89 f0                	mov    %esi,%eax
80102227:	c1 e8 10             	shr    $0x10,%eax
8010222a:	0f b6 f0             	movzbl %al,%esi
8010222d:	8b 41 10             	mov    0x10(%ecx),%eax
80102230:	c1 e8 18             	shr    $0x18,%eax
80102233:	39 d0                	cmp    %edx,%eax
80102235:	74 16                	je     8010224d <ioapicinit+0x5d>
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 b4 71 10 80       	push   $0x801071b4
8010223f:	e8 1c e4 ff ff       	call   80100660 <cprintf>
80102244:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010224a:	83 c4 10             	add    $0x10,%esp
8010224d:	83 c6 21             	add    $0x21,%esi
80102250:	ba 10 00 00 00       	mov    $0x10,%edx
80102255:	b8 20 00 00 00       	mov    $0x20,%eax
8010225a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102260:	89 11                	mov    %edx,(%ecx)
80102262:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102268:	89 c3                	mov    %eax,%ebx
8010226a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102270:	83 c0 01             	add    $0x1,%eax
80102273:	89 59 10             	mov    %ebx,0x10(%ecx)
80102276:	8d 5a 01             	lea    0x1(%edx),%ebx
80102279:	83 c2 02             	add    $0x2,%edx
8010227c:	39 f0                	cmp    %esi,%eax
8010227e:	89 19                	mov    %ebx,(%ecx)
80102280:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102286:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010228d:	75 d1                	jne    80102260 <ioapicinit+0x70>
8010228f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102292:	5b                   	pop    %ebx
80102293:	5e                   	pop    %esi
80102294:	5d                   	pop    %ebp
80102295:	c3                   	ret    
80102296:	8d 76 00             	lea    0x0(%esi),%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022a0 <ioapicenable>:
801022a0:	55                   	push   %ebp
801022a1:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022a7:	89 e5                	mov    %esp,%ebp
801022a9:	8b 45 08             	mov    0x8(%ebp),%eax
801022ac:	8d 50 20             	lea    0x20(%eax),%edx
801022af:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022b3:	89 01                	mov    %eax,(%ecx)
801022b5:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022bb:	83 c0 01             	add    $0x1,%eax
801022be:	89 51 10             	mov    %edx,0x10(%ecx)
801022c1:	8b 55 0c             	mov    0xc(%ebp),%edx
801022c4:	89 01                	mov    %eax,(%ecx)
801022c6:	a1 34 26 11 80       	mov    0x80112634,%eax
801022cb:	c1 e2 18             	shl    $0x18,%edx
801022ce:	89 50 10             	mov    %edx,0x10(%eax)
801022d1:	5d                   	pop    %ebp
801022d2:	c3                   	ret    
801022d3:	66 90                	xchg   %ax,%ax
801022d5:	66 90                	xchg   %ax,%ax
801022d7:	66 90                	xchg   %ax,%ax
801022d9:	66 90                	xchg   %ax,%ax
801022db:	66 90                	xchg   %ax,%ax
801022dd:	66 90                	xchg   %ax,%ax
801022df:	90                   	nop

801022e0 <kfree>:
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 04             	sub    $0x4,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022ea:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022f0:	75 70                	jne    80102362 <kfree+0x82>
801022f2:	81 fb 28 55 11 80    	cmp    $0x80115528,%ebx
801022f8:	72 68                	jb     80102362 <kfree+0x82>
801022fa:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102300:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102305:	77 5b                	ja     80102362 <kfree+0x82>
80102307:	83 ec 04             	sub    $0x4,%esp
8010230a:	68 00 10 00 00       	push   $0x1000
8010230f:	6a 01                	push   $0x1
80102311:	53                   	push   %ebx
80102312:	e8 09 21 00 00       	call   80104420 <memset>
80102317:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010231d:	83 c4 10             	add    $0x10,%esp
80102320:	85 d2                	test   %edx,%edx
80102322:	75 2c                	jne    80102350 <kfree+0x70>
80102324:	a1 78 26 11 80       	mov    0x80112678,%eax
80102329:	89 03                	mov    %eax,(%ebx)
8010232b:	a1 74 26 11 80       	mov    0x80112674,%eax
80102330:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
80102336:	85 c0                	test   %eax,%eax
80102338:	75 06                	jne    80102340 <kfree+0x60>
8010233a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233d:	c9                   	leave  
8010233e:	c3                   	ret    
8010233f:	90                   	nop
80102340:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
80102347:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010234a:	c9                   	leave  
8010234b:	e9 80 20 00 00       	jmp    801043d0 <release>
80102350:	83 ec 0c             	sub    $0xc,%esp
80102353:	68 40 26 11 80       	push   $0x80112640
80102358:	e8 c3 1f 00 00       	call   80104320 <acquire>
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	eb c2                	jmp    80102324 <kfree+0x44>
80102362:	83 ec 0c             	sub    $0xc,%esp
80102365:	68 e6 71 10 80       	push   $0x801071e6
8010236a:	e8 01 e0 ff ff       	call   80100370 <panic>
8010236f:	90                   	nop

80102370 <freerange>:
80102370:	55                   	push   %ebp
80102371:	89 e5                	mov    %esp,%ebp
80102373:	56                   	push   %esi
80102374:	53                   	push   %ebx
80102375:	8b 45 08             	mov    0x8(%ebp),%eax
80102378:	8b 75 0c             	mov    0xc(%ebp),%esi
8010237b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102381:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102387:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010238d:	39 de                	cmp    %ebx,%esi
8010238f:	72 23                	jb     801023b4 <freerange+0x44>
80102391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102398:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010239e:	83 ec 0c             	sub    $0xc,%esp
801023a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023a7:	50                   	push   %eax
801023a8:	e8 33 ff ff ff       	call   801022e0 <kfree>
801023ad:	83 c4 10             	add    $0x10,%esp
801023b0:	39 f3                	cmp    %esi,%ebx
801023b2:	76 e4                	jbe    80102398 <freerange+0x28>
801023b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023b7:	5b                   	pop    %ebx
801023b8:	5e                   	pop    %esi
801023b9:	5d                   	pop    %ebp
801023ba:	c3                   	ret    
801023bb:	90                   	nop
801023bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023c0 <kinit1>:
801023c0:	55                   	push   %ebp
801023c1:	89 e5                	mov    %esp,%ebp
801023c3:	56                   	push   %esi
801023c4:	53                   	push   %ebx
801023c5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023c8:	83 ec 08             	sub    $0x8,%esp
801023cb:	68 ec 71 10 80       	push   $0x801071ec
801023d0:	68 40 26 11 80       	push   $0x80112640
801023d5:	e8 e6 1d 00 00       	call   801041c0 <initlock>
801023da:	8b 45 08             	mov    0x8(%ebp),%eax
801023dd:	83 c4 10             	add    $0x10,%esp
801023e0:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
801023e7:	00 00 00 
801023ea:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023f6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fc:	39 de                	cmp    %ebx,%esi
801023fe:	72 1c                	jb     8010241c <kinit1+0x5c>
80102400:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102406:	83 ec 0c             	sub    $0xc,%esp
80102409:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010240f:	50                   	push   %eax
80102410:	e8 cb fe ff ff       	call   801022e0 <kfree>
80102415:	83 c4 10             	add    $0x10,%esp
80102418:	39 de                	cmp    %ebx,%esi
8010241a:	73 e4                	jae    80102400 <kinit1+0x40>
8010241c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010241f:	5b                   	pop    %ebx
80102420:	5e                   	pop    %esi
80102421:	5d                   	pop    %ebp
80102422:	c3                   	ret    
80102423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102430 <kinit2>:
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx
80102435:	8b 45 08             	mov    0x8(%ebp),%eax
80102438:	8b 75 0c             	mov    0xc(%ebp),%esi
8010243b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102441:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102447:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244d:	39 de                	cmp    %ebx,%esi
8010244f:	72 23                	jb     80102474 <kinit2+0x44>
80102451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102458:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010245e:	83 ec 0c             	sub    $0xc,%esp
80102461:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102467:	50                   	push   %eax
80102468:	e8 73 fe ff ff       	call   801022e0 <kfree>
8010246d:	83 c4 10             	add    $0x10,%esp
80102470:	39 de                	cmp    %ebx,%esi
80102472:	73 e4                	jae    80102458 <kinit2+0x28>
80102474:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
8010247b:	00 00 00 
8010247e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102481:	5b                   	pop    %ebx
80102482:	5e                   	pop    %esi
80102483:	5d                   	pop    %ebp
80102484:	c3                   	ret    
80102485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102490 <kalloc>:
80102490:	55                   	push   %ebp
80102491:	89 e5                	mov    %esp,%ebp
80102493:	53                   	push   %ebx
80102494:	83 ec 04             	sub    $0x4,%esp
80102497:	a1 74 26 11 80       	mov    0x80112674,%eax
8010249c:	85 c0                	test   %eax,%eax
8010249e:	75 30                	jne    801024d0 <kalloc+0x40>
801024a0:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
801024a6:	85 db                	test   %ebx,%ebx
801024a8:	74 1c                	je     801024c6 <kalloc+0x36>
801024aa:	8b 13                	mov    (%ebx),%edx
801024ac:	89 15 78 26 11 80    	mov    %edx,0x80112678
801024b2:	85 c0                	test   %eax,%eax
801024b4:	74 10                	je     801024c6 <kalloc+0x36>
801024b6:	83 ec 0c             	sub    $0xc,%esp
801024b9:	68 40 26 11 80       	push   $0x80112640
801024be:	e8 0d 1f 00 00       	call   801043d0 <release>
801024c3:	83 c4 10             	add    $0x10,%esp
801024c6:	89 d8                	mov    %ebx,%eax
801024c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024cb:	c9                   	leave  
801024cc:	c3                   	ret    
801024cd:	8d 76 00             	lea    0x0(%esi),%esi
801024d0:	83 ec 0c             	sub    $0xc,%esp
801024d3:	68 40 26 11 80       	push   $0x80112640
801024d8:	e8 43 1e 00 00       	call   80104320 <acquire>
801024dd:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
801024e3:	83 c4 10             	add    $0x10,%esp
801024e6:	a1 74 26 11 80       	mov    0x80112674,%eax
801024eb:	85 db                	test   %ebx,%ebx
801024ed:	75 bb                	jne    801024aa <kalloc+0x1a>
801024ef:	eb c1                	jmp    801024b2 <kalloc+0x22>
801024f1:	66 90                	xchg   %ax,%ax
801024f3:	66 90                	xchg   %ax,%ax
801024f5:	66 90                	xchg   %ax,%ax
801024f7:	66 90                	xchg   %ax,%ax
801024f9:	66 90                	xchg   %ax,%ax
801024fb:	66 90                	xchg   %ax,%ax
801024fd:	66 90                	xchg   %ax,%ax
801024ff:	90                   	nop

80102500 <kbdgetc>:
80102500:	55                   	push   %ebp
80102501:	ba 64 00 00 00       	mov    $0x64,%edx
80102506:	89 e5                	mov    %esp,%ebp
80102508:	ec                   	in     (%dx),%al
80102509:	a8 01                	test   $0x1,%al
8010250b:	0f 84 af 00 00 00    	je     801025c0 <kbdgetc+0xc0>
80102511:	ba 60 00 00 00       	mov    $0x60,%edx
80102516:	ec                   	in     (%dx),%al
80102517:	0f b6 d0             	movzbl %al,%edx
8010251a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102520:	74 7e                	je     801025a0 <kbdgetc+0xa0>
80102522:	84 c0                	test   %al,%al
80102524:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010252a:	79 24                	jns    80102550 <kbdgetc+0x50>
8010252c:	f6 c1 40             	test   $0x40,%cl
8010252f:	75 05                	jne    80102536 <kbdgetc+0x36>
80102531:	89 c2                	mov    %eax,%edx
80102533:	83 e2 7f             	and    $0x7f,%edx
80102536:	0f b6 82 20 73 10 80 	movzbl -0x7fef8ce0(%edx),%eax
8010253d:	83 c8 40             	or     $0x40,%eax
80102540:	0f b6 c0             	movzbl %al,%eax
80102543:	f7 d0                	not    %eax
80102545:	21 c8                	and    %ecx,%eax
80102547:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010254c:	31 c0                	xor    %eax,%eax
8010254e:	5d                   	pop    %ebp
8010254f:	c3                   	ret    
80102550:	f6 c1 40             	test   $0x40,%cl
80102553:	74 09                	je     8010255e <kbdgetc+0x5e>
80102555:	83 c8 80             	or     $0xffffff80,%eax
80102558:	83 e1 bf             	and    $0xffffffbf,%ecx
8010255b:	0f b6 d0             	movzbl %al,%edx
8010255e:	0f b6 82 20 73 10 80 	movzbl -0x7fef8ce0(%edx),%eax
80102565:	09 c1                	or     %eax,%ecx
80102567:	0f b6 82 20 72 10 80 	movzbl -0x7fef8de0(%edx),%eax
8010256e:	31 c1                	xor    %eax,%ecx
80102570:	89 c8                	mov    %ecx,%eax
80102572:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102578:	83 e0 03             	and    $0x3,%eax
8010257b:	83 e1 08             	and    $0x8,%ecx
8010257e:	8b 04 85 00 72 10 80 	mov    -0x7fef8e00(,%eax,4),%eax
80102585:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102589:	74 c3                	je     8010254e <kbdgetc+0x4e>
8010258b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010258e:	83 fa 19             	cmp    $0x19,%edx
80102591:	77 1d                	ja     801025b0 <kbdgetc+0xb0>
80102593:	83 e8 20             	sub    $0x20,%eax
80102596:	5d                   	pop    %ebp
80102597:	c3                   	ret    
80102598:	90                   	nop
80102599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025a0:	31 c0                	xor    %eax,%eax
801025a2:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
801025a9:	5d                   	pop    %ebp
801025aa:	c3                   	ret    
801025ab:	90                   	nop
801025ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025b0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025b3:	8d 50 20             	lea    0x20(%eax),%edx
801025b6:	5d                   	pop    %ebp
801025b7:	83 f9 19             	cmp    $0x19,%ecx
801025ba:	0f 46 c2             	cmovbe %edx,%eax
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax
801025c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025c5:	5d                   	pop    %ebp
801025c6:	c3                   	ret    
801025c7:	89 f6                	mov    %esi,%esi
801025c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025d0 <kbdintr>:
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	83 ec 14             	sub    $0x14,%esp
801025d6:	68 00 25 10 80       	push   $0x80102500
801025db:	e8 10 e2 ff ff       	call   801007f0 <consoleintr>
801025e0:	83 c4 10             	add    $0x10,%esp
801025e3:	c9                   	leave  
801025e4:	c3                   	ret    
801025e5:	66 90                	xchg   %ax,%ax
801025e7:	66 90                	xchg   %ax,%ax
801025e9:	66 90                	xchg   %ax,%ax
801025eb:	66 90                	xchg   %ax,%ax
801025ed:	66 90                	xchg   %ax,%ax
801025ef:	90                   	nop

801025f0 <lapicinit>:
801025f0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801025f5:	55                   	push   %ebp
801025f6:	89 e5                	mov    %esp,%ebp
801025f8:	85 c0                	test   %eax,%eax
801025fa:	0f 84 c8 00 00 00    	je     801026c8 <lapicinit+0xd8>
80102600:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102607:	01 00 00 
8010260a:	8b 50 20             	mov    0x20(%eax),%edx
8010260d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102614:	00 00 00 
80102617:	8b 50 20             	mov    0x20(%eax),%edx
8010261a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102621:	00 02 00 
80102624:	8b 50 20             	mov    0x20(%eax),%edx
80102627:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010262e:	96 98 00 
80102631:	8b 50 20             	mov    0x20(%eax),%edx
80102634:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010263b:	00 01 00 
8010263e:	8b 50 20             	mov    0x20(%eax),%edx
80102641:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102648:	00 01 00 
8010264b:	8b 50 20             	mov    0x20(%eax),%edx
8010264e:	8b 50 30             	mov    0x30(%eax),%edx
80102651:	c1 ea 10             	shr    $0x10,%edx
80102654:	80 fa 03             	cmp    $0x3,%dl
80102657:	77 77                	ja     801026d0 <lapicinit+0xe0>
80102659:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102660:	00 00 00 
80102663:	8b 50 20             	mov    0x20(%eax),%edx
80102666:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266d:	00 00 00 
80102670:	8b 50 20             	mov    0x20(%eax),%edx
80102673:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010267a:	00 00 00 
8010267d:	8b 50 20             	mov    0x20(%eax),%edx
80102680:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102687:	00 00 00 
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
8010268d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102694:	00 00 00 
80102697:	8b 50 20             	mov    0x20(%eax),%edx
8010269a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026a1:	85 08 00 
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
801026a7:	89 f6                	mov    %esi,%esi
801026a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026b0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026b6:	80 e6 10             	and    $0x10,%dh
801026b9:	75 f5                	jne    801026b0 <lapicinit+0xc0>
801026bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026c2:	00 00 00 
801026c5:	8b 40 20             	mov    0x20(%eax),%eax
801026c8:	5d                   	pop    %ebp
801026c9:	c3                   	ret    
801026ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026d0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026d7:	00 01 00 
801026da:	8b 50 20             	mov    0x20(%eax),%edx
801026dd:	e9 77 ff ff ff       	jmp    80102659 <lapicinit+0x69>
801026e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026f0 <lapicid>:
801026f0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801026f5:	55                   	push   %ebp
801026f6:	89 e5                	mov    %esp,%ebp
801026f8:	85 c0                	test   %eax,%eax
801026fa:	74 0c                	je     80102708 <lapicid+0x18>
801026fc:	8b 40 20             	mov    0x20(%eax),%eax
801026ff:	5d                   	pop    %ebp
80102700:	c1 e8 18             	shr    $0x18,%eax
80102703:	c3                   	ret    
80102704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102708:	31 c0                	xor    %eax,%eax
8010270a:	5d                   	pop    %ebp
8010270b:	c3                   	ret    
8010270c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102710 <lapiceoi>:
80102710:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102715:	55                   	push   %ebp
80102716:	89 e5                	mov    %esp,%ebp
80102718:	85 c0                	test   %eax,%eax
8010271a:	74 0d                	je     80102729 <lapiceoi+0x19>
8010271c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102723:	00 00 00 
80102726:	8b 40 20             	mov    0x20(%eax),%eax
80102729:	5d                   	pop    %ebp
8010272a:	c3                   	ret    
8010272b:	90                   	nop
8010272c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102730 <microdelay>:
80102730:	55                   	push   %ebp
80102731:	89 e5                	mov    %esp,%ebp
80102733:	5d                   	pop    %ebp
80102734:	c3                   	ret    
80102735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicstartap>:
80102740:	55                   	push   %ebp
80102741:	ba 70 00 00 00       	mov    $0x70,%edx
80102746:	b8 0f 00 00 00       	mov    $0xf,%eax
8010274b:	89 e5                	mov    %esp,%ebp
8010274d:	53                   	push   %ebx
8010274e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102751:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102754:	ee                   	out    %al,(%dx)
80102755:	ba 71 00 00 00       	mov    $0x71,%edx
8010275a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010275f:	ee                   	out    %al,(%dx)
80102760:	31 c0                	xor    %eax,%eax
80102762:	c1 e3 18             	shl    $0x18,%ebx
80102765:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010276b:	89 c8                	mov    %ecx,%eax
8010276d:	c1 e9 0c             	shr    $0xc,%ecx
80102770:	c1 e8 04             	shr    $0x4,%eax
80102773:	89 da                	mov    %ebx,%edx
80102775:	80 cd 06             	or     $0x6,%ch
80102778:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010277e:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102783:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102789:	8b 58 20             	mov    0x20(%eax),%ebx
8010278c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102793:	c5 00 00 
80102796:	8b 58 20             	mov    0x20(%eax),%ebx
80102799:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027a0:	85 00 00 
801027a3:	8b 58 20             	mov    0x20(%eax),%ebx
801027a6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ac:	8b 58 20             	mov    0x20(%eax),%ebx
801027af:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027b5:	8b 58 20             	mov    0x20(%eax),%ebx
801027b8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027be:	8b 50 20             	mov    0x20(%eax),%edx
801027c1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027c7:	8b 40 20             	mov    0x20(%eax),%eax
801027ca:	5b                   	pop    %ebx
801027cb:	5d                   	pop    %ebp
801027cc:	c3                   	ret    
801027cd:	8d 76 00             	lea    0x0(%esi),%esi

801027d0 <cmostime>:
801027d0:	55                   	push   %ebp
801027d1:	ba 70 00 00 00       	mov    $0x70,%edx
801027d6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027db:	89 e5                	mov    %esp,%ebp
801027dd:	57                   	push   %edi
801027de:	56                   	push   %esi
801027df:	53                   	push   %ebx
801027e0:	83 ec 4c             	sub    $0x4c,%esp
801027e3:	ee                   	out    %al,(%dx)
801027e4:	ba 71 00 00 00       	mov    $0x71,%edx
801027e9:	ec                   	in     (%dx),%al
801027ea:	83 e0 04             	and    $0x4,%eax
801027ed:	8d 75 d0             	lea    -0x30(%ebp),%esi
801027f0:	31 db                	xor    %ebx,%ebx
801027f2:	88 45 b7             	mov    %al,-0x49(%ebp)
801027f5:	bf 70 00 00 00       	mov    $0x70,%edi
801027fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102800:	89 d8                	mov    %ebx,%eax
80102802:	89 fa                	mov    %edi,%edx
80102804:	ee                   	out    %al,(%dx)
80102805:	b9 71 00 00 00       	mov    $0x71,%ecx
8010280a:	89 ca                	mov    %ecx,%edx
8010280c:	ec                   	in     (%dx),%al
8010280d:	0f b6 c0             	movzbl %al,%eax
80102810:	89 fa                	mov    %edi,%edx
80102812:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102815:	b8 02 00 00 00       	mov    $0x2,%eax
8010281a:	ee                   	out    %al,(%dx)
8010281b:	89 ca                	mov    %ecx,%edx
8010281d:	ec                   	in     (%dx),%al
8010281e:	0f b6 c0             	movzbl %al,%eax
80102821:	89 fa                	mov    %edi,%edx
80102823:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102826:	b8 04 00 00 00       	mov    $0x4,%eax
8010282b:	ee                   	out    %al,(%dx)
8010282c:	89 ca                	mov    %ecx,%edx
8010282e:	ec                   	in     (%dx),%al
8010282f:	0f b6 c0             	movzbl %al,%eax
80102832:	89 fa                	mov    %edi,%edx
80102834:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102837:	b8 07 00 00 00       	mov    $0x7,%eax
8010283c:	ee                   	out    %al,(%dx)
8010283d:	89 ca                	mov    %ecx,%edx
8010283f:	ec                   	in     (%dx),%al
80102840:	0f b6 c0             	movzbl %al,%eax
80102843:	89 fa                	mov    %edi,%edx
80102845:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102848:	b8 08 00 00 00       	mov    $0x8,%eax
8010284d:	ee                   	out    %al,(%dx)
8010284e:	89 ca                	mov    %ecx,%edx
80102850:	ec                   	in     (%dx),%al
80102851:	0f b6 c0             	movzbl %al,%eax
80102854:	89 fa                	mov    %edi,%edx
80102856:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102859:	b8 09 00 00 00       	mov    $0x9,%eax
8010285e:	ee                   	out    %al,(%dx)
8010285f:	89 ca                	mov    %ecx,%edx
80102861:	ec                   	in     (%dx),%al
80102862:	0f b6 c0             	movzbl %al,%eax
80102865:	89 fa                	mov    %edi,%edx
80102867:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010286a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010286f:	ee                   	out    %al,(%dx)
80102870:	89 ca                	mov    %ecx,%edx
80102872:	ec                   	in     (%dx),%al
80102873:	84 c0                	test   %al,%al
80102875:	78 89                	js     80102800 <cmostime+0x30>
80102877:	89 d8                	mov    %ebx,%eax
80102879:	89 fa                	mov    %edi,%edx
8010287b:	ee                   	out    %al,(%dx)
8010287c:	89 ca                	mov    %ecx,%edx
8010287e:	ec                   	in     (%dx),%al
8010287f:	0f b6 c0             	movzbl %al,%eax
80102882:	89 fa                	mov    %edi,%edx
80102884:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102887:	b8 02 00 00 00       	mov    $0x2,%eax
8010288c:	ee                   	out    %al,(%dx)
8010288d:	89 ca                	mov    %ecx,%edx
8010288f:	ec                   	in     (%dx),%al
80102890:	0f b6 c0             	movzbl %al,%eax
80102893:	89 fa                	mov    %edi,%edx
80102895:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102898:	b8 04 00 00 00       	mov    $0x4,%eax
8010289d:	ee                   	out    %al,(%dx)
8010289e:	89 ca                	mov    %ecx,%edx
801028a0:	ec                   	in     (%dx),%al
801028a1:	0f b6 c0             	movzbl %al,%eax
801028a4:	89 fa                	mov    %edi,%edx
801028a6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028a9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ae:	ee                   	out    %al,(%dx)
801028af:	89 ca                	mov    %ecx,%edx
801028b1:	ec                   	in     (%dx),%al
801028b2:	0f b6 c0             	movzbl %al,%eax
801028b5:	89 fa                	mov    %edi,%edx
801028b7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028ba:	b8 08 00 00 00       	mov    $0x8,%eax
801028bf:	ee                   	out    %al,(%dx)
801028c0:	89 ca                	mov    %ecx,%edx
801028c2:	ec                   	in     (%dx),%al
801028c3:	0f b6 c0             	movzbl %al,%eax
801028c6:	89 fa                	mov    %edi,%edx
801028c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028cb:	b8 09 00 00 00       	mov    $0x9,%eax
801028d0:	ee                   	out    %al,(%dx)
801028d1:	89 ca                	mov    %ecx,%edx
801028d3:	ec                   	in     (%dx),%al
801028d4:	0f b6 c0             	movzbl %al,%eax
801028d7:	83 ec 04             	sub    $0x4,%esp
801028da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801028dd:	8d 45 b8             	lea    -0x48(%ebp),%eax
801028e0:	6a 18                	push   $0x18
801028e2:	56                   	push   %esi
801028e3:	50                   	push   %eax
801028e4:	e8 87 1b 00 00       	call   80104470 <memcmp>
801028e9:	83 c4 10             	add    $0x10,%esp
801028ec:	85 c0                	test   %eax,%eax
801028ee:	0f 85 0c ff ff ff    	jne    80102800 <cmostime+0x30>
801028f4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028f8:	75 78                	jne    80102972 <cmostime+0x1a2>
801028fa:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028fd:	89 c2                	mov    %eax,%edx
801028ff:	83 e0 0f             	and    $0xf,%eax
80102902:	c1 ea 04             	shr    $0x4,%edx
80102905:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102908:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290b:	89 45 b8             	mov    %eax,-0x48(%ebp)
8010290e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102911:	89 c2                	mov    %eax,%edx
80102913:	83 e0 0f             	and    $0xf,%eax
80102916:	c1 ea 04             	shr    $0x4,%edx
80102919:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010291c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010291f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102922:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102925:	89 c2                	mov    %eax,%edx
80102927:	83 e0 0f             	and    $0xf,%eax
8010292a:	c1 ea 04             	shr    $0x4,%edx
8010292d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102930:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102933:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102936:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102939:	89 c2                	mov    %eax,%edx
8010293b:	83 e0 0f             	and    $0xf,%eax
8010293e:	c1 ea 04             	shr    $0x4,%edx
80102941:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102944:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102947:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010294a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010294d:	89 c2                	mov    %eax,%edx
8010294f:	83 e0 0f             	and    $0xf,%eax
80102952:	c1 ea 04             	shr    $0x4,%edx
80102955:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102958:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295b:	89 45 c8             	mov    %eax,-0x38(%ebp)
8010295e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102961:	89 c2                	mov    %eax,%edx
80102963:	83 e0 0f             	and    $0xf,%eax
80102966:	c1 ea 04             	shr    $0x4,%edx
80102969:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010296c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296f:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102972:	8b 75 08             	mov    0x8(%ebp),%esi
80102975:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102978:	89 06                	mov    %eax,(%esi)
8010297a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010297d:	89 46 04             	mov    %eax,0x4(%esi)
80102980:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102983:	89 46 08             	mov    %eax,0x8(%esi)
80102986:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102989:	89 46 0c             	mov    %eax,0xc(%esi)
8010298c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010298f:	89 46 10             	mov    %eax,0x10(%esi)
80102992:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102995:	89 46 14             	mov    %eax,0x14(%esi)
80102998:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
8010299f:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029a2:	5b                   	pop    %ebx
801029a3:	5e                   	pop    %esi
801029a4:	5f                   	pop    %edi
801029a5:	5d                   	pop    %ebp
801029a6:	c3                   	ret    
801029a7:	66 90                	xchg   %ax,%ax
801029a9:	66 90                	xchg   %ax,%ax
801029ab:	66 90                	xchg   %ax,%ax
801029ad:	66 90                	xchg   %ax,%ax
801029af:	90                   	nop

801029b0 <install_trans>:
801029b0:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
801029b6:	85 c9                	test   %ecx,%ecx
801029b8:	0f 8e 85 00 00 00    	jle    80102a43 <install_trans+0x93>
801029be:	55                   	push   %ebp
801029bf:	89 e5                	mov    %esp,%ebp
801029c1:	57                   	push   %edi
801029c2:	56                   	push   %esi
801029c3:	53                   	push   %ebx
801029c4:	31 db                	xor    %ebx,%ebx
801029c6:	83 ec 0c             	sub    $0xc,%esp
801029c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801029d0:	a1 b4 26 11 80       	mov    0x801126b4,%eax
801029d5:	83 ec 08             	sub    $0x8,%esp
801029d8:	01 d8                	add    %ebx,%eax
801029da:	83 c0 01             	add    $0x1,%eax
801029dd:	50                   	push   %eax
801029de:	ff 35 c4 26 11 80    	pushl  0x801126c4
801029e4:	e8 e7 d6 ff ff       	call   801000d0 <bread>
801029e9:	89 c7                	mov    %eax,%edi
801029eb:	58                   	pop    %eax
801029ec:	5a                   	pop    %edx
801029ed:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
801029f4:	ff 35 c4 26 11 80    	pushl  0x801126c4
801029fa:	83 c3 01             	add    $0x1,%ebx
801029fd:	e8 ce d6 ff ff       	call   801000d0 <bread>
80102a02:	89 c6                	mov    %eax,%esi
80102a04:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a07:	83 c4 0c             	add    $0xc,%esp
80102a0a:	68 00 02 00 00       	push   $0x200
80102a0f:	50                   	push   %eax
80102a10:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a13:	50                   	push   %eax
80102a14:	e8 b7 1a 00 00       	call   801044d0 <memmove>
80102a19:	89 34 24             	mov    %esi,(%esp)
80102a1c:	e8 7f d7 ff ff       	call   801001a0 <bwrite>
80102a21:	89 3c 24             	mov    %edi,(%esp)
80102a24:	e8 b7 d7 ff ff       	call   801001e0 <brelse>
80102a29:	89 34 24             	mov    %esi,(%esp)
80102a2c:	e8 af d7 ff ff       	call   801001e0 <brelse>
80102a31:	83 c4 10             	add    $0x10,%esp
80102a34:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a3a:	7f 94                	jg     801029d0 <install_trans+0x20>
80102a3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a3f:	5b                   	pop    %ebx
80102a40:	5e                   	pop    %esi
80102a41:	5f                   	pop    %edi
80102a42:	5d                   	pop    %ebp
80102a43:	f3 c3                	repz ret 
80102a45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a50 <write_head>:
80102a50:	55                   	push   %ebp
80102a51:	89 e5                	mov    %esp,%ebp
80102a53:	53                   	push   %ebx
80102a54:	83 ec 0c             	sub    $0xc,%esp
80102a57:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102a5d:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a63:	e8 68 d6 ff ff       	call   801000d0 <bread>
80102a68:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102a6e:	83 c4 10             	add    $0x10,%esp
80102a71:	89 c3                	mov    %eax,%ebx
80102a73:	85 c9                	test   %ecx,%ecx
80102a75:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102a78:	7e 1f                	jle    80102a99 <write_head+0x49>
80102a7a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102a81:	31 d2                	xor    %edx,%edx
80102a83:	90                   	nop
80102a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a88:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102a8e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102a92:	83 c2 04             	add    $0x4,%edx
80102a95:	39 c2                	cmp    %eax,%edx
80102a97:	75 ef                	jne    80102a88 <write_head+0x38>
80102a99:	83 ec 0c             	sub    $0xc,%esp
80102a9c:	53                   	push   %ebx
80102a9d:	e8 fe d6 ff ff       	call   801001a0 <bwrite>
80102aa2:	89 1c 24             	mov    %ebx,(%esp)
80102aa5:	e8 36 d7 ff ff       	call   801001e0 <brelse>
80102aaa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102aad:	c9                   	leave  
80102aae:	c3                   	ret    
80102aaf:	90                   	nop

80102ab0 <initlog>:
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	53                   	push   %ebx
80102ab4:	83 ec 2c             	sub    $0x2c,%esp
80102ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102aba:	68 20 74 10 80       	push   $0x80107420
80102abf:	68 80 26 11 80       	push   $0x80112680
80102ac4:	e8 f7 16 00 00       	call   801041c0 <initlock>
80102ac9:	58                   	pop    %eax
80102aca:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102acd:	5a                   	pop    %edx
80102ace:	50                   	push   %eax
80102acf:	53                   	push   %ebx
80102ad0:	e8 db e8 ff ff       	call   801013b0 <readsb>
80102ad5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102ad8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102adb:	59                   	pop    %ecx
80102adc:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
80102ae2:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
80102ae8:	a3 b4 26 11 80       	mov    %eax,0x801126b4
80102aed:	5a                   	pop    %edx
80102aee:	50                   	push   %eax
80102aef:	53                   	push   %ebx
80102af0:	e8 db d5 ff ff       	call   801000d0 <bread>
80102af5:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102af8:	83 c4 10             	add    $0x10,%esp
80102afb:	85 c9                	test   %ecx,%ecx
80102afd:	89 0d c8 26 11 80    	mov    %ecx,0x801126c8
80102b03:	7e 1c                	jle    80102b21 <initlog+0x71>
80102b05:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b0c:	31 d2                	xor    %edx,%edx
80102b0e:	66 90                	xchg   %ax,%ax
80102b10:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b14:	83 c2 04             	add    $0x4,%edx
80102b17:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
80102b1d:	39 da                	cmp    %ebx,%edx
80102b1f:	75 ef                	jne    80102b10 <initlog+0x60>
80102b21:	83 ec 0c             	sub    $0xc,%esp
80102b24:	50                   	push   %eax
80102b25:	e8 b6 d6 ff ff       	call   801001e0 <brelse>
80102b2a:	e8 81 fe ff ff       	call   801029b0 <install_trans>
80102b2f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b36:	00 00 00 
80102b39:	e8 12 ff ff ff       	call   80102a50 <write_head>
80102b3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b41:	c9                   	leave  
80102b42:	c3                   	ret    
80102b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b50 <begin_op>:
80102b50:	55                   	push   %ebp
80102b51:	89 e5                	mov    %esp,%ebp
80102b53:	83 ec 14             	sub    $0x14,%esp
80102b56:	68 80 26 11 80       	push   $0x80112680
80102b5b:	e8 c0 17 00 00       	call   80104320 <acquire>
80102b60:	83 c4 10             	add    $0x10,%esp
80102b63:	eb 18                	jmp    80102b7d <begin_op+0x2d>
80102b65:	8d 76 00             	lea    0x0(%esi),%esi
80102b68:	83 ec 08             	sub    $0x8,%esp
80102b6b:	68 80 26 11 80       	push   $0x80112680
80102b70:	68 80 26 11 80       	push   $0x80112680
80102b75:	e8 b6 11 00 00       	call   80103d30 <sleep>
80102b7a:	83 c4 10             	add    $0x10,%esp
80102b7d:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102b82:	85 c0                	test   %eax,%eax
80102b84:	75 e2                	jne    80102b68 <begin_op+0x18>
80102b86:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102b8b:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102b91:	83 c0 01             	add    $0x1,%eax
80102b94:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b97:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b9a:	83 fa 1e             	cmp    $0x1e,%edx
80102b9d:	7f c9                	jg     80102b68 <begin_op+0x18>
80102b9f:	83 ec 0c             	sub    $0xc,%esp
80102ba2:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102ba7:	68 80 26 11 80       	push   $0x80112680
80102bac:	e8 1f 18 00 00       	call   801043d0 <release>
80102bb1:	83 c4 10             	add    $0x10,%esp
80102bb4:	c9                   	leave  
80102bb5:	c3                   	ret    
80102bb6:	8d 76 00             	lea    0x0(%esi),%esi
80102bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bc0 <end_op>:
80102bc0:	55                   	push   %ebp
80102bc1:	89 e5                	mov    %esp,%ebp
80102bc3:	57                   	push   %edi
80102bc4:	56                   	push   %esi
80102bc5:	53                   	push   %ebx
80102bc6:	83 ec 18             	sub    $0x18,%esp
80102bc9:	68 80 26 11 80       	push   $0x80112680
80102bce:	e8 4d 17 00 00       	call   80104320 <acquire>
80102bd3:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102bd8:	8b 1d c0 26 11 80    	mov    0x801126c0,%ebx
80102bde:	83 c4 10             	add    $0x10,%esp
80102be1:	83 e8 01             	sub    $0x1,%eax
80102be4:	85 db                	test   %ebx,%ebx
80102be6:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102beb:	0f 85 23 01 00 00    	jne    80102d14 <end_op+0x154>
80102bf1:	85 c0                	test   %eax,%eax
80102bf3:	0f 85 f7 00 00 00    	jne    80102cf0 <end_op+0x130>
80102bf9:	83 ec 0c             	sub    $0xc,%esp
80102bfc:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102c03:	00 00 00 
80102c06:	31 db                	xor    %ebx,%ebx
80102c08:	68 80 26 11 80       	push   $0x80112680
80102c0d:	e8 be 17 00 00       	call   801043d0 <release>
80102c12:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102c18:	83 c4 10             	add    $0x10,%esp
80102c1b:	85 c9                	test   %ecx,%ecx
80102c1d:	0f 8e 8a 00 00 00    	jle    80102cad <end_op+0xed>
80102c23:	90                   	nop
80102c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c28:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c2d:	83 ec 08             	sub    $0x8,%esp
80102c30:	01 d8                	add    %ebx,%eax
80102c32:	83 c0 01             	add    $0x1,%eax
80102c35:	50                   	push   %eax
80102c36:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c3c:	e8 8f d4 ff ff       	call   801000d0 <bread>
80102c41:	89 c6                	mov    %eax,%esi
80102c43:	58                   	pop    %eax
80102c44:	5a                   	pop    %edx
80102c45:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102c4c:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c52:	83 c3 01             	add    $0x1,%ebx
80102c55:	e8 76 d4 ff ff       	call   801000d0 <bread>
80102c5a:	89 c7                	mov    %eax,%edi
80102c5c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c5f:	83 c4 0c             	add    $0xc,%esp
80102c62:	68 00 02 00 00       	push   $0x200
80102c67:	50                   	push   %eax
80102c68:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c6b:	50                   	push   %eax
80102c6c:	e8 5f 18 00 00       	call   801044d0 <memmove>
80102c71:	89 34 24             	mov    %esi,(%esp)
80102c74:	e8 27 d5 ff ff       	call   801001a0 <bwrite>
80102c79:	89 3c 24             	mov    %edi,(%esp)
80102c7c:	e8 5f d5 ff ff       	call   801001e0 <brelse>
80102c81:	89 34 24             	mov    %esi,(%esp)
80102c84:	e8 57 d5 ff ff       	call   801001e0 <brelse>
80102c89:	83 c4 10             	add    $0x10,%esp
80102c8c:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102c92:	7c 94                	jl     80102c28 <end_op+0x68>
80102c94:	e8 b7 fd ff ff       	call   80102a50 <write_head>
80102c99:	e8 12 fd ff ff       	call   801029b0 <install_trans>
80102c9e:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102ca5:	00 00 00 
80102ca8:	e8 a3 fd ff ff       	call   80102a50 <write_head>
80102cad:	83 ec 0c             	sub    $0xc,%esp
80102cb0:	68 80 26 11 80       	push   $0x80112680
80102cb5:	e8 66 16 00 00       	call   80104320 <acquire>
80102cba:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cc1:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102cc8:	00 00 00 
80102ccb:	e8 10 12 00 00       	call   80103ee0 <wakeup>
80102cd0:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cd7:	e8 f4 16 00 00       	call   801043d0 <release>
80102cdc:	83 c4 10             	add    $0x10,%esp
80102cdf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ce2:	5b                   	pop    %ebx
80102ce3:	5e                   	pop    %esi
80102ce4:	5f                   	pop    %edi
80102ce5:	5d                   	pop    %ebp
80102ce6:	c3                   	ret    
80102ce7:	89 f6                	mov    %esi,%esi
80102ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102cf0:	83 ec 0c             	sub    $0xc,%esp
80102cf3:	68 80 26 11 80       	push   $0x80112680
80102cf8:	e8 e3 11 00 00       	call   80103ee0 <wakeup>
80102cfd:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d04:	e8 c7 16 00 00       	call   801043d0 <release>
80102d09:	83 c4 10             	add    $0x10,%esp
80102d0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d0f:	5b                   	pop    %ebx
80102d10:	5e                   	pop    %esi
80102d11:	5f                   	pop    %edi
80102d12:	5d                   	pop    %ebp
80102d13:	c3                   	ret    
80102d14:	83 ec 0c             	sub    $0xc,%esp
80102d17:	68 24 74 10 80       	push   $0x80107424
80102d1c:	e8 4f d6 ff ff       	call   80100370 <panic>
80102d21:	eb 0d                	jmp    80102d30 <log_write>
80102d23:	90                   	nop
80102d24:	90                   	nop
80102d25:	90                   	nop
80102d26:	90                   	nop
80102d27:	90                   	nop
80102d28:	90                   	nop
80102d29:	90                   	nop
80102d2a:	90                   	nop
80102d2b:	90                   	nop
80102d2c:	90                   	nop
80102d2d:	90                   	nop
80102d2e:	90                   	nop
80102d2f:	90                   	nop

80102d30 <log_write>:
80102d30:	55                   	push   %ebp
80102d31:	89 e5                	mov    %esp,%ebp
80102d33:	53                   	push   %ebx
80102d34:	83 ec 04             	sub    $0x4,%esp
80102d37:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d40:	83 fa 1d             	cmp    $0x1d,%edx
80102d43:	0f 8f 97 00 00 00    	jg     80102de0 <log_write+0xb0>
80102d49:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d4e:	83 e8 01             	sub    $0x1,%eax
80102d51:	39 c2                	cmp    %eax,%edx
80102d53:	0f 8d 87 00 00 00    	jge    80102de0 <log_write+0xb0>
80102d59:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102d5e:	85 c0                	test   %eax,%eax
80102d60:	0f 8e 87 00 00 00    	jle    80102ded <log_write+0xbd>
80102d66:	83 ec 0c             	sub    $0xc,%esp
80102d69:	68 80 26 11 80       	push   $0x80112680
80102d6e:	e8 ad 15 00 00       	call   80104320 <acquire>
80102d73:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d79:	83 c4 10             	add    $0x10,%esp
80102d7c:	83 fa 00             	cmp    $0x0,%edx
80102d7f:	7e 50                	jle    80102dd1 <log_write+0xa1>
80102d81:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102d84:	31 c0                	xor    %eax,%eax
80102d86:	3b 0d cc 26 11 80    	cmp    0x801126cc,%ecx
80102d8c:	75 0b                	jne    80102d99 <log_write+0x69>
80102d8e:	eb 38                	jmp    80102dc8 <log_write+0x98>
80102d90:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102d97:	74 2f                	je     80102dc8 <log_write+0x98>
80102d99:	83 c0 01             	add    $0x1,%eax
80102d9c:	39 d0                	cmp    %edx,%eax
80102d9e:	75 f0                	jne    80102d90 <log_write+0x60>
80102da0:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
80102da7:	83 c2 01             	add    $0x1,%edx
80102daa:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
80102db0:	83 0b 04             	orl    $0x4,(%ebx)
80102db3:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
80102dba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dbd:	c9                   	leave  
80102dbe:	e9 0d 16 00 00       	jmp    801043d0 <release>
80102dc3:	90                   	nop
80102dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102dc8:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102dcf:	eb df                	jmp    80102db0 <log_write+0x80>
80102dd1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dd4:	a3 cc 26 11 80       	mov    %eax,0x801126cc
80102dd9:	75 d5                	jne    80102db0 <log_write+0x80>
80102ddb:	eb ca                	jmp    80102da7 <log_write+0x77>
80102ddd:	8d 76 00             	lea    0x0(%esi),%esi
80102de0:	83 ec 0c             	sub    $0xc,%esp
80102de3:	68 33 74 10 80       	push   $0x80107433
80102de8:	e8 83 d5 ff ff       	call   80100370 <panic>
80102ded:	83 ec 0c             	sub    $0xc,%esp
80102df0:	68 49 74 10 80       	push   $0x80107449
80102df5:	e8 76 d5 ff ff       	call   80100370 <panic>
80102dfa:	66 90                	xchg   %ax,%ax
80102dfc:	66 90                	xchg   %ax,%ax
80102dfe:	66 90                	xchg   %ax,%ax

80102e00 <mpmain>:
80102e00:	55                   	push   %ebp
80102e01:	89 e5                	mov    %esp,%ebp
80102e03:	53                   	push   %ebx
80102e04:	83 ec 04             	sub    $0x4,%esp
80102e07:	e8 54 09 00 00       	call   80103760 <cpuid>
80102e0c:	89 c3                	mov    %eax,%ebx
80102e0e:	e8 4d 09 00 00       	call   80103760 <cpuid>
80102e13:	83 ec 04             	sub    $0x4,%esp
80102e16:	53                   	push   %ebx
80102e17:	50                   	push   %eax
80102e18:	68 64 74 10 80       	push   $0x80107464
80102e1d:	e8 3e d8 ff ff       	call   80100660 <cprintf>
80102e22:	e8 59 29 00 00       	call   80105780 <idtinit>
80102e27:	e8 b4 08 00 00       	call   801036e0 <mycpu>
80102e2c:	89 c2                	mov    %eax,%edx
80102e2e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e33:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102e3a:	e8 01 0c 00 00       	call   80103a40 <scheduler>
80102e3f:	90                   	nop

80102e40 <mpenter>:
80102e40:	55                   	push   %ebp
80102e41:	89 e5                	mov    %esp,%ebp
80102e43:	83 ec 08             	sub    $0x8,%esp
80102e46:	e8 55 3a 00 00       	call   801068a0 <switchkvm>
80102e4b:	e8 50 39 00 00       	call   801067a0 <seginit>
80102e50:	e8 9b f7 ff ff       	call   801025f0 <lapicinit>
80102e55:	e8 a6 ff ff ff       	call   80102e00 <mpmain>
80102e5a:	66 90                	xchg   %ax,%ax
80102e5c:	66 90                	xchg   %ax,%ax
80102e5e:	66 90                	xchg   %ax,%ax

80102e60 <main>:
80102e60:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e64:	83 e4 f0             	and    $0xfffffff0,%esp
80102e67:	ff 71 fc             	pushl  -0x4(%ecx)
80102e6a:	55                   	push   %ebp
80102e6b:	89 e5                	mov    %esp,%ebp
80102e6d:	53                   	push   %ebx
80102e6e:	51                   	push   %ecx
80102e6f:	bb 80 27 11 80       	mov    $0x80112780,%ebx
80102e74:	83 ec 08             	sub    $0x8,%esp
80102e77:	68 00 00 40 80       	push   $0x80400000
80102e7c:	68 28 55 11 80       	push   $0x80115528
80102e81:	e8 3a f5 ff ff       	call   801023c0 <kinit1>
80102e86:	e8 b5 3e 00 00       	call   80106d40 <kvmalloc>
80102e8b:	e8 70 01 00 00       	call   80103000 <mpinit>
80102e90:	e8 5b f7 ff ff       	call   801025f0 <lapicinit>
80102e95:	e8 06 39 00 00       	call   801067a0 <seginit>
80102e9a:	e8 31 03 00 00       	call   801031d0 <picinit>
80102e9f:	e8 4c f3 ff ff       	call   801021f0 <ioapicinit>
80102ea4:	e8 f7 da ff ff       	call   801009a0 <consoleinit>
80102ea9:	e8 c2 2b 00 00       	call   80105a70 <uartinit>
80102eae:	e8 0d 08 00 00       	call   801036c0 <pinit>
80102eb3:	e8 28 28 00 00       	call   801056e0 <tvinit>
80102eb8:	e8 83 d1 ff ff       	call   80100040 <binit>
80102ebd:	e8 8e de ff ff       	call   80100d50 <fileinit>
80102ec2:	e8 09 f1 ff ff       	call   80101fd0 <ideinit>
80102ec7:	83 c4 0c             	add    $0xc,%esp
80102eca:	68 8a 00 00 00       	push   $0x8a
80102ecf:	68 8c a4 10 80       	push   $0x8010a48c
80102ed4:	68 00 70 00 80       	push   $0x80007000
80102ed9:	e8 f2 15 00 00       	call   801044d0 <memmove>
80102ede:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102ee5:	00 00 00 
80102ee8:	83 c4 10             	add    $0x10,%esp
80102eeb:	05 80 27 11 80       	add    $0x80112780,%eax
80102ef0:	39 d8                	cmp    %ebx,%eax
80102ef2:	76 6f                	jbe    80102f63 <main+0x103>
80102ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ef8:	e8 e3 07 00 00       	call   801036e0 <mycpu>
80102efd:	39 d8                	cmp    %ebx,%eax
80102eff:	74 49                	je     80102f4a <main+0xea>
80102f01:	e8 8a f5 ff ff       	call   80102490 <kalloc>
80102f06:	05 00 10 00 00       	add    $0x1000,%eax
80102f0b:	c7 05 f8 6f 00 80 40 	movl   $0x80102e40,0x80006ff8
80102f12:	2e 10 80 
80102f15:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f1c:	90 10 00 
80102f1f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f24:	0f b6 03             	movzbl (%ebx),%eax
80102f27:	83 ec 08             	sub    $0x8,%esp
80102f2a:	68 00 70 00 00       	push   $0x7000
80102f2f:	50                   	push   %eax
80102f30:	e8 0b f8 ff ff       	call   80102740 <lapicstartap>
80102f35:	83 c4 10             	add    $0x10,%esp
80102f38:	90                   	nop
80102f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f40:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f46:	85 c0                	test   %eax,%eax
80102f48:	74 f6                	je     80102f40 <main+0xe0>
80102f4a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f51:	00 00 00 
80102f54:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f5a:	05 80 27 11 80       	add    $0x80112780,%eax
80102f5f:	39 c3                	cmp    %eax,%ebx
80102f61:	72 95                	jb     80102ef8 <main+0x98>
80102f63:	83 ec 08             	sub    $0x8,%esp
80102f66:	68 00 00 00 8e       	push   $0x8e000000
80102f6b:	68 00 00 40 80       	push   $0x80400000
80102f70:	e8 bb f4 ff ff       	call   80102430 <kinit2>
80102f75:	e8 36 08 00 00       	call   801037b0 <userinit>
80102f7a:	e8 81 fe ff ff       	call   80102e00 <mpmain>
80102f7f:	90                   	nop

80102f80 <mpsearch1>:
80102f80:	55                   	push   %ebp
80102f81:	89 e5                	mov    %esp,%ebp
80102f83:	57                   	push   %edi
80102f84:	56                   	push   %esi
80102f85:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102f8b:	53                   	push   %ebx
80102f8c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80102f8f:	83 ec 0c             	sub    $0xc,%esp
80102f92:	39 de                	cmp    %ebx,%esi
80102f94:	73 48                	jae    80102fde <mpsearch1+0x5e>
80102f96:	8d 76 00             	lea    0x0(%esi),%esi
80102f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102fa0:	83 ec 04             	sub    $0x4,%esp
80102fa3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fa6:	6a 04                	push   $0x4
80102fa8:	68 78 74 10 80       	push   $0x80107478
80102fad:	56                   	push   %esi
80102fae:	e8 bd 14 00 00       	call   80104470 <memcmp>
80102fb3:	83 c4 10             	add    $0x10,%esp
80102fb6:	85 c0                	test   %eax,%eax
80102fb8:	75 1e                	jne    80102fd8 <mpsearch1+0x58>
80102fba:	8d 7e 10             	lea    0x10(%esi),%edi
80102fbd:	89 f2                	mov    %esi,%edx
80102fbf:	31 c9                	xor    %ecx,%ecx
80102fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102fc8:	0f b6 02             	movzbl (%edx),%eax
80102fcb:	83 c2 01             	add    $0x1,%edx
80102fce:	01 c1                	add    %eax,%ecx
80102fd0:	39 fa                	cmp    %edi,%edx
80102fd2:	75 f4                	jne    80102fc8 <mpsearch1+0x48>
80102fd4:	84 c9                	test   %cl,%cl
80102fd6:	74 10                	je     80102fe8 <mpsearch1+0x68>
80102fd8:	39 fb                	cmp    %edi,%ebx
80102fda:	89 fe                	mov    %edi,%esi
80102fdc:	77 c2                	ja     80102fa0 <mpsearch1+0x20>
80102fde:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fe1:	31 c0                	xor    %eax,%eax
80102fe3:	5b                   	pop    %ebx
80102fe4:	5e                   	pop    %esi
80102fe5:	5f                   	pop    %edi
80102fe6:	5d                   	pop    %ebp
80102fe7:	c3                   	ret    
80102fe8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102feb:	89 f0                	mov    %esi,%eax
80102fed:	5b                   	pop    %ebx
80102fee:	5e                   	pop    %esi
80102fef:	5f                   	pop    %edi
80102ff0:	5d                   	pop    %ebp
80102ff1:	c3                   	ret    
80102ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103000 <mpinit>:
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	57                   	push   %edi
80103004:	56                   	push   %esi
80103005:	53                   	push   %ebx
80103006:	83 ec 1c             	sub    $0x1c,%esp
80103009:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103010:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103017:	c1 e0 08             	shl    $0x8,%eax
8010301a:	09 d0                	or     %edx,%eax
8010301c:	c1 e0 04             	shl    $0x4,%eax
8010301f:	85 c0                	test   %eax,%eax
80103021:	75 1b                	jne    8010303e <mpinit+0x3e>
80103023:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010302a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103031:	c1 e0 08             	shl    $0x8,%eax
80103034:	09 d0                	or     %edx,%eax
80103036:	c1 e0 0a             	shl    $0xa,%eax
80103039:	2d 00 04 00 00       	sub    $0x400,%eax
8010303e:	ba 00 04 00 00       	mov    $0x400,%edx
80103043:	e8 38 ff ff ff       	call   80102f80 <mpsearch1>
80103048:	85 c0                	test   %eax,%eax
8010304a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010304d:	0f 84 37 01 00 00    	je     8010318a <mpinit+0x18a>
80103053:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103056:	8b 58 04             	mov    0x4(%eax),%ebx
80103059:	85 db                	test   %ebx,%ebx
8010305b:	0f 84 43 01 00 00    	je     801031a4 <mpinit+0x1a4>
80103061:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
80103067:	83 ec 04             	sub    $0x4,%esp
8010306a:	6a 04                	push   $0x4
8010306c:	68 7d 74 10 80       	push   $0x8010747d
80103071:	56                   	push   %esi
80103072:	e8 f9 13 00 00       	call   80104470 <memcmp>
80103077:	83 c4 10             	add    $0x10,%esp
8010307a:	85 c0                	test   %eax,%eax
8010307c:	0f 85 22 01 00 00    	jne    801031a4 <mpinit+0x1a4>
80103082:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103089:	3c 01                	cmp    $0x1,%al
8010308b:	74 08                	je     80103095 <mpinit+0x95>
8010308d:	3c 04                	cmp    $0x4,%al
8010308f:	0f 85 0f 01 00 00    	jne    801031a4 <mpinit+0x1a4>
80103095:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010309c:	85 ff                	test   %edi,%edi
8010309e:	74 21                	je     801030c1 <mpinit+0xc1>
801030a0:	31 d2                	xor    %edx,%edx
801030a2:	31 c0                	xor    %eax,%eax
801030a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801030a8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801030af:	80 
801030b0:	83 c0 01             	add    $0x1,%eax
801030b3:	01 ca                	add    %ecx,%edx
801030b5:	39 c7                	cmp    %eax,%edi
801030b7:	75 ef                	jne    801030a8 <mpinit+0xa8>
801030b9:	84 d2                	test   %dl,%dl
801030bb:	0f 85 e3 00 00 00    	jne    801031a4 <mpinit+0x1a4>
801030c1:	85 f6                	test   %esi,%esi
801030c3:	0f 84 db 00 00 00    	je     801031a4 <mpinit+0x1a4>
801030c9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030cf:	a3 7c 26 11 80       	mov    %eax,0x8011267c
801030d4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030db:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801030e1:	bb 01 00 00 00       	mov    $0x1,%ebx
801030e6:	01 d6                	add    %edx,%esi
801030e8:	90                   	nop
801030e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030f0:	39 c6                	cmp    %eax,%esi
801030f2:	76 23                	jbe    80103117 <mpinit+0x117>
801030f4:	0f b6 10             	movzbl (%eax),%edx
801030f7:	80 fa 04             	cmp    $0x4,%dl
801030fa:	0f 87 c0 00 00 00    	ja     801031c0 <mpinit+0x1c0>
80103100:	ff 24 95 bc 74 10 80 	jmp    *-0x7fef8b44(,%edx,4)
80103107:	89 f6                	mov    %esi,%esi
80103109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103110:	83 c0 08             	add    $0x8,%eax
80103113:	39 c6                	cmp    %eax,%esi
80103115:	77 dd                	ja     801030f4 <mpinit+0xf4>
80103117:	85 db                	test   %ebx,%ebx
80103119:	0f 84 92 00 00 00    	je     801031b1 <mpinit+0x1b1>
8010311f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103122:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103126:	74 15                	je     8010313d <mpinit+0x13d>
80103128:	ba 22 00 00 00       	mov    $0x22,%edx
8010312d:	b8 70 00 00 00       	mov    $0x70,%eax
80103132:	ee                   	out    %al,(%dx)
80103133:	ba 23 00 00 00       	mov    $0x23,%edx
80103138:	ec                   	in     (%dx),%al
80103139:	83 c8 01             	or     $0x1,%eax
8010313c:	ee                   	out    %al,(%dx)
8010313d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103140:	5b                   	pop    %ebx
80103141:	5e                   	pop    %esi
80103142:	5f                   	pop    %edi
80103143:	5d                   	pop    %ebp
80103144:	c3                   	ret    
80103145:	8d 76 00             	lea    0x0(%esi),%esi
80103148:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
8010314e:	83 f9 07             	cmp    $0x7,%ecx
80103151:	7f 19                	jg     8010316c <mpinit+0x16c>
80103153:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103157:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
8010315d:	83 c1 01             	add    $0x1,%ecx
80103160:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
80103166:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
8010316c:	83 c0 14             	add    $0x14,%eax
8010316f:	e9 7c ff ff ff       	jmp    801030f0 <mpinit+0xf0>
80103174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
8010317c:	83 c0 08             	add    $0x8,%eax
8010317f:	88 15 60 27 11 80    	mov    %dl,0x80112760
80103185:	e9 66 ff ff ff       	jmp    801030f0 <mpinit+0xf0>
8010318a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010318f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103194:	e8 e7 fd ff ff       	call   80102f80 <mpsearch1>
80103199:	85 c0                	test   %eax,%eax
8010319b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010319e:	0f 85 af fe ff ff    	jne    80103053 <mpinit+0x53>
801031a4:	83 ec 0c             	sub    $0xc,%esp
801031a7:	68 82 74 10 80       	push   $0x80107482
801031ac:	e8 bf d1 ff ff       	call   80100370 <panic>
801031b1:	83 ec 0c             	sub    $0xc,%esp
801031b4:	68 9c 74 10 80       	push   $0x8010749c
801031b9:	e8 b2 d1 ff ff       	call   80100370 <panic>
801031be:	66 90                	xchg   %ax,%ax
801031c0:	31 db                	xor    %ebx,%ebx
801031c2:	e9 30 ff ff ff       	jmp    801030f7 <mpinit+0xf7>
801031c7:	66 90                	xchg   %ax,%ax
801031c9:	66 90                	xchg   %ax,%ax
801031cb:	66 90                	xchg   %ax,%ax
801031cd:	66 90                	xchg   %ax,%ax
801031cf:	90                   	nop

801031d0 <picinit>:
801031d0:	55                   	push   %ebp
801031d1:	ba 21 00 00 00       	mov    $0x21,%edx
801031d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031db:	89 e5                	mov    %esp,%ebp
801031dd:	ee                   	out    %al,(%dx)
801031de:	ba a1 00 00 00       	mov    $0xa1,%edx
801031e3:	ee                   	out    %al,(%dx)
801031e4:	5d                   	pop    %ebp
801031e5:	c3                   	ret    
801031e6:	66 90                	xchg   %ax,%ax
801031e8:	66 90                	xchg   %ax,%ax
801031ea:	66 90                	xchg   %ax,%ax
801031ec:	66 90                	xchg   %ax,%ax
801031ee:	66 90                	xchg   %ax,%ax

801031f0 <pipealloc>:
801031f0:	55                   	push   %ebp
801031f1:	89 e5                	mov    %esp,%ebp
801031f3:	57                   	push   %edi
801031f4:	56                   	push   %esi
801031f5:	53                   	push   %ebx
801031f6:	83 ec 0c             	sub    $0xc,%esp
801031f9:	8b 75 08             	mov    0x8(%ebp),%esi
801031fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801031ff:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103205:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010320b:	e8 60 db ff ff       	call   80100d70 <filealloc>
80103210:	85 c0                	test   %eax,%eax
80103212:	89 06                	mov    %eax,(%esi)
80103214:	0f 84 a8 00 00 00    	je     801032c2 <pipealloc+0xd2>
8010321a:	e8 51 db ff ff       	call   80100d70 <filealloc>
8010321f:	85 c0                	test   %eax,%eax
80103221:	89 03                	mov    %eax,(%ebx)
80103223:	0f 84 87 00 00 00    	je     801032b0 <pipealloc+0xc0>
80103229:	e8 62 f2 ff ff       	call   80102490 <kalloc>
8010322e:	85 c0                	test   %eax,%eax
80103230:	89 c7                	mov    %eax,%edi
80103232:	0f 84 b0 00 00 00    	je     801032e8 <pipealloc+0xf8>
80103238:	83 ec 08             	sub    $0x8,%esp
8010323b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103242:	00 00 00 
80103245:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010324c:	00 00 00 
8010324f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103256:	00 00 00 
80103259:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103260:	00 00 00 
80103263:	68 d0 74 10 80       	push   $0x801074d0
80103268:	50                   	push   %eax
80103269:	e8 52 0f 00 00       	call   801041c0 <initlock>
8010326e:	8b 06                	mov    (%esi),%eax
80103270:	83 c4 10             	add    $0x10,%esp
80103273:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103279:	8b 06                	mov    (%esi),%eax
8010327b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
8010327f:	8b 06                	mov    (%esi),%eax
80103281:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103285:	8b 06                	mov    (%esi),%eax
80103287:	89 78 0c             	mov    %edi,0xc(%eax)
8010328a:	8b 03                	mov    (%ebx),%eax
8010328c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103292:	8b 03                	mov    (%ebx),%eax
80103294:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103298:	8b 03                	mov    (%ebx),%eax
8010329a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010329e:	8b 03                	mov    (%ebx),%eax
801032a0:	89 78 0c             	mov    %edi,0xc(%eax)
801032a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032a6:	31 c0                	xor    %eax,%eax
801032a8:	5b                   	pop    %ebx
801032a9:	5e                   	pop    %esi
801032aa:	5f                   	pop    %edi
801032ab:	5d                   	pop    %ebp
801032ac:	c3                   	ret    
801032ad:	8d 76 00             	lea    0x0(%esi),%esi
801032b0:	8b 06                	mov    (%esi),%eax
801032b2:	85 c0                	test   %eax,%eax
801032b4:	74 1e                	je     801032d4 <pipealloc+0xe4>
801032b6:	83 ec 0c             	sub    $0xc,%esp
801032b9:	50                   	push   %eax
801032ba:	e8 71 db ff ff       	call   80100e30 <fileclose>
801032bf:	83 c4 10             	add    $0x10,%esp
801032c2:	8b 03                	mov    (%ebx),%eax
801032c4:	85 c0                	test   %eax,%eax
801032c6:	74 0c                	je     801032d4 <pipealloc+0xe4>
801032c8:	83 ec 0c             	sub    $0xc,%esp
801032cb:	50                   	push   %eax
801032cc:	e8 5f db ff ff       	call   80100e30 <fileclose>
801032d1:	83 c4 10             	add    $0x10,%esp
801032d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032dc:	5b                   	pop    %ebx
801032dd:	5e                   	pop    %esi
801032de:	5f                   	pop    %edi
801032df:	5d                   	pop    %ebp
801032e0:	c3                   	ret    
801032e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801032e8:	8b 06                	mov    (%esi),%eax
801032ea:	85 c0                	test   %eax,%eax
801032ec:	75 c8                	jne    801032b6 <pipealloc+0xc6>
801032ee:	eb d2                	jmp    801032c2 <pipealloc+0xd2>

801032f0 <pipeclose>:
801032f0:	55                   	push   %ebp
801032f1:	89 e5                	mov    %esp,%ebp
801032f3:	56                   	push   %esi
801032f4:	53                   	push   %ebx
801032f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032f8:	8b 75 0c             	mov    0xc(%ebp),%esi
801032fb:	83 ec 0c             	sub    $0xc,%esp
801032fe:	53                   	push   %ebx
801032ff:	e8 1c 10 00 00       	call   80104320 <acquire>
80103304:	83 c4 10             	add    $0x10,%esp
80103307:	85 f6                	test   %esi,%esi
80103309:	74 45                	je     80103350 <pipeclose+0x60>
8010330b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103311:	83 ec 0c             	sub    $0xc,%esp
80103314:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010331b:	00 00 00 
8010331e:	50                   	push   %eax
8010331f:	e8 bc 0b 00 00       	call   80103ee0 <wakeup>
80103324:	83 c4 10             	add    $0x10,%esp
80103327:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010332d:	85 d2                	test   %edx,%edx
8010332f:	75 0a                	jne    8010333b <pipeclose+0x4b>
80103331:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103337:	85 c0                	test   %eax,%eax
80103339:	74 35                	je     80103370 <pipeclose+0x80>
8010333b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010333e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103341:	5b                   	pop    %ebx
80103342:	5e                   	pop    %esi
80103343:	5d                   	pop    %ebp
80103344:	e9 87 10 00 00       	jmp    801043d0 <release>
80103349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103350:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103356:	83 ec 0c             	sub    $0xc,%esp
80103359:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103360:	00 00 00 
80103363:	50                   	push   %eax
80103364:	e8 77 0b 00 00       	call   80103ee0 <wakeup>
80103369:	83 c4 10             	add    $0x10,%esp
8010336c:	eb b9                	jmp    80103327 <pipeclose+0x37>
8010336e:	66 90                	xchg   %ax,%ax
80103370:	83 ec 0c             	sub    $0xc,%esp
80103373:	53                   	push   %ebx
80103374:	e8 57 10 00 00       	call   801043d0 <release>
80103379:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010337c:	83 c4 10             	add    $0x10,%esp
8010337f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103382:	5b                   	pop    %ebx
80103383:	5e                   	pop    %esi
80103384:	5d                   	pop    %ebp
80103385:	e9 56 ef ff ff       	jmp    801022e0 <kfree>
8010338a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103390 <pipewrite>:
80103390:	55                   	push   %ebp
80103391:	89 e5                	mov    %esp,%ebp
80103393:	57                   	push   %edi
80103394:	56                   	push   %esi
80103395:	53                   	push   %ebx
80103396:	83 ec 28             	sub    $0x28,%esp
80103399:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010339c:	53                   	push   %ebx
8010339d:	e8 7e 0f 00 00       	call   80104320 <acquire>
801033a2:	8b 45 10             	mov    0x10(%ebp),%eax
801033a5:	83 c4 10             	add    $0x10,%esp
801033a8:	85 c0                	test   %eax,%eax
801033aa:	0f 8e b9 00 00 00    	jle    80103469 <pipewrite+0xd9>
801033b0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033b3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801033b9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801033bf:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033c8:	03 4d 10             	add    0x10(%ebp),%ecx
801033cb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801033ce:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033d4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033da:	39 d0                	cmp    %edx,%eax
801033dc:	74 38                	je     80103416 <pipewrite+0x86>
801033de:	eb 59                	jmp    80103439 <pipewrite+0xa9>
801033e0:	e8 9b 03 00 00       	call   80103780 <myproc>
801033e5:	8b 48 24             	mov    0x24(%eax),%ecx
801033e8:	85 c9                	test   %ecx,%ecx
801033ea:	75 34                	jne    80103420 <pipewrite+0x90>
801033ec:	83 ec 0c             	sub    $0xc,%esp
801033ef:	57                   	push   %edi
801033f0:	e8 eb 0a 00 00       	call   80103ee0 <wakeup>
801033f5:	58                   	pop    %eax
801033f6:	5a                   	pop    %edx
801033f7:	53                   	push   %ebx
801033f8:	56                   	push   %esi
801033f9:	e8 32 09 00 00       	call   80103d30 <sleep>
801033fe:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103404:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010340a:	83 c4 10             	add    $0x10,%esp
8010340d:	05 00 02 00 00       	add    $0x200,%eax
80103412:	39 c2                	cmp    %eax,%edx
80103414:	75 2a                	jne    80103440 <pipewrite+0xb0>
80103416:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010341c:	85 c0                	test   %eax,%eax
8010341e:	75 c0                	jne    801033e0 <pipewrite+0x50>
80103420:	83 ec 0c             	sub    $0xc,%esp
80103423:	53                   	push   %ebx
80103424:	e8 a7 0f 00 00       	call   801043d0 <release>
80103429:	83 c4 10             	add    $0x10,%esp
8010342c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103431:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103434:	5b                   	pop    %ebx
80103435:	5e                   	pop    %esi
80103436:	5f                   	pop    %edi
80103437:	5d                   	pop    %ebp
80103438:	c3                   	ret    
80103439:	89 c2                	mov    %eax,%edx
8010343b:	90                   	nop
8010343c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103440:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103443:	8d 42 01             	lea    0x1(%edx),%eax
80103446:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010344a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103450:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103456:	0f b6 09             	movzbl (%ecx),%ecx
80103459:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010345d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103460:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103463:	0f 85 65 ff ff ff    	jne    801033ce <pipewrite+0x3e>
80103469:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010346f:	83 ec 0c             	sub    $0xc,%esp
80103472:	50                   	push   %eax
80103473:	e8 68 0a 00 00       	call   80103ee0 <wakeup>
80103478:	89 1c 24             	mov    %ebx,(%esp)
8010347b:	e8 50 0f 00 00       	call   801043d0 <release>
80103480:	83 c4 10             	add    $0x10,%esp
80103483:	8b 45 10             	mov    0x10(%ebp),%eax
80103486:	eb a9                	jmp    80103431 <pipewrite+0xa1>
80103488:	90                   	nop
80103489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103490 <piperead>:
80103490:	55                   	push   %ebp
80103491:	89 e5                	mov    %esp,%ebp
80103493:	57                   	push   %edi
80103494:	56                   	push   %esi
80103495:	53                   	push   %ebx
80103496:	83 ec 18             	sub    $0x18,%esp
80103499:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010349c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010349f:	53                   	push   %ebx
801034a0:	e8 7b 0e 00 00       	call   80104320 <acquire>
801034a5:	83 c4 10             	add    $0x10,%esp
801034a8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034ae:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034b4:	75 6a                	jne    80103520 <piperead+0x90>
801034b6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034bc:	85 f6                	test   %esi,%esi
801034be:	0f 84 cc 00 00 00    	je     80103590 <piperead+0x100>
801034c4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801034ca:	eb 2d                	jmp    801034f9 <piperead+0x69>
801034cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034d0:	83 ec 08             	sub    $0x8,%esp
801034d3:	53                   	push   %ebx
801034d4:	56                   	push   %esi
801034d5:	e8 56 08 00 00       	call   80103d30 <sleep>
801034da:	83 c4 10             	add    $0x10,%esp
801034dd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034e3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801034e9:	75 35                	jne    80103520 <piperead+0x90>
801034eb:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801034f1:	85 d2                	test   %edx,%edx
801034f3:	0f 84 97 00 00 00    	je     80103590 <piperead+0x100>
801034f9:	e8 82 02 00 00       	call   80103780 <myproc>
801034fe:	8b 48 24             	mov    0x24(%eax),%ecx
80103501:	85 c9                	test   %ecx,%ecx
80103503:	74 cb                	je     801034d0 <piperead+0x40>
80103505:	83 ec 0c             	sub    $0xc,%esp
80103508:	53                   	push   %ebx
80103509:	e8 c2 0e 00 00       	call   801043d0 <release>
8010350e:	83 c4 10             	add    $0x10,%esp
80103511:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103514:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103519:	5b                   	pop    %ebx
8010351a:	5e                   	pop    %esi
8010351b:	5f                   	pop    %edi
8010351c:	5d                   	pop    %ebp
8010351d:	c3                   	ret    
8010351e:	66 90                	xchg   %ax,%ax
80103520:	8b 45 10             	mov    0x10(%ebp),%eax
80103523:	85 c0                	test   %eax,%eax
80103525:	7e 69                	jle    80103590 <piperead+0x100>
80103527:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010352d:	31 c9                	xor    %ecx,%ecx
8010352f:	eb 15                	jmp    80103546 <piperead+0xb6>
80103531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103538:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010353e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103544:	74 5a                	je     801035a0 <piperead+0x110>
80103546:	8d 70 01             	lea    0x1(%eax),%esi
80103549:	25 ff 01 00 00       	and    $0x1ff,%eax
8010354e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103554:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103559:	88 04 0f             	mov    %al,(%edi,%ecx,1)
8010355c:	83 c1 01             	add    $0x1,%ecx
8010355f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103562:	75 d4                	jne    80103538 <piperead+0xa8>
80103564:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010356a:	83 ec 0c             	sub    $0xc,%esp
8010356d:	50                   	push   %eax
8010356e:	e8 6d 09 00 00       	call   80103ee0 <wakeup>
80103573:	89 1c 24             	mov    %ebx,(%esp)
80103576:	e8 55 0e 00 00       	call   801043d0 <release>
8010357b:	8b 45 10             	mov    0x10(%ebp),%eax
8010357e:	83 c4 10             	add    $0x10,%esp
80103581:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103584:	5b                   	pop    %ebx
80103585:	5e                   	pop    %esi
80103586:	5f                   	pop    %edi
80103587:	5d                   	pop    %ebp
80103588:	c3                   	ret    
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103590:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103597:	eb cb                	jmp    80103564 <piperead+0xd4>
80103599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035a0:	89 4d 10             	mov    %ecx,0x10(%ebp)
801035a3:	eb bf                	jmp    80103564 <piperead+0xd4>
801035a5:	66 90                	xchg   %ax,%ax
801035a7:	66 90                	xchg   %ax,%ax
801035a9:	66 90                	xchg   %ax,%ax
801035ab:	66 90                	xchg   %ax,%ax
801035ad:	66 90                	xchg   %ax,%ax
801035af:	90                   	nop

801035b0 <allocproc>:
801035b0:	55                   	push   %ebp
801035b1:	89 e5                	mov    %esp,%ebp
801035b3:	53                   	push   %ebx
801035b4:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
801035b9:	83 ec 10             	sub    $0x10,%esp
801035bc:	68 20 2d 11 80       	push   $0x80112d20
801035c1:	e8 5a 0d 00 00       	call   80104320 <acquire>
801035c6:	83 c4 10             	add    $0x10,%esp
801035c9:	eb 10                	jmp    801035db <allocproc+0x2b>
801035cb:	90                   	nop
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035d0:	83 c3 7c             	add    $0x7c,%ebx
801035d3:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
801035d9:	74 75                	je     80103650 <allocproc+0xa0>
801035db:	8b 43 0c             	mov    0xc(%ebx),%eax
801035de:	85 c0                	test   %eax,%eax
801035e0:	75 ee                	jne    801035d0 <allocproc+0x20>
801035e2:	a1 04 a0 10 80       	mov    0x8010a004,%eax
801035e7:	83 ec 0c             	sub    $0xc,%esp
801035ea:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
801035f1:	68 20 2d 11 80       	push   $0x80112d20
801035f6:	8d 50 01             	lea    0x1(%eax),%edx
801035f9:	89 43 10             	mov    %eax,0x10(%ebx)
801035fc:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
80103602:	e8 c9 0d 00 00       	call   801043d0 <release>
80103607:	e8 84 ee ff ff       	call   80102490 <kalloc>
8010360c:	83 c4 10             	add    $0x10,%esp
8010360f:	85 c0                	test   %eax,%eax
80103611:	89 43 08             	mov    %eax,0x8(%ebx)
80103614:	74 51                	je     80103667 <allocproc+0xb7>
80103616:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
8010361c:	83 ec 04             	sub    $0x4,%esp
8010361f:	05 9c 0f 00 00       	add    $0xf9c,%eax
80103624:	89 53 18             	mov    %edx,0x18(%ebx)
80103627:	c7 40 14 ce 56 10 80 	movl   $0x801056ce,0x14(%eax)
8010362e:	6a 14                	push   $0x14
80103630:	6a 00                	push   $0x0
80103632:	50                   	push   %eax
80103633:	89 43 1c             	mov    %eax,0x1c(%ebx)
80103636:	e8 e5 0d 00 00       	call   80104420 <memset>
8010363b:	8b 43 1c             	mov    0x1c(%ebx),%eax
8010363e:	83 c4 10             	add    $0x10,%esp
80103641:	c7 40 10 70 36 10 80 	movl   $0x80103670,0x10(%eax)
80103648:	89 d8                	mov    %ebx,%eax
8010364a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010364d:	c9                   	leave  
8010364e:	c3                   	ret    
8010364f:	90                   	nop
80103650:	83 ec 0c             	sub    $0xc,%esp
80103653:	68 20 2d 11 80       	push   $0x80112d20
80103658:	e8 73 0d 00 00       	call   801043d0 <release>
8010365d:	83 c4 10             	add    $0x10,%esp
80103660:	31 c0                	xor    %eax,%eax
80103662:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103665:	c9                   	leave  
80103666:	c3                   	ret    
80103667:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010366e:	eb da                	jmp    8010364a <allocproc+0x9a>

80103670 <forkret>:
80103670:	55                   	push   %ebp
80103671:	89 e5                	mov    %esp,%ebp
80103673:	83 ec 14             	sub    $0x14,%esp
80103676:	68 20 2d 11 80       	push   $0x80112d20
8010367b:	e8 50 0d 00 00       	call   801043d0 <release>
80103680:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103685:	83 c4 10             	add    $0x10,%esp
80103688:	85 c0                	test   %eax,%eax
8010368a:	75 04                	jne    80103690 <forkret+0x20>
8010368c:	c9                   	leave  
8010368d:	c3                   	ret    
8010368e:	66 90                	xchg   %ax,%ax
80103690:	83 ec 0c             	sub    $0xc,%esp
80103693:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010369a:	00 00 00 
8010369d:	6a 01                	push   $0x1
8010369f:	e8 cc dd ff ff       	call   80101470 <iinit>
801036a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801036ab:	e8 00 f4 ff ff       	call   80102ab0 <initlog>
801036b0:	83 c4 10             	add    $0x10,%esp
801036b3:	c9                   	leave  
801036b4:	c3                   	ret    
801036b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036c0 <pinit>:
801036c0:	55                   	push   %ebp
801036c1:	89 e5                	mov    %esp,%ebp
801036c3:	83 ec 10             	sub    $0x10,%esp
801036c6:	68 d5 74 10 80       	push   $0x801074d5
801036cb:	68 20 2d 11 80       	push   $0x80112d20
801036d0:	e8 eb 0a 00 00       	call   801041c0 <initlock>
801036d5:	83 c4 10             	add    $0x10,%esp
801036d8:	c9                   	leave  
801036d9:	c3                   	ret    
801036da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801036e0 <mycpu>:
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	56                   	push   %esi
801036e4:	53                   	push   %ebx
801036e5:	9c                   	pushf  
801036e6:	58                   	pop    %eax
801036e7:	f6 c4 02             	test   $0x2,%ah
801036ea:	75 5b                	jne    80103747 <mycpu+0x67>
801036ec:	e8 ff ef ff ff       	call   801026f0 <lapicid>
801036f1:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801036f7:	85 f6                	test   %esi,%esi
801036f9:	7e 3f                	jle    8010373a <mycpu+0x5a>
801036fb:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80103702:	39 d0                	cmp    %edx,%eax
80103704:	74 30                	je     80103736 <mycpu+0x56>
80103706:	b9 30 28 11 80       	mov    $0x80112830,%ecx
8010370b:	31 d2                	xor    %edx,%edx
8010370d:	8d 76 00             	lea    0x0(%esi),%esi
80103710:	83 c2 01             	add    $0x1,%edx
80103713:	39 f2                	cmp    %esi,%edx
80103715:	74 23                	je     8010373a <mycpu+0x5a>
80103717:	0f b6 19             	movzbl (%ecx),%ebx
8010371a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103720:	39 d8                	cmp    %ebx,%eax
80103722:	75 ec                	jne    80103710 <mycpu+0x30>
80103724:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010372a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010372d:	5b                   	pop    %ebx
8010372e:	05 80 27 11 80       	add    $0x80112780,%eax
80103733:	5e                   	pop    %esi
80103734:	5d                   	pop    %ebp
80103735:	c3                   	ret    
80103736:	31 d2                	xor    %edx,%edx
80103738:	eb ea                	jmp    80103724 <mycpu+0x44>
8010373a:	83 ec 0c             	sub    $0xc,%esp
8010373d:	68 dc 74 10 80       	push   $0x801074dc
80103742:	e8 29 cc ff ff       	call   80100370 <panic>
80103747:	83 ec 0c             	sub    $0xc,%esp
8010374a:	68 b8 75 10 80       	push   $0x801075b8
8010374f:	e8 1c cc ff ff       	call   80100370 <panic>
80103754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010375a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103760 <cpuid>:
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	83 ec 08             	sub    $0x8,%esp
80103766:	e8 75 ff ff ff       	call   801036e0 <mycpu>
8010376b:	2d 80 27 11 80       	sub    $0x80112780,%eax
80103770:	c9                   	leave  
80103771:	c1 f8 04             	sar    $0x4,%eax
80103774:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
8010377a:	c3                   	ret    
8010377b:	90                   	nop
8010377c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103780 <myproc>:
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	53                   	push   %ebx
80103784:	83 ec 04             	sub    $0x4,%esp
80103787:	e8 b4 0a 00 00       	call   80104240 <pushcli>
8010378c:	e8 4f ff ff ff       	call   801036e0 <mycpu>
80103791:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103797:	e8 e4 0a 00 00       	call   80104280 <popcli>
8010379c:	83 c4 04             	add    $0x4,%esp
8010379f:	89 d8                	mov    %ebx,%eax
801037a1:	5b                   	pop    %ebx
801037a2:	5d                   	pop    %ebp
801037a3:	c3                   	ret    
801037a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037b0 <userinit>:
801037b0:	55                   	push   %ebp
801037b1:	89 e5                	mov    %esp,%ebp
801037b3:	53                   	push   %ebx
801037b4:	83 ec 04             	sub    $0x4,%esp
801037b7:	e8 f4 fd ff ff       	call   801035b0 <allocproc>
801037bc:	89 c3                	mov    %eax,%ebx
801037be:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
801037c3:	e8 f8 34 00 00       	call   80106cc0 <setupkvm>
801037c8:	85 c0                	test   %eax,%eax
801037ca:	89 43 04             	mov    %eax,0x4(%ebx)
801037cd:	0f 84 bd 00 00 00    	je     80103890 <userinit+0xe0>
801037d3:	83 ec 04             	sub    $0x4,%esp
801037d6:	68 2c 00 00 00       	push   $0x2c
801037db:	68 60 a4 10 80       	push   $0x8010a460
801037e0:	50                   	push   %eax
801037e1:	e8 ea 31 00 00       	call   801069d0 <inituvm>
801037e6:	83 c4 0c             	add    $0xc,%esp
801037e9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
801037ef:	6a 4c                	push   $0x4c
801037f1:	6a 00                	push   $0x0
801037f3:	ff 73 18             	pushl  0x18(%ebx)
801037f6:	e8 25 0c 00 00       	call   80104420 <memset>
801037fb:	8b 43 18             	mov    0x18(%ebx),%eax
801037fe:	ba 1b 00 00 00       	mov    $0x1b,%edx
80103803:	b9 23 00 00 00       	mov    $0x23,%ecx
80103808:	83 c4 0c             	add    $0xc,%esp
8010380b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
8010380f:	8b 43 18             	mov    0x18(%ebx),%eax
80103812:	66 89 48 2c          	mov    %cx,0x2c(%eax)
80103816:	8b 43 18             	mov    0x18(%ebx),%eax
80103819:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010381d:	66 89 50 28          	mov    %dx,0x28(%eax)
80103821:	8b 43 18             	mov    0x18(%ebx),%eax
80103824:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103828:	66 89 50 48          	mov    %dx,0x48(%eax)
8010382c:	8b 43 18             	mov    0x18(%ebx),%eax
8010382f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80103836:	8b 43 18             	mov    0x18(%ebx),%eax
80103839:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80103840:	8b 43 18             	mov    0x18(%ebx),%eax
80103843:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
8010384a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010384d:	6a 10                	push   $0x10
8010384f:	68 05 75 10 80       	push   $0x80107505
80103854:	50                   	push   %eax
80103855:	e8 c6 0d 00 00       	call   80104620 <safestrcpy>
8010385a:	c7 04 24 0e 75 10 80 	movl   $0x8010750e,(%esp)
80103861:	e8 5a e6 ff ff       	call   80101ec0 <namei>
80103866:	89 43 68             	mov    %eax,0x68(%ebx)
80103869:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103870:	e8 ab 0a 00 00       	call   80104320 <acquire>
80103875:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
8010387c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103883:	e8 48 0b 00 00       	call   801043d0 <release>
80103888:	83 c4 10             	add    $0x10,%esp
8010388b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010388e:	c9                   	leave  
8010388f:	c3                   	ret    
80103890:	83 ec 0c             	sub    $0xc,%esp
80103893:	68 ec 74 10 80       	push   $0x801074ec
80103898:	e8 d3 ca ff ff       	call   80100370 <panic>
8010389d:	8d 76 00             	lea    0x0(%esi),%esi

801038a0 <growproc>:
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	56                   	push   %esi
801038a4:	53                   	push   %ebx
801038a5:	8b 75 08             	mov    0x8(%ebp),%esi
801038a8:	e8 93 09 00 00       	call   80104240 <pushcli>
801038ad:	e8 2e fe ff ff       	call   801036e0 <mycpu>
801038b2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801038b8:	e8 c3 09 00 00       	call   80104280 <popcli>
801038bd:	83 fe 00             	cmp    $0x0,%esi
801038c0:	8b 03                	mov    (%ebx),%eax
801038c2:	7e 34                	jle    801038f8 <growproc+0x58>
801038c4:	83 ec 04             	sub    $0x4,%esp
801038c7:	01 c6                	add    %eax,%esi
801038c9:	56                   	push   %esi
801038ca:	50                   	push   %eax
801038cb:	ff 73 04             	pushl  0x4(%ebx)
801038ce:	e8 3d 32 00 00       	call   80106b10 <allocuvm>
801038d3:	83 c4 10             	add    $0x10,%esp
801038d6:	85 c0                	test   %eax,%eax
801038d8:	74 36                	je     80103910 <growproc+0x70>
801038da:	83 ec 0c             	sub    $0xc,%esp
801038dd:	89 03                	mov    %eax,(%ebx)
801038df:	53                   	push   %ebx
801038e0:	e8 db 2f 00 00       	call   801068c0 <switchuvm>
801038e5:	83 c4 10             	add    $0x10,%esp
801038e8:	31 c0                	xor    %eax,%eax
801038ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038ed:	5b                   	pop    %ebx
801038ee:	5e                   	pop    %esi
801038ef:	5d                   	pop    %ebp
801038f0:	c3                   	ret    
801038f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801038f8:	74 e0                	je     801038da <growproc+0x3a>
801038fa:	83 ec 04             	sub    $0x4,%esp
801038fd:	01 c6                	add    %eax,%esi
801038ff:	56                   	push   %esi
80103900:	50                   	push   %eax
80103901:	ff 73 04             	pushl  0x4(%ebx)
80103904:	e8 07 33 00 00       	call   80106c10 <deallocuvm>
80103909:	83 c4 10             	add    $0x10,%esp
8010390c:	85 c0                	test   %eax,%eax
8010390e:	75 ca                	jne    801038da <growproc+0x3a>
80103910:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103915:	eb d3                	jmp    801038ea <growproc+0x4a>
80103917:	89 f6                	mov    %esi,%esi
80103919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103920 <fork>:
80103920:	55                   	push   %ebp
80103921:	89 e5                	mov    %esp,%ebp
80103923:	57                   	push   %edi
80103924:	56                   	push   %esi
80103925:	53                   	push   %ebx
80103926:	83 ec 1c             	sub    $0x1c,%esp
80103929:	e8 12 09 00 00       	call   80104240 <pushcli>
8010392e:	e8 ad fd ff ff       	call   801036e0 <mycpu>
80103933:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103939:	e8 42 09 00 00       	call   80104280 <popcli>
8010393e:	e8 6d fc ff ff       	call   801035b0 <allocproc>
80103943:	85 c0                	test   %eax,%eax
80103945:	89 c7                	mov    %eax,%edi
80103947:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010394a:	0f 84 b5 00 00 00    	je     80103a05 <fork+0xe5>
80103950:	83 ec 08             	sub    $0x8,%esp
80103953:	ff 33                	pushl  (%ebx)
80103955:	ff 73 04             	pushl  0x4(%ebx)
80103958:	e8 33 34 00 00       	call   80106d90 <copyuvm>
8010395d:	83 c4 10             	add    $0x10,%esp
80103960:	85 c0                	test   %eax,%eax
80103962:	89 47 04             	mov    %eax,0x4(%edi)
80103965:	0f 84 a1 00 00 00    	je     80103a0c <fork+0xec>
8010396b:	8b 03                	mov    (%ebx),%eax
8010396d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103970:	89 01                	mov    %eax,(%ecx)
80103972:	89 59 14             	mov    %ebx,0x14(%ecx)
80103975:	89 c8                	mov    %ecx,%eax
80103977:	8b 79 18             	mov    0x18(%ecx),%edi
8010397a:	8b 73 18             	mov    0x18(%ebx),%esi
8010397d:	b9 13 00 00 00       	mov    $0x13,%ecx
80103982:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103984:	31 f6                	xor    %esi,%esi
80103986:	8b 40 18             	mov    0x18(%eax),%eax
80103989:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103990:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103994:	85 c0                	test   %eax,%eax
80103996:	74 13                	je     801039ab <fork+0x8b>
80103998:	83 ec 0c             	sub    $0xc,%esp
8010399b:	50                   	push   %eax
8010399c:	e8 3f d4 ff ff       	call   80100de0 <filedup>
801039a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801039a4:	83 c4 10             	add    $0x10,%esp
801039a7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
801039ab:	83 c6 01             	add    $0x1,%esi
801039ae:	83 fe 10             	cmp    $0x10,%esi
801039b1:	75 dd                	jne    80103990 <fork+0x70>
801039b3:	83 ec 0c             	sub    $0xc,%esp
801039b6:	ff 73 68             	pushl  0x68(%ebx)
801039b9:	83 c3 6c             	add    $0x6c,%ebx
801039bc:	e8 7f dc ff ff       	call   80101640 <idup>
801039c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801039c4:	83 c4 0c             	add    $0xc,%esp
801039c7:	89 47 68             	mov    %eax,0x68(%edi)
801039ca:	8d 47 6c             	lea    0x6c(%edi),%eax
801039cd:	6a 10                	push   $0x10
801039cf:	53                   	push   %ebx
801039d0:	50                   	push   %eax
801039d1:	e8 4a 0c 00 00       	call   80104620 <safestrcpy>
801039d6:	8b 5f 10             	mov    0x10(%edi),%ebx
801039d9:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039e0:	e8 3b 09 00 00       	call   80104320 <acquire>
801039e5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
801039ec:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039f3:	e8 d8 09 00 00       	call   801043d0 <release>
801039f8:	83 c4 10             	add    $0x10,%esp
801039fb:	89 d8                	mov    %ebx,%eax
801039fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a00:	5b                   	pop    %ebx
80103a01:	5e                   	pop    %esi
80103a02:	5f                   	pop    %edi
80103a03:	5d                   	pop    %ebp
80103a04:	c3                   	ret    
80103a05:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a0a:	eb f1                	jmp    801039fd <fork+0xdd>
80103a0c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103a0f:	83 ec 0c             	sub    $0xc,%esp
80103a12:	ff 77 08             	pushl  0x8(%edi)
80103a15:	e8 c6 e8 ff ff       	call   801022e0 <kfree>
80103a1a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
80103a21:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
80103a28:	83 c4 10             	add    $0x10,%esp
80103a2b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a30:	eb cb                	jmp    801039fd <fork+0xdd>
80103a32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a40 <scheduler>:
80103a40:	55                   	push   %ebp
80103a41:	89 e5                	mov    %esp,%ebp
80103a43:	57                   	push   %edi
80103a44:	56                   	push   %esi
80103a45:	53                   	push   %ebx
80103a46:	83 ec 0c             	sub    $0xc,%esp
80103a49:	e8 92 fc ff ff       	call   801036e0 <mycpu>
80103a4e:	8d 78 04             	lea    0x4(%eax),%edi
80103a51:	89 c6                	mov    %eax,%esi
80103a53:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a5a:	00 00 00 
80103a5d:	8d 76 00             	lea    0x0(%esi),%esi
80103a60:	fb                   	sti    
80103a61:	83 ec 0c             	sub    $0xc,%esp
80103a64:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103a69:	68 20 2d 11 80       	push   $0x80112d20
80103a6e:	e8 ad 08 00 00       	call   80104320 <acquire>
80103a73:	83 c4 10             	add    $0x10,%esp
80103a76:	eb 13                	jmp    80103a8b <scheduler+0x4b>
80103a78:	90                   	nop
80103a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a80:	83 c3 7c             	add    $0x7c,%ebx
80103a83:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103a89:	74 45                	je     80103ad0 <scheduler+0x90>
80103a8b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103a8f:	75 ef                	jne    80103a80 <scheduler+0x40>
80103a91:	83 ec 0c             	sub    $0xc,%esp
80103a94:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
80103a9a:	53                   	push   %ebx
80103a9b:	83 c3 7c             	add    $0x7c,%ebx
80103a9e:	e8 1d 2e 00 00       	call   801068c0 <switchuvm>
80103aa3:	58                   	pop    %eax
80103aa4:	5a                   	pop    %edx
80103aa5:	ff 73 a0             	pushl  -0x60(%ebx)
80103aa8:	57                   	push   %edi
80103aa9:	c7 43 90 04 00 00 00 	movl   $0x4,-0x70(%ebx)
80103ab0:	e8 c6 0b 00 00       	call   8010467b <swtch>
80103ab5:	e8 e6 2d 00 00       	call   801068a0 <switchkvm>
80103aba:	83 c4 10             	add    $0x10,%esp
80103abd:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103ac3:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103aca:	00 00 00 
80103acd:	75 bc                	jne    80103a8b <scheduler+0x4b>
80103acf:	90                   	nop
80103ad0:	83 ec 0c             	sub    $0xc,%esp
80103ad3:	68 20 2d 11 80       	push   $0x80112d20
80103ad8:	e8 f3 08 00 00       	call   801043d0 <release>
80103add:	83 c4 10             	add    $0x10,%esp
80103ae0:	e9 7b ff ff ff       	jmp    80103a60 <scheduler+0x20>
80103ae5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103af0 <sched>:
80103af0:	55                   	push   %ebp
80103af1:	89 e5                	mov    %esp,%ebp
80103af3:	56                   	push   %esi
80103af4:	53                   	push   %ebx
80103af5:	e8 46 07 00 00       	call   80104240 <pushcli>
80103afa:	e8 e1 fb ff ff       	call   801036e0 <mycpu>
80103aff:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103b05:	e8 76 07 00 00       	call   80104280 <popcli>
80103b0a:	83 ec 0c             	sub    $0xc,%esp
80103b0d:	68 20 2d 11 80       	push   $0x80112d20
80103b12:	e8 d9 07 00 00       	call   801042f0 <holding>
80103b17:	83 c4 10             	add    $0x10,%esp
80103b1a:	85 c0                	test   %eax,%eax
80103b1c:	74 4f                	je     80103b6d <sched+0x7d>
80103b1e:	e8 bd fb ff ff       	call   801036e0 <mycpu>
80103b23:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b2a:	75 68                	jne    80103b94 <sched+0xa4>
80103b2c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b30:	74 55                	je     80103b87 <sched+0x97>
80103b32:	9c                   	pushf  
80103b33:	58                   	pop    %eax
80103b34:	f6 c4 02             	test   $0x2,%ah
80103b37:	75 41                	jne    80103b7a <sched+0x8a>
80103b39:	e8 a2 fb ff ff       	call   801036e0 <mycpu>
80103b3e:	83 c3 1c             	add    $0x1c,%ebx
80103b41:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
80103b47:	e8 94 fb ff ff       	call   801036e0 <mycpu>
80103b4c:	83 ec 08             	sub    $0x8,%esp
80103b4f:	ff 70 04             	pushl  0x4(%eax)
80103b52:	53                   	push   %ebx
80103b53:	e8 23 0b 00 00       	call   8010467b <swtch>
80103b58:	e8 83 fb ff ff       	call   801036e0 <mycpu>
80103b5d:	83 c4 10             	add    $0x10,%esp
80103b60:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80103b66:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b69:	5b                   	pop    %ebx
80103b6a:	5e                   	pop    %esi
80103b6b:	5d                   	pop    %ebp
80103b6c:	c3                   	ret    
80103b6d:	83 ec 0c             	sub    $0xc,%esp
80103b70:	68 10 75 10 80       	push   $0x80107510
80103b75:	e8 f6 c7 ff ff       	call   80100370 <panic>
80103b7a:	83 ec 0c             	sub    $0xc,%esp
80103b7d:	68 3c 75 10 80       	push   $0x8010753c
80103b82:	e8 e9 c7 ff ff       	call   80100370 <panic>
80103b87:	83 ec 0c             	sub    $0xc,%esp
80103b8a:	68 2e 75 10 80       	push   $0x8010752e
80103b8f:	e8 dc c7 ff ff       	call   80100370 <panic>
80103b94:	83 ec 0c             	sub    $0xc,%esp
80103b97:	68 22 75 10 80       	push   $0x80107522
80103b9c:	e8 cf c7 ff ff       	call   80100370 <panic>
80103ba1:	eb 0d                	jmp    80103bb0 <exit>
80103ba3:	90                   	nop
80103ba4:	90                   	nop
80103ba5:	90                   	nop
80103ba6:	90                   	nop
80103ba7:	90                   	nop
80103ba8:	90                   	nop
80103ba9:	90                   	nop
80103baa:	90                   	nop
80103bab:	90                   	nop
80103bac:	90                   	nop
80103bad:	90                   	nop
80103bae:	90                   	nop
80103baf:	90                   	nop

80103bb0 <exit>:
80103bb0:	55                   	push   %ebp
80103bb1:	89 e5                	mov    %esp,%ebp
80103bb3:	57                   	push   %edi
80103bb4:	56                   	push   %esi
80103bb5:	53                   	push   %ebx
80103bb6:	83 ec 0c             	sub    $0xc,%esp
80103bb9:	e8 82 06 00 00       	call   80104240 <pushcli>
80103bbe:	e8 1d fb ff ff       	call   801036e0 <mycpu>
80103bc3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103bc9:	e8 b2 06 00 00       	call   80104280 <popcli>
80103bce:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103bd4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103bd7:	8d 7e 68             	lea    0x68(%esi),%edi
80103bda:	0f 84 e7 00 00 00    	je     80103cc7 <exit+0x117>
80103be0:	8b 03                	mov    (%ebx),%eax
80103be2:	85 c0                	test   %eax,%eax
80103be4:	74 12                	je     80103bf8 <exit+0x48>
80103be6:	83 ec 0c             	sub    $0xc,%esp
80103be9:	50                   	push   %eax
80103bea:	e8 41 d2 ff ff       	call   80100e30 <fileclose>
80103bef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103bf5:	83 c4 10             	add    $0x10,%esp
80103bf8:	83 c3 04             	add    $0x4,%ebx
80103bfb:	39 df                	cmp    %ebx,%edi
80103bfd:	75 e1                	jne    80103be0 <exit+0x30>
80103bff:	e8 4c ef ff ff       	call   80102b50 <begin_op>
80103c04:	83 ec 0c             	sub    $0xc,%esp
80103c07:	ff 76 68             	pushl  0x68(%esi)
80103c0a:	e8 91 db ff ff       	call   801017a0 <iput>
80103c0f:	e8 ac ef ff ff       	call   80102bc0 <end_op>
80103c14:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
80103c1b:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c22:	e8 f9 06 00 00       	call   80104320 <acquire>
80103c27:	8b 56 14             	mov    0x14(%esi),%edx
80103c2a:	83 c4 10             	add    $0x10,%esp
80103c2d:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c32:	eb 0e                	jmp    80103c42 <exit+0x92>
80103c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c38:	83 c0 7c             	add    $0x7c,%eax
80103c3b:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103c40:	74 1c                	je     80103c5e <exit+0xae>
80103c42:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c46:	75 f0                	jne    80103c38 <exit+0x88>
80103c48:	3b 50 20             	cmp    0x20(%eax),%edx
80103c4b:	75 eb                	jne    80103c38 <exit+0x88>
80103c4d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103c54:	83 c0 7c             	add    $0x7c,%eax
80103c57:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103c5c:	75 e4                	jne    80103c42 <exit+0x92>
80103c5e:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103c64:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103c69:	eb 10                	jmp    80103c7b <exit+0xcb>
80103c6b:	90                   	nop
80103c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c70:	83 c2 7c             	add    $0x7c,%edx
80103c73:	81 fa 54 4c 11 80    	cmp    $0x80114c54,%edx
80103c79:	74 33                	je     80103cae <exit+0xfe>
80103c7b:	39 72 14             	cmp    %esi,0x14(%edx)
80103c7e:	75 f0                	jne    80103c70 <exit+0xc0>
80103c80:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80103c84:	89 4a 14             	mov    %ecx,0x14(%edx)
80103c87:	75 e7                	jne    80103c70 <exit+0xc0>
80103c89:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c8e:	eb 0a                	jmp    80103c9a <exit+0xea>
80103c90:	83 c0 7c             	add    $0x7c,%eax
80103c93:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103c98:	74 d6                	je     80103c70 <exit+0xc0>
80103c9a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c9e:	75 f0                	jne    80103c90 <exit+0xe0>
80103ca0:	3b 48 20             	cmp    0x20(%eax),%ecx
80103ca3:	75 eb                	jne    80103c90 <exit+0xe0>
80103ca5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cac:	eb e2                	jmp    80103c90 <exit+0xe0>
80103cae:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
80103cb5:	e8 36 fe ff ff       	call   80103af0 <sched>
80103cba:	83 ec 0c             	sub    $0xc,%esp
80103cbd:	68 5d 75 10 80       	push   $0x8010755d
80103cc2:	e8 a9 c6 ff ff       	call   80100370 <panic>
80103cc7:	83 ec 0c             	sub    $0xc,%esp
80103cca:	68 50 75 10 80       	push   $0x80107550
80103ccf:	e8 9c c6 ff ff       	call   80100370 <panic>
80103cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103ce0 <yield>:
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	53                   	push   %ebx
80103ce4:	83 ec 10             	sub    $0x10,%esp
80103ce7:	68 20 2d 11 80       	push   $0x80112d20
80103cec:	e8 2f 06 00 00       	call   80104320 <acquire>
80103cf1:	e8 4a 05 00 00       	call   80104240 <pushcli>
80103cf6:	e8 e5 f9 ff ff       	call   801036e0 <mycpu>
80103cfb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103d01:	e8 7a 05 00 00       	call   80104280 <popcli>
80103d06:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103d0d:	e8 de fd ff ff       	call   80103af0 <sched>
80103d12:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d19:	e8 b2 06 00 00       	call   801043d0 <release>
80103d1e:	83 c4 10             	add    $0x10,%esp
80103d21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d24:	c9                   	leave  
80103d25:	c3                   	ret    
80103d26:	8d 76 00             	lea    0x0(%esi),%esi
80103d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d30 <sleep>:
80103d30:	55                   	push   %ebp
80103d31:	89 e5                	mov    %esp,%ebp
80103d33:	57                   	push   %edi
80103d34:	56                   	push   %esi
80103d35:	53                   	push   %ebx
80103d36:	83 ec 0c             	sub    $0xc,%esp
80103d39:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80103d3f:	e8 fc 04 00 00       	call   80104240 <pushcli>
80103d44:	e8 97 f9 ff ff       	call   801036e0 <mycpu>
80103d49:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103d4f:	e8 2c 05 00 00       	call   80104280 <popcli>
80103d54:	85 db                	test   %ebx,%ebx
80103d56:	0f 84 87 00 00 00    	je     80103de3 <sleep+0xb3>
80103d5c:	85 f6                	test   %esi,%esi
80103d5e:	74 76                	je     80103dd6 <sleep+0xa6>
80103d60:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103d66:	74 50                	je     80103db8 <sleep+0x88>
80103d68:	83 ec 0c             	sub    $0xc,%esp
80103d6b:	68 20 2d 11 80       	push   $0x80112d20
80103d70:	e8 ab 05 00 00       	call   80104320 <acquire>
80103d75:	89 34 24             	mov    %esi,(%esp)
80103d78:	e8 53 06 00 00       	call   801043d0 <release>
80103d7d:	89 7b 20             	mov    %edi,0x20(%ebx)
80103d80:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103d87:	e8 64 fd ff ff       	call   80103af0 <sched>
80103d8c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103d93:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d9a:	e8 31 06 00 00       	call   801043d0 <release>
80103d9f:	89 75 08             	mov    %esi,0x8(%ebp)
80103da2:	83 c4 10             	add    $0x10,%esp
80103da5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103da8:	5b                   	pop    %ebx
80103da9:	5e                   	pop    %esi
80103daa:	5f                   	pop    %edi
80103dab:	5d                   	pop    %ebp
80103dac:	e9 6f 05 00 00       	jmp    80104320 <acquire>
80103db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103db8:	89 7b 20             	mov    %edi,0x20(%ebx)
80103dbb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103dc2:	e8 29 fd ff ff       	call   80103af0 <sched>
80103dc7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dd1:	5b                   	pop    %ebx
80103dd2:	5e                   	pop    %esi
80103dd3:	5f                   	pop    %edi
80103dd4:	5d                   	pop    %ebp
80103dd5:	c3                   	ret    
80103dd6:	83 ec 0c             	sub    $0xc,%esp
80103dd9:	68 6f 75 10 80       	push   $0x8010756f
80103dde:	e8 8d c5 ff ff       	call   80100370 <panic>
80103de3:	83 ec 0c             	sub    $0xc,%esp
80103de6:	68 69 75 10 80       	push   $0x80107569
80103deb:	e8 80 c5 ff ff       	call   80100370 <panic>

80103df0 <wait>:
80103df0:	55                   	push   %ebp
80103df1:	89 e5                	mov    %esp,%ebp
80103df3:	56                   	push   %esi
80103df4:	53                   	push   %ebx
80103df5:	e8 46 04 00 00       	call   80104240 <pushcli>
80103dfa:	e8 e1 f8 ff ff       	call   801036e0 <mycpu>
80103dff:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103e05:	e8 76 04 00 00       	call   80104280 <popcli>
80103e0a:	83 ec 0c             	sub    $0xc,%esp
80103e0d:	68 20 2d 11 80       	push   $0x80112d20
80103e12:	e8 09 05 00 00       	call   80104320 <acquire>
80103e17:	83 c4 10             	add    $0x10,%esp
80103e1a:	31 c0                	xor    %eax,%eax
80103e1c:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103e21:	eb 10                	jmp    80103e33 <wait+0x43>
80103e23:	90                   	nop
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	83 c3 7c             	add    $0x7c,%ebx
80103e2b:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103e31:	74 1d                	je     80103e50 <wait+0x60>
80103e33:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e36:	75 f0                	jne    80103e28 <wait+0x38>
80103e38:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e3c:	74 30                	je     80103e6e <wait+0x7e>
80103e3e:	83 c3 7c             	add    $0x7c,%ebx
80103e41:	b8 01 00 00 00       	mov    $0x1,%eax
80103e46:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103e4c:	75 e5                	jne    80103e33 <wait+0x43>
80103e4e:	66 90                	xchg   %ax,%ax
80103e50:	85 c0                	test   %eax,%eax
80103e52:	74 70                	je     80103ec4 <wait+0xd4>
80103e54:	8b 46 24             	mov    0x24(%esi),%eax
80103e57:	85 c0                	test   %eax,%eax
80103e59:	75 69                	jne    80103ec4 <wait+0xd4>
80103e5b:	83 ec 08             	sub    $0x8,%esp
80103e5e:	68 20 2d 11 80       	push   $0x80112d20
80103e63:	56                   	push   %esi
80103e64:	e8 c7 fe ff ff       	call   80103d30 <sleep>
80103e69:	83 c4 10             	add    $0x10,%esp
80103e6c:	eb ac                	jmp    80103e1a <wait+0x2a>
80103e6e:	83 ec 0c             	sub    $0xc,%esp
80103e71:	ff 73 08             	pushl  0x8(%ebx)
80103e74:	8b 73 10             	mov    0x10(%ebx),%esi
80103e77:	e8 64 e4 ff ff       	call   801022e0 <kfree>
80103e7c:	5a                   	pop    %edx
80103e7d:	ff 73 04             	pushl  0x4(%ebx)
80103e80:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103e87:	e8 b4 2d 00 00       	call   80106c40 <freevm>
80103e8c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80103e93:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103e9a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103e9e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80103ea5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103eac:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103eb3:	e8 18 05 00 00       	call   801043d0 <release>
80103eb8:	83 c4 10             	add    $0x10,%esp
80103ebb:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ebe:	89 f0                	mov    %esi,%eax
80103ec0:	5b                   	pop    %ebx
80103ec1:	5e                   	pop    %esi
80103ec2:	5d                   	pop    %ebp
80103ec3:	c3                   	ret    
80103ec4:	83 ec 0c             	sub    $0xc,%esp
80103ec7:	68 20 2d 11 80       	push   $0x80112d20
80103ecc:	e8 ff 04 00 00       	call   801043d0 <release>
80103ed1:	83 c4 10             	add    $0x10,%esp
80103ed4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ed7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103edc:	5b                   	pop    %ebx
80103edd:	5e                   	pop    %esi
80103ede:	5d                   	pop    %ebp
80103edf:	c3                   	ret    

80103ee0 <wakeup>:
80103ee0:	55                   	push   %ebp
80103ee1:	89 e5                	mov    %esp,%ebp
80103ee3:	53                   	push   %ebx
80103ee4:	83 ec 10             	sub    $0x10,%esp
80103ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103eea:	68 20 2d 11 80       	push   $0x80112d20
80103eef:	e8 2c 04 00 00       	call   80104320 <acquire>
80103ef4:	83 c4 10             	add    $0x10,%esp
80103ef7:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103efc:	eb 0c                	jmp    80103f0a <wakeup+0x2a>
80103efe:	66 90                	xchg   %ax,%ax
80103f00:	83 c0 7c             	add    $0x7c,%eax
80103f03:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103f08:	74 1c                	je     80103f26 <wakeup+0x46>
80103f0a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f0e:	75 f0                	jne    80103f00 <wakeup+0x20>
80103f10:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f13:	75 eb                	jne    80103f00 <wakeup+0x20>
80103f15:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f1c:	83 c0 7c             	add    $0x7c,%eax
80103f1f:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103f24:	75 e4                	jne    80103f0a <wakeup+0x2a>
80103f26:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
80103f2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f30:	c9                   	leave  
80103f31:	e9 9a 04 00 00       	jmp    801043d0 <release>
80103f36:	8d 76 00             	lea    0x0(%esi),%esi
80103f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f40 <kill>:
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 10             	sub    $0x10,%esp
80103f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103f4a:	68 20 2d 11 80       	push   $0x80112d20
80103f4f:	e8 cc 03 00 00       	call   80104320 <acquire>
80103f54:	83 c4 10             	add    $0x10,%esp
80103f57:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103f5c:	eb 0c                	jmp    80103f6a <kill+0x2a>
80103f5e:	66 90                	xchg   %ax,%ax
80103f60:	83 c0 7c             	add    $0x7c,%eax
80103f63:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103f68:	74 3e                	je     80103fa8 <kill+0x68>
80103f6a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f6d:	75 f1                	jne    80103f60 <kill+0x20>
80103f6f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f73:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80103f7a:	74 1c                	je     80103f98 <kill+0x58>
80103f7c:	83 ec 0c             	sub    $0xc,%esp
80103f7f:	68 20 2d 11 80       	push   $0x80112d20
80103f84:	e8 47 04 00 00       	call   801043d0 <release>
80103f89:	83 c4 10             	add    $0x10,%esp
80103f8c:	31 c0                	xor    %eax,%eax
80103f8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f91:	c9                   	leave  
80103f92:	c3                   	ret    
80103f93:	90                   	nop
80103f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f98:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f9f:	eb db                	jmp    80103f7c <kill+0x3c>
80103fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fa8:	83 ec 0c             	sub    $0xc,%esp
80103fab:	68 20 2d 11 80       	push   $0x80112d20
80103fb0:	e8 1b 04 00 00       	call   801043d0 <release>
80103fb5:	83 c4 10             	add    $0x10,%esp
80103fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fc0:	c9                   	leave  
80103fc1:	c3                   	ret    
80103fc2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fd0 <procdump>:
80103fd0:	55                   	push   %ebp
80103fd1:	89 e5                	mov    %esp,%ebp
80103fd3:	57                   	push   %edi
80103fd4:	56                   	push   %esi
80103fd5:	53                   	push   %ebx
80103fd6:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103fd9:	bb c0 2d 11 80       	mov    $0x80112dc0,%ebx
80103fde:	83 ec 3c             	sub    $0x3c,%esp
80103fe1:	eb 24                	jmp    80104007 <procdump+0x37>
80103fe3:	90                   	nop
80103fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fe8:	83 ec 0c             	sub    $0xc,%esp
80103feb:	68 ff 78 10 80       	push   $0x801078ff
80103ff0:	e8 6b c6 ff ff       	call   80100660 <cprintf>
80103ff5:	83 c4 10             	add    $0x10,%esp
80103ff8:	83 c3 7c             	add    $0x7c,%ebx
80103ffb:	81 fb c0 4c 11 80    	cmp    $0x80114cc0,%ebx
80104001:	0f 84 81 00 00 00    	je     80104088 <procdump+0xb8>
80104007:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010400a:	85 c0                	test   %eax,%eax
8010400c:	74 ea                	je     80103ff8 <procdump+0x28>
8010400e:	83 f8 05             	cmp    $0x5,%eax
80104011:	ba 80 75 10 80       	mov    $0x80107580,%edx
80104016:	77 11                	ja     80104029 <procdump+0x59>
80104018:	8b 14 85 e0 75 10 80 	mov    -0x7fef8a20(,%eax,4),%edx
8010401f:	b8 80 75 10 80       	mov    $0x80107580,%eax
80104024:	85 d2                	test   %edx,%edx
80104026:	0f 44 d0             	cmove  %eax,%edx
80104029:	53                   	push   %ebx
8010402a:	52                   	push   %edx
8010402b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010402e:	68 84 75 10 80       	push   $0x80107584
80104033:	e8 28 c6 ff ff       	call   80100660 <cprintf>
80104038:	83 c4 10             	add    $0x10,%esp
8010403b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010403f:	75 a7                	jne    80103fe8 <procdump+0x18>
80104041:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104044:	83 ec 08             	sub    $0x8,%esp
80104047:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010404a:	50                   	push   %eax
8010404b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010404e:	8b 40 0c             	mov    0xc(%eax),%eax
80104051:	83 c0 08             	add    $0x8,%eax
80104054:	50                   	push   %eax
80104055:	e8 86 01 00 00       	call   801041e0 <getcallerpcs>
8010405a:	83 c4 10             	add    $0x10,%esp
8010405d:	8d 76 00             	lea    0x0(%esi),%esi
80104060:	8b 17                	mov    (%edi),%edx
80104062:	85 d2                	test   %edx,%edx
80104064:	74 82                	je     80103fe8 <procdump+0x18>
80104066:	83 ec 08             	sub    $0x8,%esp
80104069:	83 c7 04             	add    $0x4,%edi
8010406c:	52                   	push   %edx
8010406d:	68 c1 6f 10 80       	push   $0x80106fc1
80104072:	e8 e9 c5 ff ff       	call   80100660 <cprintf>
80104077:	83 c4 10             	add    $0x10,%esp
8010407a:	39 f7                	cmp    %esi,%edi
8010407c:	75 e2                	jne    80104060 <procdump+0x90>
8010407e:	e9 65 ff ff ff       	jmp    80103fe8 <procdump+0x18>
80104083:	90                   	nop
80104084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104088:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010408b:	5b                   	pop    %ebx
8010408c:	5e                   	pop    %esi
8010408d:	5f                   	pop    %edi
8010408e:	5d                   	pop    %ebp
8010408f:	c3                   	ret    

80104090 <initsleeplock>:
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	53                   	push   %ebx
80104094:	83 ec 0c             	sub    $0xc,%esp
80104097:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010409a:	68 f8 75 10 80       	push   $0x801075f8
8010409f:	8d 43 04             	lea    0x4(%ebx),%eax
801040a2:	50                   	push   %eax
801040a3:	e8 18 01 00 00       	call   801041c0 <initlock>
801040a8:	8b 45 0c             	mov    0xc(%ebp),%eax
801040ab:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801040b1:	83 c4 10             	add    $0x10,%esp
801040b4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801040bb:	89 43 38             	mov    %eax,0x38(%ebx)
801040be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040c1:	c9                   	leave  
801040c2:	c3                   	ret    
801040c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801040c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040d0 <acquiresleep>:
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	56                   	push   %esi
801040d4:	53                   	push   %ebx
801040d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040d8:	83 ec 0c             	sub    $0xc,%esp
801040db:	8d 73 04             	lea    0x4(%ebx),%esi
801040de:	56                   	push   %esi
801040df:	e8 3c 02 00 00       	call   80104320 <acquire>
801040e4:	8b 13                	mov    (%ebx),%edx
801040e6:	83 c4 10             	add    $0x10,%esp
801040e9:	85 d2                	test   %edx,%edx
801040eb:	74 16                	je     80104103 <acquiresleep+0x33>
801040ed:	8d 76 00             	lea    0x0(%esi),%esi
801040f0:	83 ec 08             	sub    $0x8,%esp
801040f3:	56                   	push   %esi
801040f4:	53                   	push   %ebx
801040f5:	e8 36 fc ff ff       	call   80103d30 <sleep>
801040fa:	8b 03                	mov    (%ebx),%eax
801040fc:	83 c4 10             	add    $0x10,%esp
801040ff:	85 c0                	test   %eax,%eax
80104101:	75 ed                	jne    801040f0 <acquiresleep+0x20>
80104103:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104109:	e8 72 f6 ff ff       	call   80103780 <myproc>
8010410e:	8b 40 10             	mov    0x10(%eax),%eax
80104111:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104114:	89 75 08             	mov    %esi,0x8(%ebp)
80104117:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010411a:	5b                   	pop    %ebx
8010411b:	5e                   	pop    %esi
8010411c:	5d                   	pop    %ebp
8010411d:	e9 ae 02 00 00       	jmp    801043d0 <release>
80104122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104130 <releasesleep>:
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	56                   	push   %esi
80104134:	53                   	push   %ebx
80104135:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104138:	83 ec 0c             	sub    $0xc,%esp
8010413b:	8d 73 04             	lea    0x4(%ebx),%esi
8010413e:	56                   	push   %esi
8010413f:	e8 dc 01 00 00       	call   80104320 <acquire>
80104144:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010414a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104151:	89 1c 24             	mov    %ebx,(%esp)
80104154:	e8 87 fd ff ff       	call   80103ee0 <wakeup>
80104159:	89 75 08             	mov    %esi,0x8(%ebp)
8010415c:	83 c4 10             	add    $0x10,%esp
8010415f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104162:	5b                   	pop    %ebx
80104163:	5e                   	pop    %esi
80104164:	5d                   	pop    %ebp
80104165:	e9 66 02 00 00       	jmp    801043d0 <release>
8010416a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104170 <holdingsleep>:
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	57                   	push   %edi
80104174:	56                   	push   %esi
80104175:	53                   	push   %ebx
80104176:	31 ff                	xor    %edi,%edi
80104178:	83 ec 18             	sub    $0x18,%esp
8010417b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010417e:	8d 73 04             	lea    0x4(%ebx),%esi
80104181:	56                   	push   %esi
80104182:	e8 99 01 00 00       	call   80104320 <acquire>
80104187:	8b 03                	mov    (%ebx),%eax
80104189:	83 c4 10             	add    $0x10,%esp
8010418c:	85 c0                	test   %eax,%eax
8010418e:	74 13                	je     801041a3 <holdingsleep+0x33>
80104190:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104193:	e8 e8 f5 ff ff       	call   80103780 <myproc>
80104198:	39 58 10             	cmp    %ebx,0x10(%eax)
8010419b:	0f 94 c0             	sete   %al
8010419e:	0f b6 c0             	movzbl %al,%eax
801041a1:	89 c7                	mov    %eax,%edi
801041a3:	83 ec 0c             	sub    $0xc,%esp
801041a6:	56                   	push   %esi
801041a7:	e8 24 02 00 00       	call   801043d0 <release>
801041ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041af:	89 f8                	mov    %edi,%eax
801041b1:	5b                   	pop    %ebx
801041b2:	5e                   	pop    %esi
801041b3:	5f                   	pop    %edi
801041b4:	5d                   	pop    %ebp
801041b5:	c3                   	ret    
801041b6:	66 90                	xchg   %ax,%ax
801041b8:	66 90                	xchg   %ax,%ax
801041ba:	66 90                	xchg   %ax,%ax
801041bc:	66 90                	xchg   %ax,%ax
801041be:	66 90                	xchg   %ax,%ax

801041c0 <initlock>:
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	8b 45 08             	mov    0x8(%ebp),%eax
801041c6:	8b 55 0c             	mov    0xc(%ebp),%edx
801041c9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801041cf:	89 50 04             	mov    %edx,0x4(%eax)
801041d2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
801041d9:	5d                   	pop    %ebp
801041da:	c3                   	ret    
801041db:	90                   	nop
801041dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801041e0 <getcallerpcs>:
801041e0:	55                   	push   %ebp
801041e1:	89 e5                	mov    %esp,%ebp
801041e3:	53                   	push   %ebx
801041e4:	8b 45 08             	mov    0x8(%ebp),%eax
801041e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801041ea:	8d 50 f8             	lea    -0x8(%eax),%edx
801041ed:	31 c0                	xor    %eax,%eax
801041ef:	90                   	nop
801041f0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801041f6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801041fc:	77 1a                	ja     80104218 <getcallerpcs+0x38>
801041fe:	8b 5a 04             	mov    0x4(%edx),%ebx
80104201:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104204:	83 c0 01             	add    $0x1,%eax
80104207:	8b 12                	mov    (%edx),%edx
80104209:	83 f8 0a             	cmp    $0xa,%eax
8010420c:	75 e2                	jne    801041f0 <getcallerpcs+0x10>
8010420e:	5b                   	pop    %ebx
8010420f:	5d                   	pop    %ebp
80104210:	c3                   	ret    
80104211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104218:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010421f:	83 c0 01             	add    $0x1,%eax
80104222:	83 f8 0a             	cmp    $0xa,%eax
80104225:	74 e7                	je     8010420e <getcallerpcs+0x2e>
80104227:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010422e:	83 c0 01             	add    $0x1,%eax
80104231:	83 f8 0a             	cmp    $0xa,%eax
80104234:	75 e2                	jne    80104218 <getcallerpcs+0x38>
80104236:	eb d6                	jmp    8010420e <getcallerpcs+0x2e>
80104238:	90                   	nop
80104239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104240 <pushcli>:
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	53                   	push   %ebx
80104244:	83 ec 04             	sub    $0x4,%esp
80104247:	9c                   	pushf  
80104248:	5b                   	pop    %ebx
80104249:	fa                   	cli    
8010424a:	e8 91 f4 ff ff       	call   801036e0 <mycpu>
8010424f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104255:	85 c0                	test   %eax,%eax
80104257:	75 11                	jne    8010426a <pushcli+0x2a>
80104259:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010425f:	e8 7c f4 ff ff       	call   801036e0 <mycpu>
80104264:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
8010426a:	e8 71 f4 ff ff       	call   801036e0 <mycpu>
8010426f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104276:	83 c4 04             	add    $0x4,%esp
80104279:	5b                   	pop    %ebx
8010427a:	5d                   	pop    %ebp
8010427b:	c3                   	ret    
8010427c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104280 <popcli>:
80104280:	55                   	push   %ebp
80104281:	89 e5                	mov    %esp,%ebp
80104283:	83 ec 08             	sub    $0x8,%esp
80104286:	9c                   	pushf  
80104287:	58                   	pop    %eax
80104288:	f6 c4 02             	test   $0x2,%ah
8010428b:	75 52                	jne    801042df <popcli+0x5f>
8010428d:	e8 4e f4 ff ff       	call   801036e0 <mycpu>
80104292:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104298:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010429b:	85 d2                	test   %edx,%edx
8010429d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801042a3:	78 2d                	js     801042d2 <popcli+0x52>
801042a5:	e8 36 f4 ff ff       	call   801036e0 <mycpu>
801042aa:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801042b0:	85 d2                	test   %edx,%edx
801042b2:	74 0c                	je     801042c0 <popcli+0x40>
801042b4:	c9                   	leave  
801042b5:	c3                   	ret    
801042b6:	8d 76 00             	lea    0x0(%esi),%esi
801042b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801042c0:	e8 1b f4 ff ff       	call   801036e0 <mycpu>
801042c5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801042cb:	85 c0                	test   %eax,%eax
801042cd:	74 e5                	je     801042b4 <popcli+0x34>
801042cf:	fb                   	sti    
801042d0:	c9                   	leave  
801042d1:	c3                   	ret    
801042d2:	83 ec 0c             	sub    $0xc,%esp
801042d5:	68 1a 76 10 80       	push   $0x8010761a
801042da:	e8 91 c0 ff ff       	call   80100370 <panic>
801042df:	83 ec 0c             	sub    $0xc,%esp
801042e2:	68 03 76 10 80       	push   $0x80107603
801042e7:	e8 84 c0 ff ff       	call   80100370 <panic>
801042ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042f0 <holding>:
801042f0:	55                   	push   %ebp
801042f1:	89 e5                	mov    %esp,%ebp
801042f3:	56                   	push   %esi
801042f4:	53                   	push   %ebx
801042f5:	8b 75 08             	mov    0x8(%ebp),%esi
801042f8:	31 db                	xor    %ebx,%ebx
801042fa:	e8 41 ff ff ff       	call   80104240 <pushcli>
801042ff:	8b 06                	mov    (%esi),%eax
80104301:	85 c0                	test   %eax,%eax
80104303:	74 10                	je     80104315 <holding+0x25>
80104305:	8b 5e 08             	mov    0x8(%esi),%ebx
80104308:	e8 d3 f3 ff ff       	call   801036e0 <mycpu>
8010430d:	39 c3                	cmp    %eax,%ebx
8010430f:	0f 94 c3             	sete   %bl
80104312:	0f b6 db             	movzbl %bl,%ebx
80104315:	e8 66 ff ff ff       	call   80104280 <popcli>
8010431a:	89 d8                	mov    %ebx,%eax
8010431c:	5b                   	pop    %ebx
8010431d:	5e                   	pop    %esi
8010431e:	5d                   	pop    %ebp
8010431f:	c3                   	ret    

80104320 <acquire>:
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	53                   	push   %ebx
80104324:	83 ec 04             	sub    $0x4,%esp
80104327:	e8 14 ff ff ff       	call   80104240 <pushcli>
8010432c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010432f:	83 ec 0c             	sub    $0xc,%esp
80104332:	53                   	push   %ebx
80104333:	e8 b8 ff ff ff       	call   801042f0 <holding>
80104338:	83 c4 10             	add    $0x10,%esp
8010433b:	85 c0                	test   %eax,%eax
8010433d:	0f 85 7d 00 00 00    	jne    801043c0 <acquire+0xa0>
80104343:	ba 01 00 00 00       	mov    $0x1,%edx
80104348:	eb 09                	jmp    80104353 <acquire+0x33>
8010434a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104350:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104353:	89 d0                	mov    %edx,%eax
80104355:	f0 87 03             	lock xchg %eax,(%ebx)
80104358:	85 c0                	test   %eax,%eax
8010435a:	75 f4                	jne    80104350 <acquire+0x30>
8010435c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104361:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104364:	e8 77 f3 ff ff       	call   801036e0 <mycpu>
80104369:	89 ea                	mov    %ebp,%edx
8010436b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
8010436e:	89 43 08             	mov    %eax,0x8(%ebx)
80104371:	31 c0                	xor    %eax,%eax
80104373:	90                   	nop
80104374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104378:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
8010437e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104384:	77 1a                	ja     801043a0 <acquire+0x80>
80104386:	8b 5a 04             	mov    0x4(%edx),%ebx
80104389:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
8010438c:	83 c0 01             	add    $0x1,%eax
8010438f:	8b 12                	mov    (%edx),%edx
80104391:	83 f8 0a             	cmp    $0xa,%eax
80104394:	75 e2                	jne    80104378 <acquire+0x58>
80104396:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104399:	c9                   	leave  
8010439a:	c3                   	ret    
8010439b:	90                   	nop
8010439c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043a0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801043a7:	83 c0 01             	add    $0x1,%eax
801043aa:	83 f8 0a             	cmp    $0xa,%eax
801043ad:	74 e7                	je     80104396 <acquire+0x76>
801043af:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801043b6:	83 c0 01             	add    $0x1,%eax
801043b9:	83 f8 0a             	cmp    $0xa,%eax
801043bc:	75 e2                	jne    801043a0 <acquire+0x80>
801043be:	eb d6                	jmp    80104396 <acquire+0x76>
801043c0:	83 ec 0c             	sub    $0xc,%esp
801043c3:	68 21 76 10 80       	push   $0x80107621
801043c8:	e8 a3 bf ff ff       	call   80100370 <panic>
801043cd:	8d 76 00             	lea    0x0(%esi),%esi

801043d0 <release>:
801043d0:	55                   	push   %ebp
801043d1:	89 e5                	mov    %esp,%ebp
801043d3:	53                   	push   %ebx
801043d4:	83 ec 10             	sub    $0x10,%esp
801043d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043da:	53                   	push   %ebx
801043db:	e8 10 ff ff ff       	call   801042f0 <holding>
801043e0:	83 c4 10             	add    $0x10,%esp
801043e3:	85 c0                	test   %eax,%eax
801043e5:	74 22                	je     80104409 <release+0x39>
801043e7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801043ee:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801043f5:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801043fa:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104400:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104403:	c9                   	leave  
80104404:	e9 77 fe ff ff       	jmp    80104280 <popcli>
80104409:	83 ec 0c             	sub    $0xc,%esp
8010440c:	68 29 76 10 80       	push   $0x80107629
80104411:	e8 5a bf ff ff       	call   80100370 <panic>
80104416:	66 90                	xchg   %ax,%ax
80104418:	66 90                	xchg   %ax,%ax
8010441a:	66 90                	xchg   %ax,%ax
8010441c:	66 90                	xchg   %ax,%ax
8010441e:	66 90                	xchg   %ax,%ax

80104420 <memset>:
80104420:	55                   	push   %ebp
80104421:	89 e5                	mov    %esp,%ebp
80104423:	57                   	push   %edi
80104424:	53                   	push   %ebx
80104425:	8b 55 08             	mov    0x8(%ebp),%edx
80104428:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010442b:	f6 c2 03             	test   $0x3,%dl
8010442e:	75 05                	jne    80104435 <memset+0x15>
80104430:	f6 c1 03             	test   $0x3,%cl
80104433:	74 13                	je     80104448 <memset+0x28>
80104435:	89 d7                	mov    %edx,%edi
80104437:	8b 45 0c             	mov    0xc(%ebp),%eax
8010443a:	fc                   	cld    
8010443b:	f3 aa                	rep stos %al,%es:(%edi)
8010443d:	5b                   	pop    %ebx
8010443e:	89 d0                	mov    %edx,%eax
80104440:	5f                   	pop    %edi
80104441:	5d                   	pop    %ebp
80104442:	c3                   	ret    
80104443:	90                   	nop
80104444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104448:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010444c:	c1 e9 02             	shr    $0x2,%ecx
8010444f:	89 fb                	mov    %edi,%ebx
80104451:	89 f8                	mov    %edi,%eax
80104453:	c1 e3 18             	shl    $0x18,%ebx
80104456:	c1 e0 10             	shl    $0x10,%eax
80104459:	09 d8                	or     %ebx,%eax
8010445b:	09 f8                	or     %edi,%eax
8010445d:	c1 e7 08             	shl    $0x8,%edi
80104460:	09 f8                	or     %edi,%eax
80104462:	89 d7                	mov    %edx,%edi
80104464:	fc                   	cld    
80104465:	f3 ab                	rep stos %eax,%es:(%edi)
80104467:	5b                   	pop    %ebx
80104468:	89 d0                	mov    %edx,%eax
8010446a:	5f                   	pop    %edi
8010446b:	5d                   	pop    %ebp
8010446c:	c3                   	ret    
8010446d:	8d 76 00             	lea    0x0(%esi),%esi

80104470 <memcmp>:
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	57                   	push   %edi
80104474:	56                   	push   %esi
80104475:	8b 45 10             	mov    0x10(%ebp),%eax
80104478:	53                   	push   %ebx
80104479:	8b 75 0c             	mov    0xc(%ebp),%esi
8010447c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010447f:	85 c0                	test   %eax,%eax
80104481:	74 29                	je     801044ac <memcmp+0x3c>
80104483:	0f b6 13             	movzbl (%ebx),%edx
80104486:	0f b6 0e             	movzbl (%esi),%ecx
80104489:	38 d1                	cmp    %dl,%cl
8010448b:	75 2b                	jne    801044b8 <memcmp+0x48>
8010448d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104490:	31 c0                	xor    %eax,%eax
80104492:	eb 14                	jmp    801044a8 <memcmp+0x38>
80104494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104498:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010449d:	83 c0 01             	add    $0x1,%eax
801044a0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801044a4:	38 ca                	cmp    %cl,%dl
801044a6:	75 10                	jne    801044b8 <memcmp+0x48>
801044a8:	39 f8                	cmp    %edi,%eax
801044aa:	75 ec                	jne    80104498 <memcmp+0x28>
801044ac:	5b                   	pop    %ebx
801044ad:	31 c0                	xor    %eax,%eax
801044af:	5e                   	pop    %esi
801044b0:	5f                   	pop    %edi
801044b1:	5d                   	pop    %ebp
801044b2:	c3                   	ret    
801044b3:	90                   	nop
801044b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044b8:	0f b6 c2             	movzbl %dl,%eax
801044bb:	5b                   	pop    %ebx
801044bc:	29 c8                	sub    %ecx,%eax
801044be:	5e                   	pop    %esi
801044bf:	5f                   	pop    %edi
801044c0:	5d                   	pop    %ebp
801044c1:	c3                   	ret    
801044c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044d0 <memmove>:
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	56                   	push   %esi
801044d4:	53                   	push   %ebx
801044d5:	8b 45 08             	mov    0x8(%ebp),%eax
801044d8:	8b 75 0c             	mov    0xc(%ebp),%esi
801044db:	8b 5d 10             	mov    0x10(%ebp),%ebx
801044de:	39 c6                	cmp    %eax,%esi
801044e0:	73 2e                	jae    80104510 <memmove+0x40>
801044e2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801044e5:	39 c8                	cmp    %ecx,%eax
801044e7:	73 27                	jae    80104510 <memmove+0x40>
801044e9:	85 db                	test   %ebx,%ebx
801044eb:	8d 53 ff             	lea    -0x1(%ebx),%edx
801044ee:	74 17                	je     80104507 <memmove+0x37>
801044f0:	29 d9                	sub    %ebx,%ecx
801044f2:	89 cb                	mov    %ecx,%ebx
801044f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044f8:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801044fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801044ff:	83 ea 01             	sub    $0x1,%edx
80104502:	83 fa ff             	cmp    $0xffffffff,%edx
80104505:	75 f1                	jne    801044f8 <memmove+0x28>
80104507:	5b                   	pop    %ebx
80104508:	5e                   	pop    %esi
80104509:	5d                   	pop    %ebp
8010450a:	c3                   	ret    
8010450b:	90                   	nop
8010450c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104510:	31 d2                	xor    %edx,%edx
80104512:	85 db                	test   %ebx,%ebx
80104514:	74 f1                	je     80104507 <memmove+0x37>
80104516:	8d 76 00             	lea    0x0(%esi),%esi
80104519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104520:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104524:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104527:	83 c2 01             	add    $0x1,%edx
8010452a:	39 d3                	cmp    %edx,%ebx
8010452c:	75 f2                	jne    80104520 <memmove+0x50>
8010452e:	5b                   	pop    %ebx
8010452f:	5e                   	pop    %esi
80104530:	5d                   	pop    %ebp
80104531:	c3                   	ret    
80104532:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104540 <memcpy>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	5d                   	pop    %ebp
80104544:	eb 8a                	jmp    801044d0 <memmove>
80104546:	8d 76 00             	lea    0x0(%esi),%esi
80104549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104550 <strncmp>:
80104550:	55                   	push   %ebp
80104551:	89 e5                	mov    %esp,%ebp
80104553:	57                   	push   %edi
80104554:	56                   	push   %esi
80104555:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104558:	53                   	push   %ebx
80104559:	8b 7d 08             	mov    0x8(%ebp),%edi
8010455c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010455f:	85 c9                	test   %ecx,%ecx
80104561:	74 37                	je     8010459a <strncmp+0x4a>
80104563:	0f b6 17             	movzbl (%edi),%edx
80104566:	0f b6 1e             	movzbl (%esi),%ebx
80104569:	84 d2                	test   %dl,%dl
8010456b:	74 3f                	je     801045ac <strncmp+0x5c>
8010456d:	38 d3                	cmp    %dl,%bl
8010456f:	75 3b                	jne    801045ac <strncmp+0x5c>
80104571:	8d 47 01             	lea    0x1(%edi),%eax
80104574:	01 cf                	add    %ecx,%edi
80104576:	eb 1b                	jmp    80104593 <strncmp+0x43>
80104578:	90                   	nop
80104579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104580:	0f b6 10             	movzbl (%eax),%edx
80104583:	84 d2                	test   %dl,%dl
80104585:	74 21                	je     801045a8 <strncmp+0x58>
80104587:	0f b6 19             	movzbl (%ecx),%ebx
8010458a:	83 c0 01             	add    $0x1,%eax
8010458d:	89 ce                	mov    %ecx,%esi
8010458f:	38 da                	cmp    %bl,%dl
80104591:	75 19                	jne    801045ac <strncmp+0x5c>
80104593:	39 c7                	cmp    %eax,%edi
80104595:	8d 4e 01             	lea    0x1(%esi),%ecx
80104598:	75 e6                	jne    80104580 <strncmp+0x30>
8010459a:	5b                   	pop    %ebx
8010459b:	31 c0                	xor    %eax,%eax
8010459d:	5e                   	pop    %esi
8010459e:	5f                   	pop    %edi
8010459f:	5d                   	pop    %ebp
801045a0:	c3                   	ret    
801045a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045a8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
801045ac:	0f b6 c2             	movzbl %dl,%eax
801045af:	29 d8                	sub    %ebx,%eax
801045b1:	5b                   	pop    %ebx
801045b2:	5e                   	pop    %esi
801045b3:	5f                   	pop    %edi
801045b4:	5d                   	pop    %ebp
801045b5:	c3                   	ret    
801045b6:	8d 76 00             	lea    0x0(%esi),%esi
801045b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045c0 <strncpy>:
801045c0:	55                   	push   %ebp
801045c1:	89 e5                	mov    %esp,%ebp
801045c3:	56                   	push   %esi
801045c4:	53                   	push   %ebx
801045c5:	8b 45 08             	mov    0x8(%ebp),%eax
801045c8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801045cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045ce:	89 c2                	mov    %eax,%edx
801045d0:	eb 19                	jmp    801045eb <strncpy+0x2b>
801045d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045d8:	83 c3 01             	add    $0x1,%ebx
801045db:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801045df:	83 c2 01             	add    $0x1,%edx
801045e2:	84 c9                	test   %cl,%cl
801045e4:	88 4a ff             	mov    %cl,-0x1(%edx)
801045e7:	74 09                	je     801045f2 <strncpy+0x32>
801045e9:	89 f1                	mov    %esi,%ecx
801045eb:	85 c9                	test   %ecx,%ecx
801045ed:	8d 71 ff             	lea    -0x1(%ecx),%esi
801045f0:	7f e6                	jg     801045d8 <strncpy+0x18>
801045f2:	31 c9                	xor    %ecx,%ecx
801045f4:	85 f6                	test   %esi,%esi
801045f6:	7e 17                	jle    8010460f <strncpy+0x4f>
801045f8:	90                   	nop
801045f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104600:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104604:	89 f3                	mov    %esi,%ebx
80104606:	83 c1 01             	add    $0x1,%ecx
80104609:	29 cb                	sub    %ecx,%ebx
8010460b:	85 db                	test   %ebx,%ebx
8010460d:	7f f1                	jg     80104600 <strncpy+0x40>
8010460f:	5b                   	pop    %ebx
80104610:	5e                   	pop    %esi
80104611:	5d                   	pop    %ebp
80104612:	c3                   	ret    
80104613:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104620 <safestrcpy>:
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	56                   	push   %esi
80104624:	53                   	push   %ebx
80104625:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104628:	8b 45 08             	mov    0x8(%ebp),%eax
8010462b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010462e:	85 c9                	test   %ecx,%ecx
80104630:	7e 26                	jle    80104658 <safestrcpy+0x38>
80104632:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104636:	89 c1                	mov    %eax,%ecx
80104638:	eb 17                	jmp    80104651 <safestrcpy+0x31>
8010463a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104640:	83 c2 01             	add    $0x1,%edx
80104643:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104647:	83 c1 01             	add    $0x1,%ecx
8010464a:	84 db                	test   %bl,%bl
8010464c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010464f:	74 04                	je     80104655 <safestrcpy+0x35>
80104651:	39 f2                	cmp    %esi,%edx
80104653:	75 eb                	jne    80104640 <safestrcpy+0x20>
80104655:	c6 01 00             	movb   $0x0,(%ecx)
80104658:	5b                   	pop    %ebx
80104659:	5e                   	pop    %esi
8010465a:	5d                   	pop    %ebp
8010465b:	c3                   	ret    
8010465c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104660 <strlen>:
80104660:	55                   	push   %ebp
80104661:	31 c0                	xor    %eax,%eax
80104663:	89 e5                	mov    %esp,%ebp
80104665:	8b 55 08             	mov    0x8(%ebp),%edx
80104668:	80 3a 00             	cmpb   $0x0,(%edx)
8010466b:	74 0c                	je     80104679 <strlen+0x19>
8010466d:	8d 76 00             	lea    0x0(%esi),%esi
80104670:	83 c0 01             	add    $0x1,%eax
80104673:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104677:	75 f7                	jne    80104670 <strlen+0x10>
80104679:	5d                   	pop    %ebp
8010467a:	c3                   	ret    

8010467b <swtch>:
8010467b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010467f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104683:	55                   	push   %ebp
80104684:	53                   	push   %ebx
80104685:	56                   	push   %esi
80104686:	57                   	push   %edi
80104687:	89 20                	mov    %esp,(%eax)
80104689:	89 d4                	mov    %edx,%esp
8010468b:	5f                   	pop    %edi
8010468c:	5e                   	pop    %esi
8010468d:	5b                   	pop    %ebx
8010468e:	5d                   	pop    %ebp
8010468f:	c3                   	ret    

80104690 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	53                   	push   %ebx
80104694:	83 ec 04             	sub    $0x4,%esp
80104697:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010469a:	e8 e1 f0 ff ff       	call   80103780 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010469f:	8b 00                	mov    (%eax),%eax
801046a1:	39 d8                	cmp    %ebx,%eax
801046a3:	76 1b                	jbe    801046c0 <fetchint+0x30>
801046a5:	8d 53 04             	lea    0x4(%ebx),%edx
801046a8:	39 d0                	cmp    %edx,%eax
801046aa:	72 14                	jb     801046c0 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
801046ac:	8b 45 0c             	mov    0xc(%ebp),%eax
801046af:	8b 13                	mov    (%ebx),%edx
801046b1:	89 10                	mov    %edx,(%eax)
  return 0;
801046b3:	31 c0                	xor    %eax,%eax
}
801046b5:	83 c4 04             	add    $0x4,%esp
801046b8:	5b                   	pop    %ebx
801046b9:	5d                   	pop    %ebp
801046ba:	c3                   	ret    
801046bb:	90                   	nop
801046bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
801046c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046c5:	eb ee                	jmp    801046b5 <fetchint+0x25>
801046c7:	89 f6                	mov    %esi,%esi
801046c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046d0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	53                   	push   %ebx
801046d4:	83 ec 04             	sub    $0x4,%esp
801046d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801046da:	e8 a1 f0 ff ff       	call   80103780 <myproc>

  if(addr >= curproc->sz)
801046df:	39 18                	cmp    %ebx,(%eax)
801046e1:	76 29                	jbe    8010470c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
801046e3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801046e6:	89 da                	mov    %ebx,%edx
801046e8:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
801046ea:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
801046ec:	39 c3                	cmp    %eax,%ebx
801046ee:	73 1c                	jae    8010470c <fetchstr+0x3c>
    if(*s == 0)
801046f0:	80 3b 00             	cmpb   $0x0,(%ebx)
801046f3:	75 10                	jne    80104705 <fetchstr+0x35>
801046f5:	eb 29                	jmp    80104720 <fetchstr+0x50>
801046f7:	89 f6                	mov    %esi,%esi
801046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104700:	80 3a 00             	cmpb   $0x0,(%edx)
80104703:	74 1b                	je     80104720 <fetchstr+0x50>

  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
80104705:	83 c2 01             	add    $0x1,%edx
80104708:	39 d0                	cmp    %edx,%eax
8010470a:	77 f4                	ja     80104700 <fetchstr+0x30>
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
8010470c:	83 c4 04             	add    $0x4,%esp
{
  char *s, *ep;
  struct proc *curproc = myproc();

  if(addr >= curproc->sz)
    return -1;
8010470f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
80104714:	5b                   	pop    %ebx
80104715:	5d                   	pop    %ebp
80104716:	c3                   	ret    
80104717:	89 f6                	mov    %esi,%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104720:	83 c4 04             	add    $0x4,%esp
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
80104723:	89 d0                	mov    %edx,%eax
80104725:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
80104727:	5b                   	pop    %ebx
80104728:	5d                   	pop    %ebp
80104729:	c3                   	ret    
8010472a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104730 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104730:	55                   	push   %ebp
80104731:	89 e5                	mov    %esp,%ebp
80104733:	56                   	push   %esi
80104734:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104735:	e8 46 f0 ff ff       	call   80103780 <myproc>
8010473a:	8b 40 18             	mov    0x18(%eax),%eax
8010473d:	8b 55 08             	mov    0x8(%ebp),%edx
80104740:	8b 40 44             	mov    0x44(%eax),%eax
80104743:	8d 1c 90             	lea    (%eax,%edx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();
80104746:	e8 35 f0 ff ff       	call   80103780 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010474b:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010474d:	8d 73 04             	lea    0x4(%ebx),%esi
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104750:	39 c6                	cmp    %eax,%esi
80104752:	73 1c                	jae    80104770 <argint+0x40>
80104754:	8d 53 08             	lea    0x8(%ebx),%edx
80104757:	39 d0                	cmp    %edx,%eax
80104759:	72 15                	jb     80104770 <argint+0x40>
    return -1;
  *ip = *(int*)(addr);
8010475b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010475e:	8b 53 04             	mov    0x4(%ebx),%edx
80104761:	89 10                	mov    %edx,(%eax)
  return 0;
80104763:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
80104765:	5b                   	pop    %ebx
80104766:	5e                   	pop    %esi
80104767:	5d                   	pop    %ebp
80104768:	c3                   	ret    
80104769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
80104770:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104775:	eb ee                	jmp    80104765 <argint+0x35>
80104777:	89 f6                	mov    %esi,%esi
80104779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104780 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
80104785:	83 ec 10             	sub    $0x10,%esp
80104788:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010478b:	e8 f0 ef ff ff       	call   80103780 <myproc>
80104790:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104792:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104795:	83 ec 08             	sub    $0x8,%esp
80104798:	50                   	push   %eax
80104799:	ff 75 08             	pushl  0x8(%ebp)
8010479c:	e8 8f ff ff ff       	call   80104730 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
801047a1:	c1 e8 1f             	shr    $0x1f,%eax
801047a4:	83 c4 10             	add    $0x10,%esp
801047a7:	84 c0                	test   %al,%al
801047a9:	75 2d                	jne    801047d8 <argptr+0x58>
801047ab:	89 d8                	mov    %ebx,%eax
801047ad:	c1 e8 1f             	shr    $0x1f,%eax
801047b0:	84 c0                	test   %al,%al
801047b2:	75 24                	jne    801047d8 <argptr+0x58>
801047b4:	8b 16                	mov    (%esi),%edx
801047b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801047b9:	39 c2                	cmp    %eax,%edx
801047bb:	76 1b                	jbe    801047d8 <argptr+0x58>
801047bd:	01 c3                	add    %eax,%ebx
801047bf:	39 da                	cmp    %ebx,%edx
801047c1:	72 15                	jb     801047d8 <argptr+0x58>
    return -1;
  *pp = (char*)i;
801047c3:	8b 55 0c             	mov    0xc(%ebp),%edx
801047c6:	89 02                	mov    %eax,(%edx)
  return 0;
801047c8:	31 c0                	xor    %eax,%eax
}
801047ca:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047cd:	5b                   	pop    %ebx
801047ce:	5e                   	pop    %esi
801047cf:	5d                   	pop    %ebp
801047d0:	c3                   	ret    
801047d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
    return -1;
801047d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047dd:	eb eb                	jmp    801047ca <argptr+0x4a>
801047df:	90                   	nop

801047e0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
801047e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801047e9:	50                   	push   %eax
801047ea:	ff 75 08             	pushl  0x8(%ebp)
801047ed:	e8 3e ff ff ff       	call   80104730 <argint>
801047f2:	83 c4 10             	add    $0x10,%esp
801047f5:	85 c0                	test   %eax,%eax
801047f7:	78 17                	js     80104810 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
801047f9:	83 ec 08             	sub    $0x8,%esp
801047fc:	ff 75 0c             	pushl  0xc(%ebp)
801047ff:	ff 75 f4             	pushl  -0xc(%ebp)
80104802:	e8 c9 fe ff ff       	call   801046d0 <fetchstr>
80104807:	83 c4 10             	add    $0x10,%esp
}
8010480a:	c9                   	leave  
8010480b:	c3                   	ret    
8010480c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104810:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104815:	c9                   	leave  
80104816:	c3                   	ret    
80104817:	89 f6                	mov    %esi,%esi
80104819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104820 <syscall>:
[SYS_countreset] sys_countreset,
};

void
syscall(void)
{
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	53                   	push   %ebx
80104824:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104827:	e8 54 ef ff ff       	call   80103780 <myproc>
8010482c:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
8010482e:	8b 40 18             	mov    0x18(%eax),%eax
80104831:	8b 40 1c             	mov    0x1c(%eax),%eax
  
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104834:	8d 50 ff             	lea    -0x1(%eax),%edx
80104837:	83 fa 16             	cmp    $0x16,%edx
8010483a:	77 24                	ja     80104860 <syscall+0x40>
8010483c:	8b 0c 85 60 76 10 80 	mov    -0x7fef89a0(,%eax,4),%ecx
80104843:	85 c9                	test   %ecx,%ecx
80104845:	74 19                	je     80104860 <syscall+0x40>
    callcounts[num-1]++;//iterate executed system call counter in array callcounts
80104847:	83 04 95 60 4c 11 80 	addl   $0x1,-0x7feeb3a0(,%edx,4)
8010484e:	01 
    curproc->tf->eax = syscalls[num]();
8010484f:	8b 5b 18             	mov    0x18(%ebx),%ebx
80104852:	ff d1                	call   *%ecx
80104854:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104857:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010485a:	c9                   	leave  
8010485b:	c3                   	ret    
8010485c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    callcounts[num-1]++;//iterate executed system call counter in array callcounts
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104860:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104861:	8d 43 6c             	lea    0x6c(%ebx),%eax
  
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    callcounts[num-1]++;//iterate executed system call counter in array callcounts
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104864:	50                   	push   %eax
80104865:	ff 73 10             	pushl  0x10(%ebx)
80104868:	68 31 76 10 80       	push   $0x80107631
8010486d:	e8 ee bd ff ff       	call   80100660 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
80104872:	8b 43 18             	mov    0x18(%ebx),%eax
80104875:	83 c4 10             	add    $0x10,%esp
80104878:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
8010487f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104882:	c9                   	leave  
80104883:	c3                   	ret    
80104884:	66 90                	xchg   %ax,%ax
80104886:	66 90                	xchg   %ax,%ax
80104888:	66 90                	xchg   %ax,%ax
8010488a:	66 90                	xchg   %ax,%ax
8010488c:	66 90                	xchg   %ax,%ax
8010488e:	66 90                	xchg   %ax,%ax

80104890 <create>:
80104890:	55                   	push   %ebp
80104891:	89 e5                	mov    %esp,%ebp
80104893:	57                   	push   %edi
80104894:	56                   	push   %esi
80104895:	53                   	push   %ebx
80104896:	8d 75 da             	lea    -0x26(%ebp),%esi
80104899:	83 ec 44             	sub    $0x44,%esp
8010489c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010489f:	8b 4d 08             	mov    0x8(%ebp),%ecx
801048a2:	56                   	push   %esi
801048a3:	50                   	push   %eax
801048a4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801048a7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
801048aa:	e8 31 d6 ff ff       	call   80101ee0 <nameiparent>
801048af:	83 c4 10             	add    $0x10,%esp
801048b2:	85 c0                	test   %eax,%eax
801048b4:	0f 84 f6 00 00 00    	je     801049b0 <create+0x120>
801048ba:	83 ec 0c             	sub    $0xc,%esp
801048bd:	89 c7                	mov    %eax,%edi
801048bf:	50                   	push   %eax
801048c0:	e8 ab cd ff ff       	call   80101670 <ilock>
801048c5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801048c8:	83 c4 0c             	add    $0xc,%esp
801048cb:	50                   	push   %eax
801048cc:	56                   	push   %esi
801048cd:	57                   	push   %edi
801048ce:	e8 cd d2 ff ff       	call   80101ba0 <dirlookup>
801048d3:	83 c4 10             	add    $0x10,%esp
801048d6:	85 c0                	test   %eax,%eax
801048d8:	89 c3                	mov    %eax,%ebx
801048da:	74 54                	je     80104930 <create+0xa0>
801048dc:	83 ec 0c             	sub    $0xc,%esp
801048df:	57                   	push   %edi
801048e0:	e8 1b d0 ff ff       	call   80101900 <iunlockput>
801048e5:	89 1c 24             	mov    %ebx,(%esp)
801048e8:	e8 83 cd ff ff       	call   80101670 <ilock>
801048ed:	83 c4 10             	add    $0x10,%esp
801048f0:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
801048f5:	75 19                	jne    80104910 <create+0x80>
801048f7:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
801048fc:	89 d8                	mov    %ebx,%eax
801048fe:	75 10                	jne    80104910 <create+0x80>
80104900:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104903:	5b                   	pop    %ebx
80104904:	5e                   	pop    %esi
80104905:	5f                   	pop    %edi
80104906:	5d                   	pop    %ebp
80104907:	c3                   	ret    
80104908:	90                   	nop
80104909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104910:	83 ec 0c             	sub    $0xc,%esp
80104913:	53                   	push   %ebx
80104914:	e8 e7 cf ff ff       	call   80101900 <iunlockput>
80104919:	83 c4 10             	add    $0x10,%esp
8010491c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010491f:	31 c0                	xor    %eax,%eax
80104921:	5b                   	pop    %ebx
80104922:	5e                   	pop    %esi
80104923:	5f                   	pop    %edi
80104924:	5d                   	pop    %ebp
80104925:	c3                   	ret    
80104926:	8d 76 00             	lea    0x0(%esi),%esi
80104929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104930:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104934:	83 ec 08             	sub    $0x8,%esp
80104937:	50                   	push   %eax
80104938:	ff 37                	pushl  (%edi)
8010493a:	e8 c1 cb ff ff       	call   80101500 <ialloc>
8010493f:	83 c4 10             	add    $0x10,%esp
80104942:	85 c0                	test   %eax,%eax
80104944:	89 c3                	mov    %eax,%ebx
80104946:	0f 84 cc 00 00 00    	je     80104a18 <create+0x188>
8010494c:	83 ec 0c             	sub    $0xc,%esp
8010494f:	50                   	push   %eax
80104950:	e8 1b cd ff ff       	call   80101670 <ilock>
80104955:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104959:	66 89 43 52          	mov    %ax,0x52(%ebx)
8010495d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104961:	66 89 43 54          	mov    %ax,0x54(%ebx)
80104965:	b8 01 00 00 00       	mov    $0x1,%eax
8010496a:	66 89 43 56          	mov    %ax,0x56(%ebx)
8010496e:	89 1c 24             	mov    %ebx,(%esp)
80104971:	e8 4a cc ff ff       	call   801015c0 <iupdate>
80104976:	83 c4 10             	add    $0x10,%esp
80104979:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
8010497e:	74 40                	je     801049c0 <create+0x130>
80104980:	83 ec 04             	sub    $0x4,%esp
80104983:	ff 73 04             	pushl  0x4(%ebx)
80104986:	56                   	push   %esi
80104987:	57                   	push   %edi
80104988:	e8 73 d4 ff ff       	call   80101e00 <dirlink>
8010498d:	83 c4 10             	add    $0x10,%esp
80104990:	85 c0                	test   %eax,%eax
80104992:	78 77                	js     80104a0b <create+0x17b>
80104994:	83 ec 0c             	sub    $0xc,%esp
80104997:	57                   	push   %edi
80104998:	e8 63 cf ff ff       	call   80101900 <iunlockput>
8010499d:	83 c4 10             	add    $0x10,%esp
801049a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801049a3:	89 d8                	mov    %ebx,%eax
801049a5:	5b                   	pop    %ebx
801049a6:	5e                   	pop    %esi
801049a7:	5f                   	pop    %edi
801049a8:	5d                   	pop    %ebp
801049a9:	c3                   	ret    
801049aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049b0:	31 c0                	xor    %eax,%eax
801049b2:	e9 49 ff ff ff       	jmp    80104900 <create+0x70>
801049b7:	89 f6                	mov    %esi,%esi
801049b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801049c0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
801049c5:	83 ec 0c             	sub    $0xc,%esp
801049c8:	57                   	push   %edi
801049c9:	e8 f2 cb ff ff       	call   801015c0 <iupdate>
801049ce:	83 c4 0c             	add    $0xc,%esp
801049d1:	ff 73 04             	pushl  0x4(%ebx)
801049d4:	68 dc 76 10 80       	push   $0x801076dc
801049d9:	53                   	push   %ebx
801049da:	e8 21 d4 ff ff       	call   80101e00 <dirlink>
801049df:	83 c4 10             	add    $0x10,%esp
801049e2:	85 c0                	test   %eax,%eax
801049e4:	78 18                	js     801049fe <create+0x16e>
801049e6:	83 ec 04             	sub    $0x4,%esp
801049e9:	ff 77 04             	pushl  0x4(%edi)
801049ec:	68 db 76 10 80       	push   $0x801076db
801049f1:	53                   	push   %ebx
801049f2:	e8 09 d4 ff ff       	call   80101e00 <dirlink>
801049f7:	83 c4 10             	add    $0x10,%esp
801049fa:	85 c0                	test   %eax,%eax
801049fc:	79 82                	jns    80104980 <create+0xf0>
801049fe:	83 ec 0c             	sub    $0xc,%esp
80104a01:	68 cf 76 10 80       	push   $0x801076cf
80104a06:	e8 65 b9 ff ff       	call   80100370 <panic>
80104a0b:	83 ec 0c             	sub    $0xc,%esp
80104a0e:	68 de 76 10 80       	push   $0x801076de
80104a13:	e8 58 b9 ff ff       	call   80100370 <panic>
80104a18:	83 ec 0c             	sub    $0xc,%esp
80104a1b:	68 c0 76 10 80       	push   $0x801076c0
80104a20:	e8 4b b9 ff ff       	call   80100370 <panic>
80104a25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a30 <argfd.constprop.0>:
80104a30:	55                   	push   %ebp
80104a31:	89 e5                	mov    %esp,%ebp
80104a33:	56                   	push   %esi
80104a34:	53                   	push   %ebx
80104a35:	89 c6                	mov    %eax,%esi
80104a37:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a3a:	89 d3                	mov    %edx,%ebx
80104a3c:	83 ec 18             	sub    $0x18,%esp
80104a3f:	50                   	push   %eax
80104a40:	6a 00                	push   $0x0
80104a42:	e8 e9 fc ff ff       	call   80104730 <argint>
80104a47:	83 c4 10             	add    $0x10,%esp
80104a4a:	85 c0                	test   %eax,%eax
80104a4c:	78 32                	js     80104a80 <argfd.constprop.0+0x50>
80104a4e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104a52:	77 2c                	ja     80104a80 <argfd.constprop.0+0x50>
80104a54:	e8 27 ed ff ff       	call   80103780 <myproc>
80104a59:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104a5c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104a60:	85 c0                	test   %eax,%eax
80104a62:	74 1c                	je     80104a80 <argfd.constprop.0+0x50>
80104a64:	85 f6                	test   %esi,%esi
80104a66:	74 02                	je     80104a6a <argfd.constprop.0+0x3a>
80104a68:	89 16                	mov    %edx,(%esi)
80104a6a:	85 db                	test   %ebx,%ebx
80104a6c:	74 22                	je     80104a90 <argfd.constprop.0+0x60>
80104a6e:	89 03                	mov    %eax,(%ebx)
80104a70:	31 c0                	xor    %eax,%eax
80104a72:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a75:	5b                   	pop    %ebx
80104a76:	5e                   	pop    %esi
80104a77:	5d                   	pop    %ebp
80104a78:	c3                   	ret    
80104a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a80:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a83:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a88:	5b                   	pop    %ebx
80104a89:	5e                   	pop    %esi
80104a8a:	5d                   	pop    %ebp
80104a8b:	c3                   	ret    
80104a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a90:	31 c0                	xor    %eax,%eax
80104a92:	eb de                	jmp    80104a72 <argfd.constprop.0+0x42>
80104a94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104aa0 <sys_dup>:
80104aa0:	55                   	push   %ebp
80104aa1:	31 c0                	xor    %eax,%eax
80104aa3:	89 e5                	mov    %esp,%ebp
80104aa5:	56                   	push   %esi
80104aa6:	53                   	push   %ebx
80104aa7:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104aaa:	83 ec 10             	sub    $0x10,%esp
80104aad:	e8 7e ff ff ff       	call   80104a30 <argfd.constprop.0>
80104ab2:	85 c0                	test   %eax,%eax
80104ab4:	78 1a                	js     80104ad0 <sys_dup+0x30>
80104ab6:	31 db                	xor    %ebx,%ebx
80104ab8:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104abb:	e8 c0 ec ff ff       	call   80103780 <myproc>
80104ac0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104ac4:	85 d2                	test   %edx,%edx
80104ac6:	74 18                	je     80104ae0 <sys_dup+0x40>
80104ac8:	83 c3 01             	add    $0x1,%ebx
80104acb:	83 fb 10             	cmp    $0x10,%ebx
80104ace:	75 f0                	jne    80104ac0 <sys_dup+0x20>
80104ad0:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ad3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ad8:	5b                   	pop    %ebx
80104ad9:	5e                   	pop    %esi
80104ada:	5d                   	pop    %ebp
80104adb:	c3                   	ret    
80104adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ae0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104ae4:	83 ec 0c             	sub    $0xc,%esp
80104ae7:	ff 75 f4             	pushl  -0xc(%ebp)
80104aea:	e8 f1 c2 ff ff       	call   80100de0 <filedup>
80104aef:	83 c4 10             	add    $0x10,%esp
80104af2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104af5:	89 d8                	mov    %ebx,%eax
80104af7:	5b                   	pop    %ebx
80104af8:	5e                   	pop    %esi
80104af9:	5d                   	pop    %ebp
80104afa:	c3                   	ret    
80104afb:	90                   	nop
80104afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b00 <sys_read>:
80104b00:	55                   	push   %ebp
80104b01:	31 c0                	xor    %eax,%eax
80104b03:	89 e5                	mov    %esp,%ebp
80104b05:	83 ec 18             	sub    $0x18,%esp
80104b08:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b0b:	e8 20 ff ff ff       	call   80104a30 <argfd.constprop.0>
80104b10:	85 c0                	test   %eax,%eax
80104b12:	78 4c                	js     80104b60 <sys_read+0x60>
80104b14:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b17:	83 ec 08             	sub    $0x8,%esp
80104b1a:	50                   	push   %eax
80104b1b:	6a 02                	push   $0x2
80104b1d:	e8 0e fc ff ff       	call   80104730 <argint>
80104b22:	83 c4 10             	add    $0x10,%esp
80104b25:	85 c0                	test   %eax,%eax
80104b27:	78 37                	js     80104b60 <sys_read+0x60>
80104b29:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b2c:	83 ec 04             	sub    $0x4,%esp
80104b2f:	ff 75 f0             	pushl  -0x10(%ebp)
80104b32:	50                   	push   %eax
80104b33:	6a 01                	push   $0x1
80104b35:	e8 46 fc ff ff       	call   80104780 <argptr>
80104b3a:	83 c4 10             	add    $0x10,%esp
80104b3d:	85 c0                	test   %eax,%eax
80104b3f:	78 1f                	js     80104b60 <sys_read+0x60>
80104b41:	83 ec 04             	sub    $0x4,%esp
80104b44:	ff 75 f0             	pushl  -0x10(%ebp)
80104b47:	ff 75 f4             	pushl  -0xc(%ebp)
80104b4a:	ff 75 ec             	pushl  -0x14(%ebp)
80104b4d:	e8 fe c3 ff ff       	call   80100f50 <fileread>
80104b52:	83 c4 10             	add    $0x10,%esp
80104b55:	c9                   	leave  
80104b56:	c3                   	ret    
80104b57:	89 f6                	mov    %esi,%esi
80104b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b65:	c9                   	leave  
80104b66:	c3                   	ret    
80104b67:	89 f6                	mov    %esi,%esi
80104b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b70 <sys_write>:
80104b70:	55                   	push   %ebp
80104b71:	31 c0                	xor    %eax,%eax
80104b73:	89 e5                	mov    %esp,%ebp
80104b75:	83 ec 18             	sub    $0x18,%esp
80104b78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b7b:	e8 b0 fe ff ff       	call   80104a30 <argfd.constprop.0>
80104b80:	85 c0                	test   %eax,%eax
80104b82:	78 4c                	js     80104bd0 <sys_write+0x60>
80104b84:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b87:	83 ec 08             	sub    $0x8,%esp
80104b8a:	50                   	push   %eax
80104b8b:	6a 02                	push   $0x2
80104b8d:	e8 9e fb ff ff       	call   80104730 <argint>
80104b92:	83 c4 10             	add    $0x10,%esp
80104b95:	85 c0                	test   %eax,%eax
80104b97:	78 37                	js     80104bd0 <sys_write+0x60>
80104b99:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b9c:	83 ec 04             	sub    $0x4,%esp
80104b9f:	ff 75 f0             	pushl  -0x10(%ebp)
80104ba2:	50                   	push   %eax
80104ba3:	6a 01                	push   $0x1
80104ba5:	e8 d6 fb ff ff       	call   80104780 <argptr>
80104baa:	83 c4 10             	add    $0x10,%esp
80104bad:	85 c0                	test   %eax,%eax
80104baf:	78 1f                	js     80104bd0 <sys_write+0x60>
80104bb1:	83 ec 04             	sub    $0x4,%esp
80104bb4:	ff 75 f0             	pushl  -0x10(%ebp)
80104bb7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bba:	ff 75 ec             	pushl  -0x14(%ebp)
80104bbd:	e8 1e c4 ff ff       	call   80100fe0 <filewrite>
80104bc2:	83 c4 10             	add    $0x10,%esp
80104bc5:	c9                   	leave  
80104bc6:	c3                   	ret    
80104bc7:	89 f6                	mov    %esi,%esi
80104bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104bd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bd5:	c9                   	leave  
80104bd6:	c3                   	ret    
80104bd7:	89 f6                	mov    %esi,%esi
80104bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104be0 <sys_close>:
80104be0:	55                   	push   %ebp
80104be1:	89 e5                	mov    %esp,%ebp
80104be3:	83 ec 18             	sub    $0x18,%esp
80104be6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104be9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bec:	e8 3f fe ff ff       	call   80104a30 <argfd.constprop.0>
80104bf1:	85 c0                	test   %eax,%eax
80104bf3:	78 2b                	js     80104c20 <sys_close+0x40>
80104bf5:	e8 86 eb ff ff       	call   80103780 <myproc>
80104bfa:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104bfd:	83 ec 0c             	sub    $0xc,%esp
80104c00:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104c07:	00 
80104c08:	ff 75 f4             	pushl  -0xc(%ebp)
80104c0b:	e8 20 c2 ff ff       	call   80100e30 <fileclose>
80104c10:	83 c4 10             	add    $0x10,%esp
80104c13:	31 c0                	xor    %eax,%eax
80104c15:	c9                   	leave  
80104c16:	c3                   	ret    
80104c17:	89 f6                	mov    %esi,%esi
80104c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c25:	c9                   	leave  
80104c26:	c3                   	ret    
80104c27:	89 f6                	mov    %esi,%esi
80104c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c30 <sys_fstat>:
80104c30:	55                   	push   %ebp
80104c31:	31 c0                	xor    %eax,%eax
80104c33:	89 e5                	mov    %esp,%ebp
80104c35:	83 ec 18             	sub    $0x18,%esp
80104c38:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104c3b:	e8 f0 fd ff ff       	call   80104a30 <argfd.constprop.0>
80104c40:	85 c0                	test   %eax,%eax
80104c42:	78 2c                	js     80104c70 <sys_fstat+0x40>
80104c44:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c47:	83 ec 04             	sub    $0x4,%esp
80104c4a:	6a 14                	push   $0x14
80104c4c:	50                   	push   %eax
80104c4d:	6a 01                	push   $0x1
80104c4f:	e8 2c fb ff ff       	call   80104780 <argptr>
80104c54:	83 c4 10             	add    $0x10,%esp
80104c57:	85 c0                	test   %eax,%eax
80104c59:	78 15                	js     80104c70 <sys_fstat+0x40>
80104c5b:	83 ec 08             	sub    $0x8,%esp
80104c5e:	ff 75 f4             	pushl  -0xc(%ebp)
80104c61:	ff 75 f0             	pushl  -0x10(%ebp)
80104c64:	e8 97 c2 ff ff       	call   80100f00 <filestat>
80104c69:	83 c4 10             	add    $0x10,%esp
80104c6c:	c9                   	leave  
80104c6d:	c3                   	ret    
80104c6e:	66 90                	xchg   %ax,%ax
80104c70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c75:	c9                   	leave  
80104c76:	c3                   	ret    
80104c77:	89 f6                	mov    %esi,%esi
80104c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c80 <sys_link>:
80104c80:	55                   	push   %ebp
80104c81:	89 e5                	mov    %esp,%ebp
80104c83:	57                   	push   %edi
80104c84:	56                   	push   %esi
80104c85:	53                   	push   %ebx
80104c86:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104c89:	83 ec 34             	sub    $0x34,%esp
80104c8c:	50                   	push   %eax
80104c8d:	6a 00                	push   $0x0
80104c8f:	e8 4c fb ff ff       	call   801047e0 <argstr>
80104c94:	83 c4 10             	add    $0x10,%esp
80104c97:	85 c0                	test   %eax,%eax
80104c99:	0f 88 fb 00 00 00    	js     80104d9a <sys_link+0x11a>
80104c9f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104ca2:	83 ec 08             	sub    $0x8,%esp
80104ca5:	50                   	push   %eax
80104ca6:	6a 01                	push   $0x1
80104ca8:	e8 33 fb ff ff       	call   801047e0 <argstr>
80104cad:	83 c4 10             	add    $0x10,%esp
80104cb0:	85 c0                	test   %eax,%eax
80104cb2:	0f 88 e2 00 00 00    	js     80104d9a <sys_link+0x11a>
80104cb8:	e8 93 de ff ff       	call   80102b50 <begin_op>
80104cbd:	83 ec 0c             	sub    $0xc,%esp
80104cc0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104cc3:	e8 f8 d1 ff ff       	call   80101ec0 <namei>
80104cc8:	83 c4 10             	add    $0x10,%esp
80104ccb:	85 c0                	test   %eax,%eax
80104ccd:	89 c3                	mov    %eax,%ebx
80104ccf:	0f 84 f3 00 00 00    	je     80104dc8 <sys_link+0x148>
80104cd5:	83 ec 0c             	sub    $0xc,%esp
80104cd8:	50                   	push   %eax
80104cd9:	e8 92 c9 ff ff       	call   80101670 <ilock>
80104cde:	83 c4 10             	add    $0x10,%esp
80104ce1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ce6:	0f 84 c4 00 00 00    	je     80104db0 <sys_link+0x130>
80104cec:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104cf1:	83 ec 0c             	sub    $0xc,%esp
80104cf4:	8d 7d da             	lea    -0x26(%ebp),%edi
80104cf7:	53                   	push   %ebx
80104cf8:	e8 c3 c8 ff ff       	call   801015c0 <iupdate>
80104cfd:	89 1c 24             	mov    %ebx,(%esp)
80104d00:	e8 4b ca ff ff       	call   80101750 <iunlock>
80104d05:	58                   	pop    %eax
80104d06:	5a                   	pop    %edx
80104d07:	57                   	push   %edi
80104d08:	ff 75 d0             	pushl  -0x30(%ebp)
80104d0b:	e8 d0 d1 ff ff       	call   80101ee0 <nameiparent>
80104d10:	83 c4 10             	add    $0x10,%esp
80104d13:	85 c0                	test   %eax,%eax
80104d15:	89 c6                	mov    %eax,%esi
80104d17:	74 5b                	je     80104d74 <sys_link+0xf4>
80104d19:	83 ec 0c             	sub    $0xc,%esp
80104d1c:	50                   	push   %eax
80104d1d:	e8 4e c9 ff ff       	call   80101670 <ilock>
80104d22:	83 c4 10             	add    $0x10,%esp
80104d25:	8b 03                	mov    (%ebx),%eax
80104d27:	39 06                	cmp    %eax,(%esi)
80104d29:	75 3d                	jne    80104d68 <sys_link+0xe8>
80104d2b:	83 ec 04             	sub    $0x4,%esp
80104d2e:	ff 73 04             	pushl  0x4(%ebx)
80104d31:	57                   	push   %edi
80104d32:	56                   	push   %esi
80104d33:	e8 c8 d0 ff ff       	call   80101e00 <dirlink>
80104d38:	83 c4 10             	add    $0x10,%esp
80104d3b:	85 c0                	test   %eax,%eax
80104d3d:	78 29                	js     80104d68 <sys_link+0xe8>
80104d3f:	83 ec 0c             	sub    $0xc,%esp
80104d42:	56                   	push   %esi
80104d43:	e8 b8 cb ff ff       	call   80101900 <iunlockput>
80104d48:	89 1c 24             	mov    %ebx,(%esp)
80104d4b:	e8 50 ca ff ff       	call   801017a0 <iput>
80104d50:	e8 6b de ff ff       	call   80102bc0 <end_op>
80104d55:	83 c4 10             	add    $0x10,%esp
80104d58:	31 c0                	xor    %eax,%eax
80104d5a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d5d:	5b                   	pop    %ebx
80104d5e:	5e                   	pop    %esi
80104d5f:	5f                   	pop    %edi
80104d60:	5d                   	pop    %ebp
80104d61:	c3                   	ret    
80104d62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104d68:	83 ec 0c             	sub    $0xc,%esp
80104d6b:	56                   	push   %esi
80104d6c:	e8 8f cb ff ff       	call   80101900 <iunlockput>
80104d71:	83 c4 10             	add    $0x10,%esp
80104d74:	83 ec 0c             	sub    $0xc,%esp
80104d77:	53                   	push   %ebx
80104d78:	e8 f3 c8 ff ff       	call   80101670 <ilock>
80104d7d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104d82:	89 1c 24             	mov    %ebx,(%esp)
80104d85:	e8 36 c8 ff ff       	call   801015c0 <iupdate>
80104d8a:	89 1c 24             	mov    %ebx,(%esp)
80104d8d:	e8 6e cb ff ff       	call   80101900 <iunlockput>
80104d92:	e8 29 de ff ff       	call   80102bc0 <end_op>
80104d97:	83 c4 10             	add    $0x10,%esp
80104d9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104da2:	5b                   	pop    %ebx
80104da3:	5e                   	pop    %esi
80104da4:	5f                   	pop    %edi
80104da5:	5d                   	pop    %ebp
80104da6:	c3                   	ret    
80104da7:	89 f6                	mov    %esi,%esi
80104da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104db0:	83 ec 0c             	sub    $0xc,%esp
80104db3:	53                   	push   %ebx
80104db4:	e8 47 cb ff ff       	call   80101900 <iunlockput>
80104db9:	e8 02 de ff ff       	call   80102bc0 <end_op>
80104dbe:	83 c4 10             	add    $0x10,%esp
80104dc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dc6:	eb 92                	jmp    80104d5a <sys_link+0xda>
80104dc8:	e8 f3 dd ff ff       	call   80102bc0 <end_op>
80104dcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dd2:	eb 86                	jmp    80104d5a <sys_link+0xda>
80104dd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104dda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104de0 <sys_unlink>:
80104de0:	55                   	push   %ebp
80104de1:	89 e5                	mov    %esp,%ebp
80104de3:	57                   	push   %edi
80104de4:	56                   	push   %esi
80104de5:	53                   	push   %ebx
80104de6:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104de9:	83 ec 54             	sub    $0x54,%esp
80104dec:	50                   	push   %eax
80104ded:	6a 00                	push   $0x0
80104def:	e8 ec f9 ff ff       	call   801047e0 <argstr>
80104df4:	83 c4 10             	add    $0x10,%esp
80104df7:	85 c0                	test   %eax,%eax
80104df9:	0f 88 82 01 00 00    	js     80104f81 <sys_unlink+0x1a1>
80104dff:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104e02:	e8 49 dd ff ff       	call   80102b50 <begin_op>
80104e07:	83 ec 08             	sub    $0x8,%esp
80104e0a:	53                   	push   %ebx
80104e0b:	ff 75 c0             	pushl  -0x40(%ebp)
80104e0e:	e8 cd d0 ff ff       	call   80101ee0 <nameiparent>
80104e13:	83 c4 10             	add    $0x10,%esp
80104e16:	85 c0                	test   %eax,%eax
80104e18:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104e1b:	0f 84 6a 01 00 00    	je     80104f8b <sys_unlink+0x1ab>
80104e21:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104e24:	83 ec 0c             	sub    $0xc,%esp
80104e27:	56                   	push   %esi
80104e28:	e8 43 c8 ff ff       	call   80101670 <ilock>
80104e2d:	58                   	pop    %eax
80104e2e:	5a                   	pop    %edx
80104e2f:	68 dc 76 10 80       	push   $0x801076dc
80104e34:	53                   	push   %ebx
80104e35:	e8 46 cd ff ff       	call   80101b80 <namecmp>
80104e3a:	83 c4 10             	add    $0x10,%esp
80104e3d:	85 c0                	test   %eax,%eax
80104e3f:	0f 84 fc 00 00 00    	je     80104f41 <sys_unlink+0x161>
80104e45:	83 ec 08             	sub    $0x8,%esp
80104e48:	68 db 76 10 80       	push   $0x801076db
80104e4d:	53                   	push   %ebx
80104e4e:	e8 2d cd ff ff       	call   80101b80 <namecmp>
80104e53:	83 c4 10             	add    $0x10,%esp
80104e56:	85 c0                	test   %eax,%eax
80104e58:	0f 84 e3 00 00 00    	je     80104f41 <sys_unlink+0x161>
80104e5e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104e61:	83 ec 04             	sub    $0x4,%esp
80104e64:	50                   	push   %eax
80104e65:	53                   	push   %ebx
80104e66:	56                   	push   %esi
80104e67:	e8 34 cd ff ff       	call   80101ba0 <dirlookup>
80104e6c:	83 c4 10             	add    $0x10,%esp
80104e6f:	85 c0                	test   %eax,%eax
80104e71:	89 c3                	mov    %eax,%ebx
80104e73:	0f 84 c8 00 00 00    	je     80104f41 <sys_unlink+0x161>
80104e79:	83 ec 0c             	sub    $0xc,%esp
80104e7c:	50                   	push   %eax
80104e7d:	e8 ee c7 ff ff       	call   80101670 <ilock>
80104e82:	83 c4 10             	add    $0x10,%esp
80104e85:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104e8a:	0f 8e 24 01 00 00    	jle    80104fb4 <sys_unlink+0x1d4>
80104e90:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104e95:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104e98:	74 66                	je     80104f00 <sys_unlink+0x120>
80104e9a:	83 ec 04             	sub    $0x4,%esp
80104e9d:	6a 10                	push   $0x10
80104e9f:	6a 00                	push   $0x0
80104ea1:	56                   	push   %esi
80104ea2:	e8 79 f5 ff ff       	call   80104420 <memset>
80104ea7:	6a 10                	push   $0x10
80104ea9:	ff 75 c4             	pushl  -0x3c(%ebp)
80104eac:	56                   	push   %esi
80104ead:	ff 75 b4             	pushl  -0x4c(%ebp)
80104eb0:	e8 9b cb ff ff       	call   80101a50 <writei>
80104eb5:	83 c4 20             	add    $0x20,%esp
80104eb8:	83 f8 10             	cmp    $0x10,%eax
80104ebb:	0f 85 e6 00 00 00    	jne    80104fa7 <sys_unlink+0x1c7>
80104ec1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ec6:	0f 84 9c 00 00 00    	je     80104f68 <sys_unlink+0x188>
80104ecc:	83 ec 0c             	sub    $0xc,%esp
80104ecf:	ff 75 b4             	pushl  -0x4c(%ebp)
80104ed2:	e8 29 ca ff ff       	call   80101900 <iunlockput>
80104ed7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104edc:	89 1c 24             	mov    %ebx,(%esp)
80104edf:	e8 dc c6 ff ff       	call   801015c0 <iupdate>
80104ee4:	89 1c 24             	mov    %ebx,(%esp)
80104ee7:	e8 14 ca ff ff       	call   80101900 <iunlockput>
80104eec:	e8 cf dc ff ff       	call   80102bc0 <end_op>
80104ef1:	83 c4 10             	add    $0x10,%esp
80104ef4:	31 c0                	xor    %eax,%eax
80104ef6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ef9:	5b                   	pop    %ebx
80104efa:	5e                   	pop    %esi
80104efb:	5f                   	pop    %edi
80104efc:	5d                   	pop    %ebp
80104efd:	c3                   	ret    
80104efe:	66 90                	xchg   %ax,%ax
80104f00:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104f04:	76 94                	jbe    80104e9a <sys_unlink+0xba>
80104f06:	bf 20 00 00 00       	mov    $0x20,%edi
80104f0b:	eb 0f                	jmp    80104f1c <sys_unlink+0x13c>
80104f0d:	8d 76 00             	lea    0x0(%esi),%esi
80104f10:	83 c7 10             	add    $0x10,%edi
80104f13:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f16:	0f 83 7e ff ff ff    	jae    80104e9a <sys_unlink+0xba>
80104f1c:	6a 10                	push   $0x10
80104f1e:	57                   	push   %edi
80104f1f:	56                   	push   %esi
80104f20:	53                   	push   %ebx
80104f21:	e8 2a ca ff ff       	call   80101950 <readi>
80104f26:	83 c4 10             	add    $0x10,%esp
80104f29:	83 f8 10             	cmp    $0x10,%eax
80104f2c:	75 6c                	jne    80104f9a <sys_unlink+0x1ba>
80104f2e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104f33:	74 db                	je     80104f10 <sys_unlink+0x130>
80104f35:	83 ec 0c             	sub    $0xc,%esp
80104f38:	53                   	push   %ebx
80104f39:	e8 c2 c9 ff ff       	call   80101900 <iunlockput>
80104f3e:	83 c4 10             	add    $0x10,%esp
80104f41:	83 ec 0c             	sub    $0xc,%esp
80104f44:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f47:	e8 b4 c9 ff ff       	call   80101900 <iunlockput>
80104f4c:	e8 6f dc ff ff       	call   80102bc0 <end_op>
80104f51:	83 c4 10             	add    $0x10,%esp
80104f54:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f5c:	5b                   	pop    %ebx
80104f5d:	5e                   	pop    %esi
80104f5e:	5f                   	pop    %edi
80104f5f:	5d                   	pop    %ebp
80104f60:	c3                   	ret    
80104f61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104f68:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104f6b:	83 ec 0c             	sub    $0xc,%esp
80104f6e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
80104f73:	50                   	push   %eax
80104f74:	e8 47 c6 ff ff       	call   801015c0 <iupdate>
80104f79:	83 c4 10             	add    $0x10,%esp
80104f7c:	e9 4b ff ff ff       	jmp    80104ecc <sys_unlink+0xec>
80104f81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f86:	e9 6b ff ff ff       	jmp    80104ef6 <sys_unlink+0x116>
80104f8b:	e8 30 dc ff ff       	call   80102bc0 <end_op>
80104f90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f95:	e9 5c ff ff ff       	jmp    80104ef6 <sys_unlink+0x116>
80104f9a:	83 ec 0c             	sub    $0xc,%esp
80104f9d:	68 00 77 10 80       	push   $0x80107700
80104fa2:	e8 c9 b3 ff ff       	call   80100370 <panic>
80104fa7:	83 ec 0c             	sub    $0xc,%esp
80104faa:	68 12 77 10 80       	push   $0x80107712
80104faf:	e8 bc b3 ff ff       	call   80100370 <panic>
80104fb4:	83 ec 0c             	sub    $0xc,%esp
80104fb7:	68 ee 76 10 80       	push   $0x801076ee
80104fbc:	e8 af b3 ff ff       	call   80100370 <panic>
80104fc1:	eb 0d                	jmp    80104fd0 <sys_open>
80104fc3:	90                   	nop
80104fc4:	90                   	nop
80104fc5:	90                   	nop
80104fc6:	90                   	nop
80104fc7:	90                   	nop
80104fc8:	90                   	nop
80104fc9:	90                   	nop
80104fca:	90                   	nop
80104fcb:	90                   	nop
80104fcc:	90                   	nop
80104fcd:	90                   	nop
80104fce:	90                   	nop
80104fcf:	90                   	nop

80104fd0 <sys_open>:
80104fd0:	55                   	push   %ebp
80104fd1:	89 e5                	mov    %esp,%ebp
80104fd3:	57                   	push   %edi
80104fd4:	56                   	push   %esi
80104fd5:	53                   	push   %ebx
80104fd6:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104fd9:	83 ec 24             	sub    $0x24,%esp
80104fdc:	50                   	push   %eax
80104fdd:	6a 00                	push   $0x0
80104fdf:	e8 fc f7 ff ff       	call   801047e0 <argstr>
80104fe4:	83 c4 10             	add    $0x10,%esp
80104fe7:	85 c0                	test   %eax,%eax
80104fe9:	0f 88 9e 00 00 00    	js     8010508d <sys_open+0xbd>
80104fef:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104ff2:	83 ec 08             	sub    $0x8,%esp
80104ff5:	50                   	push   %eax
80104ff6:	6a 01                	push   $0x1
80104ff8:	e8 33 f7 ff ff       	call   80104730 <argint>
80104ffd:	83 c4 10             	add    $0x10,%esp
80105000:	85 c0                	test   %eax,%eax
80105002:	0f 88 85 00 00 00    	js     8010508d <sys_open+0xbd>
80105008:	e8 43 db ff ff       	call   80102b50 <begin_op>
8010500d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105011:	0f 85 89 00 00 00    	jne    801050a0 <sys_open+0xd0>
80105017:	83 ec 0c             	sub    $0xc,%esp
8010501a:	ff 75 e0             	pushl  -0x20(%ebp)
8010501d:	e8 9e ce ff ff       	call   80101ec0 <namei>
80105022:	83 c4 10             	add    $0x10,%esp
80105025:	85 c0                	test   %eax,%eax
80105027:	89 c6                	mov    %eax,%esi
80105029:	0f 84 8e 00 00 00    	je     801050bd <sys_open+0xed>
8010502f:	83 ec 0c             	sub    $0xc,%esp
80105032:	50                   	push   %eax
80105033:	e8 38 c6 ff ff       	call   80101670 <ilock>
80105038:	83 c4 10             	add    $0x10,%esp
8010503b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105040:	0f 84 d2 00 00 00    	je     80105118 <sys_open+0x148>
80105046:	e8 25 bd ff ff       	call   80100d70 <filealloc>
8010504b:	85 c0                	test   %eax,%eax
8010504d:	89 c7                	mov    %eax,%edi
8010504f:	74 2b                	je     8010507c <sys_open+0xac>
80105051:	31 db                	xor    %ebx,%ebx
80105053:	e8 28 e7 ff ff       	call   80103780 <myproc>
80105058:	90                   	nop
80105059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105060:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105064:	85 d2                	test   %edx,%edx
80105066:	74 68                	je     801050d0 <sys_open+0x100>
80105068:	83 c3 01             	add    $0x1,%ebx
8010506b:	83 fb 10             	cmp    $0x10,%ebx
8010506e:	75 f0                	jne    80105060 <sys_open+0x90>
80105070:	83 ec 0c             	sub    $0xc,%esp
80105073:	57                   	push   %edi
80105074:	e8 b7 bd ff ff       	call   80100e30 <fileclose>
80105079:	83 c4 10             	add    $0x10,%esp
8010507c:	83 ec 0c             	sub    $0xc,%esp
8010507f:	56                   	push   %esi
80105080:	e8 7b c8 ff ff       	call   80101900 <iunlockput>
80105085:	e8 36 db ff ff       	call   80102bc0 <end_op>
8010508a:	83 c4 10             	add    $0x10,%esp
8010508d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105090:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105095:	5b                   	pop    %ebx
80105096:	5e                   	pop    %esi
80105097:	5f                   	pop    %edi
80105098:	5d                   	pop    %ebp
80105099:	c3                   	ret    
8010509a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050a0:	83 ec 0c             	sub    $0xc,%esp
801050a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801050a6:	31 c9                	xor    %ecx,%ecx
801050a8:	6a 00                	push   $0x0
801050aa:	ba 02 00 00 00       	mov    $0x2,%edx
801050af:	e8 dc f7 ff ff       	call   80104890 <create>
801050b4:	83 c4 10             	add    $0x10,%esp
801050b7:	85 c0                	test   %eax,%eax
801050b9:	89 c6                	mov    %eax,%esi
801050bb:	75 89                	jne    80105046 <sys_open+0x76>
801050bd:	e8 fe da ff ff       	call   80102bc0 <end_op>
801050c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050c7:	eb 43                	jmp    8010510c <sys_open+0x13c>
801050c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801050d0:	83 ec 0c             	sub    $0xc,%esp
801050d3:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
801050d7:	56                   	push   %esi
801050d8:	e8 73 c6 ff ff       	call   80101750 <iunlock>
801050dd:	e8 de da ff ff       	call   80102bc0 <end_op>
801050e2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801050e8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801050eb:	83 c4 10             	add    $0x10,%esp
801050ee:	89 77 10             	mov    %esi,0x10(%edi)
801050f1:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801050f8:	89 d0                	mov    %edx,%eax
801050fa:	83 e0 01             	and    $0x1,%eax
801050fd:	83 f0 01             	xor    $0x1,%eax
80105100:	83 e2 03             	and    $0x3,%edx
80105103:	88 47 08             	mov    %al,0x8(%edi)
80105106:	0f 95 47 09          	setne  0x9(%edi)
8010510a:	89 d8                	mov    %ebx,%eax
8010510c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010510f:	5b                   	pop    %ebx
80105110:	5e                   	pop    %esi
80105111:	5f                   	pop    %edi
80105112:	5d                   	pop    %ebp
80105113:	c3                   	ret    
80105114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105118:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010511b:	85 c9                	test   %ecx,%ecx
8010511d:	0f 84 23 ff ff ff    	je     80105046 <sys_open+0x76>
80105123:	e9 54 ff ff ff       	jmp    8010507c <sys_open+0xac>
80105128:	90                   	nop
80105129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105130 <sys_mkdir>:
80105130:	55                   	push   %ebp
80105131:	89 e5                	mov    %esp,%ebp
80105133:	83 ec 18             	sub    $0x18,%esp
80105136:	e8 15 da ff ff       	call   80102b50 <begin_op>
8010513b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010513e:	83 ec 08             	sub    $0x8,%esp
80105141:	50                   	push   %eax
80105142:	6a 00                	push   $0x0
80105144:	e8 97 f6 ff ff       	call   801047e0 <argstr>
80105149:	83 c4 10             	add    $0x10,%esp
8010514c:	85 c0                	test   %eax,%eax
8010514e:	78 30                	js     80105180 <sys_mkdir+0x50>
80105150:	83 ec 0c             	sub    $0xc,%esp
80105153:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105156:	31 c9                	xor    %ecx,%ecx
80105158:	6a 00                	push   $0x0
8010515a:	ba 01 00 00 00       	mov    $0x1,%edx
8010515f:	e8 2c f7 ff ff       	call   80104890 <create>
80105164:	83 c4 10             	add    $0x10,%esp
80105167:	85 c0                	test   %eax,%eax
80105169:	74 15                	je     80105180 <sys_mkdir+0x50>
8010516b:	83 ec 0c             	sub    $0xc,%esp
8010516e:	50                   	push   %eax
8010516f:	e8 8c c7 ff ff       	call   80101900 <iunlockput>
80105174:	e8 47 da ff ff       	call   80102bc0 <end_op>
80105179:	83 c4 10             	add    $0x10,%esp
8010517c:	31 c0                	xor    %eax,%eax
8010517e:	c9                   	leave  
8010517f:	c3                   	ret    
80105180:	e8 3b da ff ff       	call   80102bc0 <end_op>
80105185:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010518a:	c9                   	leave  
8010518b:	c3                   	ret    
8010518c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105190 <sys_mknod>:
80105190:	55                   	push   %ebp
80105191:	89 e5                	mov    %esp,%ebp
80105193:	83 ec 18             	sub    $0x18,%esp
80105196:	e8 b5 d9 ff ff       	call   80102b50 <begin_op>
8010519b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010519e:	83 ec 08             	sub    $0x8,%esp
801051a1:	50                   	push   %eax
801051a2:	6a 00                	push   $0x0
801051a4:	e8 37 f6 ff ff       	call   801047e0 <argstr>
801051a9:	83 c4 10             	add    $0x10,%esp
801051ac:	85 c0                	test   %eax,%eax
801051ae:	78 60                	js     80105210 <sys_mknod+0x80>
801051b0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801051b3:	83 ec 08             	sub    $0x8,%esp
801051b6:	50                   	push   %eax
801051b7:	6a 01                	push   $0x1
801051b9:	e8 72 f5 ff ff       	call   80104730 <argint>
801051be:	83 c4 10             	add    $0x10,%esp
801051c1:	85 c0                	test   %eax,%eax
801051c3:	78 4b                	js     80105210 <sys_mknod+0x80>
801051c5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051c8:	83 ec 08             	sub    $0x8,%esp
801051cb:	50                   	push   %eax
801051cc:	6a 02                	push   $0x2
801051ce:	e8 5d f5 ff ff       	call   80104730 <argint>
801051d3:	83 c4 10             	add    $0x10,%esp
801051d6:	85 c0                	test   %eax,%eax
801051d8:	78 36                	js     80105210 <sys_mknod+0x80>
801051da:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801051de:	83 ec 0c             	sub    $0xc,%esp
801051e1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801051e5:	ba 03 00 00 00       	mov    $0x3,%edx
801051ea:	50                   	push   %eax
801051eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801051ee:	e8 9d f6 ff ff       	call   80104890 <create>
801051f3:	83 c4 10             	add    $0x10,%esp
801051f6:	85 c0                	test   %eax,%eax
801051f8:	74 16                	je     80105210 <sys_mknod+0x80>
801051fa:	83 ec 0c             	sub    $0xc,%esp
801051fd:	50                   	push   %eax
801051fe:	e8 fd c6 ff ff       	call   80101900 <iunlockput>
80105203:	e8 b8 d9 ff ff       	call   80102bc0 <end_op>
80105208:	83 c4 10             	add    $0x10,%esp
8010520b:	31 c0                	xor    %eax,%eax
8010520d:	c9                   	leave  
8010520e:	c3                   	ret    
8010520f:	90                   	nop
80105210:	e8 ab d9 ff ff       	call   80102bc0 <end_op>
80105215:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010521a:	c9                   	leave  
8010521b:	c3                   	ret    
8010521c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105220 <sys_chdir>:
80105220:	55                   	push   %ebp
80105221:	89 e5                	mov    %esp,%ebp
80105223:	56                   	push   %esi
80105224:	53                   	push   %ebx
80105225:	83 ec 10             	sub    $0x10,%esp
80105228:	e8 53 e5 ff ff       	call   80103780 <myproc>
8010522d:	89 c6                	mov    %eax,%esi
8010522f:	e8 1c d9 ff ff       	call   80102b50 <begin_op>
80105234:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105237:	83 ec 08             	sub    $0x8,%esp
8010523a:	50                   	push   %eax
8010523b:	6a 00                	push   $0x0
8010523d:	e8 9e f5 ff ff       	call   801047e0 <argstr>
80105242:	83 c4 10             	add    $0x10,%esp
80105245:	85 c0                	test   %eax,%eax
80105247:	78 77                	js     801052c0 <sys_chdir+0xa0>
80105249:	83 ec 0c             	sub    $0xc,%esp
8010524c:	ff 75 f4             	pushl  -0xc(%ebp)
8010524f:	e8 6c cc ff ff       	call   80101ec0 <namei>
80105254:	83 c4 10             	add    $0x10,%esp
80105257:	85 c0                	test   %eax,%eax
80105259:	89 c3                	mov    %eax,%ebx
8010525b:	74 63                	je     801052c0 <sys_chdir+0xa0>
8010525d:	83 ec 0c             	sub    $0xc,%esp
80105260:	50                   	push   %eax
80105261:	e8 0a c4 ff ff       	call   80101670 <ilock>
80105266:	83 c4 10             	add    $0x10,%esp
80105269:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010526e:	75 30                	jne    801052a0 <sys_chdir+0x80>
80105270:	83 ec 0c             	sub    $0xc,%esp
80105273:	53                   	push   %ebx
80105274:	e8 d7 c4 ff ff       	call   80101750 <iunlock>
80105279:	58                   	pop    %eax
8010527a:	ff 76 68             	pushl  0x68(%esi)
8010527d:	e8 1e c5 ff ff       	call   801017a0 <iput>
80105282:	e8 39 d9 ff ff       	call   80102bc0 <end_op>
80105287:	89 5e 68             	mov    %ebx,0x68(%esi)
8010528a:	83 c4 10             	add    $0x10,%esp
8010528d:	31 c0                	xor    %eax,%eax
8010528f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105292:	5b                   	pop    %ebx
80105293:	5e                   	pop    %esi
80105294:	5d                   	pop    %ebp
80105295:	c3                   	ret    
80105296:	8d 76 00             	lea    0x0(%esi),%esi
80105299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801052a0:	83 ec 0c             	sub    $0xc,%esp
801052a3:	53                   	push   %ebx
801052a4:	e8 57 c6 ff ff       	call   80101900 <iunlockput>
801052a9:	e8 12 d9 ff ff       	call   80102bc0 <end_op>
801052ae:	83 c4 10             	add    $0x10,%esp
801052b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052b6:	eb d7                	jmp    8010528f <sys_chdir+0x6f>
801052b8:	90                   	nop
801052b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801052c0:	e8 fb d8 ff ff       	call   80102bc0 <end_op>
801052c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052ca:	eb c3                	jmp    8010528f <sys_chdir+0x6f>
801052cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052d0 <sys_exec>:
801052d0:	55                   	push   %ebp
801052d1:	89 e5                	mov    %esp,%ebp
801052d3:	57                   	push   %edi
801052d4:	56                   	push   %esi
801052d5:	53                   	push   %ebx
801052d6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801052dc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
801052e2:	50                   	push   %eax
801052e3:	6a 00                	push   $0x0
801052e5:	e8 f6 f4 ff ff       	call   801047e0 <argstr>
801052ea:	83 c4 10             	add    $0x10,%esp
801052ed:	85 c0                	test   %eax,%eax
801052ef:	78 7f                	js     80105370 <sys_exec+0xa0>
801052f1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801052f7:	83 ec 08             	sub    $0x8,%esp
801052fa:	50                   	push   %eax
801052fb:	6a 01                	push   $0x1
801052fd:	e8 2e f4 ff ff       	call   80104730 <argint>
80105302:	83 c4 10             	add    $0x10,%esp
80105305:	85 c0                	test   %eax,%eax
80105307:	78 67                	js     80105370 <sys_exec+0xa0>
80105309:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010530f:	83 ec 04             	sub    $0x4,%esp
80105312:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105318:	68 80 00 00 00       	push   $0x80
8010531d:	6a 00                	push   $0x0
8010531f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105325:	50                   	push   %eax
80105326:	31 db                	xor    %ebx,%ebx
80105328:	e8 f3 f0 ff ff       	call   80104420 <memset>
8010532d:	83 c4 10             	add    $0x10,%esp
80105330:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105336:	83 ec 08             	sub    $0x8,%esp
80105339:	57                   	push   %edi
8010533a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010533d:	50                   	push   %eax
8010533e:	e8 4d f3 ff ff       	call   80104690 <fetchint>
80105343:	83 c4 10             	add    $0x10,%esp
80105346:	85 c0                	test   %eax,%eax
80105348:	78 26                	js     80105370 <sys_exec+0xa0>
8010534a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105350:	85 c0                	test   %eax,%eax
80105352:	74 2c                	je     80105380 <sys_exec+0xb0>
80105354:	83 ec 08             	sub    $0x8,%esp
80105357:	56                   	push   %esi
80105358:	50                   	push   %eax
80105359:	e8 72 f3 ff ff       	call   801046d0 <fetchstr>
8010535e:	83 c4 10             	add    $0x10,%esp
80105361:	85 c0                	test   %eax,%eax
80105363:	78 0b                	js     80105370 <sys_exec+0xa0>
80105365:	83 c3 01             	add    $0x1,%ebx
80105368:	83 c6 04             	add    $0x4,%esi
8010536b:	83 fb 20             	cmp    $0x20,%ebx
8010536e:	75 c0                	jne    80105330 <sys_exec+0x60>
80105370:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105373:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105378:	5b                   	pop    %ebx
80105379:	5e                   	pop    %esi
8010537a:	5f                   	pop    %edi
8010537b:	5d                   	pop    %ebp
8010537c:	c3                   	ret    
8010537d:	8d 76 00             	lea    0x0(%esi),%esi
80105380:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105386:	83 ec 08             	sub    $0x8,%esp
80105389:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105390:	00 00 00 00 
80105394:	50                   	push   %eax
80105395:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010539b:	e8 50 b6 ff ff       	call   801009f0 <exec>
801053a0:	83 c4 10             	add    $0x10,%esp
801053a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053a6:	5b                   	pop    %ebx
801053a7:	5e                   	pop    %esi
801053a8:	5f                   	pop    %edi
801053a9:	5d                   	pop    %ebp
801053aa:	c3                   	ret    
801053ab:	90                   	nop
801053ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053b0 <sys_pipe>:
801053b0:	55                   	push   %ebp
801053b1:	89 e5                	mov    %esp,%ebp
801053b3:	57                   	push   %edi
801053b4:	56                   	push   %esi
801053b5:	53                   	push   %ebx
801053b6:	8d 45 dc             	lea    -0x24(%ebp),%eax
801053b9:	83 ec 20             	sub    $0x20,%esp
801053bc:	6a 08                	push   $0x8
801053be:	50                   	push   %eax
801053bf:	6a 00                	push   $0x0
801053c1:	e8 ba f3 ff ff       	call   80104780 <argptr>
801053c6:	83 c4 10             	add    $0x10,%esp
801053c9:	85 c0                	test   %eax,%eax
801053cb:	78 4a                	js     80105417 <sys_pipe+0x67>
801053cd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801053d0:	83 ec 08             	sub    $0x8,%esp
801053d3:	50                   	push   %eax
801053d4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801053d7:	50                   	push   %eax
801053d8:	e8 13 de ff ff       	call   801031f0 <pipealloc>
801053dd:	83 c4 10             	add    $0x10,%esp
801053e0:	85 c0                	test   %eax,%eax
801053e2:	78 33                	js     80105417 <sys_pipe+0x67>
801053e4:	31 db                	xor    %ebx,%ebx
801053e6:	8b 7d e0             	mov    -0x20(%ebp),%edi
801053e9:	e8 92 e3 ff ff       	call   80103780 <myproc>
801053ee:	66 90                	xchg   %ax,%ax
801053f0:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801053f4:	85 f6                	test   %esi,%esi
801053f6:	74 30                	je     80105428 <sys_pipe+0x78>
801053f8:	83 c3 01             	add    $0x1,%ebx
801053fb:	83 fb 10             	cmp    $0x10,%ebx
801053fe:	75 f0                	jne    801053f0 <sys_pipe+0x40>
80105400:	83 ec 0c             	sub    $0xc,%esp
80105403:	ff 75 e0             	pushl  -0x20(%ebp)
80105406:	e8 25 ba ff ff       	call   80100e30 <fileclose>
8010540b:	58                   	pop    %eax
8010540c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010540f:	e8 1c ba ff ff       	call   80100e30 <fileclose>
80105414:	83 c4 10             	add    $0x10,%esp
80105417:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010541a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010541f:	5b                   	pop    %ebx
80105420:	5e                   	pop    %esi
80105421:	5f                   	pop    %edi
80105422:	5d                   	pop    %ebp
80105423:	c3                   	ret    
80105424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105428:	8d 73 08             	lea    0x8(%ebx),%esi
8010542b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
8010542f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105432:	e8 49 e3 ff ff       	call   80103780 <myproc>
80105437:	31 d2                	xor    %edx,%edx
80105439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105440:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105444:	85 c9                	test   %ecx,%ecx
80105446:	74 18                	je     80105460 <sys_pipe+0xb0>
80105448:	83 c2 01             	add    $0x1,%edx
8010544b:	83 fa 10             	cmp    $0x10,%edx
8010544e:	75 f0                	jne    80105440 <sys_pipe+0x90>
80105450:	e8 2b e3 ff ff       	call   80103780 <myproc>
80105455:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010545c:	00 
8010545d:	eb a1                	jmp    80105400 <sys_pipe+0x50>
8010545f:	90                   	nop
80105460:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
80105464:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105467:	89 18                	mov    %ebx,(%eax)
80105469:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010546c:	89 50 04             	mov    %edx,0x4(%eax)
8010546f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105472:	31 c0                	xor    %eax,%eax
80105474:	5b                   	pop    %ebx
80105475:	5e                   	pop    %esi
80105476:	5f                   	pop    %edi
80105477:	5d                   	pop    %ebp
80105478:	c3                   	ret    
80105479:	66 90                	xchg   %ax,%ax
8010547b:	66 90                	xchg   %ax,%ax
8010547d:	66 90                	xchg   %ax,%ax
8010547f:	90                   	nop

80105480 <sys_fork>:

int callcounts[25]; //contains counters for all system calls

int
sys_fork(void)
{
80105480:	55                   	push   %ebp
80105481:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105483:	5d                   	pop    %ebp
int callcounts[25]; //contains counters for all system calls

int
sys_fork(void)
{
  return fork();
80105484:	e9 97 e4 ff ff       	jmp    80103920 <fork>
80105489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105490 <sys_exit>:
}

int
sys_exit(void)
{
80105490:	55                   	push   %ebp
80105491:	89 e5                	mov    %esp,%ebp
80105493:	83 ec 08             	sub    $0x8,%esp
  exit();
80105496:	e8 15 e7 ff ff       	call   80103bb0 <exit>
  return 0;  // not reached
}
8010549b:	31 c0                	xor    %eax,%eax
8010549d:	c9                   	leave  
8010549e:	c3                   	ret    
8010549f:	90                   	nop

801054a0 <sys_wait>:

int
sys_wait(void)
{
801054a0:	55                   	push   %ebp
801054a1:	89 e5                	mov    %esp,%ebp
  return wait();
}
801054a3:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
801054a4:	e9 47 e9 ff ff       	jmp    80103df0 <wait>
801054a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801054b0 <sys_kill>:
}

int
sys_kill(void)
{
801054b0:	55                   	push   %ebp
801054b1:	89 e5                	mov    %esp,%ebp
801054b3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
801054b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054b9:	50                   	push   %eax
801054ba:	6a 00                	push   $0x0
801054bc:	e8 6f f2 ff ff       	call   80104730 <argint>
801054c1:	83 c4 10             	add    $0x10,%esp
801054c4:	85 c0                	test   %eax,%eax
801054c6:	78 18                	js     801054e0 <sys_kill+0x30>
    return -1;
  return kill(pid);
801054c8:	83 ec 0c             	sub    $0xc,%esp
801054cb:	ff 75 f4             	pushl  -0xc(%ebp)
801054ce:	e8 6d ea ff ff       	call   80103f40 <kill>
801054d3:	83 c4 10             	add    $0x10,%esp
}
801054d6:	c9                   	leave  
801054d7:	c3                   	ret    
801054d8:	90                   	nop
801054d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
801054e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
801054e5:	c9                   	leave  
801054e6:	c3                   	ret    
801054e7:	89 f6                	mov    %esi,%esi
801054e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801054f0 <sys_getpid>:

int
sys_getpid(void)
{
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801054f6:	e8 85 e2 ff ff       	call   80103780 <myproc>
801054fb:	8b 40 10             	mov    0x10(%eax),%eax
}
801054fe:	c9                   	leave  
801054ff:	c3                   	ret    

80105500 <sys_sbrk>:

int
sys_sbrk(void)
{
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
80105503:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105504:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
80105507:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010550a:	50                   	push   %eax
8010550b:	6a 00                	push   $0x0
8010550d:	e8 1e f2 ff ff       	call   80104730 <argint>
80105512:	83 c4 10             	add    $0x10,%esp
80105515:	85 c0                	test   %eax,%eax
80105517:	78 27                	js     80105540 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105519:	e8 62 e2 ff ff       	call   80103780 <myproc>
  if(growproc(n) < 0)
8010551e:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
80105521:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105523:	ff 75 f4             	pushl  -0xc(%ebp)
80105526:	e8 75 e3 ff ff       	call   801038a0 <growproc>
8010552b:	83 c4 10             	add    $0x10,%esp
8010552e:	85 c0                	test   %eax,%eax
80105530:	78 0e                	js     80105540 <sys_sbrk+0x40>
    return -1;
  return addr;
80105532:	89 d8                	mov    %ebx,%eax
}
80105534:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105537:	c9                   	leave  
80105538:	c3                   	ret    
80105539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105540:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105545:	eb ed                	jmp    80105534 <sys_sbrk+0x34>
80105547:	89 f6                	mov    %esi,%esi
80105549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105550 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105550:	55                   	push   %ebp
80105551:	89 e5                	mov    %esp,%ebp
80105553:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105554:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
80105557:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
8010555a:	50                   	push   %eax
8010555b:	6a 00                	push   $0x0
8010555d:	e8 ce f1 ff ff       	call   80104730 <argint>
80105562:	83 c4 10             	add    $0x10,%esp
80105565:	85 c0                	test   %eax,%eax
80105567:	0f 88 8a 00 00 00    	js     801055f7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010556d:	83 ec 0c             	sub    $0xc,%esp
80105570:	68 e0 4c 11 80       	push   $0x80114ce0
80105575:	e8 a6 ed ff ff       	call   80104320 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010557a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010557d:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105580:	8b 1d 20 55 11 80    	mov    0x80115520,%ebx
  while(ticks - ticks0 < n){
80105586:	85 d2                	test   %edx,%edx
80105588:	75 27                	jne    801055b1 <sys_sleep+0x61>
8010558a:	eb 54                	jmp    801055e0 <sys_sleep+0x90>
8010558c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105590:	83 ec 08             	sub    $0x8,%esp
80105593:	68 e0 4c 11 80       	push   $0x80114ce0
80105598:	68 20 55 11 80       	push   $0x80115520
8010559d:	e8 8e e7 ff ff       	call   80103d30 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801055a2:	a1 20 55 11 80       	mov    0x80115520,%eax
801055a7:	83 c4 10             	add    $0x10,%esp
801055aa:	29 d8                	sub    %ebx,%eax
801055ac:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801055af:	73 2f                	jae    801055e0 <sys_sleep+0x90>
    if(myproc()->killed){
801055b1:	e8 ca e1 ff ff       	call   80103780 <myproc>
801055b6:	8b 40 24             	mov    0x24(%eax),%eax
801055b9:	85 c0                	test   %eax,%eax
801055bb:	74 d3                	je     80105590 <sys_sleep+0x40>
      release(&tickslock);
801055bd:	83 ec 0c             	sub    $0xc,%esp
801055c0:	68 e0 4c 11 80       	push   $0x80114ce0
801055c5:	e8 06 ee ff ff       	call   801043d0 <release>
      return -1;
801055ca:	83 c4 10             	add    $0x10,%esp
801055cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
801055d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055d5:	c9                   	leave  
801055d6:	c3                   	ret    
801055d7:	89 f6                	mov    %esi,%esi
801055d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
801055e0:	83 ec 0c             	sub    $0xc,%esp
801055e3:	68 e0 4c 11 80       	push   $0x80114ce0
801055e8:	e8 e3 ed ff ff       	call   801043d0 <release>
  return 0;
801055ed:	83 c4 10             	add    $0x10,%esp
801055f0:	31 c0                	xor    %eax,%eax
}
801055f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055f5:	c9                   	leave  
801055f6:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
801055f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055fc:	eb d4                	jmp    801055d2 <sys_sleep+0x82>
801055fe:	66 90                	xchg   %ax,%ax

80105600 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105600:	55                   	push   %ebp
80105601:	89 e5                	mov    %esp,%ebp
80105603:	53                   	push   %ebx
80105604:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105607:	68 e0 4c 11 80       	push   $0x80114ce0
8010560c:	e8 0f ed ff ff       	call   80104320 <acquire>
  xticks = ticks;
80105611:	8b 1d 20 55 11 80    	mov    0x80115520,%ebx
  release(&tickslock);
80105617:	c7 04 24 e0 4c 11 80 	movl   $0x80114ce0,(%esp)
8010561e:	e8 ad ed ff ff       	call   801043d0 <release>
  return xticks;
}
80105623:	89 d8                	mov    %ebx,%eax
80105625:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105628:	c9                   	leave  
80105629:	c3                   	ret    
8010562a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105630 <sys_getreadcount>:

//get count of specific system call
int
sys_getreadcount(void)
{
80105630:	55                   	push   %ebp
80105631:	89 e5                	mov    %esp,%ebp
80105633:	83 ec 20             	sub    $0x20,%esp
	int calltofollow;	
	if(argint(0, &calltofollow) < 0) {
80105636:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105639:	50                   	push   %eax
8010563a:	6a 00                	push   $0x0
8010563c:	e8 ef f0 ff ff       	call   80104730 <argint>
80105641:	83 c4 10             	add    $0x10,%esp
80105644:	85 c0                	test   %eax,%eax
80105646:	78 10                	js     80105658 <sys_getreadcount+0x28>
		return -1;
		exit();
	}
	//return count value with input index calltofollow-1
	return callcounts[calltofollow-1];
80105648:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010564b:	8b 04 85 5c 4c 11 80 	mov    -0x7feeb3a4(,%eax,4),%eax
}
80105652:	c9                   	leave  
80105653:	c3                   	ret    
80105654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
sys_getreadcount(void)
{
	int calltofollow;	
	if(argint(0, &calltofollow) < 0) {
		return -1;
80105658:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
		exit();
	}
	//return count value with input index calltofollow-1
	return callcounts[calltofollow-1];
}
8010565d:	c9                   	leave  
8010565e:	c3                   	ret    
8010565f:	90                   	nop

80105660 <sys_countreset>:

//reset specific or all system call counters
int
sys_countreset(void)
{
80105660:	55                   	push   %ebp
80105661:	89 e5                	mov    %esp,%ebp
80105663:	83 ec 20             	sub    $0x20,%esp
	int input;
	if(argint(0, &input) < 0) {
80105666:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105669:	50                   	push   %eax
8010566a:	6a 00                	push   $0x0
8010566c:	e8 bf f0 ff ff       	call   80104730 <argint>
80105671:	83 c4 10             	add    $0x10,%esp
80105674:	85 c0                	test   %eax,%eax
80105676:	78 37                	js     801056af <sys_countreset+0x4f>
		return -1;
		exit();
	}
	//reset all
	if(input == 0) {
80105678:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010567b:	85 c0                	test   %eax,%eax
8010567d:	75 21                	jne    801056a0 <sys_countreset+0x40>
8010567f:	b8 60 4c 11 80       	mov    $0x80114c60,%eax
80105684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		 for(int i=0;i<25;i++){
			callcounts[i] = 0;
80105688:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010568e:	83 c0 04             	add    $0x4,%eax
		return -1;
		exit();
	}
	//reset all
	if(input == 0) {
		 for(int i=0;i<25;i++){
80105691:	3d c4 4c 11 80       	cmp    $0x80114cc4,%eax
80105696:	75 f0                	jne    80105688 <sys_countreset+0x28>
			callcounts[i] = 0;
		}
		return 1;
80105698:	b8 01 00 00 00       	mov    $0x1,%eax
	}
	//reset one with index input-1
	callcounts[input-1] = 0;
	return 0;
}
8010569d:	c9                   	leave  
8010569e:	c3                   	ret    
8010569f:	90                   	nop
			callcounts[i] = 0;
		}
		return 1;
	}
	//reset one with index input-1
	callcounts[input-1] = 0;
801056a0:	c7 04 85 5c 4c 11 80 	movl   $0x0,-0x7feeb3a4(,%eax,4)
801056a7:	00 00 00 00 
	return 0;
801056ab:	31 c0                	xor    %eax,%eax
}
801056ad:	c9                   	leave  
801056ae:	c3                   	ret    
int
sys_countreset(void)
{
	int input;
	if(argint(0, &input) < 0) {
		return -1;
801056af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
		return 1;
	}
	//reset one with index input-1
	callcounts[input-1] = 0;
	return 0;
}
801056b4:	c9                   	leave  
801056b5:	c3                   	ret    

801056b6 <alltraps>:
801056b6:	1e                   	push   %ds
801056b7:	06                   	push   %es
801056b8:	0f a0                	push   %fs
801056ba:	0f a8                	push   %gs
801056bc:	60                   	pusha  
801056bd:	66 b8 10 00          	mov    $0x10,%ax
801056c1:	8e d8                	mov    %eax,%ds
801056c3:	8e c0                	mov    %eax,%es
801056c5:	54                   	push   %esp
801056c6:	e8 e5 00 00 00       	call   801057b0 <trap>
801056cb:	83 c4 04             	add    $0x4,%esp

801056ce <trapret>:
801056ce:	61                   	popa   
801056cf:	0f a9                	pop    %gs
801056d1:	0f a1                	pop    %fs
801056d3:	07                   	pop    %es
801056d4:	1f                   	pop    %ds
801056d5:	83 c4 08             	add    $0x8,%esp
801056d8:	cf                   	iret   
801056d9:	66 90                	xchg   %ax,%ax
801056db:	66 90                	xchg   %ax,%ax
801056dd:	66 90                	xchg   %ax,%ax
801056df:	90                   	nop

801056e0 <tvinit>:
801056e0:	31 c0                	xor    %eax,%eax
801056e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801056e8:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801056ef:	b9 08 00 00 00       	mov    $0x8,%ecx
801056f4:	c6 04 c5 24 4d 11 80 	movb   $0x0,-0x7feeb2dc(,%eax,8)
801056fb:	00 
801056fc:	66 89 0c c5 22 4d 11 	mov    %cx,-0x7feeb2de(,%eax,8)
80105703:	80 
80105704:	c6 04 c5 25 4d 11 80 	movb   $0x8e,-0x7feeb2db(,%eax,8)
8010570b:	8e 
8010570c:	66 89 14 c5 20 4d 11 	mov    %dx,-0x7feeb2e0(,%eax,8)
80105713:	80 
80105714:	c1 ea 10             	shr    $0x10,%edx
80105717:	66 89 14 c5 26 4d 11 	mov    %dx,-0x7feeb2da(,%eax,8)
8010571e:	80 
8010571f:	83 c0 01             	add    $0x1,%eax
80105722:	3d 00 01 00 00       	cmp    $0x100,%eax
80105727:	75 bf                	jne    801056e8 <tvinit+0x8>
80105729:	55                   	push   %ebp
8010572a:	ba 08 00 00 00       	mov    $0x8,%edx
8010572f:	89 e5                	mov    %esp,%ebp
80105731:	83 ec 10             	sub    $0x10,%esp
80105734:	a1 08 a1 10 80       	mov    0x8010a108,%eax
80105739:	68 21 77 10 80       	push   $0x80107721
8010573e:	68 e0 4c 11 80       	push   $0x80114ce0
80105743:	66 89 15 22 4f 11 80 	mov    %dx,0x80114f22
8010574a:	c6 05 24 4f 11 80 00 	movb   $0x0,0x80114f24
80105751:	66 a3 20 4f 11 80    	mov    %ax,0x80114f20
80105757:	c1 e8 10             	shr    $0x10,%eax
8010575a:	c6 05 25 4f 11 80 ef 	movb   $0xef,0x80114f25
80105761:	66 a3 26 4f 11 80    	mov    %ax,0x80114f26
80105767:	e8 54 ea ff ff       	call   801041c0 <initlock>
8010576c:	83 c4 10             	add    $0x10,%esp
8010576f:	c9                   	leave  
80105770:	c3                   	ret    
80105771:	eb 0d                	jmp    80105780 <idtinit>
80105773:	90                   	nop
80105774:	90                   	nop
80105775:	90                   	nop
80105776:	90                   	nop
80105777:	90                   	nop
80105778:	90                   	nop
80105779:	90                   	nop
8010577a:	90                   	nop
8010577b:	90                   	nop
8010577c:	90                   	nop
8010577d:	90                   	nop
8010577e:	90                   	nop
8010577f:	90                   	nop

80105780 <idtinit>:
80105780:	55                   	push   %ebp
80105781:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105786:	89 e5                	mov    %esp,%ebp
80105788:	83 ec 10             	sub    $0x10,%esp
8010578b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
8010578f:	b8 20 4d 11 80       	mov    $0x80114d20,%eax
80105794:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105798:	c1 e8 10             	shr    $0x10,%eax
8010579b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
8010579f:	8d 45 fa             	lea    -0x6(%ebp),%eax
801057a2:	0f 01 18             	lidtl  (%eax)
801057a5:	c9                   	leave  
801057a6:	c3                   	ret    
801057a7:	89 f6                	mov    %esi,%esi
801057a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057b0 <trap>:
801057b0:	55                   	push   %ebp
801057b1:	89 e5                	mov    %esp,%ebp
801057b3:	57                   	push   %edi
801057b4:	56                   	push   %esi
801057b5:	53                   	push   %ebx
801057b6:	83 ec 1c             	sub    $0x1c,%esp
801057b9:	8b 7d 08             	mov    0x8(%ebp),%edi
801057bc:	8b 47 30             	mov    0x30(%edi),%eax
801057bf:	83 f8 40             	cmp    $0x40,%eax
801057c2:	0f 84 88 01 00 00    	je     80105950 <trap+0x1a0>
801057c8:	83 e8 20             	sub    $0x20,%eax
801057cb:	83 f8 1f             	cmp    $0x1f,%eax
801057ce:	77 10                	ja     801057e0 <trap+0x30>
801057d0:	ff 24 85 c8 77 10 80 	jmp    *-0x7fef8838(,%eax,4)
801057d7:	89 f6                	mov    %esi,%esi
801057d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801057e0:	e8 9b df ff ff       	call   80103780 <myproc>
801057e5:	85 c0                	test   %eax,%eax
801057e7:	0f 84 d7 01 00 00    	je     801059c4 <trap+0x214>
801057ed:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801057f1:	0f 84 cd 01 00 00    	je     801059c4 <trap+0x214>
801057f7:	0f 20 d1             	mov    %cr2,%ecx
801057fa:	8b 57 38             	mov    0x38(%edi),%edx
801057fd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105800:	89 55 dc             	mov    %edx,-0x24(%ebp)
80105803:	e8 58 df ff ff       	call   80103760 <cpuid>
80105808:	8b 77 34             	mov    0x34(%edi),%esi
8010580b:	8b 5f 30             	mov    0x30(%edi),%ebx
8010580e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105811:	e8 6a df ff ff       	call   80103780 <myproc>
80105816:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105819:	e8 62 df ff ff       	call   80103780 <myproc>
8010581e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105821:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105824:	51                   	push   %ecx
80105825:	52                   	push   %edx
80105826:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105829:	ff 75 e4             	pushl  -0x1c(%ebp)
8010582c:	56                   	push   %esi
8010582d:	53                   	push   %ebx
8010582e:	83 c2 6c             	add    $0x6c,%edx
80105831:	52                   	push   %edx
80105832:	ff 70 10             	pushl  0x10(%eax)
80105835:	68 84 77 10 80       	push   $0x80107784
8010583a:	e8 21 ae ff ff       	call   80100660 <cprintf>
8010583f:	83 c4 20             	add    $0x20,%esp
80105842:	e8 39 df ff ff       	call   80103780 <myproc>
80105847:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010584e:	66 90                	xchg   %ax,%ax
80105850:	e8 2b df ff ff       	call   80103780 <myproc>
80105855:	85 c0                	test   %eax,%eax
80105857:	74 0c                	je     80105865 <trap+0xb5>
80105859:	e8 22 df ff ff       	call   80103780 <myproc>
8010585e:	8b 50 24             	mov    0x24(%eax),%edx
80105861:	85 d2                	test   %edx,%edx
80105863:	75 4b                	jne    801058b0 <trap+0x100>
80105865:	e8 16 df ff ff       	call   80103780 <myproc>
8010586a:	85 c0                	test   %eax,%eax
8010586c:	74 0b                	je     80105879 <trap+0xc9>
8010586e:	e8 0d df ff ff       	call   80103780 <myproc>
80105873:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105877:	74 4f                	je     801058c8 <trap+0x118>
80105879:	e8 02 df ff ff       	call   80103780 <myproc>
8010587e:	85 c0                	test   %eax,%eax
80105880:	74 1d                	je     8010589f <trap+0xef>
80105882:	e8 f9 de ff ff       	call   80103780 <myproc>
80105887:	8b 40 24             	mov    0x24(%eax),%eax
8010588a:	85 c0                	test   %eax,%eax
8010588c:	74 11                	je     8010589f <trap+0xef>
8010588e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105892:	83 e0 03             	and    $0x3,%eax
80105895:	66 83 f8 03          	cmp    $0x3,%ax
80105899:	0f 84 da 00 00 00    	je     80105979 <trap+0x1c9>
8010589f:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058a2:	5b                   	pop    %ebx
801058a3:	5e                   	pop    %esi
801058a4:	5f                   	pop    %edi
801058a5:	5d                   	pop    %ebp
801058a6:	c3                   	ret    
801058a7:	89 f6                	mov    %esi,%esi
801058a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801058b0:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801058b4:	83 e0 03             	and    $0x3,%eax
801058b7:	66 83 f8 03          	cmp    $0x3,%ax
801058bb:	75 a8                	jne    80105865 <trap+0xb5>
801058bd:	e8 ee e2 ff ff       	call   80103bb0 <exit>
801058c2:	eb a1                	jmp    80105865 <trap+0xb5>
801058c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801058c8:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
801058cc:	75 ab                	jne    80105879 <trap+0xc9>
801058ce:	e8 0d e4 ff ff       	call   80103ce0 <yield>
801058d3:	eb a4                	jmp    80105879 <trap+0xc9>
801058d5:	8d 76 00             	lea    0x0(%esi),%esi
801058d8:	e8 83 de ff ff       	call   80103760 <cpuid>
801058dd:	85 c0                	test   %eax,%eax
801058df:	0f 84 ab 00 00 00    	je     80105990 <trap+0x1e0>
801058e5:	e8 26 ce ff ff       	call   80102710 <lapiceoi>
801058ea:	e9 61 ff ff ff       	jmp    80105850 <trap+0xa0>
801058ef:	90                   	nop
801058f0:	e8 db cc ff ff       	call   801025d0 <kbdintr>
801058f5:	e8 16 ce ff ff       	call   80102710 <lapiceoi>
801058fa:	e9 51 ff ff ff       	jmp    80105850 <trap+0xa0>
801058ff:	90                   	nop
80105900:	e8 5b 02 00 00       	call   80105b60 <uartintr>
80105905:	e8 06 ce ff ff       	call   80102710 <lapiceoi>
8010590a:	e9 41 ff ff ff       	jmp    80105850 <trap+0xa0>
8010590f:	90                   	nop
80105910:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105914:	8b 77 38             	mov    0x38(%edi),%esi
80105917:	e8 44 de ff ff       	call   80103760 <cpuid>
8010591c:	56                   	push   %esi
8010591d:	53                   	push   %ebx
8010591e:	50                   	push   %eax
8010591f:	68 2c 77 10 80       	push   $0x8010772c
80105924:	e8 37 ad ff ff       	call   80100660 <cprintf>
80105929:	e8 e2 cd ff ff       	call   80102710 <lapiceoi>
8010592e:	83 c4 10             	add    $0x10,%esp
80105931:	e9 1a ff ff ff       	jmp    80105850 <trap+0xa0>
80105936:	8d 76 00             	lea    0x0(%esi),%esi
80105939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105940:	e8 0b c7 ff ff       	call   80102050 <ideintr>
80105945:	eb 9e                	jmp    801058e5 <trap+0x135>
80105947:	89 f6                	mov    %esi,%esi
80105949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105950:	e8 2b de ff ff       	call   80103780 <myproc>
80105955:	8b 58 24             	mov    0x24(%eax),%ebx
80105958:	85 db                	test   %ebx,%ebx
8010595a:	75 2c                	jne    80105988 <trap+0x1d8>
8010595c:	e8 1f de ff ff       	call   80103780 <myproc>
80105961:	89 78 18             	mov    %edi,0x18(%eax)
80105964:	e8 b7 ee ff ff       	call   80104820 <syscall>
80105969:	e8 12 de ff ff       	call   80103780 <myproc>
8010596e:	8b 48 24             	mov    0x24(%eax),%ecx
80105971:	85 c9                	test   %ecx,%ecx
80105973:	0f 84 26 ff ff ff    	je     8010589f <trap+0xef>
80105979:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010597c:	5b                   	pop    %ebx
8010597d:	5e                   	pop    %esi
8010597e:	5f                   	pop    %edi
8010597f:	5d                   	pop    %ebp
80105980:	e9 2b e2 ff ff       	jmp    80103bb0 <exit>
80105985:	8d 76 00             	lea    0x0(%esi),%esi
80105988:	e8 23 e2 ff ff       	call   80103bb0 <exit>
8010598d:	eb cd                	jmp    8010595c <trap+0x1ac>
8010598f:	90                   	nop
80105990:	83 ec 0c             	sub    $0xc,%esp
80105993:	68 e0 4c 11 80       	push   $0x80114ce0
80105998:	e8 83 e9 ff ff       	call   80104320 <acquire>
8010599d:	c7 04 24 20 55 11 80 	movl   $0x80115520,(%esp)
801059a4:	83 05 20 55 11 80 01 	addl   $0x1,0x80115520
801059ab:	e8 30 e5 ff ff       	call   80103ee0 <wakeup>
801059b0:	c7 04 24 e0 4c 11 80 	movl   $0x80114ce0,(%esp)
801059b7:	e8 14 ea ff ff       	call   801043d0 <release>
801059bc:	83 c4 10             	add    $0x10,%esp
801059bf:	e9 21 ff ff ff       	jmp    801058e5 <trap+0x135>
801059c4:	0f 20 d6             	mov    %cr2,%esi
801059c7:	8b 5f 38             	mov    0x38(%edi),%ebx
801059ca:	e8 91 dd ff ff       	call   80103760 <cpuid>
801059cf:	83 ec 0c             	sub    $0xc,%esp
801059d2:	56                   	push   %esi
801059d3:	53                   	push   %ebx
801059d4:	50                   	push   %eax
801059d5:	ff 77 30             	pushl  0x30(%edi)
801059d8:	68 50 77 10 80       	push   $0x80107750
801059dd:	e8 7e ac ff ff       	call   80100660 <cprintf>
801059e2:	83 c4 14             	add    $0x14,%esp
801059e5:	68 26 77 10 80       	push   $0x80107726
801059ea:	e8 81 a9 ff ff       	call   80100370 <panic>
801059ef:	90                   	nop

801059f0 <uartgetc>:
801059f0:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
801059f5:	55                   	push   %ebp
801059f6:	89 e5                	mov    %esp,%ebp
801059f8:	85 c0                	test   %eax,%eax
801059fa:	74 1c                	je     80105a18 <uartgetc+0x28>
801059fc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a01:	ec                   	in     (%dx),%al
80105a02:	a8 01                	test   $0x1,%al
80105a04:	74 12                	je     80105a18 <uartgetc+0x28>
80105a06:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a0b:	ec                   	in     (%dx),%al
80105a0c:	0f b6 c0             	movzbl %al,%eax
80105a0f:	5d                   	pop    %ebp
80105a10:	c3                   	ret    
80105a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a1d:	5d                   	pop    %ebp
80105a1e:	c3                   	ret    
80105a1f:	90                   	nop

80105a20 <uartputc.part.0>:
80105a20:	55                   	push   %ebp
80105a21:	89 e5                	mov    %esp,%ebp
80105a23:	57                   	push   %edi
80105a24:	56                   	push   %esi
80105a25:	53                   	push   %ebx
80105a26:	89 c7                	mov    %eax,%edi
80105a28:	bb 80 00 00 00       	mov    $0x80,%ebx
80105a2d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105a32:	83 ec 0c             	sub    $0xc,%esp
80105a35:	eb 1b                	jmp    80105a52 <uartputc.part.0+0x32>
80105a37:	89 f6                	mov    %esi,%esi
80105a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105a40:	83 ec 0c             	sub    $0xc,%esp
80105a43:	6a 0a                	push   $0xa
80105a45:	e8 e6 cc ff ff       	call   80102730 <microdelay>
80105a4a:	83 c4 10             	add    $0x10,%esp
80105a4d:	83 eb 01             	sub    $0x1,%ebx
80105a50:	74 07                	je     80105a59 <uartputc.part.0+0x39>
80105a52:	89 f2                	mov    %esi,%edx
80105a54:	ec                   	in     (%dx),%al
80105a55:	a8 20                	test   $0x20,%al
80105a57:	74 e7                	je     80105a40 <uartputc.part.0+0x20>
80105a59:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a5e:	89 f8                	mov    %edi,%eax
80105a60:	ee                   	out    %al,(%dx)
80105a61:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a64:	5b                   	pop    %ebx
80105a65:	5e                   	pop    %esi
80105a66:	5f                   	pop    %edi
80105a67:	5d                   	pop    %ebp
80105a68:	c3                   	ret    
80105a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105a70 <uartinit>:
80105a70:	55                   	push   %ebp
80105a71:	31 c9                	xor    %ecx,%ecx
80105a73:	89 c8                	mov    %ecx,%eax
80105a75:	89 e5                	mov    %esp,%ebp
80105a77:	57                   	push   %edi
80105a78:	56                   	push   %esi
80105a79:	53                   	push   %ebx
80105a7a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105a7f:	89 da                	mov    %ebx,%edx
80105a81:	83 ec 0c             	sub    $0xc,%esp
80105a84:	ee                   	out    %al,(%dx)
80105a85:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105a8a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105a8f:	89 fa                	mov    %edi,%edx
80105a91:	ee                   	out    %al,(%dx)
80105a92:	b8 0c 00 00 00       	mov    $0xc,%eax
80105a97:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a9c:	ee                   	out    %al,(%dx)
80105a9d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105aa2:	89 c8                	mov    %ecx,%eax
80105aa4:	89 f2                	mov    %esi,%edx
80105aa6:	ee                   	out    %al,(%dx)
80105aa7:	b8 03 00 00 00       	mov    $0x3,%eax
80105aac:	89 fa                	mov    %edi,%edx
80105aae:	ee                   	out    %al,(%dx)
80105aaf:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105ab4:	89 c8                	mov    %ecx,%eax
80105ab6:	ee                   	out    %al,(%dx)
80105ab7:	b8 01 00 00 00       	mov    $0x1,%eax
80105abc:	89 f2                	mov    %esi,%edx
80105abe:	ee                   	out    %al,(%dx)
80105abf:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ac4:	ec                   	in     (%dx),%al
80105ac5:	3c ff                	cmp    $0xff,%al
80105ac7:	74 5a                	je     80105b23 <uartinit+0xb3>
80105ac9:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105ad0:	00 00 00 
80105ad3:	89 da                	mov    %ebx,%edx
80105ad5:	ec                   	in     (%dx),%al
80105ad6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105adb:	ec                   	in     (%dx),%al
80105adc:	83 ec 08             	sub    $0x8,%esp
80105adf:	bb 48 78 10 80       	mov    $0x80107848,%ebx
80105ae4:	6a 00                	push   $0x0
80105ae6:	6a 04                	push   $0x4
80105ae8:	e8 b3 c7 ff ff       	call   801022a0 <ioapicenable>
80105aed:	83 c4 10             	add    $0x10,%esp
80105af0:	b8 78 00 00 00       	mov    $0x78,%eax
80105af5:	eb 13                	jmp    80105b0a <uartinit+0x9a>
80105af7:	89 f6                	mov    %esi,%esi
80105af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b00:	83 c3 01             	add    $0x1,%ebx
80105b03:	0f be 03             	movsbl (%ebx),%eax
80105b06:	84 c0                	test   %al,%al
80105b08:	74 19                	je     80105b23 <uartinit+0xb3>
80105b0a:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105b10:	85 d2                	test   %edx,%edx
80105b12:	74 ec                	je     80105b00 <uartinit+0x90>
80105b14:	83 c3 01             	add    $0x1,%ebx
80105b17:	e8 04 ff ff ff       	call   80105a20 <uartputc.part.0>
80105b1c:	0f be 03             	movsbl (%ebx),%eax
80105b1f:	84 c0                	test   %al,%al
80105b21:	75 e7                	jne    80105b0a <uartinit+0x9a>
80105b23:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b26:	5b                   	pop    %ebx
80105b27:	5e                   	pop    %esi
80105b28:	5f                   	pop    %edi
80105b29:	5d                   	pop    %ebp
80105b2a:	c3                   	ret    
80105b2b:	90                   	nop
80105b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b30 <uartputc>:
80105b30:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105b36:	55                   	push   %ebp
80105b37:	89 e5                	mov    %esp,%ebp
80105b39:	85 d2                	test   %edx,%edx
80105b3b:	8b 45 08             	mov    0x8(%ebp),%eax
80105b3e:	74 10                	je     80105b50 <uartputc+0x20>
80105b40:	5d                   	pop    %ebp
80105b41:	e9 da fe ff ff       	jmp    80105a20 <uartputc.part.0>
80105b46:	8d 76 00             	lea    0x0(%esi),%esi
80105b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b50:	5d                   	pop    %ebp
80105b51:	c3                   	ret    
80105b52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b60 <uartintr>:
80105b60:	55                   	push   %ebp
80105b61:	89 e5                	mov    %esp,%ebp
80105b63:	83 ec 14             	sub    $0x14,%esp
80105b66:	68 f0 59 10 80       	push   $0x801059f0
80105b6b:	e8 80 ac ff ff       	call   801007f0 <consoleintr>
80105b70:	83 c4 10             	add    $0x10,%esp
80105b73:	c9                   	leave  
80105b74:	c3                   	ret    

80105b75 <vector0>:
80105b75:	6a 00                	push   $0x0
80105b77:	6a 00                	push   $0x0
80105b79:	e9 38 fb ff ff       	jmp    801056b6 <alltraps>

80105b7e <vector1>:
80105b7e:	6a 00                	push   $0x0
80105b80:	6a 01                	push   $0x1
80105b82:	e9 2f fb ff ff       	jmp    801056b6 <alltraps>

80105b87 <vector2>:
80105b87:	6a 00                	push   $0x0
80105b89:	6a 02                	push   $0x2
80105b8b:	e9 26 fb ff ff       	jmp    801056b6 <alltraps>

80105b90 <vector3>:
80105b90:	6a 00                	push   $0x0
80105b92:	6a 03                	push   $0x3
80105b94:	e9 1d fb ff ff       	jmp    801056b6 <alltraps>

80105b99 <vector4>:
80105b99:	6a 00                	push   $0x0
80105b9b:	6a 04                	push   $0x4
80105b9d:	e9 14 fb ff ff       	jmp    801056b6 <alltraps>

80105ba2 <vector5>:
80105ba2:	6a 00                	push   $0x0
80105ba4:	6a 05                	push   $0x5
80105ba6:	e9 0b fb ff ff       	jmp    801056b6 <alltraps>

80105bab <vector6>:
80105bab:	6a 00                	push   $0x0
80105bad:	6a 06                	push   $0x6
80105baf:	e9 02 fb ff ff       	jmp    801056b6 <alltraps>

80105bb4 <vector7>:
80105bb4:	6a 00                	push   $0x0
80105bb6:	6a 07                	push   $0x7
80105bb8:	e9 f9 fa ff ff       	jmp    801056b6 <alltraps>

80105bbd <vector8>:
80105bbd:	6a 08                	push   $0x8
80105bbf:	e9 f2 fa ff ff       	jmp    801056b6 <alltraps>

80105bc4 <vector9>:
80105bc4:	6a 00                	push   $0x0
80105bc6:	6a 09                	push   $0x9
80105bc8:	e9 e9 fa ff ff       	jmp    801056b6 <alltraps>

80105bcd <vector10>:
80105bcd:	6a 0a                	push   $0xa
80105bcf:	e9 e2 fa ff ff       	jmp    801056b6 <alltraps>

80105bd4 <vector11>:
80105bd4:	6a 0b                	push   $0xb
80105bd6:	e9 db fa ff ff       	jmp    801056b6 <alltraps>

80105bdb <vector12>:
80105bdb:	6a 0c                	push   $0xc
80105bdd:	e9 d4 fa ff ff       	jmp    801056b6 <alltraps>

80105be2 <vector13>:
80105be2:	6a 0d                	push   $0xd
80105be4:	e9 cd fa ff ff       	jmp    801056b6 <alltraps>

80105be9 <vector14>:
80105be9:	6a 0e                	push   $0xe
80105beb:	e9 c6 fa ff ff       	jmp    801056b6 <alltraps>

80105bf0 <vector15>:
80105bf0:	6a 00                	push   $0x0
80105bf2:	6a 0f                	push   $0xf
80105bf4:	e9 bd fa ff ff       	jmp    801056b6 <alltraps>

80105bf9 <vector16>:
80105bf9:	6a 00                	push   $0x0
80105bfb:	6a 10                	push   $0x10
80105bfd:	e9 b4 fa ff ff       	jmp    801056b6 <alltraps>

80105c02 <vector17>:
80105c02:	6a 11                	push   $0x11
80105c04:	e9 ad fa ff ff       	jmp    801056b6 <alltraps>

80105c09 <vector18>:
80105c09:	6a 00                	push   $0x0
80105c0b:	6a 12                	push   $0x12
80105c0d:	e9 a4 fa ff ff       	jmp    801056b6 <alltraps>

80105c12 <vector19>:
80105c12:	6a 00                	push   $0x0
80105c14:	6a 13                	push   $0x13
80105c16:	e9 9b fa ff ff       	jmp    801056b6 <alltraps>

80105c1b <vector20>:
80105c1b:	6a 00                	push   $0x0
80105c1d:	6a 14                	push   $0x14
80105c1f:	e9 92 fa ff ff       	jmp    801056b6 <alltraps>

80105c24 <vector21>:
80105c24:	6a 00                	push   $0x0
80105c26:	6a 15                	push   $0x15
80105c28:	e9 89 fa ff ff       	jmp    801056b6 <alltraps>

80105c2d <vector22>:
80105c2d:	6a 00                	push   $0x0
80105c2f:	6a 16                	push   $0x16
80105c31:	e9 80 fa ff ff       	jmp    801056b6 <alltraps>

80105c36 <vector23>:
80105c36:	6a 00                	push   $0x0
80105c38:	6a 17                	push   $0x17
80105c3a:	e9 77 fa ff ff       	jmp    801056b6 <alltraps>

80105c3f <vector24>:
80105c3f:	6a 00                	push   $0x0
80105c41:	6a 18                	push   $0x18
80105c43:	e9 6e fa ff ff       	jmp    801056b6 <alltraps>

80105c48 <vector25>:
80105c48:	6a 00                	push   $0x0
80105c4a:	6a 19                	push   $0x19
80105c4c:	e9 65 fa ff ff       	jmp    801056b6 <alltraps>

80105c51 <vector26>:
80105c51:	6a 00                	push   $0x0
80105c53:	6a 1a                	push   $0x1a
80105c55:	e9 5c fa ff ff       	jmp    801056b6 <alltraps>

80105c5a <vector27>:
80105c5a:	6a 00                	push   $0x0
80105c5c:	6a 1b                	push   $0x1b
80105c5e:	e9 53 fa ff ff       	jmp    801056b6 <alltraps>

80105c63 <vector28>:
80105c63:	6a 00                	push   $0x0
80105c65:	6a 1c                	push   $0x1c
80105c67:	e9 4a fa ff ff       	jmp    801056b6 <alltraps>

80105c6c <vector29>:
80105c6c:	6a 00                	push   $0x0
80105c6e:	6a 1d                	push   $0x1d
80105c70:	e9 41 fa ff ff       	jmp    801056b6 <alltraps>

80105c75 <vector30>:
80105c75:	6a 00                	push   $0x0
80105c77:	6a 1e                	push   $0x1e
80105c79:	e9 38 fa ff ff       	jmp    801056b6 <alltraps>

80105c7e <vector31>:
80105c7e:	6a 00                	push   $0x0
80105c80:	6a 1f                	push   $0x1f
80105c82:	e9 2f fa ff ff       	jmp    801056b6 <alltraps>

80105c87 <vector32>:
80105c87:	6a 00                	push   $0x0
80105c89:	6a 20                	push   $0x20
80105c8b:	e9 26 fa ff ff       	jmp    801056b6 <alltraps>

80105c90 <vector33>:
80105c90:	6a 00                	push   $0x0
80105c92:	6a 21                	push   $0x21
80105c94:	e9 1d fa ff ff       	jmp    801056b6 <alltraps>

80105c99 <vector34>:
80105c99:	6a 00                	push   $0x0
80105c9b:	6a 22                	push   $0x22
80105c9d:	e9 14 fa ff ff       	jmp    801056b6 <alltraps>

80105ca2 <vector35>:
80105ca2:	6a 00                	push   $0x0
80105ca4:	6a 23                	push   $0x23
80105ca6:	e9 0b fa ff ff       	jmp    801056b6 <alltraps>

80105cab <vector36>:
80105cab:	6a 00                	push   $0x0
80105cad:	6a 24                	push   $0x24
80105caf:	e9 02 fa ff ff       	jmp    801056b6 <alltraps>

80105cb4 <vector37>:
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 25                	push   $0x25
80105cb8:	e9 f9 f9 ff ff       	jmp    801056b6 <alltraps>

80105cbd <vector38>:
80105cbd:	6a 00                	push   $0x0
80105cbf:	6a 26                	push   $0x26
80105cc1:	e9 f0 f9 ff ff       	jmp    801056b6 <alltraps>

80105cc6 <vector39>:
80105cc6:	6a 00                	push   $0x0
80105cc8:	6a 27                	push   $0x27
80105cca:	e9 e7 f9 ff ff       	jmp    801056b6 <alltraps>

80105ccf <vector40>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	6a 28                	push   $0x28
80105cd3:	e9 de f9 ff ff       	jmp    801056b6 <alltraps>

80105cd8 <vector41>:
80105cd8:	6a 00                	push   $0x0
80105cda:	6a 29                	push   $0x29
80105cdc:	e9 d5 f9 ff ff       	jmp    801056b6 <alltraps>

80105ce1 <vector42>:
80105ce1:	6a 00                	push   $0x0
80105ce3:	6a 2a                	push   $0x2a
80105ce5:	e9 cc f9 ff ff       	jmp    801056b6 <alltraps>

80105cea <vector43>:
80105cea:	6a 00                	push   $0x0
80105cec:	6a 2b                	push   $0x2b
80105cee:	e9 c3 f9 ff ff       	jmp    801056b6 <alltraps>

80105cf3 <vector44>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	6a 2c                	push   $0x2c
80105cf7:	e9 ba f9 ff ff       	jmp    801056b6 <alltraps>

80105cfc <vector45>:
80105cfc:	6a 00                	push   $0x0
80105cfe:	6a 2d                	push   $0x2d
80105d00:	e9 b1 f9 ff ff       	jmp    801056b6 <alltraps>

80105d05 <vector46>:
80105d05:	6a 00                	push   $0x0
80105d07:	6a 2e                	push   $0x2e
80105d09:	e9 a8 f9 ff ff       	jmp    801056b6 <alltraps>

80105d0e <vector47>:
80105d0e:	6a 00                	push   $0x0
80105d10:	6a 2f                	push   $0x2f
80105d12:	e9 9f f9 ff ff       	jmp    801056b6 <alltraps>

80105d17 <vector48>:
80105d17:	6a 00                	push   $0x0
80105d19:	6a 30                	push   $0x30
80105d1b:	e9 96 f9 ff ff       	jmp    801056b6 <alltraps>

80105d20 <vector49>:
80105d20:	6a 00                	push   $0x0
80105d22:	6a 31                	push   $0x31
80105d24:	e9 8d f9 ff ff       	jmp    801056b6 <alltraps>

80105d29 <vector50>:
80105d29:	6a 00                	push   $0x0
80105d2b:	6a 32                	push   $0x32
80105d2d:	e9 84 f9 ff ff       	jmp    801056b6 <alltraps>

80105d32 <vector51>:
80105d32:	6a 00                	push   $0x0
80105d34:	6a 33                	push   $0x33
80105d36:	e9 7b f9 ff ff       	jmp    801056b6 <alltraps>

80105d3b <vector52>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	6a 34                	push   $0x34
80105d3f:	e9 72 f9 ff ff       	jmp    801056b6 <alltraps>

80105d44 <vector53>:
80105d44:	6a 00                	push   $0x0
80105d46:	6a 35                	push   $0x35
80105d48:	e9 69 f9 ff ff       	jmp    801056b6 <alltraps>

80105d4d <vector54>:
80105d4d:	6a 00                	push   $0x0
80105d4f:	6a 36                	push   $0x36
80105d51:	e9 60 f9 ff ff       	jmp    801056b6 <alltraps>

80105d56 <vector55>:
80105d56:	6a 00                	push   $0x0
80105d58:	6a 37                	push   $0x37
80105d5a:	e9 57 f9 ff ff       	jmp    801056b6 <alltraps>

80105d5f <vector56>:
80105d5f:	6a 00                	push   $0x0
80105d61:	6a 38                	push   $0x38
80105d63:	e9 4e f9 ff ff       	jmp    801056b6 <alltraps>

80105d68 <vector57>:
80105d68:	6a 00                	push   $0x0
80105d6a:	6a 39                	push   $0x39
80105d6c:	e9 45 f9 ff ff       	jmp    801056b6 <alltraps>

80105d71 <vector58>:
80105d71:	6a 00                	push   $0x0
80105d73:	6a 3a                	push   $0x3a
80105d75:	e9 3c f9 ff ff       	jmp    801056b6 <alltraps>

80105d7a <vector59>:
80105d7a:	6a 00                	push   $0x0
80105d7c:	6a 3b                	push   $0x3b
80105d7e:	e9 33 f9 ff ff       	jmp    801056b6 <alltraps>

80105d83 <vector60>:
80105d83:	6a 00                	push   $0x0
80105d85:	6a 3c                	push   $0x3c
80105d87:	e9 2a f9 ff ff       	jmp    801056b6 <alltraps>

80105d8c <vector61>:
80105d8c:	6a 00                	push   $0x0
80105d8e:	6a 3d                	push   $0x3d
80105d90:	e9 21 f9 ff ff       	jmp    801056b6 <alltraps>

80105d95 <vector62>:
80105d95:	6a 00                	push   $0x0
80105d97:	6a 3e                	push   $0x3e
80105d99:	e9 18 f9 ff ff       	jmp    801056b6 <alltraps>

80105d9e <vector63>:
80105d9e:	6a 00                	push   $0x0
80105da0:	6a 3f                	push   $0x3f
80105da2:	e9 0f f9 ff ff       	jmp    801056b6 <alltraps>

80105da7 <vector64>:
80105da7:	6a 00                	push   $0x0
80105da9:	6a 40                	push   $0x40
80105dab:	e9 06 f9 ff ff       	jmp    801056b6 <alltraps>

80105db0 <vector65>:
80105db0:	6a 00                	push   $0x0
80105db2:	6a 41                	push   $0x41
80105db4:	e9 fd f8 ff ff       	jmp    801056b6 <alltraps>

80105db9 <vector66>:
80105db9:	6a 00                	push   $0x0
80105dbb:	6a 42                	push   $0x42
80105dbd:	e9 f4 f8 ff ff       	jmp    801056b6 <alltraps>

80105dc2 <vector67>:
80105dc2:	6a 00                	push   $0x0
80105dc4:	6a 43                	push   $0x43
80105dc6:	e9 eb f8 ff ff       	jmp    801056b6 <alltraps>

80105dcb <vector68>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	6a 44                	push   $0x44
80105dcf:	e9 e2 f8 ff ff       	jmp    801056b6 <alltraps>

80105dd4 <vector69>:
80105dd4:	6a 00                	push   $0x0
80105dd6:	6a 45                	push   $0x45
80105dd8:	e9 d9 f8 ff ff       	jmp    801056b6 <alltraps>

80105ddd <vector70>:
80105ddd:	6a 00                	push   $0x0
80105ddf:	6a 46                	push   $0x46
80105de1:	e9 d0 f8 ff ff       	jmp    801056b6 <alltraps>

80105de6 <vector71>:
80105de6:	6a 00                	push   $0x0
80105de8:	6a 47                	push   $0x47
80105dea:	e9 c7 f8 ff ff       	jmp    801056b6 <alltraps>

80105def <vector72>:
80105def:	6a 00                	push   $0x0
80105df1:	6a 48                	push   $0x48
80105df3:	e9 be f8 ff ff       	jmp    801056b6 <alltraps>

80105df8 <vector73>:
80105df8:	6a 00                	push   $0x0
80105dfa:	6a 49                	push   $0x49
80105dfc:	e9 b5 f8 ff ff       	jmp    801056b6 <alltraps>

80105e01 <vector74>:
80105e01:	6a 00                	push   $0x0
80105e03:	6a 4a                	push   $0x4a
80105e05:	e9 ac f8 ff ff       	jmp    801056b6 <alltraps>

80105e0a <vector75>:
80105e0a:	6a 00                	push   $0x0
80105e0c:	6a 4b                	push   $0x4b
80105e0e:	e9 a3 f8 ff ff       	jmp    801056b6 <alltraps>

80105e13 <vector76>:
80105e13:	6a 00                	push   $0x0
80105e15:	6a 4c                	push   $0x4c
80105e17:	e9 9a f8 ff ff       	jmp    801056b6 <alltraps>

80105e1c <vector77>:
80105e1c:	6a 00                	push   $0x0
80105e1e:	6a 4d                	push   $0x4d
80105e20:	e9 91 f8 ff ff       	jmp    801056b6 <alltraps>

80105e25 <vector78>:
80105e25:	6a 00                	push   $0x0
80105e27:	6a 4e                	push   $0x4e
80105e29:	e9 88 f8 ff ff       	jmp    801056b6 <alltraps>

80105e2e <vector79>:
80105e2e:	6a 00                	push   $0x0
80105e30:	6a 4f                	push   $0x4f
80105e32:	e9 7f f8 ff ff       	jmp    801056b6 <alltraps>

80105e37 <vector80>:
80105e37:	6a 00                	push   $0x0
80105e39:	6a 50                	push   $0x50
80105e3b:	e9 76 f8 ff ff       	jmp    801056b6 <alltraps>

80105e40 <vector81>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 51                	push   $0x51
80105e44:	e9 6d f8 ff ff       	jmp    801056b6 <alltraps>

80105e49 <vector82>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 52                	push   $0x52
80105e4d:	e9 64 f8 ff ff       	jmp    801056b6 <alltraps>

80105e52 <vector83>:
80105e52:	6a 00                	push   $0x0
80105e54:	6a 53                	push   $0x53
80105e56:	e9 5b f8 ff ff       	jmp    801056b6 <alltraps>

80105e5b <vector84>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	6a 54                	push   $0x54
80105e5f:	e9 52 f8 ff ff       	jmp    801056b6 <alltraps>

80105e64 <vector85>:
80105e64:	6a 00                	push   $0x0
80105e66:	6a 55                	push   $0x55
80105e68:	e9 49 f8 ff ff       	jmp    801056b6 <alltraps>

80105e6d <vector86>:
80105e6d:	6a 00                	push   $0x0
80105e6f:	6a 56                	push   $0x56
80105e71:	e9 40 f8 ff ff       	jmp    801056b6 <alltraps>

80105e76 <vector87>:
80105e76:	6a 00                	push   $0x0
80105e78:	6a 57                	push   $0x57
80105e7a:	e9 37 f8 ff ff       	jmp    801056b6 <alltraps>

80105e7f <vector88>:
80105e7f:	6a 00                	push   $0x0
80105e81:	6a 58                	push   $0x58
80105e83:	e9 2e f8 ff ff       	jmp    801056b6 <alltraps>

80105e88 <vector89>:
80105e88:	6a 00                	push   $0x0
80105e8a:	6a 59                	push   $0x59
80105e8c:	e9 25 f8 ff ff       	jmp    801056b6 <alltraps>

80105e91 <vector90>:
80105e91:	6a 00                	push   $0x0
80105e93:	6a 5a                	push   $0x5a
80105e95:	e9 1c f8 ff ff       	jmp    801056b6 <alltraps>

80105e9a <vector91>:
80105e9a:	6a 00                	push   $0x0
80105e9c:	6a 5b                	push   $0x5b
80105e9e:	e9 13 f8 ff ff       	jmp    801056b6 <alltraps>

80105ea3 <vector92>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	6a 5c                	push   $0x5c
80105ea7:	e9 0a f8 ff ff       	jmp    801056b6 <alltraps>

80105eac <vector93>:
80105eac:	6a 00                	push   $0x0
80105eae:	6a 5d                	push   $0x5d
80105eb0:	e9 01 f8 ff ff       	jmp    801056b6 <alltraps>

80105eb5 <vector94>:
80105eb5:	6a 00                	push   $0x0
80105eb7:	6a 5e                	push   $0x5e
80105eb9:	e9 f8 f7 ff ff       	jmp    801056b6 <alltraps>

80105ebe <vector95>:
80105ebe:	6a 00                	push   $0x0
80105ec0:	6a 5f                	push   $0x5f
80105ec2:	e9 ef f7 ff ff       	jmp    801056b6 <alltraps>

80105ec7 <vector96>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	6a 60                	push   $0x60
80105ecb:	e9 e6 f7 ff ff       	jmp    801056b6 <alltraps>

80105ed0 <vector97>:
80105ed0:	6a 00                	push   $0x0
80105ed2:	6a 61                	push   $0x61
80105ed4:	e9 dd f7 ff ff       	jmp    801056b6 <alltraps>

80105ed9 <vector98>:
80105ed9:	6a 00                	push   $0x0
80105edb:	6a 62                	push   $0x62
80105edd:	e9 d4 f7 ff ff       	jmp    801056b6 <alltraps>

80105ee2 <vector99>:
80105ee2:	6a 00                	push   $0x0
80105ee4:	6a 63                	push   $0x63
80105ee6:	e9 cb f7 ff ff       	jmp    801056b6 <alltraps>

80105eeb <vector100>:
80105eeb:	6a 00                	push   $0x0
80105eed:	6a 64                	push   $0x64
80105eef:	e9 c2 f7 ff ff       	jmp    801056b6 <alltraps>

80105ef4 <vector101>:
80105ef4:	6a 00                	push   $0x0
80105ef6:	6a 65                	push   $0x65
80105ef8:	e9 b9 f7 ff ff       	jmp    801056b6 <alltraps>

80105efd <vector102>:
80105efd:	6a 00                	push   $0x0
80105eff:	6a 66                	push   $0x66
80105f01:	e9 b0 f7 ff ff       	jmp    801056b6 <alltraps>

80105f06 <vector103>:
80105f06:	6a 00                	push   $0x0
80105f08:	6a 67                	push   $0x67
80105f0a:	e9 a7 f7 ff ff       	jmp    801056b6 <alltraps>

80105f0f <vector104>:
80105f0f:	6a 00                	push   $0x0
80105f11:	6a 68                	push   $0x68
80105f13:	e9 9e f7 ff ff       	jmp    801056b6 <alltraps>

80105f18 <vector105>:
80105f18:	6a 00                	push   $0x0
80105f1a:	6a 69                	push   $0x69
80105f1c:	e9 95 f7 ff ff       	jmp    801056b6 <alltraps>

80105f21 <vector106>:
80105f21:	6a 00                	push   $0x0
80105f23:	6a 6a                	push   $0x6a
80105f25:	e9 8c f7 ff ff       	jmp    801056b6 <alltraps>

80105f2a <vector107>:
80105f2a:	6a 00                	push   $0x0
80105f2c:	6a 6b                	push   $0x6b
80105f2e:	e9 83 f7 ff ff       	jmp    801056b6 <alltraps>

80105f33 <vector108>:
80105f33:	6a 00                	push   $0x0
80105f35:	6a 6c                	push   $0x6c
80105f37:	e9 7a f7 ff ff       	jmp    801056b6 <alltraps>

80105f3c <vector109>:
80105f3c:	6a 00                	push   $0x0
80105f3e:	6a 6d                	push   $0x6d
80105f40:	e9 71 f7 ff ff       	jmp    801056b6 <alltraps>

80105f45 <vector110>:
80105f45:	6a 00                	push   $0x0
80105f47:	6a 6e                	push   $0x6e
80105f49:	e9 68 f7 ff ff       	jmp    801056b6 <alltraps>

80105f4e <vector111>:
80105f4e:	6a 00                	push   $0x0
80105f50:	6a 6f                	push   $0x6f
80105f52:	e9 5f f7 ff ff       	jmp    801056b6 <alltraps>

80105f57 <vector112>:
80105f57:	6a 00                	push   $0x0
80105f59:	6a 70                	push   $0x70
80105f5b:	e9 56 f7 ff ff       	jmp    801056b6 <alltraps>

80105f60 <vector113>:
80105f60:	6a 00                	push   $0x0
80105f62:	6a 71                	push   $0x71
80105f64:	e9 4d f7 ff ff       	jmp    801056b6 <alltraps>

80105f69 <vector114>:
80105f69:	6a 00                	push   $0x0
80105f6b:	6a 72                	push   $0x72
80105f6d:	e9 44 f7 ff ff       	jmp    801056b6 <alltraps>

80105f72 <vector115>:
80105f72:	6a 00                	push   $0x0
80105f74:	6a 73                	push   $0x73
80105f76:	e9 3b f7 ff ff       	jmp    801056b6 <alltraps>

80105f7b <vector116>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	6a 74                	push   $0x74
80105f7f:	e9 32 f7 ff ff       	jmp    801056b6 <alltraps>

80105f84 <vector117>:
80105f84:	6a 00                	push   $0x0
80105f86:	6a 75                	push   $0x75
80105f88:	e9 29 f7 ff ff       	jmp    801056b6 <alltraps>

80105f8d <vector118>:
80105f8d:	6a 00                	push   $0x0
80105f8f:	6a 76                	push   $0x76
80105f91:	e9 20 f7 ff ff       	jmp    801056b6 <alltraps>

80105f96 <vector119>:
80105f96:	6a 00                	push   $0x0
80105f98:	6a 77                	push   $0x77
80105f9a:	e9 17 f7 ff ff       	jmp    801056b6 <alltraps>

80105f9f <vector120>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	6a 78                	push   $0x78
80105fa3:	e9 0e f7 ff ff       	jmp    801056b6 <alltraps>

80105fa8 <vector121>:
80105fa8:	6a 00                	push   $0x0
80105faa:	6a 79                	push   $0x79
80105fac:	e9 05 f7 ff ff       	jmp    801056b6 <alltraps>

80105fb1 <vector122>:
80105fb1:	6a 00                	push   $0x0
80105fb3:	6a 7a                	push   $0x7a
80105fb5:	e9 fc f6 ff ff       	jmp    801056b6 <alltraps>

80105fba <vector123>:
80105fba:	6a 00                	push   $0x0
80105fbc:	6a 7b                	push   $0x7b
80105fbe:	e9 f3 f6 ff ff       	jmp    801056b6 <alltraps>

80105fc3 <vector124>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	6a 7c                	push   $0x7c
80105fc7:	e9 ea f6 ff ff       	jmp    801056b6 <alltraps>

80105fcc <vector125>:
80105fcc:	6a 00                	push   $0x0
80105fce:	6a 7d                	push   $0x7d
80105fd0:	e9 e1 f6 ff ff       	jmp    801056b6 <alltraps>

80105fd5 <vector126>:
80105fd5:	6a 00                	push   $0x0
80105fd7:	6a 7e                	push   $0x7e
80105fd9:	e9 d8 f6 ff ff       	jmp    801056b6 <alltraps>

80105fde <vector127>:
80105fde:	6a 00                	push   $0x0
80105fe0:	6a 7f                	push   $0x7f
80105fe2:	e9 cf f6 ff ff       	jmp    801056b6 <alltraps>

80105fe7 <vector128>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	68 80 00 00 00       	push   $0x80
80105fee:	e9 c3 f6 ff ff       	jmp    801056b6 <alltraps>

80105ff3 <vector129>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	68 81 00 00 00       	push   $0x81
80105ffa:	e9 b7 f6 ff ff       	jmp    801056b6 <alltraps>

80105fff <vector130>:
80105fff:	6a 00                	push   $0x0
80106001:	68 82 00 00 00       	push   $0x82
80106006:	e9 ab f6 ff ff       	jmp    801056b6 <alltraps>

8010600b <vector131>:
8010600b:	6a 00                	push   $0x0
8010600d:	68 83 00 00 00       	push   $0x83
80106012:	e9 9f f6 ff ff       	jmp    801056b6 <alltraps>

80106017 <vector132>:
80106017:	6a 00                	push   $0x0
80106019:	68 84 00 00 00       	push   $0x84
8010601e:	e9 93 f6 ff ff       	jmp    801056b6 <alltraps>

80106023 <vector133>:
80106023:	6a 00                	push   $0x0
80106025:	68 85 00 00 00       	push   $0x85
8010602a:	e9 87 f6 ff ff       	jmp    801056b6 <alltraps>

8010602f <vector134>:
8010602f:	6a 00                	push   $0x0
80106031:	68 86 00 00 00       	push   $0x86
80106036:	e9 7b f6 ff ff       	jmp    801056b6 <alltraps>

8010603b <vector135>:
8010603b:	6a 00                	push   $0x0
8010603d:	68 87 00 00 00       	push   $0x87
80106042:	e9 6f f6 ff ff       	jmp    801056b6 <alltraps>

80106047 <vector136>:
80106047:	6a 00                	push   $0x0
80106049:	68 88 00 00 00       	push   $0x88
8010604e:	e9 63 f6 ff ff       	jmp    801056b6 <alltraps>

80106053 <vector137>:
80106053:	6a 00                	push   $0x0
80106055:	68 89 00 00 00       	push   $0x89
8010605a:	e9 57 f6 ff ff       	jmp    801056b6 <alltraps>

8010605f <vector138>:
8010605f:	6a 00                	push   $0x0
80106061:	68 8a 00 00 00       	push   $0x8a
80106066:	e9 4b f6 ff ff       	jmp    801056b6 <alltraps>

8010606b <vector139>:
8010606b:	6a 00                	push   $0x0
8010606d:	68 8b 00 00 00       	push   $0x8b
80106072:	e9 3f f6 ff ff       	jmp    801056b6 <alltraps>

80106077 <vector140>:
80106077:	6a 00                	push   $0x0
80106079:	68 8c 00 00 00       	push   $0x8c
8010607e:	e9 33 f6 ff ff       	jmp    801056b6 <alltraps>

80106083 <vector141>:
80106083:	6a 00                	push   $0x0
80106085:	68 8d 00 00 00       	push   $0x8d
8010608a:	e9 27 f6 ff ff       	jmp    801056b6 <alltraps>

8010608f <vector142>:
8010608f:	6a 00                	push   $0x0
80106091:	68 8e 00 00 00       	push   $0x8e
80106096:	e9 1b f6 ff ff       	jmp    801056b6 <alltraps>

8010609b <vector143>:
8010609b:	6a 00                	push   $0x0
8010609d:	68 8f 00 00 00       	push   $0x8f
801060a2:	e9 0f f6 ff ff       	jmp    801056b6 <alltraps>

801060a7 <vector144>:
801060a7:	6a 00                	push   $0x0
801060a9:	68 90 00 00 00       	push   $0x90
801060ae:	e9 03 f6 ff ff       	jmp    801056b6 <alltraps>

801060b3 <vector145>:
801060b3:	6a 00                	push   $0x0
801060b5:	68 91 00 00 00       	push   $0x91
801060ba:	e9 f7 f5 ff ff       	jmp    801056b6 <alltraps>

801060bf <vector146>:
801060bf:	6a 00                	push   $0x0
801060c1:	68 92 00 00 00       	push   $0x92
801060c6:	e9 eb f5 ff ff       	jmp    801056b6 <alltraps>

801060cb <vector147>:
801060cb:	6a 00                	push   $0x0
801060cd:	68 93 00 00 00       	push   $0x93
801060d2:	e9 df f5 ff ff       	jmp    801056b6 <alltraps>

801060d7 <vector148>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 94 00 00 00       	push   $0x94
801060de:	e9 d3 f5 ff ff       	jmp    801056b6 <alltraps>

801060e3 <vector149>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 95 00 00 00       	push   $0x95
801060ea:	e9 c7 f5 ff ff       	jmp    801056b6 <alltraps>

801060ef <vector150>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 96 00 00 00       	push   $0x96
801060f6:	e9 bb f5 ff ff       	jmp    801056b6 <alltraps>

801060fb <vector151>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 97 00 00 00       	push   $0x97
80106102:	e9 af f5 ff ff       	jmp    801056b6 <alltraps>

80106107 <vector152>:
80106107:	6a 00                	push   $0x0
80106109:	68 98 00 00 00       	push   $0x98
8010610e:	e9 a3 f5 ff ff       	jmp    801056b6 <alltraps>

80106113 <vector153>:
80106113:	6a 00                	push   $0x0
80106115:	68 99 00 00 00       	push   $0x99
8010611a:	e9 97 f5 ff ff       	jmp    801056b6 <alltraps>

8010611f <vector154>:
8010611f:	6a 00                	push   $0x0
80106121:	68 9a 00 00 00       	push   $0x9a
80106126:	e9 8b f5 ff ff       	jmp    801056b6 <alltraps>

8010612b <vector155>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 9b 00 00 00       	push   $0x9b
80106132:	e9 7f f5 ff ff       	jmp    801056b6 <alltraps>

80106137 <vector156>:
80106137:	6a 00                	push   $0x0
80106139:	68 9c 00 00 00       	push   $0x9c
8010613e:	e9 73 f5 ff ff       	jmp    801056b6 <alltraps>

80106143 <vector157>:
80106143:	6a 00                	push   $0x0
80106145:	68 9d 00 00 00       	push   $0x9d
8010614a:	e9 67 f5 ff ff       	jmp    801056b6 <alltraps>

8010614f <vector158>:
8010614f:	6a 00                	push   $0x0
80106151:	68 9e 00 00 00       	push   $0x9e
80106156:	e9 5b f5 ff ff       	jmp    801056b6 <alltraps>

8010615b <vector159>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 9f 00 00 00       	push   $0x9f
80106162:	e9 4f f5 ff ff       	jmp    801056b6 <alltraps>

80106167 <vector160>:
80106167:	6a 00                	push   $0x0
80106169:	68 a0 00 00 00       	push   $0xa0
8010616e:	e9 43 f5 ff ff       	jmp    801056b6 <alltraps>

80106173 <vector161>:
80106173:	6a 00                	push   $0x0
80106175:	68 a1 00 00 00       	push   $0xa1
8010617a:	e9 37 f5 ff ff       	jmp    801056b6 <alltraps>

8010617f <vector162>:
8010617f:	6a 00                	push   $0x0
80106181:	68 a2 00 00 00       	push   $0xa2
80106186:	e9 2b f5 ff ff       	jmp    801056b6 <alltraps>

8010618b <vector163>:
8010618b:	6a 00                	push   $0x0
8010618d:	68 a3 00 00 00       	push   $0xa3
80106192:	e9 1f f5 ff ff       	jmp    801056b6 <alltraps>

80106197 <vector164>:
80106197:	6a 00                	push   $0x0
80106199:	68 a4 00 00 00       	push   $0xa4
8010619e:	e9 13 f5 ff ff       	jmp    801056b6 <alltraps>

801061a3 <vector165>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 a5 00 00 00       	push   $0xa5
801061aa:	e9 07 f5 ff ff       	jmp    801056b6 <alltraps>

801061af <vector166>:
801061af:	6a 00                	push   $0x0
801061b1:	68 a6 00 00 00       	push   $0xa6
801061b6:	e9 fb f4 ff ff       	jmp    801056b6 <alltraps>

801061bb <vector167>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 a7 00 00 00       	push   $0xa7
801061c2:	e9 ef f4 ff ff       	jmp    801056b6 <alltraps>

801061c7 <vector168>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 a8 00 00 00       	push   $0xa8
801061ce:	e9 e3 f4 ff ff       	jmp    801056b6 <alltraps>

801061d3 <vector169>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 a9 00 00 00       	push   $0xa9
801061da:	e9 d7 f4 ff ff       	jmp    801056b6 <alltraps>

801061df <vector170>:
801061df:	6a 00                	push   $0x0
801061e1:	68 aa 00 00 00       	push   $0xaa
801061e6:	e9 cb f4 ff ff       	jmp    801056b6 <alltraps>

801061eb <vector171>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 ab 00 00 00       	push   $0xab
801061f2:	e9 bf f4 ff ff       	jmp    801056b6 <alltraps>

801061f7 <vector172>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 ac 00 00 00       	push   $0xac
801061fe:	e9 b3 f4 ff ff       	jmp    801056b6 <alltraps>

80106203 <vector173>:
80106203:	6a 00                	push   $0x0
80106205:	68 ad 00 00 00       	push   $0xad
8010620a:	e9 a7 f4 ff ff       	jmp    801056b6 <alltraps>

8010620f <vector174>:
8010620f:	6a 00                	push   $0x0
80106211:	68 ae 00 00 00       	push   $0xae
80106216:	e9 9b f4 ff ff       	jmp    801056b6 <alltraps>

8010621b <vector175>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 af 00 00 00       	push   $0xaf
80106222:	e9 8f f4 ff ff       	jmp    801056b6 <alltraps>

80106227 <vector176>:
80106227:	6a 00                	push   $0x0
80106229:	68 b0 00 00 00       	push   $0xb0
8010622e:	e9 83 f4 ff ff       	jmp    801056b6 <alltraps>

80106233 <vector177>:
80106233:	6a 00                	push   $0x0
80106235:	68 b1 00 00 00       	push   $0xb1
8010623a:	e9 77 f4 ff ff       	jmp    801056b6 <alltraps>

8010623f <vector178>:
8010623f:	6a 00                	push   $0x0
80106241:	68 b2 00 00 00       	push   $0xb2
80106246:	e9 6b f4 ff ff       	jmp    801056b6 <alltraps>

8010624b <vector179>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 b3 00 00 00       	push   $0xb3
80106252:	e9 5f f4 ff ff       	jmp    801056b6 <alltraps>

80106257 <vector180>:
80106257:	6a 00                	push   $0x0
80106259:	68 b4 00 00 00       	push   $0xb4
8010625e:	e9 53 f4 ff ff       	jmp    801056b6 <alltraps>

80106263 <vector181>:
80106263:	6a 00                	push   $0x0
80106265:	68 b5 00 00 00       	push   $0xb5
8010626a:	e9 47 f4 ff ff       	jmp    801056b6 <alltraps>

8010626f <vector182>:
8010626f:	6a 00                	push   $0x0
80106271:	68 b6 00 00 00       	push   $0xb6
80106276:	e9 3b f4 ff ff       	jmp    801056b6 <alltraps>

8010627b <vector183>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 b7 00 00 00       	push   $0xb7
80106282:	e9 2f f4 ff ff       	jmp    801056b6 <alltraps>

80106287 <vector184>:
80106287:	6a 00                	push   $0x0
80106289:	68 b8 00 00 00       	push   $0xb8
8010628e:	e9 23 f4 ff ff       	jmp    801056b6 <alltraps>

80106293 <vector185>:
80106293:	6a 00                	push   $0x0
80106295:	68 b9 00 00 00       	push   $0xb9
8010629a:	e9 17 f4 ff ff       	jmp    801056b6 <alltraps>

8010629f <vector186>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 ba 00 00 00       	push   $0xba
801062a6:	e9 0b f4 ff ff       	jmp    801056b6 <alltraps>

801062ab <vector187>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 bb 00 00 00       	push   $0xbb
801062b2:	e9 ff f3 ff ff       	jmp    801056b6 <alltraps>

801062b7 <vector188>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 bc 00 00 00       	push   $0xbc
801062be:	e9 f3 f3 ff ff       	jmp    801056b6 <alltraps>

801062c3 <vector189>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 bd 00 00 00       	push   $0xbd
801062ca:	e9 e7 f3 ff ff       	jmp    801056b6 <alltraps>

801062cf <vector190>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 be 00 00 00       	push   $0xbe
801062d6:	e9 db f3 ff ff       	jmp    801056b6 <alltraps>

801062db <vector191>:
801062db:	6a 00                	push   $0x0
801062dd:	68 bf 00 00 00       	push   $0xbf
801062e2:	e9 cf f3 ff ff       	jmp    801056b6 <alltraps>

801062e7 <vector192>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 c0 00 00 00       	push   $0xc0
801062ee:	e9 c3 f3 ff ff       	jmp    801056b6 <alltraps>

801062f3 <vector193>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 c1 00 00 00       	push   $0xc1
801062fa:	e9 b7 f3 ff ff       	jmp    801056b6 <alltraps>

801062ff <vector194>:
801062ff:	6a 00                	push   $0x0
80106301:	68 c2 00 00 00       	push   $0xc2
80106306:	e9 ab f3 ff ff       	jmp    801056b6 <alltraps>

8010630b <vector195>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 c3 00 00 00       	push   $0xc3
80106312:	e9 9f f3 ff ff       	jmp    801056b6 <alltraps>

80106317 <vector196>:
80106317:	6a 00                	push   $0x0
80106319:	68 c4 00 00 00       	push   $0xc4
8010631e:	e9 93 f3 ff ff       	jmp    801056b6 <alltraps>

80106323 <vector197>:
80106323:	6a 00                	push   $0x0
80106325:	68 c5 00 00 00       	push   $0xc5
8010632a:	e9 87 f3 ff ff       	jmp    801056b6 <alltraps>

8010632f <vector198>:
8010632f:	6a 00                	push   $0x0
80106331:	68 c6 00 00 00       	push   $0xc6
80106336:	e9 7b f3 ff ff       	jmp    801056b6 <alltraps>

8010633b <vector199>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 c7 00 00 00       	push   $0xc7
80106342:	e9 6f f3 ff ff       	jmp    801056b6 <alltraps>

80106347 <vector200>:
80106347:	6a 00                	push   $0x0
80106349:	68 c8 00 00 00       	push   $0xc8
8010634e:	e9 63 f3 ff ff       	jmp    801056b6 <alltraps>

80106353 <vector201>:
80106353:	6a 00                	push   $0x0
80106355:	68 c9 00 00 00       	push   $0xc9
8010635a:	e9 57 f3 ff ff       	jmp    801056b6 <alltraps>

8010635f <vector202>:
8010635f:	6a 00                	push   $0x0
80106361:	68 ca 00 00 00       	push   $0xca
80106366:	e9 4b f3 ff ff       	jmp    801056b6 <alltraps>

8010636b <vector203>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 cb 00 00 00       	push   $0xcb
80106372:	e9 3f f3 ff ff       	jmp    801056b6 <alltraps>

80106377 <vector204>:
80106377:	6a 00                	push   $0x0
80106379:	68 cc 00 00 00       	push   $0xcc
8010637e:	e9 33 f3 ff ff       	jmp    801056b6 <alltraps>

80106383 <vector205>:
80106383:	6a 00                	push   $0x0
80106385:	68 cd 00 00 00       	push   $0xcd
8010638a:	e9 27 f3 ff ff       	jmp    801056b6 <alltraps>

8010638f <vector206>:
8010638f:	6a 00                	push   $0x0
80106391:	68 ce 00 00 00       	push   $0xce
80106396:	e9 1b f3 ff ff       	jmp    801056b6 <alltraps>

8010639b <vector207>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 cf 00 00 00       	push   $0xcf
801063a2:	e9 0f f3 ff ff       	jmp    801056b6 <alltraps>

801063a7 <vector208>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 d0 00 00 00       	push   $0xd0
801063ae:	e9 03 f3 ff ff       	jmp    801056b6 <alltraps>

801063b3 <vector209>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 d1 00 00 00       	push   $0xd1
801063ba:	e9 f7 f2 ff ff       	jmp    801056b6 <alltraps>

801063bf <vector210>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 d2 00 00 00       	push   $0xd2
801063c6:	e9 eb f2 ff ff       	jmp    801056b6 <alltraps>

801063cb <vector211>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 d3 00 00 00       	push   $0xd3
801063d2:	e9 df f2 ff ff       	jmp    801056b6 <alltraps>

801063d7 <vector212>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 d4 00 00 00       	push   $0xd4
801063de:	e9 d3 f2 ff ff       	jmp    801056b6 <alltraps>

801063e3 <vector213>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 d5 00 00 00       	push   $0xd5
801063ea:	e9 c7 f2 ff ff       	jmp    801056b6 <alltraps>

801063ef <vector214>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 d6 00 00 00       	push   $0xd6
801063f6:	e9 bb f2 ff ff       	jmp    801056b6 <alltraps>

801063fb <vector215>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 d7 00 00 00       	push   $0xd7
80106402:	e9 af f2 ff ff       	jmp    801056b6 <alltraps>

80106407 <vector216>:
80106407:	6a 00                	push   $0x0
80106409:	68 d8 00 00 00       	push   $0xd8
8010640e:	e9 a3 f2 ff ff       	jmp    801056b6 <alltraps>

80106413 <vector217>:
80106413:	6a 00                	push   $0x0
80106415:	68 d9 00 00 00       	push   $0xd9
8010641a:	e9 97 f2 ff ff       	jmp    801056b6 <alltraps>

8010641f <vector218>:
8010641f:	6a 00                	push   $0x0
80106421:	68 da 00 00 00       	push   $0xda
80106426:	e9 8b f2 ff ff       	jmp    801056b6 <alltraps>

8010642b <vector219>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 db 00 00 00       	push   $0xdb
80106432:	e9 7f f2 ff ff       	jmp    801056b6 <alltraps>

80106437 <vector220>:
80106437:	6a 00                	push   $0x0
80106439:	68 dc 00 00 00       	push   $0xdc
8010643e:	e9 73 f2 ff ff       	jmp    801056b6 <alltraps>

80106443 <vector221>:
80106443:	6a 00                	push   $0x0
80106445:	68 dd 00 00 00       	push   $0xdd
8010644a:	e9 67 f2 ff ff       	jmp    801056b6 <alltraps>

8010644f <vector222>:
8010644f:	6a 00                	push   $0x0
80106451:	68 de 00 00 00       	push   $0xde
80106456:	e9 5b f2 ff ff       	jmp    801056b6 <alltraps>

8010645b <vector223>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 df 00 00 00       	push   $0xdf
80106462:	e9 4f f2 ff ff       	jmp    801056b6 <alltraps>

80106467 <vector224>:
80106467:	6a 00                	push   $0x0
80106469:	68 e0 00 00 00       	push   $0xe0
8010646e:	e9 43 f2 ff ff       	jmp    801056b6 <alltraps>

80106473 <vector225>:
80106473:	6a 00                	push   $0x0
80106475:	68 e1 00 00 00       	push   $0xe1
8010647a:	e9 37 f2 ff ff       	jmp    801056b6 <alltraps>

8010647f <vector226>:
8010647f:	6a 00                	push   $0x0
80106481:	68 e2 00 00 00       	push   $0xe2
80106486:	e9 2b f2 ff ff       	jmp    801056b6 <alltraps>

8010648b <vector227>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 e3 00 00 00       	push   $0xe3
80106492:	e9 1f f2 ff ff       	jmp    801056b6 <alltraps>

80106497 <vector228>:
80106497:	6a 00                	push   $0x0
80106499:	68 e4 00 00 00       	push   $0xe4
8010649e:	e9 13 f2 ff ff       	jmp    801056b6 <alltraps>

801064a3 <vector229>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 e5 00 00 00       	push   $0xe5
801064aa:	e9 07 f2 ff ff       	jmp    801056b6 <alltraps>

801064af <vector230>:
801064af:	6a 00                	push   $0x0
801064b1:	68 e6 00 00 00       	push   $0xe6
801064b6:	e9 fb f1 ff ff       	jmp    801056b6 <alltraps>

801064bb <vector231>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 e7 00 00 00       	push   $0xe7
801064c2:	e9 ef f1 ff ff       	jmp    801056b6 <alltraps>

801064c7 <vector232>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 e8 00 00 00       	push   $0xe8
801064ce:	e9 e3 f1 ff ff       	jmp    801056b6 <alltraps>

801064d3 <vector233>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 e9 00 00 00       	push   $0xe9
801064da:	e9 d7 f1 ff ff       	jmp    801056b6 <alltraps>

801064df <vector234>:
801064df:	6a 00                	push   $0x0
801064e1:	68 ea 00 00 00       	push   $0xea
801064e6:	e9 cb f1 ff ff       	jmp    801056b6 <alltraps>

801064eb <vector235>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 eb 00 00 00       	push   $0xeb
801064f2:	e9 bf f1 ff ff       	jmp    801056b6 <alltraps>

801064f7 <vector236>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 ec 00 00 00       	push   $0xec
801064fe:	e9 b3 f1 ff ff       	jmp    801056b6 <alltraps>

80106503 <vector237>:
80106503:	6a 00                	push   $0x0
80106505:	68 ed 00 00 00       	push   $0xed
8010650a:	e9 a7 f1 ff ff       	jmp    801056b6 <alltraps>

8010650f <vector238>:
8010650f:	6a 00                	push   $0x0
80106511:	68 ee 00 00 00       	push   $0xee
80106516:	e9 9b f1 ff ff       	jmp    801056b6 <alltraps>

8010651b <vector239>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 ef 00 00 00       	push   $0xef
80106522:	e9 8f f1 ff ff       	jmp    801056b6 <alltraps>

80106527 <vector240>:
80106527:	6a 00                	push   $0x0
80106529:	68 f0 00 00 00       	push   $0xf0
8010652e:	e9 83 f1 ff ff       	jmp    801056b6 <alltraps>

80106533 <vector241>:
80106533:	6a 00                	push   $0x0
80106535:	68 f1 00 00 00       	push   $0xf1
8010653a:	e9 77 f1 ff ff       	jmp    801056b6 <alltraps>

8010653f <vector242>:
8010653f:	6a 00                	push   $0x0
80106541:	68 f2 00 00 00       	push   $0xf2
80106546:	e9 6b f1 ff ff       	jmp    801056b6 <alltraps>

8010654b <vector243>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 f3 00 00 00       	push   $0xf3
80106552:	e9 5f f1 ff ff       	jmp    801056b6 <alltraps>

80106557 <vector244>:
80106557:	6a 00                	push   $0x0
80106559:	68 f4 00 00 00       	push   $0xf4
8010655e:	e9 53 f1 ff ff       	jmp    801056b6 <alltraps>

80106563 <vector245>:
80106563:	6a 00                	push   $0x0
80106565:	68 f5 00 00 00       	push   $0xf5
8010656a:	e9 47 f1 ff ff       	jmp    801056b6 <alltraps>

8010656f <vector246>:
8010656f:	6a 00                	push   $0x0
80106571:	68 f6 00 00 00       	push   $0xf6
80106576:	e9 3b f1 ff ff       	jmp    801056b6 <alltraps>

8010657b <vector247>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 f7 00 00 00       	push   $0xf7
80106582:	e9 2f f1 ff ff       	jmp    801056b6 <alltraps>

80106587 <vector248>:
80106587:	6a 00                	push   $0x0
80106589:	68 f8 00 00 00       	push   $0xf8
8010658e:	e9 23 f1 ff ff       	jmp    801056b6 <alltraps>

80106593 <vector249>:
80106593:	6a 00                	push   $0x0
80106595:	68 f9 00 00 00       	push   $0xf9
8010659a:	e9 17 f1 ff ff       	jmp    801056b6 <alltraps>

8010659f <vector250>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 fa 00 00 00       	push   $0xfa
801065a6:	e9 0b f1 ff ff       	jmp    801056b6 <alltraps>

801065ab <vector251>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 fb 00 00 00       	push   $0xfb
801065b2:	e9 ff f0 ff ff       	jmp    801056b6 <alltraps>

801065b7 <vector252>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 fc 00 00 00       	push   $0xfc
801065be:	e9 f3 f0 ff ff       	jmp    801056b6 <alltraps>

801065c3 <vector253>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 fd 00 00 00       	push   $0xfd
801065ca:	e9 e7 f0 ff ff       	jmp    801056b6 <alltraps>

801065cf <vector254>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 fe 00 00 00       	push   $0xfe
801065d6:	e9 db f0 ff ff       	jmp    801056b6 <alltraps>

801065db <vector255>:
801065db:	6a 00                	push   $0x0
801065dd:	68 ff 00 00 00       	push   $0xff
801065e2:	e9 cf f0 ff ff       	jmp    801056b6 <alltraps>
801065e7:	66 90                	xchg   %ax,%ax
801065e9:	66 90                	xchg   %ax,%ax
801065eb:	66 90                	xchg   %ax,%ax
801065ed:	66 90                	xchg   %ax,%ax
801065ef:	90                   	nop

801065f0 <walkpgdir>:
801065f0:	55                   	push   %ebp
801065f1:	89 e5                	mov    %esp,%ebp
801065f3:	57                   	push   %edi
801065f4:	56                   	push   %esi
801065f5:	53                   	push   %ebx
801065f6:	89 d3                	mov    %edx,%ebx
801065f8:	c1 ea 16             	shr    $0x16,%edx
801065fb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801065fe:	83 ec 0c             	sub    $0xc,%esp
80106601:	8b 07                	mov    (%edi),%eax
80106603:	a8 01                	test   $0x1,%al
80106605:	74 29                	je     80106630 <walkpgdir+0x40>
80106607:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010660c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80106612:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106615:	c1 eb 0a             	shr    $0xa,%ebx
80106618:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010661e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
80106621:	5b                   	pop    %ebx
80106622:	5e                   	pop    %esi
80106623:	5f                   	pop    %edi
80106624:	5d                   	pop    %ebp
80106625:	c3                   	ret    
80106626:	8d 76 00             	lea    0x0(%esi),%esi
80106629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106630:	85 c9                	test   %ecx,%ecx
80106632:	74 2c                	je     80106660 <walkpgdir+0x70>
80106634:	e8 57 be ff ff       	call   80102490 <kalloc>
80106639:	85 c0                	test   %eax,%eax
8010663b:	89 c6                	mov    %eax,%esi
8010663d:	74 21                	je     80106660 <walkpgdir+0x70>
8010663f:	83 ec 04             	sub    $0x4,%esp
80106642:	68 00 10 00 00       	push   $0x1000
80106647:	6a 00                	push   $0x0
80106649:	50                   	push   %eax
8010664a:	e8 d1 dd ff ff       	call   80104420 <memset>
8010664f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106655:	83 c4 10             	add    $0x10,%esp
80106658:	83 c8 07             	or     $0x7,%eax
8010665b:	89 07                	mov    %eax,(%edi)
8010665d:	eb b3                	jmp    80106612 <walkpgdir+0x22>
8010665f:	90                   	nop
80106660:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106663:	31 c0                	xor    %eax,%eax
80106665:	5b                   	pop    %ebx
80106666:	5e                   	pop    %esi
80106667:	5f                   	pop    %edi
80106668:	5d                   	pop    %ebp
80106669:	c3                   	ret    
8010666a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106670 <mappages>:
80106670:	55                   	push   %ebp
80106671:	89 e5                	mov    %esp,%ebp
80106673:	57                   	push   %edi
80106674:	56                   	push   %esi
80106675:	53                   	push   %ebx
80106676:	89 d3                	mov    %edx,%ebx
80106678:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010667e:	83 ec 1c             	sub    $0x1c,%esp
80106681:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106684:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106688:	8b 7d 08             	mov    0x8(%ebp),%edi
8010668b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106690:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106693:	8b 45 0c             	mov    0xc(%ebp),%eax
80106696:	29 df                	sub    %ebx,%edi
80106698:	83 c8 01             	or     $0x1,%eax
8010669b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010669e:	eb 15                	jmp    801066b5 <mappages+0x45>
801066a0:	f6 00 01             	testb  $0x1,(%eax)
801066a3:	75 45                	jne    801066ea <mappages+0x7a>
801066a5:	0b 75 dc             	or     -0x24(%ebp),%esi
801066a8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
801066ab:	89 30                	mov    %esi,(%eax)
801066ad:	74 31                	je     801066e0 <mappages+0x70>
801066af:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801066b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801066b8:	b9 01 00 00 00       	mov    $0x1,%ecx
801066bd:	89 da                	mov    %ebx,%edx
801066bf:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801066c2:	e8 29 ff ff ff       	call   801065f0 <walkpgdir>
801066c7:	85 c0                	test   %eax,%eax
801066c9:	75 d5                	jne    801066a0 <mappages+0x30>
801066cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801066d3:	5b                   	pop    %ebx
801066d4:	5e                   	pop    %esi
801066d5:	5f                   	pop    %edi
801066d6:	5d                   	pop    %ebp
801066d7:	c3                   	ret    
801066d8:	90                   	nop
801066d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801066e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066e3:	31 c0                	xor    %eax,%eax
801066e5:	5b                   	pop    %ebx
801066e6:	5e                   	pop    %esi
801066e7:	5f                   	pop    %edi
801066e8:	5d                   	pop    %ebp
801066e9:	c3                   	ret    
801066ea:	83 ec 0c             	sub    $0xc,%esp
801066ed:	68 50 78 10 80       	push   $0x80107850
801066f2:	e8 79 9c ff ff       	call   80100370 <panic>
801066f7:	89 f6                	mov    %esi,%esi
801066f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106700 <deallocuvm.part.0>:
80106700:	55                   	push   %ebp
80106701:	89 e5                	mov    %esp,%ebp
80106703:	57                   	push   %edi
80106704:	56                   	push   %esi
80106705:	53                   	push   %ebx
80106706:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010670c:	89 c7                	mov    %eax,%edi
8010670e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106714:	83 ec 1c             	sub    $0x1c,%esp
80106717:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010671a:	39 d3                	cmp    %edx,%ebx
8010671c:	73 66                	jae    80106784 <deallocuvm.part.0+0x84>
8010671e:	89 d6                	mov    %edx,%esi
80106720:	eb 3d                	jmp    8010675f <deallocuvm.part.0+0x5f>
80106722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106728:	8b 10                	mov    (%eax),%edx
8010672a:	f6 c2 01             	test   $0x1,%dl
8010672d:	74 26                	je     80106755 <deallocuvm.part.0+0x55>
8010672f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106735:	74 58                	je     8010678f <deallocuvm.part.0+0x8f>
80106737:	83 ec 0c             	sub    $0xc,%esp
8010673a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106740:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106743:	52                   	push   %edx
80106744:	e8 97 bb ff ff       	call   801022e0 <kfree>
80106749:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010674c:	83 c4 10             	add    $0x10,%esp
8010674f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106755:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010675b:	39 f3                	cmp    %esi,%ebx
8010675d:	73 25                	jae    80106784 <deallocuvm.part.0+0x84>
8010675f:	31 c9                	xor    %ecx,%ecx
80106761:	89 da                	mov    %ebx,%edx
80106763:	89 f8                	mov    %edi,%eax
80106765:	e8 86 fe ff ff       	call   801065f0 <walkpgdir>
8010676a:	85 c0                	test   %eax,%eax
8010676c:	75 ba                	jne    80106728 <deallocuvm.part.0+0x28>
8010676e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106774:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
8010677a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106780:	39 f3                	cmp    %esi,%ebx
80106782:	72 db                	jb     8010675f <deallocuvm.part.0+0x5f>
80106784:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106787:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010678a:	5b                   	pop    %ebx
8010678b:	5e                   	pop    %esi
8010678c:	5f                   	pop    %edi
8010678d:	5d                   	pop    %ebp
8010678e:	c3                   	ret    
8010678f:	83 ec 0c             	sub    $0xc,%esp
80106792:	68 e6 71 10 80       	push   $0x801071e6
80106797:	e8 d4 9b ff ff       	call   80100370 <panic>
8010679c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801067a0 <seginit>:
801067a0:	55                   	push   %ebp
801067a1:	89 e5                	mov    %esp,%ebp
801067a3:	83 ec 18             	sub    $0x18,%esp
801067a6:	e8 b5 cf ff ff       	call   80103760 <cpuid>
801067ab:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
801067b1:	31 c9                	xor    %ecx,%ecx
801067b3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067b8:	66 89 90 f8 27 11 80 	mov    %dx,-0x7feed808(%eax)
801067bf:	66 89 88 fa 27 11 80 	mov    %cx,-0x7feed806(%eax)
801067c6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067cb:	31 c9                	xor    %ecx,%ecx
801067cd:	66 89 90 00 28 11 80 	mov    %dx,-0x7feed800(%eax)
801067d4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067d9:	66 89 88 02 28 11 80 	mov    %cx,-0x7feed7fe(%eax)
801067e0:	31 c9                	xor    %ecx,%ecx
801067e2:	66 89 90 08 28 11 80 	mov    %dx,-0x7feed7f8(%eax)
801067e9:	66 89 88 0a 28 11 80 	mov    %cx,-0x7feed7f6(%eax)
801067f0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067f5:	31 c9                	xor    %ecx,%ecx
801067f7:	66 89 90 10 28 11 80 	mov    %dx,-0x7feed7f0(%eax)
801067fe:	c6 80 fc 27 11 80 00 	movb   $0x0,-0x7feed804(%eax)
80106805:	ba 2f 00 00 00       	mov    $0x2f,%edx
8010680a:	c6 80 fd 27 11 80 9a 	movb   $0x9a,-0x7feed803(%eax)
80106811:	c6 80 fe 27 11 80 cf 	movb   $0xcf,-0x7feed802(%eax)
80106818:	c6 80 ff 27 11 80 00 	movb   $0x0,-0x7feed801(%eax)
8010681f:	c6 80 04 28 11 80 00 	movb   $0x0,-0x7feed7fc(%eax)
80106826:	c6 80 05 28 11 80 92 	movb   $0x92,-0x7feed7fb(%eax)
8010682d:	c6 80 06 28 11 80 cf 	movb   $0xcf,-0x7feed7fa(%eax)
80106834:	c6 80 07 28 11 80 00 	movb   $0x0,-0x7feed7f9(%eax)
8010683b:	c6 80 0c 28 11 80 00 	movb   $0x0,-0x7feed7f4(%eax)
80106842:	c6 80 0d 28 11 80 fa 	movb   $0xfa,-0x7feed7f3(%eax)
80106849:	c6 80 0e 28 11 80 cf 	movb   $0xcf,-0x7feed7f2(%eax)
80106850:	c6 80 0f 28 11 80 00 	movb   $0x0,-0x7feed7f1(%eax)
80106857:	66 89 88 12 28 11 80 	mov    %cx,-0x7feed7ee(%eax)
8010685e:	c6 80 14 28 11 80 00 	movb   $0x0,-0x7feed7ec(%eax)
80106865:	c6 80 15 28 11 80 f2 	movb   $0xf2,-0x7feed7eb(%eax)
8010686c:	c6 80 16 28 11 80 cf 	movb   $0xcf,-0x7feed7ea(%eax)
80106873:	c6 80 17 28 11 80 00 	movb   $0x0,-0x7feed7e9(%eax)
8010687a:	05 f0 27 11 80       	add    $0x801127f0,%eax
8010687f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106883:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106887:	c1 e8 10             	shr    $0x10,%eax
8010688a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
8010688e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106891:	0f 01 10             	lgdtl  (%eax)
80106894:	c9                   	leave  
80106895:	c3                   	ret    
80106896:	8d 76 00             	lea    0x0(%esi),%esi
80106899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068a0 <switchkvm>:
801068a0:	a1 24 55 11 80       	mov    0x80115524,%eax
801068a5:	55                   	push   %ebp
801068a6:	89 e5                	mov    %esp,%ebp
801068a8:	05 00 00 00 80       	add    $0x80000000,%eax
801068ad:	0f 22 d8             	mov    %eax,%cr3
801068b0:	5d                   	pop    %ebp
801068b1:	c3                   	ret    
801068b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068c0 <switchuvm>:
801068c0:	55                   	push   %ebp
801068c1:	89 e5                	mov    %esp,%ebp
801068c3:	57                   	push   %edi
801068c4:	56                   	push   %esi
801068c5:	53                   	push   %ebx
801068c6:	83 ec 1c             	sub    $0x1c,%esp
801068c9:	8b 75 08             	mov    0x8(%ebp),%esi
801068cc:	85 f6                	test   %esi,%esi
801068ce:	0f 84 cd 00 00 00    	je     801069a1 <switchuvm+0xe1>
801068d4:	8b 46 08             	mov    0x8(%esi),%eax
801068d7:	85 c0                	test   %eax,%eax
801068d9:	0f 84 dc 00 00 00    	je     801069bb <switchuvm+0xfb>
801068df:	8b 7e 04             	mov    0x4(%esi),%edi
801068e2:	85 ff                	test   %edi,%edi
801068e4:	0f 84 c4 00 00 00    	je     801069ae <switchuvm+0xee>
801068ea:	e8 51 d9 ff ff       	call   80104240 <pushcli>
801068ef:	e8 ec cd ff ff       	call   801036e0 <mycpu>
801068f4:	89 c3                	mov    %eax,%ebx
801068f6:	e8 e5 cd ff ff       	call   801036e0 <mycpu>
801068fb:	89 c7                	mov    %eax,%edi
801068fd:	e8 de cd ff ff       	call   801036e0 <mycpu>
80106902:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106905:	83 c7 08             	add    $0x8,%edi
80106908:	e8 d3 cd ff ff       	call   801036e0 <mycpu>
8010690d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106910:	83 c0 08             	add    $0x8,%eax
80106913:	ba 67 00 00 00       	mov    $0x67,%edx
80106918:	c1 e8 18             	shr    $0x18,%eax
8010691b:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106922:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106929:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106930:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106937:	83 c1 08             	add    $0x8,%ecx
8010693a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106940:	c1 e9 10             	shr    $0x10,%ecx
80106943:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106949:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010694e:	e8 8d cd ff ff       	call   801036e0 <mycpu>
80106953:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
8010695a:	e8 81 cd ff ff       	call   801036e0 <mycpu>
8010695f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106964:	66 89 48 10          	mov    %cx,0x10(%eax)
80106968:	e8 73 cd ff ff       	call   801036e0 <mycpu>
8010696d:	8b 56 08             	mov    0x8(%esi),%edx
80106970:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106976:	89 48 0c             	mov    %ecx,0xc(%eax)
80106979:	e8 62 cd ff ff       	call   801036e0 <mycpu>
8010697e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
80106982:	b8 28 00 00 00       	mov    $0x28,%eax
80106987:	0f 00 d8             	ltr    %ax
8010698a:	8b 46 04             	mov    0x4(%esi),%eax
8010698d:	05 00 00 00 80       	add    $0x80000000,%eax
80106992:	0f 22 d8             	mov    %eax,%cr3
80106995:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106998:	5b                   	pop    %ebx
80106999:	5e                   	pop    %esi
8010699a:	5f                   	pop    %edi
8010699b:	5d                   	pop    %ebp
8010699c:	e9 df d8 ff ff       	jmp    80104280 <popcli>
801069a1:	83 ec 0c             	sub    $0xc,%esp
801069a4:	68 56 78 10 80       	push   $0x80107856
801069a9:	e8 c2 99 ff ff       	call   80100370 <panic>
801069ae:	83 ec 0c             	sub    $0xc,%esp
801069b1:	68 81 78 10 80       	push   $0x80107881
801069b6:	e8 b5 99 ff ff       	call   80100370 <panic>
801069bb:	83 ec 0c             	sub    $0xc,%esp
801069be:	68 6c 78 10 80       	push   $0x8010786c
801069c3:	e8 a8 99 ff ff       	call   80100370 <panic>
801069c8:	90                   	nop
801069c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801069d0 <inituvm>:
801069d0:	55                   	push   %ebp
801069d1:	89 e5                	mov    %esp,%ebp
801069d3:	57                   	push   %edi
801069d4:	56                   	push   %esi
801069d5:	53                   	push   %ebx
801069d6:	83 ec 1c             	sub    $0x1c,%esp
801069d9:	8b 75 10             	mov    0x10(%ebp),%esi
801069dc:	8b 45 08             	mov    0x8(%ebp),%eax
801069df:	8b 7d 0c             	mov    0xc(%ebp),%edi
801069e2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801069e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801069eb:	77 49                	ja     80106a36 <inituvm+0x66>
801069ed:	e8 9e ba ff ff       	call   80102490 <kalloc>
801069f2:	83 ec 04             	sub    $0x4,%esp
801069f5:	89 c3                	mov    %eax,%ebx
801069f7:	68 00 10 00 00       	push   $0x1000
801069fc:	6a 00                	push   $0x0
801069fe:	50                   	push   %eax
801069ff:	e8 1c da ff ff       	call   80104420 <memset>
80106a04:	58                   	pop    %eax
80106a05:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106a0b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106a10:	5a                   	pop    %edx
80106a11:	6a 06                	push   $0x6
80106a13:	50                   	push   %eax
80106a14:	31 d2                	xor    %edx,%edx
80106a16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a19:	e8 52 fc ff ff       	call   80106670 <mappages>
80106a1e:	89 75 10             	mov    %esi,0x10(%ebp)
80106a21:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106a24:	83 c4 10             	add    $0x10,%esp
80106a27:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106a2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a2d:	5b                   	pop    %ebx
80106a2e:	5e                   	pop    %esi
80106a2f:	5f                   	pop    %edi
80106a30:	5d                   	pop    %ebp
80106a31:	e9 9a da ff ff       	jmp    801044d0 <memmove>
80106a36:	83 ec 0c             	sub    $0xc,%esp
80106a39:	68 95 78 10 80       	push   $0x80107895
80106a3e:	e8 2d 99 ff ff       	call   80100370 <panic>
80106a43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a50 <loaduvm>:
80106a50:	55                   	push   %ebp
80106a51:	89 e5                	mov    %esp,%ebp
80106a53:	57                   	push   %edi
80106a54:	56                   	push   %esi
80106a55:	53                   	push   %ebx
80106a56:	83 ec 0c             	sub    $0xc,%esp
80106a59:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106a60:	0f 85 91 00 00 00    	jne    80106af7 <loaduvm+0xa7>
80106a66:	8b 75 18             	mov    0x18(%ebp),%esi
80106a69:	31 db                	xor    %ebx,%ebx
80106a6b:	85 f6                	test   %esi,%esi
80106a6d:	75 1a                	jne    80106a89 <loaduvm+0x39>
80106a6f:	eb 6f                	jmp    80106ae0 <loaduvm+0x90>
80106a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a78:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a7e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106a84:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106a87:	76 57                	jbe    80106ae0 <loaduvm+0x90>
80106a89:	8b 55 0c             	mov    0xc(%ebp),%edx
80106a8c:	8b 45 08             	mov    0x8(%ebp),%eax
80106a8f:	31 c9                	xor    %ecx,%ecx
80106a91:	01 da                	add    %ebx,%edx
80106a93:	e8 58 fb ff ff       	call   801065f0 <walkpgdir>
80106a98:	85 c0                	test   %eax,%eax
80106a9a:	74 4e                	je     80106aea <loaduvm+0x9a>
80106a9c:	8b 00                	mov    (%eax),%eax
80106a9e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106aa1:	bf 00 10 00 00       	mov    $0x1000,%edi
80106aa6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106aab:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ab1:	0f 46 fe             	cmovbe %esi,%edi
80106ab4:	01 d9                	add    %ebx,%ecx
80106ab6:	05 00 00 00 80       	add    $0x80000000,%eax
80106abb:	57                   	push   %edi
80106abc:	51                   	push   %ecx
80106abd:	50                   	push   %eax
80106abe:	ff 75 10             	pushl  0x10(%ebp)
80106ac1:	e8 8a ae ff ff       	call   80101950 <readi>
80106ac6:	83 c4 10             	add    $0x10,%esp
80106ac9:	39 c7                	cmp    %eax,%edi
80106acb:	74 ab                	je     80106a78 <loaduvm+0x28>
80106acd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ad0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106ad5:	5b                   	pop    %ebx
80106ad6:	5e                   	pop    %esi
80106ad7:	5f                   	pop    %edi
80106ad8:	5d                   	pop    %ebp
80106ad9:	c3                   	ret    
80106ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ae0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ae3:	31 c0                	xor    %eax,%eax
80106ae5:	5b                   	pop    %ebx
80106ae6:	5e                   	pop    %esi
80106ae7:	5f                   	pop    %edi
80106ae8:	5d                   	pop    %ebp
80106ae9:	c3                   	ret    
80106aea:	83 ec 0c             	sub    $0xc,%esp
80106aed:	68 af 78 10 80       	push   $0x801078af
80106af2:	e8 79 98 ff ff       	call   80100370 <panic>
80106af7:	83 ec 0c             	sub    $0xc,%esp
80106afa:	68 50 79 10 80       	push   $0x80107950
80106aff:	e8 6c 98 ff ff       	call   80100370 <panic>
80106b04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106b10 <allocuvm>:
80106b10:	55                   	push   %ebp
80106b11:	89 e5                	mov    %esp,%ebp
80106b13:	57                   	push   %edi
80106b14:	56                   	push   %esi
80106b15:	53                   	push   %ebx
80106b16:	83 ec 0c             	sub    $0xc,%esp
80106b19:	8b 7d 10             	mov    0x10(%ebp),%edi
80106b1c:	85 ff                	test   %edi,%edi
80106b1e:	0f 88 ca 00 00 00    	js     80106bee <allocuvm+0xde>
80106b24:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106b27:	8b 45 0c             	mov    0xc(%ebp),%eax
80106b2a:	0f 82 82 00 00 00    	jb     80106bb2 <allocuvm+0xa2>
80106b30:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106b36:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106b3c:	39 df                	cmp    %ebx,%edi
80106b3e:	77 43                	ja     80106b83 <allocuvm+0x73>
80106b40:	e9 bb 00 00 00       	jmp    80106c00 <allocuvm+0xf0>
80106b45:	8d 76 00             	lea    0x0(%esi),%esi
80106b48:	83 ec 04             	sub    $0x4,%esp
80106b4b:	68 00 10 00 00       	push   $0x1000
80106b50:	6a 00                	push   $0x0
80106b52:	50                   	push   %eax
80106b53:	e8 c8 d8 ff ff       	call   80104420 <memset>
80106b58:	58                   	pop    %eax
80106b59:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106b5f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b64:	5a                   	pop    %edx
80106b65:	6a 06                	push   $0x6
80106b67:	50                   	push   %eax
80106b68:	89 da                	mov    %ebx,%edx
80106b6a:	8b 45 08             	mov    0x8(%ebp),%eax
80106b6d:	e8 fe fa ff ff       	call   80106670 <mappages>
80106b72:	83 c4 10             	add    $0x10,%esp
80106b75:	85 c0                	test   %eax,%eax
80106b77:	78 47                	js     80106bc0 <allocuvm+0xb0>
80106b79:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b7f:	39 df                	cmp    %ebx,%edi
80106b81:	76 7d                	jbe    80106c00 <allocuvm+0xf0>
80106b83:	e8 08 b9 ff ff       	call   80102490 <kalloc>
80106b88:	85 c0                	test   %eax,%eax
80106b8a:	89 c6                	mov    %eax,%esi
80106b8c:	75 ba                	jne    80106b48 <allocuvm+0x38>
80106b8e:	83 ec 0c             	sub    $0xc,%esp
80106b91:	68 cd 78 10 80       	push   $0x801078cd
80106b96:	e8 c5 9a ff ff       	call   80100660 <cprintf>
80106b9b:	83 c4 10             	add    $0x10,%esp
80106b9e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106ba1:	76 4b                	jbe    80106bee <allocuvm+0xde>
80106ba3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106ba6:	8b 45 08             	mov    0x8(%ebp),%eax
80106ba9:	89 fa                	mov    %edi,%edx
80106bab:	e8 50 fb ff ff       	call   80106700 <deallocuvm.part.0>
80106bb0:	31 c0                	xor    %eax,%eax
80106bb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bb5:	5b                   	pop    %ebx
80106bb6:	5e                   	pop    %esi
80106bb7:	5f                   	pop    %edi
80106bb8:	5d                   	pop    %ebp
80106bb9:	c3                   	ret    
80106bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bc0:	83 ec 0c             	sub    $0xc,%esp
80106bc3:	68 e5 78 10 80       	push   $0x801078e5
80106bc8:	e8 93 9a ff ff       	call   80100660 <cprintf>
80106bcd:	83 c4 10             	add    $0x10,%esp
80106bd0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106bd3:	76 0d                	jbe    80106be2 <allocuvm+0xd2>
80106bd5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106bd8:	8b 45 08             	mov    0x8(%ebp),%eax
80106bdb:	89 fa                	mov    %edi,%edx
80106bdd:	e8 1e fb ff ff       	call   80106700 <deallocuvm.part.0>
80106be2:	83 ec 0c             	sub    $0xc,%esp
80106be5:	56                   	push   %esi
80106be6:	e8 f5 b6 ff ff       	call   801022e0 <kfree>
80106beb:	83 c4 10             	add    $0x10,%esp
80106bee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bf1:	31 c0                	xor    %eax,%eax
80106bf3:	5b                   	pop    %ebx
80106bf4:	5e                   	pop    %esi
80106bf5:	5f                   	pop    %edi
80106bf6:	5d                   	pop    %ebp
80106bf7:	c3                   	ret    
80106bf8:	90                   	nop
80106bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c00:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c03:	89 f8                	mov    %edi,%eax
80106c05:	5b                   	pop    %ebx
80106c06:	5e                   	pop    %esi
80106c07:	5f                   	pop    %edi
80106c08:	5d                   	pop    %ebp
80106c09:	c3                   	ret    
80106c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106c10 <deallocuvm>:
80106c10:	55                   	push   %ebp
80106c11:	89 e5                	mov    %esp,%ebp
80106c13:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c16:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106c19:	8b 45 08             	mov    0x8(%ebp),%eax
80106c1c:	39 d1                	cmp    %edx,%ecx
80106c1e:	73 10                	jae    80106c30 <deallocuvm+0x20>
80106c20:	5d                   	pop    %ebp
80106c21:	e9 da fa ff ff       	jmp    80106700 <deallocuvm.part.0>
80106c26:	8d 76 00             	lea    0x0(%esi),%esi
80106c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106c30:	89 d0                	mov    %edx,%eax
80106c32:	5d                   	pop    %ebp
80106c33:	c3                   	ret    
80106c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c40 <freevm>:
80106c40:	55                   	push   %ebp
80106c41:	89 e5                	mov    %esp,%ebp
80106c43:	57                   	push   %edi
80106c44:	56                   	push   %esi
80106c45:	53                   	push   %ebx
80106c46:	83 ec 0c             	sub    $0xc,%esp
80106c49:	8b 75 08             	mov    0x8(%ebp),%esi
80106c4c:	85 f6                	test   %esi,%esi
80106c4e:	74 59                	je     80106ca9 <freevm+0x69>
80106c50:	31 c9                	xor    %ecx,%ecx
80106c52:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106c57:	89 f0                	mov    %esi,%eax
80106c59:	e8 a2 fa ff ff       	call   80106700 <deallocuvm.part.0>
80106c5e:	89 f3                	mov    %esi,%ebx
80106c60:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106c66:	eb 0f                	jmp    80106c77 <freevm+0x37>
80106c68:	90                   	nop
80106c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c70:	83 c3 04             	add    $0x4,%ebx
80106c73:	39 fb                	cmp    %edi,%ebx
80106c75:	74 23                	je     80106c9a <freevm+0x5a>
80106c77:	8b 03                	mov    (%ebx),%eax
80106c79:	a8 01                	test   $0x1,%al
80106c7b:	74 f3                	je     80106c70 <freevm+0x30>
80106c7d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c82:	83 ec 0c             	sub    $0xc,%esp
80106c85:	83 c3 04             	add    $0x4,%ebx
80106c88:	05 00 00 00 80       	add    $0x80000000,%eax
80106c8d:	50                   	push   %eax
80106c8e:	e8 4d b6 ff ff       	call   801022e0 <kfree>
80106c93:	83 c4 10             	add    $0x10,%esp
80106c96:	39 fb                	cmp    %edi,%ebx
80106c98:	75 dd                	jne    80106c77 <freevm+0x37>
80106c9a:	89 75 08             	mov    %esi,0x8(%ebp)
80106c9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ca0:	5b                   	pop    %ebx
80106ca1:	5e                   	pop    %esi
80106ca2:	5f                   	pop    %edi
80106ca3:	5d                   	pop    %ebp
80106ca4:	e9 37 b6 ff ff       	jmp    801022e0 <kfree>
80106ca9:	83 ec 0c             	sub    $0xc,%esp
80106cac:	68 01 79 10 80       	push   $0x80107901
80106cb1:	e8 ba 96 ff ff       	call   80100370 <panic>
80106cb6:	8d 76 00             	lea    0x0(%esi),%esi
80106cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cc0 <setupkvm>:
80106cc0:	55                   	push   %ebp
80106cc1:	89 e5                	mov    %esp,%ebp
80106cc3:	56                   	push   %esi
80106cc4:	53                   	push   %ebx
80106cc5:	e8 c6 b7 ff ff       	call   80102490 <kalloc>
80106cca:	85 c0                	test   %eax,%eax
80106ccc:	74 6a                	je     80106d38 <setupkvm+0x78>
80106cce:	83 ec 04             	sub    $0x4,%esp
80106cd1:	89 c6                	mov    %eax,%esi
80106cd3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106cd8:	68 00 10 00 00       	push   $0x1000
80106cdd:	6a 00                	push   $0x0
80106cdf:	50                   	push   %eax
80106ce0:	e8 3b d7 ff ff       	call   80104420 <memset>
80106ce5:	83 c4 10             	add    $0x10,%esp
80106ce8:	8b 43 04             	mov    0x4(%ebx),%eax
80106ceb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106cee:	83 ec 08             	sub    $0x8,%esp
80106cf1:	8b 13                	mov    (%ebx),%edx
80106cf3:	ff 73 0c             	pushl  0xc(%ebx)
80106cf6:	50                   	push   %eax
80106cf7:	29 c1                	sub    %eax,%ecx
80106cf9:	89 f0                	mov    %esi,%eax
80106cfb:	e8 70 f9 ff ff       	call   80106670 <mappages>
80106d00:	83 c4 10             	add    $0x10,%esp
80106d03:	85 c0                	test   %eax,%eax
80106d05:	78 19                	js     80106d20 <setupkvm+0x60>
80106d07:	83 c3 10             	add    $0x10,%ebx
80106d0a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106d10:	75 d6                	jne    80106ce8 <setupkvm+0x28>
80106d12:	89 f0                	mov    %esi,%eax
80106d14:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d17:	5b                   	pop    %ebx
80106d18:	5e                   	pop    %esi
80106d19:	5d                   	pop    %ebp
80106d1a:	c3                   	ret    
80106d1b:	90                   	nop
80106d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106d20:	83 ec 0c             	sub    $0xc,%esp
80106d23:	56                   	push   %esi
80106d24:	e8 17 ff ff ff       	call   80106c40 <freevm>
80106d29:	83 c4 10             	add    $0x10,%esp
80106d2c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d2f:	31 c0                	xor    %eax,%eax
80106d31:	5b                   	pop    %ebx
80106d32:	5e                   	pop    %esi
80106d33:	5d                   	pop    %ebp
80106d34:	c3                   	ret    
80106d35:	8d 76 00             	lea    0x0(%esi),%esi
80106d38:	31 c0                	xor    %eax,%eax
80106d3a:	eb d8                	jmp    80106d14 <setupkvm+0x54>
80106d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106d40 <kvmalloc>:
80106d40:	55                   	push   %ebp
80106d41:	89 e5                	mov    %esp,%ebp
80106d43:	83 ec 08             	sub    $0x8,%esp
80106d46:	e8 75 ff ff ff       	call   80106cc0 <setupkvm>
80106d4b:	a3 24 55 11 80       	mov    %eax,0x80115524
80106d50:	05 00 00 00 80       	add    $0x80000000,%eax
80106d55:	0f 22 d8             	mov    %eax,%cr3
80106d58:	c9                   	leave  
80106d59:	c3                   	ret    
80106d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d60 <clearpteu>:
80106d60:	55                   	push   %ebp
80106d61:	31 c9                	xor    %ecx,%ecx
80106d63:	89 e5                	mov    %esp,%ebp
80106d65:	83 ec 08             	sub    $0x8,%esp
80106d68:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d6b:	8b 45 08             	mov    0x8(%ebp),%eax
80106d6e:	e8 7d f8 ff ff       	call   801065f0 <walkpgdir>
80106d73:	85 c0                	test   %eax,%eax
80106d75:	74 05                	je     80106d7c <clearpteu+0x1c>
80106d77:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106d7a:	c9                   	leave  
80106d7b:	c3                   	ret    
80106d7c:	83 ec 0c             	sub    $0xc,%esp
80106d7f:	68 12 79 10 80       	push   $0x80107912
80106d84:	e8 e7 95 ff ff       	call   80100370 <panic>
80106d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106d90 <copyuvm>:
80106d90:	55                   	push   %ebp
80106d91:	89 e5                	mov    %esp,%ebp
80106d93:	57                   	push   %edi
80106d94:	56                   	push   %esi
80106d95:	53                   	push   %ebx
80106d96:	83 ec 1c             	sub    $0x1c,%esp
80106d99:	e8 22 ff ff ff       	call   80106cc0 <setupkvm>
80106d9e:	85 c0                	test   %eax,%eax
80106da0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106da3:	0f 84 c5 00 00 00    	je     80106e6e <copyuvm+0xde>
80106da9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106dac:	85 c9                	test   %ecx,%ecx
80106dae:	0f 84 9c 00 00 00    	je     80106e50 <copyuvm+0xc0>
80106db4:	31 ff                	xor    %edi,%edi
80106db6:	eb 4a                	jmp    80106e02 <copyuvm+0x72>
80106db8:	90                   	nop
80106db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106dc0:	83 ec 04             	sub    $0x4,%esp
80106dc3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106dc9:	68 00 10 00 00       	push   $0x1000
80106dce:	53                   	push   %ebx
80106dcf:	50                   	push   %eax
80106dd0:	e8 fb d6 ff ff       	call   801044d0 <memmove>
80106dd5:	58                   	pop    %eax
80106dd6:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106ddc:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106de1:	5a                   	pop    %edx
80106de2:	ff 75 e4             	pushl  -0x1c(%ebp)
80106de5:	50                   	push   %eax
80106de6:	89 fa                	mov    %edi,%edx
80106de8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106deb:	e8 80 f8 ff ff       	call   80106670 <mappages>
80106df0:	83 c4 10             	add    $0x10,%esp
80106df3:	85 c0                	test   %eax,%eax
80106df5:	78 69                	js     80106e60 <copyuvm+0xd0>
80106df7:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106dfd:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106e00:	76 4e                	jbe    80106e50 <copyuvm+0xc0>
80106e02:	8b 45 08             	mov    0x8(%ebp),%eax
80106e05:	31 c9                	xor    %ecx,%ecx
80106e07:	89 fa                	mov    %edi,%edx
80106e09:	e8 e2 f7 ff ff       	call   801065f0 <walkpgdir>
80106e0e:	85 c0                	test   %eax,%eax
80106e10:	74 6d                	je     80106e7f <copyuvm+0xef>
80106e12:	8b 00                	mov    (%eax),%eax
80106e14:	a8 01                	test   $0x1,%al
80106e16:	74 5a                	je     80106e72 <copyuvm+0xe2>
80106e18:	89 c3                	mov    %eax,%ebx
80106e1a:	25 ff 0f 00 00       	and    $0xfff,%eax
80106e1f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106e25:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106e28:	e8 63 b6 ff ff       	call   80102490 <kalloc>
80106e2d:	85 c0                	test   %eax,%eax
80106e2f:	89 c6                	mov    %eax,%esi
80106e31:	75 8d                	jne    80106dc0 <copyuvm+0x30>
80106e33:	83 ec 0c             	sub    $0xc,%esp
80106e36:	ff 75 e0             	pushl  -0x20(%ebp)
80106e39:	e8 02 fe ff ff       	call   80106c40 <freevm>
80106e3e:	83 c4 10             	add    $0x10,%esp
80106e41:	31 c0                	xor    %eax,%eax
80106e43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e46:	5b                   	pop    %ebx
80106e47:	5e                   	pop    %esi
80106e48:	5f                   	pop    %edi
80106e49:	5d                   	pop    %ebp
80106e4a:	c3                   	ret    
80106e4b:	90                   	nop
80106e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e50:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e53:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e56:	5b                   	pop    %ebx
80106e57:	5e                   	pop    %esi
80106e58:	5f                   	pop    %edi
80106e59:	5d                   	pop    %ebp
80106e5a:	c3                   	ret    
80106e5b:	90                   	nop
80106e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e60:	83 ec 0c             	sub    $0xc,%esp
80106e63:	56                   	push   %esi
80106e64:	e8 77 b4 ff ff       	call   801022e0 <kfree>
80106e69:	83 c4 10             	add    $0x10,%esp
80106e6c:	eb c5                	jmp    80106e33 <copyuvm+0xa3>
80106e6e:	31 c0                	xor    %eax,%eax
80106e70:	eb d1                	jmp    80106e43 <copyuvm+0xb3>
80106e72:	83 ec 0c             	sub    $0xc,%esp
80106e75:	68 36 79 10 80       	push   $0x80107936
80106e7a:	e8 f1 94 ff ff       	call   80100370 <panic>
80106e7f:	83 ec 0c             	sub    $0xc,%esp
80106e82:	68 1c 79 10 80       	push   $0x8010791c
80106e87:	e8 e4 94 ff ff       	call   80100370 <panic>
80106e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e90 <uva2ka>:
80106e90:	55                   	push   %ebp
80106e91:	31 c9                	xor    %ecx,%ecx
80106e93:	89 e5                	mov    %esp,%ebp
80106e95:	83 ec 08             	sub    $0x8,%esp
80106e98:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e9b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e9e:	e8 4d f7 ff ff       	call   801065f0 <walkpgdir>
80106ea3:	8b 00                	mov    (%eax),%eax
80106ea5:	89 c2                	mov    %eax,%edx
80106ea7:	83 e2 05             	and    $0x5,%edx
80106eaa:	83 fa 05             	cmp    $0x5,%edx
80106ead:	75 11                	jne    80106ec0 <uva2ka+0x30>
80106eaf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106eb4:	c9                   	leave  
80106eb5:	05 00 00 00 80       	add    $0x80000000,%eax
80106eba:	c3                   	ret    
80106ebb:	90                   	nop
80106ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ec0:	31 c0                	xor    %eax,%eax
80106ec2:	c9                   	leave  
80106ec3:	c3                   	ret    
80106ec4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106eca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ed0 <copyout>:
80106ed0:	55                   	push   %ebp
80106ed1:	89 e5                	mov    %esp,%ebp
80106ed3:	57                   	push   %edi
80106ed4:	56                   	push   %esi
80106ed5:	53                   	push   %ebx
80106ed6:	83 ec 1c             	sub    $0x1c,%esp
80106ed9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106edc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106edf:	8b 7d 10             	mov    0x10(%ebp),%edi
80106ee2:	85 db                	test   %ebx,%ebx
80106ee4:	75 40                	jne    80106f26 <copyout+0x56>
80106ee6:	eb 70                	jmp    80106f58 <copyout+0x88>
80106ee8:	90                   	nop
80106ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ef0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106ef3:	89 f1                	mov    %esi,%ecx
80106ef5:	29 d1                	sub    %edx,%ecx
80106ef7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106efd:	39 d9                	cmp    %ebx,%ecx
80106eff:	0f 47 cb             	cmova  %ebx,%ecx
80106f02:	29 f2                	sub    %esi,%edx
80106f04:	83 ec 04             	sub    $0x4,%esp
80106f07:	01 d0                	add    %edx,%eax
80106f09:	51                   	push   %ecx
80106f0a:	57                   	push   %edi
80106f0b:	50                   	push   %eax
80106f0c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106f0f:	e8 bc d5 ff ff       	call   801044d0 <memmove>
80106f14:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106f17:	83 c4 10             	add    $0x10,%esp
80106f1a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80106f20:	01 cf                	add    %ecx,%edi
80106f22:	29 cb                	sub    %ecx,%ebx
80106f24:	74 32                	je     80106f58 <copyout+0x88>
80106f26:	89 d6                	mov    %edx,%esi
80106f28:	83 ec 08             	sub    $0x8,%esp
80106f2b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f2e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106f34:	56                   	push   %esi
80106f35:	ff 75 08             	pushl  0x8(%ebp)
80106f38:	e8 53 ff ff ff       	call   80106e90 <uva2ka>
80106f3d:	83 c4 10             	add    $0x10,%esp
80106f40:	85 c0                	test   %eax,%eax
80106f42:	75 ac                	jne    80106ef0 <copyout+0x20>
80106f44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f4c:	5b                   	pop    %ebx
80106f4d:	5e                   	pop    %esi
80106f4e:	5f                   	pop    %edi
80106f4f:	5d                   	pop    %ebp
80106f50:	c3                   	ret    
80106f51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f5b:	31 c0                	xor    %eax,%eax
80106f5d:	5b                   	pop    %ebx
80106f5e:	5e                   	pop    %esi
80106f5f:	5f                   	pop    %edi
80106f60:	5d                   	pop    %ebp
80106f61:	c3                   	ret    
