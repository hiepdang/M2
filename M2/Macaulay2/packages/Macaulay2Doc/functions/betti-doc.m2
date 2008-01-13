--- status: DRAFT
--- author(s): caviglia, kummini 
--- notes: 

document {
     Key => [betti, Weights],
     Usage => "betti(..., Weights => w)",
     Inputs => {
	  "w" => List => { "a list of integers" }
	  },
     PARA {
	  "The module or chain complex provided should be over a ring whose degree length
	  (see ", TO "degreeLength", ") is the same as the length of the list ", TT "w", ".
	  The dot products of w with the multi-degrees occurring will be used to construct
	  the resulting betti tally (see ", TO "BettiTally", ")."
	  }
     }

document {
     Key => [regularity, Weights],
     Usage => "regularity(..., Weights => w)",
     Inputs => {
	  "w" => List => { "a list of integers" }
	  },
     PARA {
	  "The module or chain complex provided should be over a ring whose degree length
	  (see ", TO "degreeLength", ") is the same as the length of the list ", TT "w", ".
	  The dot products of w with the multi-degrees occurring will be used in
	  the resulting computation."
	  }
     }

document { 
     Key => {betti},
     Headline => "display degrees",
     "The function ", TT "betti", " displays the degrees of generators and
     relations of graded modules and ideals."
     }

document { 
     Key => (betti,GroebnerBasis),
     Headline => "diagram of the degrees of a groebner basis",
     Usage => "betti G",
     Inputs => { "G" => GroebnerBasis },
	Outputs => { { "a diagram showing the degrees of the generators of the
	source and target modules of the matrix of generators of ", TT "G" } },
	"Here is an example:",
     EXAMPLE {
		   "S = ZZ/10007[x,y];",
		   "G = gb ideal(x^3+y^3, x*y^4);",
		   "gens G",
		   "betti G"
	  },
     "For an explanation of the diagram, see ", TO (betti, ChainComplex), ".",
     }
document { 
     Key => (betti,Matrix),
     Headline => "display of the degrees of a map",
     Usage => "betti f",
     Inputs => { "f" => Matrix },
     Outputs => { { "a diagram showing the degrees of the generators of the source and target modules of ", TT "f" } },
     EXAMPLE {
	  "S = ZZ/10007[x,y];",
	  "betti matrix{{x^3,x*y^2},{y*x,y^2}}"
	  },
     "For an explanation of the diagram, see ", TO (betti, ChainComplex), ".",
     Caveat => {"The diagram ignores the degree of the map itself."},
     "For an explanation of the diagram, see ", TO (betti, ChainComplex), ".",
     }
document { 
     Key => {(betti,Module),(betti,CoherentSheaf)},
     Headline => "show the degrees of the generators and relations of a module or a coherent sheaf",
     Usage => "betti M",
     Inputs => { "M" => Module => " graded." },
     Outputs => {{ "a diagram showing the degrees of the generators and the relations in the module ", TT "M" }
	  },
     Consequences => {
	  },     
	"The diagram lists the zeroth and first graded and total Betti numbers of
	the module.",
     EXAMPLE {
		"S = ZZ/10007[x,y];",
		"betti coker matrix{{x^3,x*y^2},{y*x^2,y^3}}",
	  },
	 "Another example:",
     EXAMPLE {
	 "betti coker map(S^{0,-1},,matrix{{x^2,y},{y^3,x^2}})",
	 },
     "For an explanation of the diagram, see ", TO (betti, ChainComplex), ".",
     }

document {
     Key => (betti, ChainComplex),
     Headline => "display of degrees in a chain complex",
     Usage => "betti C",
     Inputs => { "C" => ChainComplex },
     Outputs => { { "a diagram showing the degrees of the generators of the modules in ", TT "C"} },
     "The diagram can be used to determine the degrees of the entries in the matrices
     of the differentials in the chain complex, provided they are homogeneous maps
     of degree 0.",
     PARA{},
     "Here is a sample diagram.",
     EXAMPLE {
	  "R = ZZ/101[a..h]",
      	  "p = genericMatrix(R,a,2,4)",
      	  "q = generators gb p",
      	  "C = resolution cokernel leadTerm q",
      	  "betti C",
	  },
	"Column ", TT "j", " of the top row of the diagram gives the rank of the
	free module ", TT "C_j", ". (Columns are numbered from 0.) The entry in
	column ", TT "j", " in the row labelled ", TT "i", " is the number
	of basis elements of degree ", TT "i+j", " in the free module", TT " C_j",
	". When the chain complex is the resolution of a module the entries are
	the total and the graded Betti numbers of the module.",
     PARA{},
     "If the numbers are needed in a program, then they are accessible, because
     the value returned is ", ofClass BettiTally, ", and the diagram you see
     on the screen is just the way it prints out."
     }

document { 
     Key => {(betti,Ideal),(betti,MonomialIdeal)},
     Headline => "gives the degrees of generators.",
     Usage => "betti I",
     Inputs => { "I" => Ideal },
     Outputs => { { "a diagram showing the degrees of the generators of the modules in ", TT "C" } },
	"The output is the degrees of generators and relations of the quotient of
	the ambient ring by the ideal.", 
     EXAMPLE {
		"S = ZZ/10007[x,y];",
		"I = ideal(x^2,y^3);",
		"betti I",
	},
     "For an explanation of the diagram, see ", TO (betti, ChainComplex), ".",
	}