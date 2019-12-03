(* fn : (int * int * int) * (int * int * int) -> bool *)
						  
fun is_older (date1: int*int*int, date2: int*int*int) =
    if (#1 date1) < (#1 date2)
    then true
    else if (#1 date1) > (#1 date2)
    then false
    else
	if (#2 date1) < (#2 date2)
	then true
	else if (#2 date1) > (#2 date2)
	then false
	else
	    if (#3 date1) < (#3 date2)
	    then true
	    else if (#3 date1) > (#3 date2)
	    then false
	    else false



(* fn : (int * int * int) list * int -> int *)
fun number_in_month (dates_list: (int*int*int) list, month: int) =
    if null dates_list
    then 0
    else
	let val tail = (tl dates_list)
	in
	    if (#2 (hd dates_list)) = month
	    then 1 + number_in_month(tail, month)
	    else number_in_month(tail, month)
	end

	    
			    
(* fn : (int * int * int) list * int list -> int *)
fun number_in_months (dates_list: (int*int*int) list, months: int list) =
    if null months
    then 0
    else
	number_in_month (dates_list, (hd months)) +
	number_in_months (dates_list, (tl months))


(* fn : (int*int*int) list * int -> (int*int*int) list *)
fun dates_in_month (dates_list: (int*int*int) list, month: int) =
    if null dates_list
    then []
    else
	let val tail = (tl dates_list)
	in
	    if (#2 (hd dates_list)) = month
	    then (hd dates_list) :: dates_in_month(tail, month)
	    else dates_in_month(tail, month)
	end


	    
(* fn : (int * int * int) list * int list -> (int * int * int) list *)
fun dates_in_months (dates_list: (int*int*int) list, months: int list) =
    if null months
    then []
    else
	dates_in_month(dates_list, (hd months)) @
	dates_in_months(dates_list, (tl months))

		       

(* fn : string list * int -> string *)
fun get_nth (string_list: string list, n: int) =
    if n = 1
    then (hd string_list)
    else
		get_nth ((tl string_list), (n-1))



(* fn : int * int * int -> string *)
fun date_to_string (date: (int*int*int)) =
    let val months = ["January", "February", "March", "April", "May", "June",
		      "July", "August", "September", "October", "November",
		      "December"]
    in
	get_nth (months, (#2 date)) ^ " "
	^ Int.toString((#3 date)) ^ ", "
	^ Int.toString((#1 date))
    end



(* int * int list -> int *)
fun number_before_reaching_sum (sum: int, integer_list: int list) =
    if sum <= (hd integer_list)
    then 0
    else
	1 + number_before_reaching_sum (sum - (hd integer_list),
					(tl integer_list))



(* fn : int -> int *)
fun what_month (days: int) =
    let val  month_days = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
	1 + number_before_reaching_sum(days, month_days)
    end
	


(* fn : int * int -> int list *)
fun month_range (day1: int, day2: int) =
    if day1 > day2
    then []
    else
	what_month (day1) :: month_range(day1+1, day2)



(* fn : (int * int * int) list -> (int * int * int) option *)
fun oldest (dates_list: (int*int*int) list) =
    if null dates_list
    then NONE
    else
	let fun oldest_nonempty (dates_list: (int*int*int) list) =
		if null (tl dates_list)
		then (hd dates_list)
		else
		    let val tl_ans = oldest_nonempty(tl dates_list)
		    in
			if is_older ((hd dates_list), tl_ans)
			then (hd dates_list)
			else tl_ans
		    end
	in
	    SOME (oldest_nonempty dates_list)
	end



(*

fun number_in_month_challenge (dates_list: (int*int*int) list,
			       month: int list) =
    if null month
    then 0
    else
	let fun 
	in
	    number_in_month (dates_list, (hd remove_duplicates (month))) +
	    number_in_months (dates_list, (tl remove_duplicates (month)))
	end


fun remove_duplicates (months: int list) =
    if null months
    then []
    else
	if (hd months) = remove_duplicates (tl months)
	then (tl months)
	else (hd months) :: remove_duplicates (tl months)

					      
	    *)
