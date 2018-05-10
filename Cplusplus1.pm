#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.155.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'Cplusplus1.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Cplusplus1;
use strict;

push @Cplusplus1::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

#line 1 "Cplusplus1.eyp"

our $VERSION = '0.01';
use base q{DebugTail}; 

#line 32 ./Cplusplus1.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Cplusplus1::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.155',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'prog', '$end' ], 1 ],
  [ 'EMPTY' => 'prog', [  ], 1 ],
  [ 'PROG' => 'prog', [ 'prog', 'stmt' ], 1 ],
  [ 'EXP' => 'stmt', [ 'expr', ';' ], 1 ],
  [ 'DECL' => 'stmt', [ 'decl' ], 1 ],
  [ 'ID:EXP' => 'expr', [ 'ID', 'decORexp' ], 1 ],
  [ 'NUM' => 'expr', [ 'NUM' ], 1 ],
  [ 'TYPECAST' => 'expr', [ 'INT', '(', 'expr', ')' ], 1 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 1 ],
  [ 'ASSIGN' => 'expr', [ 'expr', '=', 'expr' ], 1 ],
  [ 'DECLARATOR' => 'decl', [ 'INT', 'declarator', ';' ], 1 ],
  [ 'DECLARATORINIT' => 'decl', [ 'INT', 'declarator', '=', 'expr', ';' ], 1 ],
  [ 'ID:DEC' => 'declarator', [ 'ID', 'decORexp' ], 1 ],
  [ 'declarator_13' => 'declarator', [ '(', 'declarator', ')' ], 1 ],
  [ 'decORexp' => 'decORexp', [  ], 1 ],
],
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
    yyFILENAME  => 'Cplusplus1.eyp',
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
		DEFAULT => -14,
		GOTOS => {
			'decORexp' => 9
		}
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
			";" => 11,
			"+" => 10,
			"=" => 12
		}
	},
	{#State 8
		ACTIONS => {
			'ID' => 13,
			"(" => 14
		},
		GOTOS => {
			'declarator' => 15
		}
	},
	{#State 9
		DEFAULT => -5
	},
	{#State 10
		ACTIONS => {
			'ID' => 3,
			'NUM' => 2,
			'INT' => 17
		},
		GOTOS => {
			'expr' => 16
		}
	},
	{#State 11
		DEFAULT => -3
	},
	{#State 12
		ACTIONS => {
			'ID' => 3,
			'NUM' => 2,
			'INT' => 17
		},
		GOTOS => {
			'expr' => 18
		}
	},
	{#State 13
		DEFAULT => -14,
		GOTOS => {
			'decORexp' => 19
		}
	},
	{#State 14
		ACTIONS => {
			'ID' => 20,
			'NUM' => 2,
			"(" => 21,
			'INT' => 17
		},
		GOTOS => {
			'expr' => 22,
			'declarator' => 23
		}
	},
	{#State 15
		ACTIONS => {
			";" => 24,
			"=" => 25
		}
	},
	{#State 16
		DEFAULT => -8
	},
	{#State 17
		ACTIONS => {
			"(" => 26
		}
	},
	{#State 18
		ACTIONS => {
			"+" => 10,
			"=" => 12
		},
		DEFAULT => -9
	},
	{#State 19
		DEFAULT => -12
	},
	{#State 20
		DEFAULT => -14,
		GOTOS => {
			'decORexp' => 27
		}
	},
	{#State 21
		ACTIONS => {
			'ID' => 13,
			"(" => 21
		},
		GOTOS => {
			'declarator' => 23
		}
	},
	{#State 22
		ACTIONS => {
			"+" => 10,
			")" => 28,
			"=" => 12
		}
	},
	{#State 23
		ACTIONS => {
			")" => 29
		}
	},
	{#State 24
		DEFAULT => -10
	},
	{#State 25
		ACTIONS => {
			'ID' => 3,
			'NUM' => 2,
			'INT' => 17
		},
		GOTOS => {
			'expr' => 30
		}
	},
	{#State 26
		ACTIONS => {
			'ID' => 3,
			'NUM' => 2,
			'INT' => 17
		},
		GOTOS => {
			'expr' => 22
		}
	},
	{#State 27
		DEFAULT => -5
	},
	{#State 28
		DEFAULT => -7
	},
	{#State 29
		DEFAULT => -13
	},
	{#State 30
		ACTIONS => {
			";" => 31,
			"+" => 10,
			"=" => 12
		}
	},
	{#State 31
		DEFAULT => -11
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 273 ./Cplusplus1.pm
	],
	[#Rule EMPTY
		 'prog', 0,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 280 ./Cplusplus1.pm
	],
	[#Rule PROG
		 'prog', 2,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 287 ./Cplusplus1.pm
	],
	[#Rule EXP
		 'stmt', 2,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 294 ./Cplusplus1.pm
	],
	[#Rule DECL
		 'stmt', 1,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 301 ./Cplusplus1.pm
	],
	[#Rule ID:EXP
		 'expr', 2,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 308 ./Cplusplus1.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 315 ./Cplusplus1.pm
	],
	[#Rule TYPECAST
		 'expr', 4,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 322 ./Cplusplus1.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 329 ./Cplusplus1.pm
	],
	[#Rule ASSIGN
		 'expr', 3,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 336 ./Cplusplus1.pm
	],
	[#Rule DECLARATOR
		 'decl', 3,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 343 ./Cplusplus1.pm
	],
	[#Rule DECLARATORINIT
		 'decl', 5,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 350 ./Cplusplus1.pm
	],
	[#Rule ID:DEC
		 'declarator', 2,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 357 ./Cplusplus1.pm
	],
	[#Rule declarator_13
		 'declarator', 3,
sub {
#line 12 "Cplusplus1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 364 ./Cplusplus1.pm
	],
	[#Rule decORexp
		 'decORexp', 0,
sub {
#line 68 "Cplusplus1.eyp"
  my $self = $_[0];
#line 16 "Cplusplus1.eyp"

        my $self = shift;

        if (${$self->input()} =~ m{^[)\s]*[;=]\s*}) {
          $self->YYSetReduce(')', 'ID:DEC' );
        }
        else {
          $self->YYSetReduce(')', 'ID:EXP' ); 
        }
      
#line 382 ./Cplusplus1.pm
}
#line 384 ./Cplusplus1.pm
	]
],
#line 387 ./Cplusplus1.pm
    yybypass       => 1,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'EMPTY', 
         'PROG', 
         'EXP', 
         'DECL', 
         'ID:EXP', 
         'NUM', 
         'TYPECAST', 
         'PLUS', 
         'ASSIGN', 
         'DECLARATOR', 
         'DECLARATORINIT', 
         'ID:DEC', 
         'declarator_13', 
         'decORexp', );
  $self;
}

