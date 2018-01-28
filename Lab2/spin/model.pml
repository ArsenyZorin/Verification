#define queueAmount 5
#define deckAmount 2
#define patience 10
#define service_time 5
#define time 15

mtype = { WAIT_P, PAY, WAIT_L, LIFT, SLOPE, GONE }; //Queue states
mtype = { FREE, BUSY }; //Deck states

byte men[queueAmount] = WAIT_P;
byte decks[deckAmount] = FREE;

chan mans_queue = [queueAmount] of {int}
int rand_value;
int waiting_time[queueAmount] = -1
int t = 0;

proctype decksAction(int id)
{
	int man_id = 0;
	int internal_time = 1;
	int int_service_time = 1;
	do
	:: (t <= time) ->
		(t == internal_time) -> internal_time = internal_time + 1;
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
				if
				:: (int_service_time < service_time ) -> int_service_time = int_service_time + 1;
				:: (int_service_time == service_time) ->
					(men[man_id] == PAY) ->
						men[man_id] = WAIT_L;
					decks[id] = FREE;
					mans_queue ! man_id;
					int_service_time = 1;
				fi
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
	int internal_time = 1;
	do :: (t <= time) ->
		(t == internal_time) -> internal_time = internal_time + 1;
		atomic {
			if
			:: (men[id] == WAIT_P) -> 
				if
				:: (( t - waiting_time[id]) < patience) -> skip;
				:: ((t - waiting_time[id]) == patience) -> men[id] = GONE;
				fi
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
		:: else -> break;
	od
	
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
	<>[] (decks[0] == FREE && decks[1] == FREE)
}

ltl all_slope{ 
	<>[] (len(mans_queue) == 0)
}

ltl pay_slope{ 
	[]((men[0] == WAIT_P)->(<>(men[0] == SLOPE)))
	&&
	[]((men[1] == WAIT_P)->(<>(men[1] == SLOPE)))
	&&
	[]((men[2] == WAIT_P)->(<>(men[2] == SLOPE)))
	&&
	[]((men[3] == WAIT_P)->(<>(men[3] == SLOPE)))
	&&
	[]((men[4] == WAIT_P)->(<>(men[4] == SLOPE)))
}

ltl slope_fifo{
	[] ((men[0] == SLOPE) implies ((men[1] == LIFT))) &&
	[] ((men[1] == LIFT) implies ((men[2] == WAIT_L))) &&
	[] ((men[2] == WAIT_L) implies ((men[3] == PAY))) &&
	[] ((men[3] == PAY) implies ((men[4] == WAIT_P)))
}

ltl queue_patience {
	[]( !((men[1] == WAIT_P) && ((t - waiting_time[1]) > patience)))
}
