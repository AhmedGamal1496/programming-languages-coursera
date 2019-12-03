(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* (a) *)
fun all_except_option (string, string_list) =
    case string_list of
	[] => NONE
     |  s::tail => if same_string (string, s)
		   then SOME tail
		   else
		       case all_except_option (string, tail) of
			   NONE => NONE
			|  SOME tail => SOME (s::tail)


(* (b) *)
fun get_substitutions1 (string_list_list, string) =
    case string_list_list of
	[] => []
      | lst::tails =>  case all_except_option (string, lst) of
			   NONE => get_substitutions1(tails, string)
			  | SOME value => value@get_substitutions1(tails, string)


(* (c) *)
fun get_substitutions2 (string_list_list, string) =
    let fun f (list, acc) =
	      case list of
		  [] => acc
		| lst::tails =>  case all_except_option (string, lst) of
				     NONE => f(tails, acc)
				   | SOME value => f (tails, acc@value)
    in
	f (string_list_list, [])
    end


(* (d) *)
fun similar_names (string_list_list, full_name) =
    let val {first=f, middle=m, last=l} = full_name
	val names = get_substitutions2 (string_list_list, f)
	
    in
	let fun similar (diff_names,acc) =
		case diff_names of
		    [] => [{first=acc, last=l, middle=m}]
		  | s::tail => {first=acc, last=l, middle=m}::similar(tail,s)
	in
	    similar(names,f)
	end
    end
	
    

    
	    
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
	      
(* (a) *)
fun card_color (given_card) =
    case given_card of
	(Clubs,_) => Black
       |(Diamonds,_) => Red 
       |(Hearts,_) => Red
       |(Spades,_) => Black


(* (b) *)
fun card_value (given_card) =
    case given_card of
	(_,Num i) => i
      | (_,Ace) => 11
      | _ => 10


(* (c) *)
fun remove_card (cards, card, e) =
    case cards of
	[] => raise e
      | c::tail => if card = c
		   then tail
		   else c::remove_card (tail, card, e)


(* (d) *)
fun all_same_color (cards) =
    case cards of
	[] => true
      | _::[] => true 
      | head::(neck::tail) => (card_color(head) = card_color(neck) andalso
			       all_same_color (neck::tail))


(* (e) *)
fun sum_cards (cards) =
    let fun sum (cards, acc) =
	    case cards of
		[] => acc
	      | c::tail =>  sum(tail, card_value(c)+acc)
    in
	sum (cards, 0)
    end


(* (d) *)
fun score (held_cards, goal) =
    let val sum = sum_cards (held_cards)
	val same_color = all_same_color (held_cards)
    in
	if sum > goal
	then if same_color
	     then (3*(sum-goal)) div 2
	     else 3*(sum-goal)
	else
	    if same_color
	    then (goal-sum) div 2
	    else goal-sum
    end    



(* (g) *)
fun officiate (card_list,move_list,goal) =
    let fun play (card_list, move_list, acc) =
	    case (card_list,move_list) of
		([],_) => score (acc,goal)
	      | (_,[]) => score(acc,goal) 
	      | (c::card_tail,m::move_tail)
		=> case m of
		       Draw => if sum_cards (c::acc) > goal
			       then score (c::acc,goal)
			       else  play (card_tail,
					   move_tail,
					   c::acc)
		     | Discard (x,y) => play(c::card_tail,
					     move_tail,
					     remove_card(acc,(x,y),IllegalMove))
					     
    in play (card_list, move_list, [])
    end
