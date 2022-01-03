(deffacts pomocne_fakty
	(menu)
)

(defrule ukaz_menu
	?prec<-(menu)
=>
	(retract ?prec)
	(printout t "-----------<MENU>------------------------" crlf)
	(printout t "Zistit vas stav....................... S" crlf)	
	(printout t "Ukoncit program....................... E" crlf)
	(printout t "-----------------------------------------" crlf)
	(printout t "Pre pokracovanie stlacte prislusnu klavesu: ")
	(assert (my_choice (read)))
)

(defrule zistit_stav
	(my_choice S)
=>
	(printout t "Zadajte vas vek:" crlf)
	(bind ?a (read))
	(assert (my_age ?a))

	(printout t "Zadajte pohlavie (muz=0 ,zena=1)" crlf)
	(bind ?a (read))
	(assert (my_sex_f ?a))

    (if(= ?a 1)
         then
         (assert (my_sex_m 0))
         else
         (assert (my_sex_m 1)))

    (printout t "Zadajte vas maximalny srdcovy tep:" crlf)
	(bind ?a (read))
	(assert (my_max_hr ?a))

	(printout t "Zadajte vas cholesterol:" crlf)
	(bind ?a (read))
	(assert (my_cholesterol ?a))

    (printout t "Mali ste anginu po cviceni? (ano=1, nie=0):" crlf)
	(bind ?a (read))
	(assert (my_angina ?a))

	(printout t "--------------------------" crlf)
	(printout t "" crlf)
)

(defrule rule1
	(my_angina ?a)
	(my_max_hr ?b)
	(my_sex_f ?c)
	(test(<= ?a 0.5))
	(test(<= ?b 130.5))
	(test(<= ?c 0.5))
=>
	(printout t "Pravdepodobne nemate srdcove problemy." crlf)
)

(defrule rule2
	(my_angina ?a)
	(my_max_hr ?b)
	(my_sex_f ?c)
	(test(<= ?a 0.5))
	(test(<= ?b 150.5))
	(test(<= ?c 0.5))
    (test(> ?b 130.5))
=>
	(printout t "Pravdepodobne nemate srdcove problemy." crlf)
)

(defrule rule3
	(my_angina ?a)
	(my_max_hr ?b)
	(my_sex_f ?c)
    (my_age ?d)
	(test(<= ?a 0.5))
	(test(<= ?b 150.5))
	(test(> ?c 0.5))
    (test(<= ?d 69.0))
=>
	(printout t "Pravdepodobne nemate srdcove problemy." crlf)
)

(defrule rule4
	(my_angina ?a)
	(my_max_hr ?b)
	(my_sex_f ?c)
    (my_age ?d)
	(test(<= ?a 0.5))
	(test(<= ?b 150.5))
	(test(> ?c 0.5))
    (test(> ?d 69.0))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule5
	(my_angina ?a)
	(my_max_hr ?b)
	(my_age ?c)
    (my_sex_f ?d)
	(test(<= ?a 0.5))
	(test(> ?b 150.5))
	(test(<= ?c 59.5))
    (test(<= ?d 0.5))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule6
	(my_angina ?a)
	(my_max_hr ?b)
	(my_age ?c)
    (my_sex_f ?d)
	(test(<= ?a 0.5))
	(test(> ?b 150.5))
	(test(<= ?c 59.5))
    (test(> ?d 0.5))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule7
	(my_angina ?a)
	(my_max_hr ?b)
	(my_age ?c)
	(test(<= ?a 0.5))
	(test(> ?b 150.5))
	(test(> ?c 59.5))
    (test(<= ?b 155.5))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule8
	(my_angina ?a)
	(my_max_hr ?b)
	(my_age ?c)
	(test(<= ?a 0.5))
	(test(> ?b 150.5))
	(test(> ?c 59.5))
    (test(> ?b 155.5))
=>
	(printout t "Pravdepodobne nemate srdcove problemy." crlf)
)

(defrule rule9
	(my_angina ?a)
	(my_cholesterol ?b)
	(my_age ?c)
	(test(> ?a 0.5))
	(test(<= ?b 124.5))
	(test(<= ?c 61.5))
    (test(<= ?b 42.5))
=>
	(printout t "Pravdepodobne nemate srdcove problemy." crlf)
)

(defrule rule10
	(my_angina ?a)
	(my_cholesterol ?b)
	(my_age ?c)
	(test(> ?a 0.5))
	(test(<= ?b 124.5))
	(test(<= ?c 61.5))
    (test(> ?b 42.5))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule11
	(my_angina ?a)
	(my_cholesterol ?b)
	(my_age ?c)
    (my_max_hr ?d)
	(test(> ?a 0.5))
	(test(<= ?b 124.5))
	(test(> ?c 61.5))
    (test(<= ?d 157.0))
=>
	(printout t "Pravdepodobne nemate srdcove problemy." crlf)
)

(defrule rule12
	(my_angina ?a)
	(my_cholesterol ?b)
	(my_age ?c)
    (my_max_hr ?d)
	(test(> ?a 0.5))
	(test(<= ?b 124.5))
	(test(> ?c 61.5))
    (test(> ?d 157.0))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule13
	(my_angina ?a)
	(my_cholesterol ?b)
	(my_age ?c)
    (my_sex_m ?d)
	(test(> ?a 0.5))
	(test(> ?b 124.5))
	(test(<= ?c 56.5))
    (test(<= ?d 0.5))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule14
	(my_angina ?a)
	(my_cholesterol ?b)
	(my_age ?c)
    (my_sex_m ?d)
	(test(> ?a 0.5))
	(test(> ?b 124.5))
	(test(<= ?c 56.5))
    (test(> ?d 0.5))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule15
	(my_angina ?a)
	(my_cholesterol ?b)
	(my_age ?c)
    (my_sex_m ?d)
	(test(> ?a 0.5))
	(test(> ?b 124.5))
	(test(> ?c 56.5))
    (test(<= ?d 0.5))
=>
	(printout t "Pravdepodobne mate srdcove problemy." crlf)
)

(defrule rule16
	(my_angina ?a)
	(my_cholesterol ?b)
	(my_age ?c)
    (my_sex_m ?d)
	(test(> ?a 0.5))
	(test(> ?b 124.5))
	(test(> ?c 56.5))
    (test(> ?d 0.5))
=>
	(printout t "Pravdepodobne nemate srdcove problemy." crlf)
)

(defrule delete
	(declare (salience -20))
	?prec1 <- (my_choice ?a)
	?prec2 <- (my_max_hr ?b)
	?prec3 <- (my_sex_f ?c)
	?prec4 <- (my_sex_m ?d)
	?prec5 <- (my_cholesterol ?e)
	?prec6 <- (my_angina ?f)
	?prec7 <- (my_age ?g)
=>
	(retract ?prec1 ?prec2 ?prec3 ?prec4 ?prec5 ?prec6 ?prec7)
	(assert(menu))
)

(defrule end
	(moja_choice E)
	?prec10 <- (moja_choice ?x)
=>
	(retract ?prec10)
	(printout t "Program ukonceny" crlf)
)