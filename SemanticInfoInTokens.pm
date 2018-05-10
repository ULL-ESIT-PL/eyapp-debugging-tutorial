#!/opt/local/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.164.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'SemanticInfoInTokens.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package SemanticInfoInTokens;
use strict;

push @SemanticInfoInTokens::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\+|\;|\,|\=|\(|\))}gc and return ($1, $1);

      /\G(ID)/gc and return ($1, $1);
      /\G(INTEGER)/gc and return ($1, $1);
      /\G(INT)/gc and return ($1, $1);
      /\G(HEX)/gc and return ($1, $1);


      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      /\G\s*(\S+)/;
      my $near = substr($1,0,10); 
      die( "Error inside the lexical analyzer near '". $near
          ."'. Line: ".$self->line()
          .". File: '".$self->YYFilename()."'. No match found.\n");
    }
  }
;


sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 14 "SemanticInfoInTokens.eyp"

use base q{DebugTail};
my %st;

#line 64 ./SemanticInfoInTokens.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@SemanticInfoInTokens::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.164',
    yyGRAMMAR  =>
[
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
  [ 'HEX' => 'expr', [ 'HEX', '(', '@13-2', 'expr', ')' ], 1 ],
  [ '_CODE' => '@13-2', [  ], 1 ],
  [ 'ASSIGN' => 'expr', [ 'id', '=', 'expr' ], 1 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 1 ],
  [ 'id_17' => 'id', [ 'ID' ], 1 ],
],
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
    yyFILENAME  => 'SemanticInfoInTokens.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'INT' => 5
		},
		DEFAULT => -4,
		GOTOS => {
			'stmt' => 1,
			'STAR-2' => 2,
			'STAR-1' => 4,
			'decl' => 3
		}
	},
	{#State 1
		ACTIONS => {
			'' => 6
		}
	},
	{#State 2
		ACTIONS => {
			'ID' => 8,
			'INTEGER' => 7,
			'HEX' => 9
		},
		GOTOS => {
			'PLUS-3' => 11,
			'expr' => 10,
			'id' => 12
		}
	},
	{#State 3
		DEFAULT => -2
	},
	{#State 4
		ACTIONS => {
			";" => 13
		},
		DEFAULT => -3
	},
	{#State 5
		ACTIONS => {
			'ID' => 14
		},
		GOTOS => {
			'PLUS-4' => 15
		}
	},
	{#State 6
		DEFAULT => 0
	},
	{#State 7
		DEFAULT => -12
	},
	{#State 8
		ACTIONS => {
			"=" => -17
		},
		DEFAULT => -11
	},
	{#State 9
		ACTIONS => {
			"(" => 16
		}
	},
	{#State 10
		ACTIONS => {
			"+" => 17
		},
		DEFAULT => -6
	},
	{#State 11
		ACTIONS => {
			";" => 18
		},
		DEFAULT => -7
	},
	{#State 12
		ACTIONS => {
			"=" => 19
		}
	},
	{#State 13
		ACTIONS => {
			'INT' => 5
		},
		GOTOS => {
			'decl' => 20
		}
	},
	{#State 14
		DEFAULT => -9
	},
	{#State 15
		ACTIONS => {
			"," => 21
		},
		DEFAULT => -10
	},
	{#State 16
		DEFAULT => -14,
		GOTOS => {
			'@13-2' => 22
		}
	},
	{#State 17
		ACTIONS => {
			'ID' => 8,
			'INTEGER' => 7,
			'HEX' => 9
		},
		GOTOS => {
			'expr' => 23,
			'id' => 12
		}
	},
	{#State 18
		ACTIONS => {
			'ID' => 8,
			'INTEGER' => 7,
			'HEX' => 9
		},
		GOTOS => {
			'expr' => 24,
			'id' => 12
		}
	},
	{#State 19
		ACTIONS => {
			'ID' => 8,
			'INTEGER' => 7,
			'HEX' => 9
		},
		GOTOS => {
			'expr' => 25,
			'id' => 12
		}
	},
	{#State 20
		DEFAULT => -1
	},
	{#State 21
		ACTIONS => {
			'ID' => 26
		}
	},
	{#State 22
		ACTIONS => {
			'ID' => 8,
			'INTEGER' => 7,
			'HEX' => 9
		},
		GOTOS => {
			'expr' => 27,
			'id' => 12
		}
	},
	{#State 23
		DEFAULT => -16
	},
	{#State 24
		ACTIONS => {
			"+" => 17
		},
		DEFAULT => -5
	},
	{#State 25
		ACTIONS => {
			"+" => 17
		},
		DEFAULT => -15
	},
	{#State 26
		DEFAULT => -8
	},
	{#State 27
		ACTIONS => {
			"+" => 17,
			")" => 28
		}
	},
	{#State 28
		DEFAULT => -13
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 302 ./SemanticInfoInTokens.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 3,
sub {
#line 23 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 309 ./SemanticInfoInTokens.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 1,
sub {
#line 23 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 316 ./SemanticInfoInTokens.pm
	],
	[#Rule _STAR_LIST
		 'STAR-2', 1,
sub {
#line 23 "SemanticInfoInTokens.eyp"
 { $_[1] } # optimize 
}
#line 324 ./SemanticInfoInTokens.pm
	],
	[#Rule _STAR_LIST
		 'STAR-2', 0,
sub {
#line 23 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 331 ./SemanticInfoInTokens.pm
	],
	[#Rule EXPS
		 'PLUS-3', 3,
sub {
#line 23 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 338 ./SemanticInfoInTokens.pm
	],
	[#Rule EXPS
		 'PLUS-3', 1,
sub {
#line 23 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 345 ./SemanticInfoInTokens.pm
	],
	[#Rule stmt_7
		 'stmt', 2,
sub {
#line 24 "SemanticInfoInTokens.eyp"

        # make the symbol table an attribute 
        # of the root node
        $_[2]->{st} = { %st };
        $_[2];
      }
#line 357 ./SemanticInfoInTokens.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-4', 3,
sub {
#line 33 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 364 ./SemanticInfoInTokens.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-4', 1,
sub {
#line 33 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 371 ./SemanticInfoInTokens.pm
	],
	[#Rule decl_10
		 'decl', 2,
sub {
#line 34 "SemanticInfoInTokens.eyp"

        # insert identifiers in the symbol table
        $st{$_->{attr}} = 1 for $_[2]->children();
      }
#line 381 ./SemanticInfoInTokens.pm
	],
	[#Rule ID
		 'expr', 1,
sub {
#line 19 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 388 ./SemanticInfoInTokens.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 19 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 395 ./SemanticInfoInTokens.pm
	],
	[#Rule HEX
		 'expr', 5,
sub {
#line 47 "SemanticInfoInTokens.eyp"
my $expr = $_[4];  
        $_[0]->{HEXFLAG} = 0; 
        $expr;
      }
#line 405 ./SemanticInfoInTokens.pm
	],
	[#Rule _CODE
		 '@13-2', 0,
sub {
#line 46 "SemanticInfoInTokens.eyp"
 $_[0]->{HEXFLAG} = 1; }
#line 412 ./SemanticInfoInTokens.pm
	],
	[#Rule ASSIGN
		 'expr', 3,
sub {
#line 19 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 419 ./SemanticInfoInTokens.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 19 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 426 ./SemanticInfoInTokens.pm
	],
	[#Rule id_17
		 'id', 1,
sub {
#line 19 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 433 ./SemanticInfoInTokens.pm
	]
],
#line 436 ./SemanticInfoInTokens.pm
    yybypass       => 1,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
      'HEX::expr' => 0,
   },
    yyconflicthandlers => {}
,
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
         'ASSIGN', 
         'PLUS', 
         'id_17', );
  $self;
}

#line 60 "SemanticInfoInTokens.eyp"


# Context-dependant lexer
__PACKAGE__->lexer( sub {
    my $parser = shift;
    my $hexflag = $parser->{HEXFLAG};

    for (${$parser->input}) {    # contextualize
      m{\G\s*(\#.*)?}gc;

      m{\G(HEX\b|INT\b)}igc and return (uc($1), $1);

      m{(\G\d+)}gc and return ('INTEGER', $hexflag? hex($1) : $1);


      m{\G([a-zA-Z_]\w*)}gc and do {
        my $match = $1;
        $hexflag and !exists($st{$match}) and $match =~ m{^([A-F0-9]+$)}gc and return ('INTEGER', hex($match)); 
        return ('ID', $1);
      };

      m{\G(.)}gc         and return ($1, $1);

      return('',undef);
    }
  }
);

*TERMINAL::info = *NUM::info = *ID::info = sub {
  $_[0]->{attr}
};

__PACKAGE__->main() unless caller();

=head1 SYNOPSIS

Compile it with:

            eyapp -b '' SemanticInfoInTokens.eyp

Run it with:

            ./SemanticInfoInTokens.pm -t -f inputforsemanticinfo.txt

try also:

            ./SemanticInfoInTokens.pm -t -f inputforsemanticinfo2.txt

=head1 THE TYPENAME-IDENTIFIER PROBLEM WHEN PARSING THE C<C> LANGUAGE

The C language has a context dependency: the way an identifier is used depends
on what its current meaning is. For example, consider this:

  T(x);

This looks like a function call statement, but if C<T> is a typedef name, then
this is actually a declaration of C<x>. How can a parser for C decide how to
parse this input?

Here is another example:

  {
    T * x;
    ...
  }

What is this, a declaration of C<x> as a pointer to C<T>, 
or a void multiplication of the variables C<T> and C<x>?

The usual method to solve this problem is to have two different token types, C<ID> and C<TYPENAME>.
When the lexer finds an identifier, it looks up in the symbol table 
the current declaration of the identifier in order to 
decide which token type to return: C<TYPENAME> if the
identifier is declared as a typedef, C<ID> otherwise.

=head1 THIS EXAMPLE

One way to handle context-dependency is the lexical tie-in: a flag which is set
by the semantic actions, whose purpose is to alter the way tokens are parsed.

In this "Calc"-like example we have a language with a special construct C<hex
(hex-expr)>. After the keyword C<hex> comes an C<expression> in parentheses in
which all integers are hexadecimal. In particular, strings in C</[A-F0-9]+/>
like C<A1B> must be treated as an hex integer unless they were previously
declared.

Here the lexer looks at the value of the hexflag attribute; when it is nonzero,
all integers are parsed in hexadecimal, and tokens starting with letters are
parsed as integers if possible.

=head1 SEE ALSO

=over 2

=item *  File: Tieins.eyp

=item * L<http://www.gnu.org/software/bison/manual/html_mono/bison.html#Lexical-Tie_002dins>

=item * L<http://en.wikipedia.org/wiki/The_lexer_hack>

=item * L<http://eli.thegreenplace.net/2007/11/24/the-context-sensitivity-of-cs-grammar/>

=back


=for None

=cut


#line 582 ./SemanticInfoInTokens.pm



1;
