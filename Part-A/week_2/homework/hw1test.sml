(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1solution.sml";

val is_older1 = is_older ((1,2,3),(2,3,4)) = true
val is_older2 = is_older ((1,2,3),(1,2,3)) = false
val is_older3 = is_older ((1,2,3),(4,2,3)) = true
val is_older4 = is_older ((2,5,3),(2,8,1)) = true
val is_older5 = is_older ((10,30,9),(6,5,2)) = false
val is_older6 = is_older ((2,3,3),(2,3,4)) = true
val is_older7 = is_older ((10,10,10),(9,9,9)) = false


val number_in_month1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val number_in_month2 = number_in_month ([(2012,5,28),(2013,12,1)],2) = 0
val number_in_month3 = number_in_month ([(2012,2,28),(2013,2,1)],2) = 2
val number_in_month4 = number_in_month ([(2012,2,28),(2013,12,1), (2015,2,30)],2) = 2


val number_in_months1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val number_in_months2 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,6,7]) = 0
val number_in_months3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,12]) = 4
val number_in_months4 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28),(2018,3,6)],[2,3,4]) = 4
val number_in_months5 = number_in_months ([(2012,2,28),(2002,8,31),(2002,2,30)],[2]) = 2
val number_in_months6 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val number_in_months7 = number_in_months ([],[2,3,4]) = 0
val number_in_months8 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28),(2002,2,5),(200,3,5),(2000,4,5)],[2,3,4]) = 6


val dates_in_month1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val dates_in_month2 = dates_in_month ([(2012,2,28),(2013,12,1)],5) = []
val dates_in_month3 = dates_in_month ([(2012,2,28),(2013,12,1),(2015,2,30)],2) = [(2012,2,28),(2015,2,30)]
val dates_in_month4 = dates_in_month ([(2012,5,28),(2013,12,1),(2015,2,30),(2014,8,2),(2002,2,1)],2) = [(2015,2,30),(2002,2,1)]


val dates_in_months1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val dates_in_months2 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,6,7]) = []
val dates_in_months3 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,12]) = [(2012,2,28),(2011,3,31),(2011,4,28),(2013,12,1)]
val dates_in_months4 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28),(2018,3,6)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2018,3,6),(2011,4,28)]
val dates_in_months5 = dates_in_months ([(2012,2,28),(2002,8,31),(2002,2,30)],[2]) = [(2012,2,28),(2002,2,30)]
val dates_in_months6 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val dates_in_months7 = dates_in_months ([],[2,3,4]) = []


val get_nth1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val get_nth2 = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"
val get_nth3 = get_nth (["hi", "there", "how", "are", "you"], 1) = "hi"


val date_to_string1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val date_to_string2 = date_to_string (2018, 1, 23) = "January 23, 2018"
val date_to_string3 = date_to_string (1999, 12, 17) = "December 17, 1999"


val number_before_reaching_sum1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val number_before_reaching_sum2 = number_before_reaching_sum (11, [1,2,3,4,5]) = 4
val number_before_reaching_sum3 = number_before_reaching_sum (2, [1,2,3,4,5]) = 1
val number_before_reaching_sum4 = number_before_reaching_sum (35, [1,5,7,8,12,15]) = 5
val number_before_reaching_sum5 = number_before_reaching_sum (30, [1,5,7,8,12]) = 4
val number_before_reaching_sum6 = number_before_reaching_sum (1, [1,2,3,4,5]) = 0
val number_before_reaching_sum7 = number_before_reaching_sum (15, [1,2,3,4,5]) = 4
val number_before_reaching_sum8 = number_before_reaching_sum (0, [1,2,3,4,5]) = 0


val what_month1 = what_month 70 = 3
val what_month2 = what_month 59 = 2
val what_month3 = what_month 90 = 3
val what_month4 = what_month 300 = 10
val what_month5 = what_month 75 = 3
val what_month6 = what_month 163 = 6


val month_range1 = month_range (31, 34) = [1,2,2,2]
val month_range2 = month_range (38, 34) = []
val month_range3 = month_range (15, 35) = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2]
val month_range4 = month_range (32, 32) = [2]
val month_range5 = month_range (31, 32) = [1,2]


val oldest1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val oldest2 = oldest([]) = NONE
val oldest3 = oldest([(2012,2,28)]) = SOME (2012,2,28)
val oldest4 = oldest([(2012,2,28),(2011,3,31),(2011,4,28),(2010,5,17)]) = SOME (2010,5,17)
val oldest5 = oldest([(2012,2,28),(2011,3,31),(2011,4,28),(2011,3,29)]) = SOME (2011,3,29)