#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.155.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'nopackrat2.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package nopackrat2;
use strict;

push @nopackrat2::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

#line 1 "nopackrat2.eyp"

=head1 SYNOPSIS

Packrat parsers cannot recognize some unambiguous grammars, such as the following 
Example taken from Bryan Ford (2002): 
I<Functional Pearl: Packrat Parsing: Simple, Powerful, Lazy, Linear Time>

    S : x' S 'x' | 'x'

In fact, neither LL(k) nor LR(k) parsing algorithms are capable of recognizing this example.

This example is more complex than the former. 

Compile this grammar with:

        eyapp -C nopackrat2.eyp

Run the program with s.t. like:

        ./nopackrat2.pm -t -m 1 -i -c '2*3; 4+2; a+1; 2; a;'

=head1 SEE ALSO

=over 2 

=item * File C<nopackrat.eyp>

=item *  http://en.wikipedia.org/wiki/Parsing_expression_grammar,
         entry 'Parsing expression grammar' in the Wikipedia

=item * Bryan Ford (2002). Functional Pearl: Packrat Parsing: Simple, Powerful, Lazy, Linear Time
        http://pdos.csail.mit.edu/~baford/packrat/icfp02/packrat-icfp02.pdf

=back

=cut

my $count = 0;

#line 49 "nopackrat2.eyp"
__PACKAGE__->YYLexer( 
  sub { # lexical analyzer
    my $self = $_[0]; 
    for (${$self->input()}) {  # contextualize
#line 49 "nopackrat2.eyp"
      
  /\G\s+/gc;

  /\G([0-9]+(?:\.[0-9]+)?)/gc   and return('NUM',$1);
  /\G([A-Za-z][A-Za-z0-9_]*)/gc and return('VAR',$1);
  /\G(.)/gc                     and return($1,$1);
       
#line 80 ./nopackrat2.pm
      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      die("Error at the end of lexical analyzer. Line: 55. File: nopackrat2.eyp. No regexp matched.\n");
    } 
  } # end lexical analyzer
);

