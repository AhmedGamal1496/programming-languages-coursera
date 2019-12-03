(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw3solution.sml";

val only_capitals1 = only_capitals ["A","B","C"] = ["A","B","C"]
val only_capitals2 = only_capitals ["Ahmed","bebo","Chady"] = ["Ahmed","Chady"]
val only_capitals3 = only_capitals [] = []
val only_capitals4 = only_capitals ["ahmed","baba","ceso"] = []


val longest_string11 = longest_string1 ["A","bc","C"] = "bc"
val longest_string12 = longest_string1 [] = ""
val longest_string13 = longest_string1 ["Ahmed","bc","C"] = "Ahmed"
val longest_string14 = longest_string1 ["A","bc","Cocooo"] = "Cocooo"
val longest_string15 = longest_string1 ["A","bc","hi"] = "bc"


val longest_string2 = longest_string2 ["A","bc","hi"] = "hi"


val longest_string31 = longest_string3 ["A","bc","C"] = "bc"
val longest_string32 = longest_string3 [] = ""
val longest_string33 = longest_string3 ["Ahmed","bc","C"] = "Ahmed"
val longest_string34 = longest_string3 ["A","bc","Cocooo"] = "Cocooo"
val longest_string35 = longest_string3 ["A","bc","hi"] = "bc"

val longest_string4 = longest_string4 ["A","bc","hi"] = "hi"


val longest_capitalized1 = longest_capitalized ["A","bc","C"] = "A"
val longest_capitalized2 = longest_capitalized ["hamo","bc","beka"] = ""
val longest_capitalized3 = longest_capitalized ["ahmed","bc","Esmail", "Cocooo1"] = "Cocooo1"
val longest_capitalized4 = longest_capitalized ["Hi","Hello","OMGFG"] = "Hello"


val rev_string1 = rev_string "abc" = "cba"


val first_answer1 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val first_answer2 = ((first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3]; false)
																					handle NoAnswer => true)