#line 68 "Cplusplus1.eyp"


__PACKAGE__->lexer( 
  sub {
    my $self = shift;
    
    for (${$self->input()}) {
      s{^(\s*)}{};

      return ('', undef) unless $_;

      return ('INT', $1) if s{^(int\b)}{};

      return ('ID',  $1) if (s{^([a-zA-Z_]\w*)}{});

      return ('NUM', $1) if s/^(\d+)//;

      return ($1,    $1) if s/^(.)//;
    }

    return EndOfInput();
  }
);

unless (caller()) {
  my $prompt = 'Try first "int (x) = 2;" then "int (x) + 2;" '.
               '(press <CR><CTRL-D> to finish): ';
  __PACKAGE__->main($prompt) 
}

####################################################

=head1 SYNOPSIS

Compile it with
 
   eyapp -b '' Cplusplus

Run it with:

   ./Cplusplus.pm -t

try with inputs:

     int (x) = 2;
     int (x) + 2;

the result will be the generated abstract sytax tree

=head1  C++ Ambiguities

This grammar models a problematic part of the C++ grammar—the ambiguity between certain
declarations and statements. For example,

     int (x) = y+z;

parses as either an expr or a stmt.


Eyapp detects this as a reduce/reduce conflict:

  State 17 contains 1 reduce/reduce conflict

  State 17:

	expr -> ID .	(Rule 5)
	declarator -> ID .	(Rule 11)

	')'	[reduce using rule 11 (declarator)]
	$default	reduce using rule 5 (expr)

The C++ rule is: take it as a declaration if it looks as a declaration,
otherwise is an expression.

This Eyapp parser solves the problem by dynamically changing the parser.

=head1 SEE ALSO

=over 2

=item * The file C<Cplusplus2.eyp> in C<examples/debuggintut>

=item * L<http://www.gnu.org/software/bison/manual/html_mono/bison.html#GLR-Parsers>

=item * L<http://en.wikipedia.org/wiki/Significantly_Prettier_and_Easier_C%2B%2B_Syntax>

=item * L<http://www.csse.monash.edu.au/~damian/papers/PS/ModestProposal.ps> 

=item * L<http://www.nobugs.org/developer/parsingcpp/>

=item * Edward Willink's "Meta-Compilation for C++" PhD thesis at L<http://www.computing.surrey.ac.uk/Research/CSRG/fog/FogThesis.pdf>

=back

=cut


#line 514 ./Cplusplus1.pm



1;
