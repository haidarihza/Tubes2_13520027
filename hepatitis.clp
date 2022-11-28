;Ask for HBsAg
(defrule ask-hbsag
=>
    (printout t "HBsAg [positive/negative]? ")
    (assert (hbsag (read)))
)

;Ask for Anti-HDV if HBsAg is positive
(defrule ask-anti-hdv
    (hbsag positive)
=>
    (printout t "Anti-HDV [positive/negative]? ")
    (assert (anti-hdv (read)))
)

;Give predict if anti-hdv is positive
(defrule predict-1
    (anti-hdv positive)
=>
    (printout t "Hasil Prediksi: Hepatitis B+D" crlf)
)

;Ask for Anti-HBc if ant-hdv is negative
(defrule ask-anti-hbc-1
    (anti-hdv negative)
=>
    (printout t "Anti-HBc [positive/negative]? ")
    (assert (anti-hbc (read)))
)

;Give predict if anti-hbc is negative
(defrule predict-2
    (and (anti-hbc negative)
         (hbsag positive))
=>
    (printout t "Hasil Prediksi: Uncertain Configuration" crlf)
)

;Ask for Anti-HBs if anti-hbc is positive
(defrule ask-anti-hbs-1
    (and (anti-hbc positive)
         (hbsag positive))
=>
    (printout t "Anti-HBs [positive/negative]? ")
    (assert (anti-hbs (read)))
)

;Give predict if anti-hbs is positive
(defrule predict-3
    (and (anti-hbs positive)
         (hbsag positive))
=>
    (printout t "Hasil Prediksi: Uncertain configuration" crlf)
)

;Ask if anti-hbs is negative
(defrule ask-igm-anti-hbc
    (and (anti-hbs negative)
         (hbsag positive))
=>
    (printout t "IgM anti-HBc [positive/negative]? ")
    (assert (igm-anti-hbc (read)))
)

;Give predict if igm-anti-hbc is positive
(defrule predict-4
    (igm-anti-hbc positive)
=>
    (printout t "Hasil Prediksi: Acute Infection" crlf)
)

;Give predict if igm-anti-hbc is negative
(defrule predict-5
    (igm-anti-hbc negative)
=>
    (printout t "Hasil Prediksi: Chronic Infection" crlf)
)

;Ask if hbsag negative
(defrule ask-anti-hbs-2
    (hbsag negative)
=>
    (printout t "Anti-HBs [positive/negative]? ")
    (assert (anti-hbs (read)))
)

;Ask if anti-hbs positive
(defrule ask-anti-hbc-2
    (and (hbsag negative)
         (anti-hbs positive))
=>
    (printout t "Anti-HBc [positive/negative]? ")
    (assert (anti-hbc (read)))
)

;Give predict if anti-hbc positive
(defrule predict-6
    (and (anti-hbc positive)
         (anti-hbs positive)
         (hbsag negative))
=>
    (printout t "Hasil Prediksi: Cured" crlf)
)

;Give predict if anti-hbc negative
(defrule predict-7
    (and (anti-hbc negative)
         (anti-hbs positive)
         (hbsag negative))
=>
    (printout t "Hasil Prediksi: Vaccinated" crlf)
)

;Ask if anti-hbs negative
(defrule ask-anti-hbc-3
    (and (anti-hbs negative)
         (hbsag negative))
=>
    (printout t "Anti-HBc [positive/negative]? ")
    (assert (anti-hbc (read)))
)

;Give predict if anti-hbc positive
(defrule predict-8
    (and (anti-hbc positive)
         (anti-hbs negative)
         (hbsag negative))
=>
    (printout t "Hasil Prediksi: Unclear (possible resolved)" crlf)
)

;Give predict if anti-hbc negative
(defrule predict-9
    (and (anti-hbc negative)
         (anti-hbs negative)
         (hbsag negative))
=>
    (printout t "Hasil Prediksi: Healthy not vaccinated or suspicious" crlf)
)