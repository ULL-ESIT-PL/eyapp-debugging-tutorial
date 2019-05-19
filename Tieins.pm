#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'Tieins.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Tieins;
use strict;

push @Tieins::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 9 "Tieins.eyp"

use base 'DebugTail';
my %st;


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\;|\+|\(|\)|\=|\,)}gc and return ($1, $1);

      /\G(INT)/gc and return ($1, $1);
      /\G(ID)/gc and return ($1, $1);
      /\G(INTEGER)/gc and return ($1, $1);
      /\G(HEX)/gc and return ($1, $1);


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


#line 69 ./Tieins.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Tieins::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'stmt', '$end' ], 1 ],
  [ '_STAR_LIST' => 'STAR-1', [ 'STAR-1', ';', 'decl' ], 1 ],
  [ '_STAR_LIST' => 'STAR-1', [ 'decl' ], 1 ],
  [ '_STAR_LIST' => 'STAR-2', [ 'STAR-1' ], 1 ],
  [ '_STAR_LIST' => 'STAR-2', [  ], 1 ],
  [ 'EXPS' => 'PLUS-3', [ 'PLUS-3', ';', 'expr' ], 1 ],
  [ 'EXPS' => 'PLUS-3', [ 'expr' ], 1 ],
  [ 'stmt_7' => 'stmt', [ 'STAR-2', 'PLUS-3' ], 1 ],
  [ '_PLUS_LIST' => 'PLUS-4', [ 'PLUS-4', ',', 'ID' ], 1 ],
  [ '_PLUS_LIST' => 'PLUS-4', [ 'ID' ], 1 ],
  [ 'decl_10' => 'decl', [ 'INT', 'PLUS-4' ], 1 ],
  [ 'ID' => 'expr', [ 'ID' ], 1 ],
  [ 'NUM' => 'expr', [ 'INTEGER' ], 1 ],
  [ 'HEX' => 'expr', [ 'HEX', '(', '@13-2', 'expr', '@13-4', ')' ], 1 ],
  [ '_CODE' => '@13-2', [  ], 1 ],
  [ '_CODE' => '@13-4', [  ], 1 ],
  [ 'ASSIGN' => 'expr', [ 'id', '=', 'expr' ], 1 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 1 ],
  [ 'id_18' => 'id', [ 'ID' ], 1 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  '_STAR_LIST' => 1,
  '_STAR_LIST' => 2,
  '_STAR_LIST' => 3,
  '_STAR_LIST' => 4,
  'EXPS' => 5,
  'EXPS' => 6,
  'stmt_7' => 7,
  '_PLUS_LIST' => 8,
  '_PLUS_LIST' => 9,
  'decl_10' => 10,
  'ID' => 11,
  'NUM' => 12,
  'HEX' => 13,
  '_CODE' => 14,
  '_CODE' => 15,
  'ASSIGN' => 16,
  'PLUS' => 17,
  'id_18' => 18,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	'+' => { ISSEMANTIC => 0 },
	',' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	'=' => { ISSEMANTIC => 0 },
	HEX => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	INT => { ISSEMANTIC => 1 },
	INTEGER => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'Tieins.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'INT' => 5
		},
		DEFAULT => -4,
		GOTOS => {
			'STAR-1' => 1,
			'stmt' => 2,
			'STAR-2' => 3,
			'decl' => 4
		}
	},
	{#State 1
		ACTIONS => {
			";" => 6
		},
		DEFAULT => -3
	},
	{#State 2
		ACTIONS => {
			'' => 7
		}
	},
	{#State 3
		ACTIONS => {
			'HEX' => 9,
			'ID' => 12,
			'INTEGER' => 13
		},
		GOTOS => {
			'expr' => 10,
			'PLUS-3' => 11,
			'id' => 8
		}
	},
	{#State 4
		DEFAULT => -2
	},
	{#State 5
		ACTIONS => {
			'ID' => 15
		},
		GOTOS => {
			'PLUS-4' => 14
		}
	},
	{#State 6
		ACTIONS => {
			'INT' => 5
		},
		GOTOS => {
			'decl' => 16
		}
	},
	{#State 7
		DEFAULT => 0
	},
	{#State 8
		ACTIONS => {
			"=" => 17
		}
	},
	{#State 9
		ACTIONS => {
			"(" => 18
		}
	},
	{#State 10
		ACTIONS => {
			"+" => 19
		},
		DEFAULT => -6
	},
	{#State 11
		ACTIONS => {
			";" => 20
		},
		DEFAULT => -7
	},
	{#State 12
		ACTIONS => {
			"=" => -18
		},
		DEFAULT => -11
	},
	{#State 13
		DEFAULT => -12
	},
	{#State 14
		ACTIONS => {
			"," => 21
		},
		DEFAULT => -10
	},
	{#State 15
		DEFAULT => -9
	},
	{#State 16
		DEFAULT => -1
	},
	{#State 17
		ACTIONS => {
			'ID' => 12,
			'INTEGER' => 13,
			'HEX' => 9
		},
		GOTOS => {
			'expr' => 22,
			'id' => 8
		}
	},
	{#State 18
		DEFAULT => -14,
		GOTOS => {
			'@13-2' => 23
		}
	},
	{#State 19
		ACTIONS => {
			'ID' => 12,
			'INTEGER' => 13,
			'HEX' => 9
		},
		GOTOS => {
			'expr' => 24,
			'id' => 8
		}
	},
	{#State 20
		ACTIONS => {
			'INTEGER' => 13,
			'ID' => 12,
			'HEX' => 9
		},
		GOTOS => {
			'id' => 8,
			'expr' => 25
		}
	},
	{#State 21
		ACTIONS => {
			'ID' => 26
		}
	},
	{#State 22
		ACTIONS => {
			"+" => 19
		},
		DEFAULT => -16
	},
	{#State 23
		ACTIONS => {
			'HEX' => 9,
			'INTEGER' => 13,
			'ID' => 12
		},
		GOTOS => {
			'expr' => 27,
			'id' => 8
		}
	},
	{#State 24
		DEFAULT => -17
	},
	{#State 25
		ACTIONS => {
			"+" => 19
		},
		DEFAULT => -5
	},
	{#State 26
		DEFAULT => -8
	},
	{#State 27
		ACTIONS => {
			"+" => 19
		},
		DEFAULT => -15,
		GOTOS => {
			'@13-4' => 28
		}
	},
	{#State 28
		ACTIONS => {
			")" => 29
		}
	},
	{#State 29
		DEFAULT => -13
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 338 ./Tieins.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 3,
sub {
#line 18 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 345 ./Tieins.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 1,
sub {
#line 18 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 352 ./Tieins.pm
	],
	[#Rule _STAR_LIST
		 'STAR-2', 1,
sub {
#line 18 "Tieins.eyp"
 { $_[1] } # optimize 
}
#line 360 ./Tieins.pm
	],
	[#Rule _STAR_LIST
		 'STAR-2', 0,
sub {
#line 18 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 367 ./Tieins.pm
	],
	[#Rule EXPS
		 'PLUS-3', 3,
sub {
#line 18 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 374 ./Tieins.pm
	],
	[#Rule EXPS
		 'PLUS-3', 1,
sub {
#line 18 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 381 ./Tieins.pm
	],
	[#Rule stmt_7
		 'stmt', 2,
sub {
#line 19 "Tieins.eyp"

        $_[2]->{st} = { %st };
        $_[2];
      }
#line 391 ./Tieins.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-4', 3,
sub {
#line 26 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 398 ./Tieins.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-4', 1,
sub {
#line 26 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 405 ./Tieins.pm
	],
	[#Rule decl_10
		 'decl', 2,
sub {
#line 27 "Tieins.eyp"

        $st{$_->{attr}} = 1 for $_[2]->children();
      }
#line 414 ./Tieins.pm
	],
	[#Rule ID
		 'expr', 1,
sub {
#line 35 "Tieins.eyp"
my $ID = $_[1]; 
        my $parser = shift;

        my $hexflag = $parser->{HEXFLAG};
        if ($hexflag and !exists($st{$ID}) and $ID =~ m{^([A-F0-9]+$)}) {
          Parse::Eyapp::Node->new('NUM', sub { $_[0]->{attr} = hex($ID) }); 
        }
        else {
          Parse::Eyapp::Node->new('ID', sub { $_[0]->{attr} = $ID });
        }
      }
#line 431 ./Tieins.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 14 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 438 ./Tieins.pm
	],
	[#Rule HEX
		 'expr', 6,
sub {
#line 50 "Tieins.eyp"
my $expr = $_[4];  $expr }
#line 445 ./Tieins.pm
	],
	[#Rule _CODE
		 '@13-2', 0,
sub {
#line 49 "Tieins.eyp"
 $_[0]->{HEXFLAG} = 1; }
#line 452 ./Tieins.pm
	],
	[#Rule _CODE
		 '@13-4', 0,
sub {
#line 49 "Tieins.eyp"
my $expr = $_[4];  $_[0]->{HEXFLAG} = 0 }
#line 459 ./Tieins.pm
	],
	[#Rule ASSIGN
		 'expr', 3,
sub {
#line 14 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 466 ./Tieins.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 14 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 473 ./Tieins.pm
	],
	[#Rule id_18
		 'id', 1,
sub {
#line 14 "Tieins.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 480 ./Tieins.pm
	]
],
#line 483 ./Tieins.pm
    yybypass       => 1,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
      'HEX::expr' => 0,
      'ID::ID' => 0,
   },
    yyconflicthandlers => {}
,
    yystateconflict => {  },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'EXPS', 
         'EXPS', 
         'stmt_7', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         'decl_10', 
         'ID', 
         'NUM', 
         'HEX', 
         '_CODE', 
         '_CODE', 
         'ASSIGN', 
         'PLUS', 
         'id_18', );
  $self;
}

#line 60 "Tieins.eyp"


# Context-dependant lexer
__PACKAGE__->lexer( sub {
    my $parser = shift;

    for (${$parser->input}) {    # contextualize
      m{\G\s*(\#.*)?}gc;

      m{\G(HEX\b|INT\b)}igc and return (uc($1), $1);

      m{(\G\d+)}gc and return ('INTEGER', $parser->{HEXFLAG}? hex($1) : $1);


      return ('ID', $1) if m{\G([a-zA-Z_]\w*)}gc;

      m{\G(.)}gc         and return ($1, $1);

      return('',undef);
    }
  }
);

*TERMINAL::info = *NUM::info = *ID::info = sub {
  $_[0]->{attr}
};

__PACKAGE__->main unless caller();

=head1 SYNOPSIS

Compile it with:

            eyapp -b '' Tieins.eyp

Run it with:

            ./Tieins.pm -t -f inputforsemanticinfo.txt

try also:

            ./Tieins.pm -t -f inputforsemanticinfo2.txt

=head1 THIS EXAMPLE

In this "Calc"-like example we have a language with a special construct C<hex
(hex-expr)>. After the keyword C<hex> comes an C<expression> in parentheses in
which all integers are hexadecimal. In particular, strings in C</[A-F0-9]+/>
like C<A1B> must be treated as an hex integer unless they were previously
declared.

=head1 SEE ALSO

=over 2

=item * File C<SemanticInfoInTokens.eyp>

=item * L<http://www.gnu.org/software/bison/manual/html_mono/bison.html#Lexical-Tie_002dins>

=item * L<http://en.wikipedia.org/wiki/The_lexer_hack>

=item * L<http://eli.thegreenplace.net/2007/11/24/the-context-sensitivity-of-cs-grammar/>

=back


=for None

=cut


#line 593 ./Tieins.pm



1;
