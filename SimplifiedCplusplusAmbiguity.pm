########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'SimplifiedCplusplusAmbiguity.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package SimplifiedCplusplusAmbiguity;
use strict;

push @SimplifiedCplusplusAmbiguity::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\(|\+|\;|\)|\=)}gc and return ($1, $1);

      /\G(ID)/gc and return ($1, $1);
      /\G(NUM)/gc and return ($1, $1);
      /\G(INT)/gc and return ($1, $1);


      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      /\G\s*(\S+)/;
      my $near = substr($1,0,10); 

      return($near, $near);

     # die( "Error inside the lexical analyzer near '". $near
     #     ."'. Line: ".$self->line()
     #     .". File: '".$self->YYFilename()."'. No match found.\n");
    }
  }
;


#line 63 ./SimplifiedCplusplusAmbiguity.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@SimplifiedCplusplusAmbiguity::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'prog', '$end' ], 0 ],
  [ 'prog_1' => 'prog', [  ], 0 ],
  [ 'prog_2' => 'prog', [ 'prog', 'stmt' ], 0 ],
  [ 'stmt_3' => 'stmt', [ 'expr', ';' ], 0 ],
  [ 'stmt_4' => 'stmt', [ 'decl' ], 0 ],
  [ 'expr_5' => 'expr', [ 'ID' ], 0 ],
  [ 'expr_6' => 'expr', [ 'NUM' ], 0 ],
  [ 'expr_7' => 'expr', [ 'INT', '(', 'expr', ')' ], 0 ],
  [ 'expr_8' => 'expr', [ 'expr', '+', 'expr' ], 0 ],
  [ 'expr_9' => 'expr', [ 'expr', '=', 'expr' ], 0 ],
  [ 'decl_10' => 'decl', [ 'INT', 'declarator', ';' ], 0 ],
  [ 'decl_11' => 'decl', [ 'INT', 'declarator', '=', 'expr', ';' ], 0 ],
  [ 'declarator_12' => 'declarator', [ 'ID' ], 0 ],
  [ 'declarator_13' => 'declarator', [ '(', 'declarator', ')' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'prog_1' => 1,
  'prog_2' => 2,
  'stmt_3' => 3,
  'stmt_4' => 4,
  'expr_5' => 5,
  'expr_6' => 6,
  'expr_7' => 7,
  'expr_8' => 8,
  'expr_9' => 9,
  'decl_10' => 10,
  'decl_11' => 11,
  'declarator_12' => 12,
  'declarator_13' => 13,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	'+' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	'=' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	INT => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'SimplifiedCplusplusAmbiguity.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -1,
		GOTOS => {
			'prog' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 5,
			'ID' => 3,
			'NUM' => 2,
			'INT' => 8
		},
		GOTOS => {
			'stmt' => 4,
			'expr' => 7,
			'decl' => 6
		}
	},
	{#State 2
		DEFAULT => -6
	},
	{#State 3
		DEFAULT => -5
	},
	{#State 4
		DEFAULT => -2
	},
	{#State 5
		DEFAULT => 0
	},
	{#State 6
		DEFAULT => -4
	},
	{#State 7
		ACTIONS => {
			";" => 10,
			"+" => 9,
			"=" => 11
		}
	},
	{#State 8
		ACTIONS => {
			'ID' => 12,
			"(" => 13
		},
		GOTOS => {
			'declarator' => 14
		}
	},
	{#State 9
		ACTIONS => {
			'ID' => 3,
			'NUM' => 2,
			'INT' => 16
		},
		GOTOS => {
			'expr' => 15
		}
	},
	{#State 10
		DEFAULT => -3
	},
	{#State 11
		ACTIONS => {
			'ID' => 3,
			'NUM' => 2,
			'INT' => 16
		},
		GOTOS => {
			'expr' => 17
		}
	},
	{#State 12
		DEFAULT => -12
	},
	{#State 13
		ACTIONS => {
			'ID' => 18,
			'NUM' => 2,
			"(" => 19,
			'INT' => 16
		},
		GOTOS => {
			'expr' => 20,
			'declarator' => 21
		}
	},
	{#State 14
		ACTIONS => {
			";" => 22,
			"=" => 23
		}
	},
	{#State 15
		ACTIONS => {
			";" => -8,
			"+" => -8,
			")" => -8,
			"=" => -8
		}
	},
	{#State 16
		ACTIONS => {
			"(" => 24
		}
	},
	{#State 17
		ACTIONS => {
			";" => -9,
			"+" => 9,
			")" => -9,
			"=" => 11
		}
	},
	{#State 18
		ACTIONS => {
			"+" => -5,
			")" => -5,
			"=" => -5
		}
	},
	{#State 19
		ACTIONS => {
			'ID' => 12,
			"(" => 19
		},
		GOTOS => {
			'declarator' => 21
		}
	},
	{#State 20
		ACTIONS => {
			"+" => 9,
			")" => 25,
			"=" => 11
		}
	},
	{#State 21
		ACTIONS => {
			")" => 26
		}
	},
	{#State 22
		DEFAULT => -10
	},
	{#State 23
		ACTIONS => {
			'ID' => 3,
			'NUM' => 2,
			'INT' => 16
		},
		GOTOS => {
			'expr' => 27
		}
	},
	{#State 24
		ACTIONS => {
			'ID' => 3,
			'NUM' => 2,
			'INT' => 16
		},
		GOTOS => {
			'expr' => 20
		}
	},
	{#State 25
		DEFAULT => -7
	},
	{#State 26
		DEFAULT => -13
	},
	{#State 27
		ACTIONS => {
			";" => 28,
			"+" => 9,
			"=" => 11
		}
	},
	{#State 28
		DEFAULT => -11
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 312 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule prog_1
		 'prog', 0, undef
#line 316 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule prog_2
		 'prog', 2, undef
#line 320 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule stmt_3
		 'stmt', 2, undef
#line 324 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule stmt_4
		 'stmt', 1, undef
#line 328 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule expr_5
		 'expr', 1, undef
#line 332 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule expr_6
		 'expr', 1, undef
#line 336 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule expr_7
		 'expr', 4, undef
#line 340 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule expr_8
		 'expr', 3, undef
#line 344 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule expr_9
		 'expr', 3, undef
#line 348 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule decl_10
		 'decl', 3, undef
#line 352 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule decl_11
		 'decl', 5, undef
#line 356 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule declarator_12
		 'declarator', 1, undef
#line 360 ./SimplifiedCplusplusAmbiguity.pm
	],
	[#Rule declarator_13
		 'declarator', 3, undef
#line 364 ./SimplifiedCplusplusAmbiguity.pm
	]
],
#line 367 ./SimplifiedCplusplusAmbiguity.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    yystateconflict => {  },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'prog_1', 
         'prog_2', 
         'stmt_3', 
         'stmt_4', 
         'expr_5', 
         'expr_6', 
         'expr_7', 
         'expr_8', 
         'expr_9', 
         'decl_10', 
         'decl_11', 
         'declarator_12', 
         'declarator_13', );
  $self;
}

#line 36 "SimplifiedCplusplusAmbiguity.eyp"


=head1  C++ Ambiguities

This grammar models a problematic part of the C++ grammar — the ambiguity between certain
declarations and statements. For example,

     int (x) = y+z;

parses as either an expr or a stmt.


=head1 SEE ALSO

=over 2

=item * L<http://www.gnu.org/software/bison/manual/html_mono/bison.html#GLR-Parsers>

=item * L<http://en.wikipedia.org/wiki/Significantly_Prettier_and_Easier_C%2B%2B_Syntax>

=item * L<http://www.csse.monash.edu.au/~damian/papers/PS/ModestProposal.ps> 

=item * L<http://www.nobugs.org/developer/parsingcpp/>

=item * Edward Willink's "Meta-Compilation for C++" PhD thesis at L<http://www.computing.surrey.ac.uk/Research/CSRG/fog/FogThesis.pdf>

=back

=cut



#line 431 ./SimplifiedCplusplusAmbiguity.pm



1;
