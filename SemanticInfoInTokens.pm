#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
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
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 11 "SemanticInfoInTokens.eyp"

my %st;
#line 15 "SemanticInfoInTokens.eyp"
__PACKAGE__->YYLexer( 
  sub { # lexical analyzer
    my $self = $_[0]; 
    for (${$self->input()}) {  # contextualize
#line 15 "SemanticInfoInTokens.eyp"
      
    my $hexflag = $self->{HEXFLAG};

    m{\G\s*(\#.*)?}gc;

    m{\G(HEX\b|INT\b)}igc and return (uc($1), $1);

    m{(\G\d+)}gc and return ('INTEGER', $hexflag? hex($1) : $1);


    m{\G([a-zA-Z_]\w*)}gc and do {
        my $match = $1;
        $hexflag and !exists($st{$match}) and $match =~ m{^([A-F0-9]+$)}gc and return ('INTEGER', hex($match)); 
        return ('ID', $1);
    };

    m{\G(.)}gc and return ($1, $1);

    return('',undef);
         
#line 60 ./SemanticInfoInTokens.pm
      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      die("Error inside the lexical analyzer. Line: 34. File: SemanticInfoInTokens.eyp. No regexp matched.\n");
    } 
  } # end lexical analyzer
);




#line 70 ./SemanticInfoInTokens.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@SemanticInfoInTokens::ISA variable inside the header section of the eyapp program?
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
  [ 'HEX' => 'expr', [ 'HEX', '(', '@13-2', 'expr', ')' ], 1 ],
  [ '_CODE' => '@13-2', [  ], 1 ],
  [ 'ASSIGN' => 'expr', [ 'id', '=', 'expr' ], 1 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 1 ],
  [ 'id_17' => 'id', [ 'ID' ], 1 ],
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
  'ASSIGN' => 15,
  'PLUS' => 16,
  'id_17' => 17,
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
    yyFILENAME  => 'SemanticInfoInTokens.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'INT' => 2
		},
		DEFAULT => -4,
		GOTOS => {
			'stmt' => 4,
			'STAR-2' => 5,
			'STAR-1' => 1,
			'decl' => 3
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
			'ID' => 7
		},
		GOTOS => {
			'PLUS-4' => 8
		}
	},
	{#State 3
		DEFAULT => -2
	},
	{#State 4
		ACTIONS => {
			'' => 9
		}
	},
	{#State 5
		ACTIONS => {
			'HEX' => 11,
			'ID' => 12,
			'INTEGER' => 14
		},
		GOTOS => {
			'PLUS-3' => 10,
			'id' => 13,
			'expr' => 15
		}
	},
	{#State 6
		ACTIONS => {
			'INT' => 2
		},
		GOTOS => {
			'decl' => 16
		}
	},
	{#State 7
		DEFAULT => -9
	},
	{#State 8
		ACTIONS => {
			"," => 17
		},
		DEFAULT => -10
	},
	{#State 9
		DEFAULT => 0
	},
	{#State 10
		ACTIONS => {
			";" => 18
		},
		DEFAULT => -7
	},
	{#State 11
		ACTIONS => {
			"(" => 19
		}
	},
	{#State 12
		ACTIONS => {
			"=" => -17
		},
		DEFAULT => -11
	},
	{#State 13
		ACTIONS => {
			"=" => 20
		}
	},
	{#State 14
		DEFAULT => -12
	},
	{#State 15
		ACTIONS => {
			"+" => 21
		},
		DEFAULT => -6
	},
	{#State 16
		DEFAULT => -1
	},
	{#State 17
		ACTIONS => {
			'ID' => 22
		}
	},
	{#State 18
		ACTIONS => {
			'ID' => 12,
			'HEX' => 11,
			'INTEGER' => 14
		},
		GOTOS => {
			'id' => 13,
			'expr' => 23
		}
	},
	{#State 19
		DEFAULT => -14,
		GOTOS => {
			'@13-2' => 24
		}
	},
	{#State 20
		ACTIONS => {
			'INTEGER' => 14,
			'ID' => 12,
			'HEX' => 11
		},
		GOTOS => {
			'id' => 13,
			'expr' => 25
		}
	},
	{#State 21
		ACTIONS => {
			'INTEGER' => 14,
			'ID' => 12,
			'HEX' => 11
		},
		GOTOS => {
			'expr' => 26,
			'id' => 13
		}
	},
	{#State 22
		DEFAULT => -8
	},
	{#State 23
		ACTIONS => {
			"+" => 21
		},
		DEFAULT => -5
	},
	{#State 24
		ACTIONS => {
			'ID' => 12,
			'HEX' => 11,
			'INTEGER' => 14
		},
		GOTOS => {
			'id' => 13,
			'expr' => 27
		}
	},
	{#State 25
		ACTIONS => {
			"+" => 21
		},
		DEFAULT => -15
	},
	{#State 26
		DEFAULT => -16
	},
	{#State 27
		ACTIONS => {
			")" => 28,
			"+" => 21
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
#line 329 ./SemanticInfoInTokens.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 3,
sub {
#line 43 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 336 ./SemanticInfoInTokens.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 1,
sub {
#line 43 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 343 ./SemanticInfoInTokens.pm
	],
	[#Rule _STAR_LIST
		 'STAR-2', 1,
sub {
#line 43 "SemanticInfoInTokens.eyp"
 { $_[1] } # optimize 
}
#line 351 ./SemanticInfoInTokens.pm
	],
	[#Rule _STAR_LIST
		 'STAR-2', 0,
sub {
#line 43 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 358 ./SemanticInfoInTokens.pm
	],
	[#Rule EXPS
		 'PLUS-3', 3,
sub {
#line 43 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 365 ./SemanticInfoInTokens.pm
	],
	[#Rule EXPS
		 'PLUS-3', 1,
sub {
#line 43 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 372 ./SemanticInfoInTokens.pm
	],
	[#Rule stmt_7
		 'stmt', 2,
sub {
#line 44 "SemanticInfoInTokens.eyp"

        # make the symbol table an attribute 
        # of the root node
        $_[2]->{st} = { %st };
        $_[2];
      }
#line 384 ./SemanticInfoInTokens.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-4', 3,
sub {
#line 53 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 391 ./SemanticInfoInTokens.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-4', 1,
sub {
#line 53 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 398 ./SemanticInfoInTokens.pm
	],
	[#Rule decl_10
		 'decl', 2,
sub {
#line 54 "SemanticInfoInTokens.eyp"

        # insert identifiers in the symbol table
        $st{$_->{attr}} = 1 for $_[2]->children();
      }
#line 408 ./SemanticInfoInTokens.pm
	],
	[#Rule ID
		 'expr', 1,
sub {
#line 39 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 415 ./SemanticInfoInTokens.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 39 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 422 ./SemanticInfoInTokens.pm
	],
	[#Rule HEX
		 'expr', 5,
sub {
#line 67 "SemanticInfoInTokens.eyp"
my $expr = $_[4];  
        $_[0]->{HEXFLAG} = 0; 
        $expr;
      }
#line 432 ./SemanticInfoInTokens.pm
	],
	[#Rule _CODE
		 '@13-2', 0,
sub {
#line 66 "SemanticInfoInTokens.eyp"
 $_[0]->{HEXFLAG} = 1; }
#line 439 ./SemanticInfoInTokens.pm
	],
	[#Rule ASSIGN
		 'expr', 3,
sub {
#line 39 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 446 ./SemanticInfoInTokens.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 39 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 453 ./SemanticInfoInTokens.pm
	],
	[#Rule id_17
		 'id', 1,
sub {
#line 39 "SemanticInfoInTokens.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 460 ./SemanticInfoInTokens.pm
	]
],
#line 463 ./SemanticInfoInTokens.pm
    yybypass       => 1,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
      'HEX::expr' => 0,
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
         'ASSIGN', 
         'PLUS', 
         'id_17', );
  $self;
}

#line 80 "SemanticInfoInTokens.eyp"


# Context-dependant lexer

=head1 SYNOPSIS

Compile it with:

                   $ eyapp -C SemanticInfoInTokens.eyp

Run it with:

                  $ ./SemanticInfoInTokens.pm -t -i -f inputforsemanticinfo.txt

try also:

            ./SemanticInfoInTokens.pm -t -i -f inputforsemanticinfo2.txt

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


#line 580 ./SemanticInfoInTokens.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
