#define queueAmount 5
#define deckAmount 2

mtype = { WAIT_P, PAY, WAIT_L, LIFT, SLOPE }; //Queue states
mtype = { FREE, BUSY }; //Deck states

byte men[queueAmount] = WAIT_P;
byte decks[deckAmount] = FREE;

chan mans_queue = [queueAmount] of {int}
int rand_value;

proctype decksAction(int id)
{
	int man_id = 0;
	do
	::
		atomic {
			if
			:: (decks[id] == FREE) -> 
				if
				:: (len(mans_queue) > 0) ->
					mans_queue ? man_id;
					decks[id] = BUSY;
					if
					:: (men[man_id] == WAIT_P) -> men[man_id] = PAY;
					fi
				:: else -> skip;
				fi
			:: (decks[id] == BUSY) -> 
				decks[id] = FREE;
				if
				:: (men[man_id] == PAY) ->
					men[man_id] = WAIT_L;
				fi
				mans_queue ! man_id;
			else -> 
				printf("Some error 38\n"); 
				printf("Deck with id %d value is %d\n", id, decks[id]);
				break;
			fi
		}
	od
}

proctype queueAction(int id)
{
	atomic {
		if
		:: (men[id] == WAIT_P) -> 
			printf("Man %d waits for paying\n", id);
		:: (men[id] == PAY) -> 
			printf("Man %d pays for lifting\n", id);
		:: (men[id] == WAIT_L) ->
			men[id] = LIFT;
			printf("Man %d waits for lifitng\n", id);
		:: (men[id] == LIFT) ->
			printf("Man %d lifts\n", id);
			men[id] = SLOPE; 
		:: (men[id] == SLOPE) ->
			printf("Man %d slopes\n", id);
		:: else -> 
			printf("Some error 70\n");
		fi
	}
}

proctype new_queue_gen() {
	int man_id = 4;
	do
	::
		atomic {
			do
			:: rand_value = 1; break;
			od

			if
			::(rand_value == 1) ->
				printf("man_id value in gen: %d\n", man_id);
				if 
				:: (man_id < 0 ) -> skip;
				fi
				men[man_id] = WAIT_P;
				mans_queue ! man_id;
				man_id = man_id - 1;
			:: else -> skip;
			fi
		}
	:: else -> break;
	od
	printf("Gen stops\n");
}

init {
	int i;
	printf("Hello\n");
	atomic {
		run new_queue_gen();
		for(i: 0 .. (queueAmount - 1)){
			run queueAction(i);
		}
		for(i: 0 .. (deckAmount - 1)){
			run decksAction(i);
		}
	}
}

ltl free_decks{
	[]<> (decks[0] == FREE && decks[1] == FREE)
}

ltl all_slope{ 
	[]<> (len(mans_queue) == 0)
}

ltl pay_slope{ 
	[]((men[0] == PAY)->(<>(men[0] == SLOPE)))
	&&
	[]((men[1] == PAY)->(<>(men[1] == SLOPE)))
	&&
	[]((men[2] == PAY)->(<>(men[2] == SLOPE)))
	&&
	[]((men[3] == PAY)->(<>(men[3] == SLOPE)))
	&&
	[]((men[4] == PAY)->(<>(men[4] == SLOPE)))
}

