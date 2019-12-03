(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

val only_capitals =
    List.filter (fn s => Char.isUpper (String.sub (s, 0)))

val longest_string1 =
    foldl (fn (s,acc) => if String.size s > String.size acc then s else acc) ""

val longest_string2 =
    foldl (fn (s,acc) => if String.size s > String.size acc
			 then s
			 else if String.size s = String.size acc
			 then s
			 else acc)
	  ""

fun longest_string_helper f =
    fn strings => List.foldl (fn (s1, s2) =>
				 if f (String.size(s1), String.size(s2))
				 then s1
				 else s2)
			     ""
			     strings

fun longest_string3 strings =
  longest_string_helper (fn (l1, l2) => l1 > l2) strings

			
fun longest_string4 strings =
    longest_string_helper (fn (l1, l2) => l1 >= l2) strings


val longest_capitalized =
    longest_string3 o only_capitals

val rev_string =
    implode o List.rev o explode

			     
fun first_answer f lst =
    case lst of
	[] => raise NoAnswer
      | l::tail => case f l of
		       NONE => first_answer f tail
		     | SOME l => l 
		
fun all_answers f lst =
    let fun answers (lst, acc) =
	case lst of
	    [] => SOME acc
	  | l::tail => case f l of
			   NONE => NONE
			 | SOME d => answers(tail,acc@d)
    in
	answers (lst, [])
    end


val count_wildcards =
    let val count = 0
    in
	g (fn _ => count+1) (fn x => count)
    end
	

val count_wild_and_variable_lengths =
    let val sum = 0
    in
	g (fn _ => sum+1) (fn x => sum+String.size x)
    end

fun count_some_var (string,pattern) =
    let val app = 0
    in
	g (fn _ => app) (fn x => if x = string then app+1 else app) pattern
    end


fun check_pat pat =
    let fun string_list(pat,acc) =
	    case pat of
		Variable x        => acc@[x]
	      | TupleP ps         => List.foldl
					 (fn (p,i) =>
					     (string_list(p,acc)@i)) [] ps
	      | ConstructorP(_,p) => string_list (p,acc)
	      | _ => acc 
    in
	let fun exists (strings) =
		case strings of
		    [] => false
		  | s::tail => (List.exists (fn x => x=s) tail)
				    orelse exists (tail)
	in
	    not (exists (string_list(pat,[])))
	end
    end


fun match (va, ptn) =
    case (va, ptn) of
	(_, Wildcard) => SOME []
     |  (v, Variable str) => SOME [(str, v)]
     |  (Unit, UnitP) => SOME []
     | (Const v, ConstP i) =>  if v = i then SOME [] else NONE
     | (Tuple vs, TupleP ps) =>  if List.length vs = List.length ps
				 then all_answers match (ListPair.zip(vs, ps))
				 else NONE
     | (Constructor(s', v), ConstructorP(s'', p)) => if s' = s''
						     then match (v, p)
						     else NONE
     | (_ , _) => NONE
		      
		      
fun first_match va ptns = 
    SOME (first_answer (fn x => match(va, x)) ptns)
    handle NoAnswer => NONE
			  