val all_answers1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val all_answers2 = all_answers (fn x => if x > 3 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val all_answers3 = all_answers (fn x => if x < 7 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val all_answers4 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7]
val all_answers5 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []
val all_answers6 = all_answers (fn x => if x mod 2 = 0 then SOME [x, x + 1] else NONE) [2,4,6,8] = SOME [2,3,4,5,6,7,8,9]
val all_answers7 = all_answers (fn x => if x mod 2 = 0 then SOME [] else NONE) [2,4,6,8] = SOME [] 


val count_wildcards1 = count_wildcards Wildcard = 1
val count_wildcards2 = count_wildcards (Variable "s1") = 0
val count_wildcards3 = count_wildcards (TupleP [Wildcard, UnitP, Wildcard, ConstP 6]) = 2
val count_wildcards4 = count_wildcards (ConstructorP ("Ahmed", TupleP [Wildcard, ConstP 5])) = 1
val count_wildcards5 = count_wildcards (TupleP [Wildcard, UnitP, Wildcard, ConstP 8, ConstructorP ("S", Wildcard)]) = 3


val count_wild_and_variable_lengths1 = count_wild_and_variable_lengths (Variable("a")) = 1
val count_wild_and_variable_lengths2 = count_wild_and_variable_lengths (TupleP [Wildcard, UnitP, Wildcard, ConstP 6, Variable "String"]) = 8
val count_wild_and_variable_lengths3 = count_wild_and_variable_lengths (ConstructorP ("Ahmed", TupleP [Wildcard, Variable "Hi", ConstP 5,
																										ConstructorP ("Ahmed", Variable "Hi")])) = 5
val count_wild_and_variable_lengths4 = count_wild_and_variable_lengths (TupleP [Wildcard, UnitP, Wildcard, ConstP 8, ConstructorP ("S", Wildcard)]) = 3
val count_wild_and_variable_lengths5 = count_wild_and_variable_lengths (TupleP [UnitP, ConstP 6]) = 0
val count_wild_and_variable_lengths6 = count_wild_and_variable_lengths (Variable "s1") = 2


val count_some_var1 = count_some_var ("x", Variable("x")) = 1
val count_some_var2 = count_some_var ("x", TupleP [Variable("x"), ConstP 5, Variable("x")]) = 2
val count_some_var3 = count_some_var ("Ahmed", Variable("x")) = 0
val count_some_var4 = count_some_var ("Ahmed", (ConstructorP ("Ahmed", TupleP [Wildcard, Variable "Hi", ConstP 5,
																										ConstructorP ("Ahmed", Variable "Hi")]))) = 0
val count_some_var5 = count_some_var ("xD", TupleP [Wildcard, UnitP, Wildcard, ConstP 6]) = 0
val count_some_var6 = count_some_var ("Hi", (ConstructorP ("Ahmed", TupleP [Wildcard, Variable "Hi", ConstP 5, Variable "Hi", Variable "Ahmed",
																										ConstructorP ("Ahmed", Variable "Hi")]))) = 3
																										
val check_pat1 = check_pat (Variable("x")) = true
val check_pat2 = check_pat (ConstructorP ("Ahmed", TupleP [Wildcard, Variable "Hi", ConstP 5, ConstructorP ("Ahmed", Variable "Hi")])) = false
val check_pat3 = check_pat (ConstructorP ("Ahmed", TupleP [Wildcard, Variable "Hi", ConstP 5, Variable "Hi2", Variable "Ahmed",
																										ConstructorP ("Ahmed", Variable "Hi3")])) = true 
val check_pat4 = check_pat (ConstructorP ("Ahmed", TupleP [Wildcard, Variable "Hi", ConstP 5, Variable "Hi", Variable "Ahmed",
																										ConstructorP ("Ahmed", Variable "Hi3")])) = false
val check_pat5 = check_pat (ConstructorP ("Ahmed", TupleP [Wildcard, Variable "Hi", ConstP 5, Variable "Hi", Variable "Hi",
																										ConstructorP ("Ahmed", Variable "Hi")])) = false
val check_pat6 = check_pat (ConstructorP ("Ahmed", TupleP [Wildcard, UnitP, Variable "Hi", Variable "Ahmed", ConstructorP ("Ahmed", Variable "Hi3")])) = true
val check_pat7 = check_pat (TupleP [Variable "Ahmed", Variable "Mahmoud", Variable "Dendan"]) = true 
val check_pat8 = check_pat (ConstructorP ("5ra", TupleP [Wildcard, Variable "Hi", ConstP 5, Variable "Hamo", Variable "Ahmed",
																										ConstructorP ("kozbra", Variable "Yala")])) = true 
																										
val test11 = match (Const(1), UnitP) = NONE
val test1101 = match (Const(1), ConstP 1) = SOME []
val test1102 = match (Const(1), Variable "s") = SOME [("s", Const(1))]
val test1103 = match (Const(1), TupleP [Wildcard]) = NONE
val test1104 = match (Const(1), TupleP [ConstP 1]) = NONE
val test1105 = match (Tuple [Unit], TupleP [UnitP]) = SOME []
val test1106 = match (Tuple [Tuple [Unit]], TupleP [TupleP[UnitP]]) = SOME []
val test1107 = match (Tuple [Tuple [Unit]], TupleP [TupleP[UnitP, Variable "x"]]) = NONE
val test1108 = match (Tuple [Const(1), Tuple [Unit]], TupleP [ConstP 1, TupleP[UnitP]]) = SOME []
val test1109 = match (Tuple [Const(1), Tuple [Unit, Const(2)]], TupleP [ConstP 1, TupleP[UnitP, Variable("s")]]) = SOME [("s", Const(2))]
val test1110 = match (Tuple [Const(1), Tuple [Unit, Const(2)]], TupleP [ConstP 2, TupleP[UnitP, Variable("s")]]) = NONE
val test1111 = match (Tuple [Const(1), Tuple [Unit, Const(2)]], TupleP [ConstP 1, TupleP[UnitP, Variable("s"), Wildcard]]) = NONE



val test12 = first_match Unit [UnitP] = SOME []

