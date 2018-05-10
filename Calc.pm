########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.173.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'Calc.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Calc;
use strict;

push @Calc::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 6 "Calc.eyp"

my %s; # symbol table


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      /\G([ \t]*(?:#.*)?)/gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\n|\-|\+|\/|\=|\^|\(|\*|\))}gc and return ($1, $1);

      /\G([0-9]+(?:\.[0-9]+)?)/gc and return ('NUM', $1);
      /\G([A-Za-z][A-Za-z0-9_]*)/gc and return ('VAR', $1);


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


#line 65 ./Calc.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Calc::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.173',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'start', '$end' ], 0 ],
  [ 'start_1' => 'start', [ 'input' ], 0 ],
  [ '_STAR_LIST' => 'STAR-1', [ 'STAR-1', 'line' ], 0 ],
  [ '_STAR_LIST' => 'STAR-1', [  ], 0 ],
  [ 'input_4' => 'input', [ 'STAR-1' ], 0 ],
  [ 'line_5' => 'line', [ '\n' ], 0 ],
  [ 'line_6' => 'line', [ 'exp', '\n' ], 0 ],
  [ 'line_7' => 'line', [ 'error', '\n' ], 0 ],
  [ 'exp_8' => 'exp', [ 'NUM' ], 0 ],
  [ 'exp_9' => 'exp', [ 'VAR' ], 0 ],
  [ 'exp_10' => 'exp', [ 'VAR', '=', 'exp' ], 0 ],
  [ 'exp_11' => 'exp', [ 'exp', '+', 'exp' ], 0 ],
  [ 'exp_12' => 'exp', [ 'exp', '-', 'exp' ], 0 ],
  [ 'exp_13' => 'exp', [ 'exp', '*', 'exp' ], 0 ],
  [ 'exp_14' => 'exp', [ 'exp', '/', 'exp' ], 0 ],
  [ 'exp_15' => 'exp', [ '-', 'exp' ], 0 ],
  [ 'exp_16' => 'exp', [ 'exp', '^', 'exp' ], 0 ],
  [ 'exp_17' => 'exp', [ '(', 'exp', ')' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'start_1' => 1,
  '_STAR_LIST' => 2,
  '_STAR_LIST' => 3,
  'input_4' => 4,
  'line_5' => 5,
  'line_6' => 6,
  'line_7' => 7,
  'exp_8' => 8,
  'exp_9' => 9,
  'exp_10' => 10,
  'exp_11' => 11,
  'exp_12' => 12,
  'exp_13' => 13,
  'exp_14' => 14,
  'exp_15' => 15,
  'exp_16' => 16,
  'exp_17' => 17,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	'*' => { ISSEMANTIC => 0 },
	'+' => { ISSEMANTIC => 0 },
	'-' => { ISSEMANTIC => 0 },
	'/' => { ISSEMANTIC => 0 },
	'=' => { ISSEMANTIC => 0 },
	'\n' => { ISSEMANTIC => 0 },
	'^' => { ISSEMANTIC => 0 },
	NUM => { ISSEMANTIC => 1 },
	VAR => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'Calc.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -3,
		GOTOS => {
			'input' => 2,
			'STAR-1' => 1,
			'start' => 3
		}
	},
	{#State 1
		ACTIONS => {
			'' => -4,
			"-" => 4,
			"\n" => 9,
			'NUM' => 5,
			"(" => 7,
			'VAR' => 8,
			'error' => 10
		},
		GOTOS => {
			'exp' => 6,
			'line' => 11
		}
	},
	{#State 2
		DEFAULT => -1
	},
	{#State 3
		ACTIONS => {
			'' => 12
		}
	},
	{#State 4
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 13
		}
	},
	{#State 5
		DEFAULT => -8
	},
	{#State 6
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => 18,
			"+" => 17,
			"/" => 19
		}
	},
	{#State 7
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 20
		}
	},
	{#State 8
		ACTIONS => {
			"-" => -9,
			"^" => -9,
			"*" => -9,
			"+" => -9,
			"\n" => -9,
			"/" => -9,
			")" => -9,
			"=" => 21
		}
	},
	{#State 9
		DEFAULT => -5
	},
	{#State 10
		ACTIONS => {
			"\n" => 22
		}
	},
	{#State 11
		DEFAULT => -2
	},
	{#State 12
		DEFAULT => 0
	},
	{#State 13
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => -15,
			"+" => 17,
			"/" => 19,
			")" => -15
		}
	},
	{#State 14
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 23
		}
	},
	{#State 15
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 24
		}
	},
	{#State 16
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 25
		}
	},
	{#State 17
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 26
		}
	},
	{#State 18
		DEFAULT => -6
	},
	{#State 19
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 27
		}
	},
	{#State 20
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"+" => 17,
			"/" => 19,
			")" => 28
		}
	},
	{#State 21
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 29
		}
	},
	{#State 22
		DEFAULT => -7
	},
	{#State 23
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => -12,
			"+" => 17,
			"/" => 19,
			")" => -12
		}
	},
	{#State 24
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => -16,
			"+" => 17,
			"/" => 19,
			")" => -16
		}
	},
	{#State 25
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => -13,
			"+" => 17,
			"/" => 19,
			")" => -13
		}
	},
	{#State 26
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => -11,
			"+" => 17,
			"/" => 19,
			")" => -11
		}
	},
	{#State 27
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => -14,
			"+" => 17,
			"/" => 19,
			")" => -14
		}
	},
	{#State 28
		DEFAULT => -17
	},
	{#State 29
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => -10,
			"+" => 17,
			"/" => 19,
			")" => -10
		}
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 398 ./Calc.pm
	],
	[#Rule start_1
		 'start', 1,
sub {
#line 12 "Calc.eyp"
 \%s }
#line 405 ./Calc.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 2,
sub {
#line 15 "Calc.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 412 ./Calc.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 0,
sub {
#line 15 "Calc.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 419 ./Calc.pm
	],
	[#Rule input_4
		 'input', 1, undef
#line 423 ./Calc.pm
	],
	[#Rule line_5
		 'line', 1,
sub {
#line 19 "Calc.eyp"
 undef }
#line 430 ./Calc.pm
	],
	[#Rule line_6
		 'line', 2,
sub {
#line 20 "Calc.eyp"
 
                  print "$_[1]\n" if defined($_[1]); 
                  $_[1] 
               }
#line 440 ./Calc.pm
	],
	[#Rule line_7
		 'line', 2,
sub {
#line 25 "Calc.eyp"
 
        $_[0]->YYErrok; 
        undef 
      }
#line 450 ./Calc.pm
	],
	[#Rule exp_8
		 'exp', 1, undef
#line 454 ./Calc.pm
	],
	[#Rule exp_9
		 'exp', 1,
sub {
#line 33 "Calc.eyp"
my $VAR = $_[1];  $s{$VAR} }
#line 461 ./Calc.pm
	],
	[#Rule exp_10
		 'exp', 3,
sub {
#line 34 "Calc.eyp"
my $exp = $_[3]; my $VAR = $_[1];  $s{$VAR} = $exp }
#line 468 ./Calc.pm
	],
	[#Rule exp_11
		 'exp', 3,
sub {
#line 35 "Calc.eyp"
my $left = $_[1]; my $right = $_[3];  $left + $right }
#line 475 ./Calc.pm
	],
	[#Rule exp_12
		 'exp', 3,
sub {
#line 36 "Calc.eyp"
my $left = $_[1]; my $right = $_[3];  $left - $right }
#line 482 ./Calc.pm
	],
	[#Rule exp_13
		 'exp', 3,
sub {
#line 37 "Calc.eyp"
my $left = $_[1]; my $right = $_[3];  $left * $right }
#line 489 ./Calc.pm
	],
	[#Rule exp_14
		 'exp', 3,
sub {
#line 39 "Calc.eyp"
my $left = $_[1]; my $right = $_[3]; 
       $_[3] and return($_[1] / $_[3]);
       $_[0]->YYData->{ERRMSG} = "Illegal division by zero.\n";
       $_[0]->YYError; 
       undef
    }
#line 501 ./Calc.pm
	],
	[#Rule exp_15
		 'exp', 2,
sub {
#line 45 "Calc.eyp"
my $exp = $_[2];  -$exp }
#line 508 ./Calc.pm
	],
	[#Rule exp_16
		 'exp', 3,
sub {
#line 46 "Calc.eyp"
my $left = $_[1]; my $right = $_[3];  $left ** $right }
#line 515 ./Calc.pm
	],
	[#Rule exp_17
		 'exp', 3,
sub {
#line 47 "Calc.eyp"
my $exp = $_[2];  $exp }
#line 522 ./Calc.pm
	]
],
#line 525 ./Calc.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'start_1', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'input_4', 
         'line_5', 
         'line_6', 
         'line_7', 
         'exp_8', 
         'exp_9', 
         'exp_10', 
         'exp_11', 
         'exp_12', 
         'exp_13', 
         'exp_14', 
         'exp_15', 
         'exp_16', 
         'exp_17', );
  $self;
}

#line 50 "Calc.eyp"


=head1 SYNOPSIS

Compile it with

   eyapp -C Calc.eyp 

run it with:

   ./Calc.pm

Provide several expressions as input and press CTRL-D

=cut


#line 577 ./Calc.pm



1;