#line 87 ./nopackrat2.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@nopackrat2::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.155',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 's', '$end' ], 0 ],
  [ 'exp_s_exp' => 's', [ 'exp', ';', 'isInTheMiddle', 's', 'exp', ';' ], 0 ],
  [ 'MIDexp' => 's', [ 'exp', ';', 'isInTheMiddle' ], 0 ],
  [ 'NUM' => 'exp', [ 'NUM' ], 0 ],
  [ 'VAR' => 'exp', [ 'VAR' ], 0 ],
  [ 'ASSIGN' => 'exp', [ 'VAR', '=', 'exp' ], 0 ],
  [ 'PLUS' => 'exp', [ 'exp', '+', 'exp' ], 0 ],
  [ 'MINUS' => 'exp', [ 'exp', '-', 'exp' ], 0 ],
  [ 'TIMES' => 'exp', [ 'exp', '*', 'exp' ], 0 ],
  [ 'DIV' => 'exp', [ 'exp', '/', 'exp' ], 0 ],
  [ 'UMINUS' => 'exp', [ '-', 'exp' ], 0 ],
  [ 'exp_11' => 'exp', [ '(', 'exp', ')' ], 0 ],
  [ 'isInTheMiddle' => 'isInTheMiddle', [  ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	'*' => { ISSEMANTIC => 0 },
	'+' => { ISSEMANTIC => 0 },
	'-' => { ISSEMANTIC => 0 },
	'/' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	'=' => { ISSEMANTIC => 0 },
	NEG => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	VAR => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'nopackrat2.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 3,
			's' => 6
		}
	},
	{#State 1
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 7
		}
	},
	{#State 2
		DEFAULT => -3
	},
	{#State 3
		ACTIONS => {
			"-" => 8,
			"*" => 9,
			";" => 11,
			"+" => 10,
			"/" => 12
		}
	},
	{#State 4
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 13
		}
	},
	{#State 5
		ACTIONS => {
			"=" => 14
		},
		DEFAULT => -4
	},
	{#State 6
		ACTIONS => {
			'' => 15
		}
	},
	{#State 7
		DEFAULT => -10
	},
	{#State 8
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 16
		}
	},
	{#State 9
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 17
		}
	},
	{#State 10
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 18
		}
	},
	{#State 11
		DEFAULT => -12,
		GOTOS => {
			'isInTheMiddle' => 19
		}
	},
	{#State 12
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 20
		}
	},
	{#State 13
		ACTIONS => {
			"-" => 8,
			"*" => 9,
			"+" => 10,
			"/" => 12,
			")" => 21
		}
	},
	{#State 14
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 22
		}
	},
	{#State 15
		DEFAULT => 0
	},
	{#State 16
		ACTIONS => {
			"*" => 9,
			"/" => 12
		},
		DEFAULT => -7
	},
	{#State 17
		DEFAULT => -8
	},
	{#State 18
		ACTIONS => {
			"*" => 9,
			"/" => 12
		},
		DEFAULT => -6
	},
	{#State 19
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		DEFAULT => -2,
		GOTOS => {
			'exp' => 3,
			's' => 23
		}
	},
	{#State 20
		DEFAULT => -9
	},
	{#State 21
		DEFAULT => -11
	},
	{#State 22
		ACTIONS => {
			"-" => 8,
			"*" => 9,
			"+" => 10,
			"/" => 12
		},
		DEFAULT => -5
	},
	{#State 23
		ACTIONS => {
			'NUM' => 2,
			"-" => 1,
			"(" => 4,
			'VAR' => 5
		},
		GOTOS => {
			'exp' => 24
		}
	},
	{#State 24
		ACTIONS => {
			"-" => 8,
			"*" => 9,
			";" => 25,
			"+" => 10,
			"/" => 12
		}
	},
	{#State 25
		DEFAULT => -1
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 340 ./nopackrat2.pm
	],
	[#Rule exp_s_exp
		 's', 6,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 347 ./nopackrat2.pm
	],
	[#Rule MIDexp
		 's', 3,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 354 ./nopackrat2.pm
	],
	[#Rule NUM
		 'exp', 1,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 361 ./nopackrat2.pm
	],
	[#Rule VAR
		 'exp', 1,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 368 ./nopackrat2.pm
	],
	[#Rule ASSIGN
		 'exp', 3,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 375 ./nopackrat2.pm
	],
	[#Rule PLUS
		 'exp', 3,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 382 ./nopackrat2.pm
	],
	[#Rule MINUS
		 'exp', 3,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 389 ./nopackrat2.pm
	],
	[#Rule TIMES
		 'exp', 3,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 396 ./nopackrat2.pm
	],
	[#Rule DIV
		 'exp', 3,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 403 ./nopackrat2.pm
	],
	[#Rule UMINUS
		 'exp', 2,
sub {
#line 70 "nopackrat2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 410 ./nopackrat2.pm
	],
	[#Rule exp_11
		 'exp', 3,
sub {
#line 98 "nopackrat2.eyp"
 $_[2] }
#line 417 ./nopackrat2.pm
	],
	[#Rule isInTheMiddle
		 'isInTheMiddle', 0,
sub {
#line 102 "nopackrat2.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 57 "nopackrat2.eyp" 

  $count++;
  # nested parsing of the remain of the input ...
  my $r = substr($_, pos($_));

  my $nrsc = ($r =~ tr/;//); # count the number of remaining ';'
  # just for debugging ...
  print "count = $count r = '$r' nrsc = $nrsc pos = ".pos($_)."\n";

  if ($count == $nrsc+1) { $self->YYSetReduce([ 'NUM', 'VAR', '(', '-' ], 'MIDexp' ) }
  else { $self->YYSetShift([ 'NUM', 'VAR', '(', '-' ]) }
#line 437 ./nopackrat2.pm
  }

}
#line 441 ./nopackrat2.pm
	]
],
#line 444 ./nopackrat2.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'exp_s_exp', 
         'MIDexp', 
         'NUM', 
         'VAR', 
         'ASSIGN', 
         'PLUS', 
         'MINUS', 
         'TIMES', 
         'DIV', 
         'UMINUS', 
         'exp_11', 
         'isInTheMiddle', );
  $self;
}

#line 102 "nopackrat2.eyp"



=for None

=cut


#line 480 ./nopackrat2.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
