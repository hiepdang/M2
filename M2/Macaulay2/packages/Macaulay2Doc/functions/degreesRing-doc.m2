--- status: DRAFT
--- author(s): L. Gold
--- notes:  

document { 
     Key => {degreesRing},
     Headline => "the ring of degrees",
     }

document { 
     -- check this node for accuracy
     Key => (degreesRing,ZZ),
     Headline => "the ring of degrees",
     Usage => "degreesRing n",
     Inputs => {
	  "n" => ZZ
	  },
     Outputs => {
	  PolynomialRing => "actually a Laurent polynomial ring"
	  },
     "This function produces a Laurent polynomial ring in n variables",
     TT "T_0, ... , T_{n-1}", " whose monomials are to be used to
     represent degrees in another ring with multi-degrees of length
     n. If n=1, then the variable has no subscript.",
     EXAMPLE {
	  "degreesRing 3", 
	  "T_0"
	  },
    "Notice that the variables in this ring are local variables, but
     the command ", TO "use", " will make the variables globally
     available.",
     EXAMPLE {
	  "use degreesRing 3",
	  "T_0"
	  },
     "Elements of this ring are used as variables for Poincare polynomials generated by ", TO "poincare", " and ", TO "poincareN", " as well as ", 
     TO2(hilbertSeries,  "Hilbertseries"), ".", 
     PARA{},
     "The degrees ring is a Laurent polynomial ring, as can be seen by
     the option in the definition of the ring that says ", 
     TT "Inverses => true", ". The monomial ordering
     used in the degrees ring is ", TT "RevLex", " so the polynomials
     in it will be displayed with the smallest exponents first,
     because such polynomials are often used as Hilbert series.",
     SeeAlso => {"poincare", "poincareN", "hilbertFunction", "hilbertSeries", "hilbertPolynomial", "reduceHilbert" }
     }

undocumented {(degreesRing, QuotientRing), (degreesRing,PolynomialRing)}

document { 
     Key => {(degreesRing,Ring),(degreesRing, Module)},
     Headline => "the ring of degrees",
     Usage => "degreesRing R",
     Inputs => {
	  "R"
	  },
     Outputs => {
	  PolynomialRing => "actually Laurent polynomial ring"
	  },
     "This function produces a Laurent polynomial ring in n
     variables", TT "T_0, ... , T_{n-1}"," whose monomials are the
     degrees of elements of the given ring. If n=1, then the variable
     has no subscript.",
     EXAMPLE {
	  "R =  ZZ [x, y];",
	  "degreesRing R",
	  "S = ZZ[x,y, Degrees=>{{1,1},{1,1}}];",
	  "degreesRing S"
     	  }
     }