#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM pay_slope */
	case 3: // STATE 1 - _spin_nvr.tmp:12 - [((((!(!((men[4]==PAY)))&&!((men[4]==SLOPE)))&&(!(!((men[1]==PAY)))||(!(!((men[2]==PAY)))||(!(!((men[3]==PAY)))||!(!((men[4]==PAY)))))))&&(!(!((men[0]==PAY)))||(!(!((men[1]==PAY)))||(!(!((men[2]==PAY)))||(!(!((men[3]==PAY)))||!(!((men[4]==PAY)))))))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][1] = 1;
		if (!(((( !( !((((int)now.men[4])==4)))&& !((((int)now.men[4])==1)))&&( !( !((((int)now.men[1])==4)))||( !( !((((int)now.men[2])==4)))||( !( !((((int)now.men[3])==4)))|| !( !((((int)now.men[4])==4)))))))&&( !( !((((int)now.men[0])==4)))||( !( !((((int)now.men[1])==4)))||( !( !((((int)now.men[2])==4)))||( !( !((((int)now.men[3])==4)))|| !( !((((int)now.men[4])==4))))))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 3 - _spin_nvr.tmp:13 - [((((!(!((men[3]==PAY)))&&!((men[3]==SLOPE)))&&(!(!((men[1]==PAY)))||(!(!((men[2]==PAY)))||(!(!((men[3]==PAY)))||!(!((men[4]==PAY)))))))&&(!(!((men[0]==PAY)))||(!(!((men[1]==PAY)))||(!(!((men[2]==PAY)))||(!(!((men[3]==PAY)))||!(!((men[4]==PAY)))))))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][3] = 1;
		if (!(((( !( !((((int)now.men[3])==4)))&& !((((int)now.men[3])==1)))&&( !( !((((int)now.men[1])==4)))||( !( !((((int)now.men[2])==4)))||( !( !((((int)now.men[3])==4)))|| !( !((((int)now.men[4])==4)))))))&&( !( !((((int)now.men[0])==4)))||( !( !((((int)now.men[1])==4)))||( !( !((((int)now.men[2])==4)))||( !( !((((int)now.men[3])==4)))|| !( !((((int)now.men[4])==4))))))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 5 - _spin_nvr.tmp:14 - [(((!(!((men[2]==PAY)))&&!((men[2]==SLOPE)))&&(!(!((men[0]==PAY)))||(!(!((men[1]==PAY)))||(!(!((men[2]==PAY)))||(!(!((men[3]==PAY)))||!(!((men[4]==PAY)))))))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported5 = 0;
			if (verbose && !reported5)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported5 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported5 = 0;
			if (verbose && !reported5)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported5 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][5] = 1;
		if (!((( !( !((((int)now.men[2])==4)))&& !((((int)now.men[2])==1)))&&( !( !((((int)now.men[0])==4)))||( !( !((((int)now.men[1])==4)))||( !( !((((int)now.men[2])==4)))||( !( !((((int)now.men[3])==4)))|| !( !((((int)now.men[4])==4))))))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 7 - _spin_nvr.tmp:15 - [((!(!((men[1]==PAY)))&&!((men[1]==SLOPE))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported7 = 0;
			if (verbose && !reported7)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported7 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported7 = 0;
			if (verbose && !reported7)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported7 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][7] = 1;
		if (!(( !( !((((int)now.men[1])==4)))&& !((((int)now.men[1])==1)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 9 - _spin_nvr.tmp:16 - [((!(!((men[0]==PAY)))&&!((men[0]==SLOPE))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported9 = 0;
			if (verbose && !reported9)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported9 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported9 = 0;
			if (verbose && !reported9)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported9 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][9] = 1;
		if (!(( !( !((((int)now.men[0])==4)))&& !((((int)now.men[0])==1)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 16 - _spin_nvr.tmp:21 - [(!((men[4]==SLOPE)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported16 = 0;
			if (verbose && !reported16)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported16 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported16 = 0;
			if (verbose && !reported16)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported16 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][16] = 1;
		if (!( !((((int)now.men[4])==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 21 - _spin_nvr.tmp:25 - [(!((men[3]==SLOPE)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported21 = 0;
			if (verbose && !reported21)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported21 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported21 = 0;
			if (verbose && !reported21)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported21 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][21] = 1;
		if (!( !((((int)now.men[3])==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 26 - _spin_nvr.tmp:29 - [(!((men[2]==SLOPE)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported26 = 0;
			if (verbose && !reported26)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported26 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported26 = 0;
			if (verbose && !reported26)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported26 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][26] = 1;
		if (!( !((((int)now.men[2])==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 31 - _spin_nvr.tmp:33 - [(!((men[1]==SLOPE)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported31 = 0;
			if (verbose && !reported31)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported31 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported31 = 0;
			if (verbose && !reported31)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported31 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][31] = 1;
		if (!( !((((int)now.men[1])==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 36 - _spin_nvr.tmp:37 - [(!((men[0]==SLOPE)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported36 = 0;
			if (verbose && !reported36)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported36 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported36 = 0;
			if (verbose && !reported36)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported36 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][36] = 1;
		if (!( !((((int)now.men[0])==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 41 - _spin_nvr.tmp:39 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported41 = 0;
			if (verbose && !reported41)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported41 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported41 = 0;
			if (verbose && !reported41)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported41 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][41] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM all_slope */
	case 14: // STATE 1 - _spin_nvr.tmp:3 - [(!((len(mans_queue)==0)))] (6:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][1] = 1;
		if (!( !((q_len(now.mans_queue)==0))))
			continue;
		/* merge: assert(!(!((len(mans_queue)==0))))(0, 2, 6) */
		reached[4][2] = 1;
		spin_assert( !( !((q_len(now.mans_queue)==0))), " !( !((q_len(mans_queue)==0)))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[4][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 15: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 16: // STATE 1 - model.pml:96 - [(run new_queue_gen())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 2, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - model.pml:97 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 3 - model.pml:97 - [((i<=(5-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		if (!((((P3 *)this)->i<=(5-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 4 - model.pml:98 - [(run queueAction(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		if (!(addproc(II, 1, 1, ((P3 *)this)->i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 5 - model.pml:97 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[3][5] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = (((P3 *)this)->i+1);
#ifdef VAR_RANGES
		logval(":init::i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 11 - model.pml:100 - [i = 0] (0:17:1 - 3)
		IfNotBlocked
		reached[3][11] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((P3 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[3][18] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 22: // STATE 12 - model.pml:100 - [((i<=(2-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][12] = 1;
		if (!((((P3 *)this)->i<=(2-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 13 - model.pml:101 - [(run decksAction(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][13] = 1;
		if (!(addproc(II, 1, 0, ((P3 *)this)->i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 14 - model.pml:100 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[3][14] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = (((P3 *)this)->i+1);
#ifdef VAR_RANGES
		logval(":init::i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 21 - model.pml:104 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][21] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC new_queue_gen */
	case 26: // STATE 1 - model.pml:77 - [rand_value = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = now.rand_value;
		now.rand_value = 1;
#ifdef VAR_RANGES
		logval("rand_value", now.rand_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 6 - model.pml:81 - [((rand_value==1))] (8:0:1 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (!((now.rand_value==1)))
			continue;
		/* merge: men[man_id] = WAIT_P(0, 7, 8) */
		reached[2][7] = 1;
		(trpt+1)->bup.oval = ((int)now.men[ Index(((P2 *)this)->man_id, 5) ]);
		now.men[ Index(((P2 *)this)->man_id, 5) ] = 5;
#ifdef VAR_RANGES
		logval("men[new_queue_gen:man_id]", ((int)now.men[ Index(((P2 *)this)->man_id, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 28: // STATE 8 - model.pml:83 - [mans_queue!man_id] (17:0:1 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (q_full(now.mans_queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.mans_queue);
		sprintf(simtmp, "%d", ((P2 *)this)->man_id); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.mans_queue, 0, ((P2 *)this)->man_id, 1);
		/* merge: man_id = (man_id-1)(17, 9, 17) */
		reached[2][9] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->man_id;
		((P2 *)this)->man_id = (((P2 *)this)->man_id-1);
#ifdef VAR_RANGES
		logval("new_queue_gen:man_id", ((P2 *)this)->man_id);
#endif
		;
		/* merge: .(goto)(17, 13, 17) */
		reached[2][13] = 1;
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[2][18] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 29: // STATE 13 - model.pml:87 - [.(goto)] (0:17:0 - 2)
		IfNotBlocked
		reached[2][13] = 1;
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[2][18] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 30: // STATE 11 - model.pml:85 - [(1)] (17:0:0 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(17, 13, 17) */
		reached[2][13] = 1;
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[2][18] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 31: // STATE 20 - model.pml:90 - [printf('Gen stops\\n')] (0:21:0 - 3)
		IfNotBlocked
		reached[2][20] = 1;
		Printf("Gen stops\n");
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 21 - model.pml:91 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][21] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC queueAction */
	case 33: // STATE 1 - model.pml:46 - [((men[id]==WAIT_P))] (29:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.men[ Index(((P1 *)this)->id, 5) ])==5)))
			continue;
		/* merge: printf('Man %d waits for paying\\n',id)(29, 2, 29) */
		reached[1][2] = 1;
		Printf("Man %d waits for paying\n", ((P1 *)this)->id);
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 34: // STATE 27 - model.pml:68 - [.(goto)] (0:29:0 - 6)
		IfNotBlocked
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 3 - model.pml:48 - [((men[id]==PAY))] (29:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!((((int)now.men[ Index(((P1 *)this)->id, 5) ])==4)))
			continue;
		/* merge: printf('Man %d pays for lifting',id)(29, 4, 29) */
		reached[1][4] = 1;
		Printf("Man %d pays for lifting", ((P1 *)this)->id);
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 36: // STATE 5 - model.pml:50 - [((men[id]==WAIT_L))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((((int)now.men[ Index(((P1 *)this)->id, 5) ])==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 6 - model.pml:52 - [((id==0))] (16:0:1 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!((((P1 *)this)->id==0)))
			continue;
		/* merge: men[id] = LIFT(0, 7, 16) */
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)now.men[ Index(((P1 *)this)->id, 5) ]);
		now.men[ Index(((P1 *)this)->id, 5) ] = 2;
#ifdef VAR_RANGES
		logval("men[queueAction:id]", ((int)now.men[ Index(((P1 *)this)->id, 5) ]));
#endif
		;
		/* merge: .(goto)(0, 9, 16) */
		reached[1][9] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 38: // STATE 10 - model.pml:55 - [((men[(id-1)]==WAIT_L))] (29:0:1 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!((((int)now.men[ Index((((P1 *)this)->id-1), 5) ])==3)))
			continue;
		/* merge: men[id] = WAIT_L(29, 11, 29) */
		reached[1][11] = 1;
		(trpt+1)->bup.oval = ((int)now.men[ Index(((P1 *)this)->id, 5) ]);
		now.men[ Index(((P1 *)this)->id, 5) ] = 3;
#ifdef VAR_RANGES
		logval("men[queueAction:id]", ((int)now.men[ Index(((P1 *)this)->id, 5) ]));
#endif
		;
		/* merge: .(goto)(29, 17, 29) */
		reached[1][17] = 1;
		;
		/* merge: printf('Man %d waits for lifitng\\n',id)(29, 18, 29) */
		reached[1][18] = 1;
		Printf("Man %d waits for lifitng\n", ((P1 *)this)->id);
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 39: // STATE 12 - model.pml:56 - [((men[(id-1)]==LIFT))] (29:0:1 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!((((int)now.men[ Index((((P1 *)this)->id-1), 5) ])==2)))
			continue;
		/* merge: men[id] = WAIT_L(29, 13, 29) */
		reached[1][13] = 1;
		(trpt+1)->bup.oval = ((int)now.men[ Index(((P1 *)this)->id, 5) ]);
		now.men[ Index(((P1 *)this)->id, 5) ] = 3;
#ifdef VAR_RANGES
		logval("men[queueAction:id]", ((int)now.men[ Index(((P1 *)this)->id, 5) ]));
#endif
		;
		/* merge: .(goto)(29, 17, 29) */
		reached[1][17] = 1;
		;
		/* merge: printf('Man %d waits for lifitng\\n',id)(29, 18, 29) */
		reached[1][18] = 1;
		Printf("Man %d waits for lifitng\n", ((P1 *)this)->id);
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 40: // STATE 14 - model.pml:57 - [((men[(id-1)]==SLOPE))] (29:0:1 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!((((int)now.men[ Index((((P1 *)this)->id-1), 5) ])==1)))
			continue;
		/* merge: men[id] = LIFT(29, 15, 29) */
		reached[1][15] = 1;
		(trpt+1)->bup.oval = ((int)now.men[ Index(((P1 *)this)->id, 5) ]);
		now.men[ Index(((P1 *)this)->id, 5) ] = 2;
#ifdef VAR_RANGES
		logval("men[queueAction:id]", ((int)now.men[ Index(((P1 *)this)->id, 5) ]));
#endif
		;
		/* merge: .(goto)(29, 17, 29) */
		reached[1][17] = 1;
		;
		/* merge: printf('Man %d waits for lifitng\\n',id)(29, 18, 29) */
		reached[1][18] = 1;
		Printf("Man %d waits for lifitng\n", ((P1 *)this)->id);
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 41: // STATE 18 - model.pml:59 - [printf('Man %d waits for lifitng\\n',id)] (0:29:0 - 4)
		IfNotBlocked
		reached[1][18] = 1;
		Printf("Man %d waits for lifitng\n", ((P1 *)this)->id);
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 42: // STATE 19 - model.pml:60 - [((men[id]==LIFT))] (29:0:1 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		if (!((((int)now.men[ Index(((P1 *)this)->id, 5) ])==2)))
			continue;
		/* merge: printf('Man %d lifts',id)(29, 20, 29) */
		reached[1][20] = 1;
		Printf("Man %d lifts", ((P1 *)this)->id);
		/* merge: men[id] = SLOPE(29, 21, 29) */
		reached[1][21] = 1;
		(trpt+1)->bup.oval = ((int)now.men[ Index(((P1 *)this)->id, 5) ]);
		now.men[ Index(((P1 *)this)->id, 5) ] = 1;
#ifdef VAR_RANGES
		logval("men[queueAction:id]", ((int)now.men[ Index(((P1 *)this)->id, 5) ]));
#endif
		;
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 43: // STATE 22 - model.pml:63 - [((men[id]==SLOPE))] (29:0:0 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		if (!((((int)now.men[ Index(((P1 *)this)->id, 5) ])==1)))
			continue;
		/* merge: printf('Man %d slopes',id)(29, 23, 29) */
		reached[1][23] = 1;
		Printf("Man %d slopes", ((P1 *)this)->id);
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 44: // STATE 25 - model.pml:66 - [printf('Some error')] (0:29:0 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		Printf("Some error");
		/* merge: .(goto)(29, 27, 29) */
		reached[1][27] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 45: // STATE 29 - model.pml:69 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][29] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC decksAction */
	case 46: // STATE 1 - model.pml:20 - [((decks[id]==FREE))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.decks[ Index(((P0 *)this)->id, 2) ])==7)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 47: // STATE 2 - model.pml:22 - [((len(mans_queue)>0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((q_len(now.mans_queue)>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 3 - model.pml:23 - [mans_queue?man_id] (7:0:2 - 1)
		reached[0][3] = 1;
		if (q_len(now.mans_queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->man_id;
		;
		((P0 *)this)->man_id = qrecv(now.mans_queue, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("decksAction:man_id", ((P0 *)this)->man_id);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.mans_queue);
		sprintf(simtmp, "%d", ((P0 *)this)->man_id); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: decks[id] = BUSY(0, 4, 7) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.decks[ Index(((P0 *)this)->id, 2) ]);
		now.decks[ Index(((P0 *)this)->id, 2) ] = 6;
#ifdef VAR_RANGES
		logval("decks[decksAction:id]", ((int)now.decks[ Index(((P0 *)this)->id, 2) ]));
#endif
		;
		_m = 4; goto P999; /* 1 */
	case 49: // STATE 5 - model.pml:26 - [((men[man_id]==WAIT_P))] (23:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)now.men[ Index(((P0 *)this)->man_id, 5) ])==5)))
			continue;
		/* merge: men[man_id] = PAY(23, 6, 23) */
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.men[ Index(((P0 *)this)->man_id, 5) ]);
		now.men[ Index(((P0 *)this)->man_id, 5) ] = 4;
#ifdef VAR_RANGES
		logval("men[decksAction:man_id]", ((int)now.men[ Index(((P0 *)this)->man_id, 5) ]));
#endif
		;
		/* merge: .(goto)(23, 8, 23) */
		reached[0][8] = 1;
		;
		/* merge: .(goto)(23, 12, 23) */
		reached[0][12] = 1;
		;
		/* merge: .(goto)(23, 21, 23) */
		reached[0][21] = 1;
		;
		/* merge: .(goto)(0, 24, 23) */
		reached[0][24] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 50: // STATE 12 - model.pml:30 - [.(goto)] (0:23:0 - 3)
		IfNotBlocked
		reached[0][12] = 1;
		;
		/* merge: .(goto)(23, 21, 23) */
		reached[0][21] = 1;
		;
		/* merge: .(goto)(0, 24, 23) */
		reached[0][24] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 51: // STATE 10 - model.pml:28 - [(1)] (23:0:0 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(23, 12, 23) */
		reached[0][12] = 1;
		;
		/* merge: .(goto)(23, 21, 23) */
		reached[0][21] = 1;
		;
		/* merge: .(goto)(0, 24, 23) */
		reached[0][24] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 52: // STATE 13 - model.pml:30 - [((decks[id]==BUSY))] (16:0:2 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((int)now.decks[ Index(((P0 *)this)->id, 2) ])==6)))
			continue;
		/* merge: decks[id] = FREE(16, 14, 16) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.decks[ Index(((P0 *)this)->id, 2) ]);
		now.decks[ Index(((P0 *)this)->id, 2) ] = 7;
#ifdef VAR_RANGES
		logval("decks[decksAction:id]", ((int)now.decks[ Index(((P0 *)this)->id, 2) ]));
#endif
		;
		/* merge: men[man_id] = WAIT_L(16, 15, 16) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.men[ Index(((P0 *)this)->man_id, 5) ]);
		now.men[ Index(((P0 *)this)->man_id, 5) ] = 3;
#ifdef VAR_RANGES
		logval("men[decksAction:man_id]", ((int)now.men[ Index(((P0 *)this)->man_id, 5) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 53: // STATE 16 - model.pml:33 - [mans_queue!man_id] (0:0:0 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (q_full(now.mans_queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.mans_queue);
		sprintf(simtmp, "%d", ((P0 *)this)->man_id); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.mans_queue, 0, ((P0 *)this)->man_id, 1);
		_m = 2; goto P999; /* 0 */
	case 54: // STATE 18 - model.pml:35 - [printf('Some error\\n')] (0:25:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		Printf("Some error\n");
		/* merge: goto :b0(25, 19, 25) */
		reached[0][19] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 55: // STATE 26 - model.pml:40 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

