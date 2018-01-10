	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM pay_slope */
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 13: // STATE 41
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM all_slope */
;
		
	case 14: // STATE 1
		goto R999;

	case 15: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 16: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 17: // STATE 2
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 19: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 20: // STATE 5
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 11
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 23: // STATE 13
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 24: // STATE 14
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 21
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC new_queue_gen */

	case 26: // STATE 1
		;
		now.rand_value = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 7
		;
		now.men[ Index(((P2 *)this)->man_id, 5) ] = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 9
		;
		((P2 *)this)->man_id = trpt->bup.oval;
		_m = unsend(now.mans_queue);
		;
		goto R999;
;
		
	case 29: // STATE 13
		goto R999;
;
		
	case 30: // STATE 11
		goto R999;
;
		
	case 31: // STATE 20
		goto R999;

	case 32: // STATE 21
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC queueAction */
;
		
	case 33: // STATE 1
		goto R999;
;
		
	case 34: // STATE 27
		goto R999;
;
		
	case 35: // STATE 3
		goto R999;
;
		;
		
	case 37: // STATE 7
		;
		now.men[ Index(((P1 *)this)->id, 5) ] = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 11
		;
		now.men[ Index(((P1 *)this)->id, 5) ] = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 13
		;
		now.men[ Index(((P1 *)this)->id, 5) ] = trpt->bup.oval;
		;
		goto R999;

	case 40: // STATE 15
		;
		now.men[ Index(((P1 *)this)->id, 5) ] = trpt->bup.oval;
		;
		goto R999;
;
		
	case 41: // STATE 18
		goto R999;

	case 42: // STATE 21
		;
		now.men[ Index(((P1 *)this)->id, 5) ] = trpt->bup.oval;
		;
		goto R999;
;
		
	case 43: // STATE 22
		goto R999;
;
		
	case 44: // STATE 25
		goto R999;

	case 45: // STATE 29
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC decksAction */
;
		;
		;
		;
		
	case 48: // STATE 4
		;
		now.decks[ Index(((P0 *)this)->id, 2) ] = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.mans_queue, XX-1, 0, ((P0 *)this)->man_id, 1);
		((P0 *)this)->man_id = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 49: // STATE 6
		;
		now.men[ Index(((P0 *)this)->man_id, 5) ] = trpt->bup.oval;
		;
		goto R999;
;
		
	case 50: // STATE 12
		goto R999;
;
		
	case 51: // STATE 10
		goto R999;

	case 52: // STATE 15
		;
		now.men[ Index(((P0 *)this)->man_id, 5) ] = trpt->bup.ovals[1];
		now.decks[ Index(((P0 *)this)->id, 2) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 53: // STATE 16
		;
		_m = unsend(now.mans_queue);
		;
		goto R999;
;
		
	case 54: // STATE 18
		goto R999;

	case 55: // STATE 26
		;
		p_restor(II);
		;
		;
		goto R999;
	}

