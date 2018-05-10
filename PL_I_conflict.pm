#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.168.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'PL_I_conflict.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package PL_I_conflict;
use strict;

push @PL_I_conflict::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "PL_I_conflict.eyp"

=head1 SYNOPSIS

This grammar deals with the famous ambiguous PL/I phrase:

                if then=if then if=then

The (partial) solution uses C<YYExpect> in the lexical analyzer to predict the token
that fulfills the parser expectatives.

Compile it with:

               eyapp -C PL_I_conflict.eyp

Run it with:

               ./PL_I_conflict.pm -t -c 'if if=then then then=if'

for more detail:

               ./PL_I_conflict.pm -d -t -c 'if if=then then then=if'

and also

               ./PL_I_conflict.pm -t -c 'if then=if then if=then'

The problem arises again

Also try:

                ./PL_I_conflict.pm -t -c 'if then=if then if a=b then c=d'

=cut

#line 42 "PL_I_conflict.eyp"
__PACKAGE__->YYLexer( 
  sub { # lexical analyzer
    my $self = $_[0]; 
    for (${$self->input()}) {  # contextualize
#line 42 "PL_I_conflict.eyp"
      
      m{\G\s*(\#.*)?}gc;

      m{\G([a-zA-Z_]\w*)}gc and do {
        my $id = $1;

        return ('if',   'if')   if ($id eq 'if')   && $self->expects('if') && /\G(?!\s*=)/;
        return ('then', 'then') if ($id eq 'then') && $self->expects('then');
        
        return ('ID', $id);
      };

      m{\G(.)}gc and return ($1, $1);

      return('',undef);
         
#line 88 ./PL_I_conflict.pm
      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      die("Error inside the lexical analyzer. Line: 57. File: PL_I_conflict.eyp. No regexp matched.\n");
    } 
  } # end lexical analyzer
);




#line 98 ./PL_I_conflict.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@PL_I_conflict::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.168',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'stmt', '$end' ], 1 ],
  [ 'stmt_1' => 'stmt', [ 'ifstmt' ], 1 ],
  [ 'stmt_2' => 'stmt', [ 'assignstmt' ], 1 ],
  [ 'IF' => 'ifstmt', [ 'if', 'expr', 'then', 'stmt' ], 1 ],
  [ 'ASSIGN' => 'assignstmt', [ 'id', '=', 'expr' ], 1 ],
  [ 'EQ' => 'expr', [ 'id', '=', 'id' ], 1 ],
  [ 'expr_6' => 'expr', [ 'id' ], 1 ],
  [ 'ID' => 'id', [ 'ID' ], 1 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'=' => { ISSEMANTIC => 0 },
	'if' => { ISSEMANTIC => 0 },
	'then' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'PL_I_conflict.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"if" => 2,
			'ID' => 1
		},
		GOTOS => {
			'stmt' => 3,
			'assignstmt' => 4,
			'ifstmt' => 5,
			'id' => 6
		}
	},
	{#State 1
		DEFAULT => -7
	},
	{#State 2
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'expr' => 7,
			'id' => 8
		}
	},
	{#State 3
		ACTIONS => {
			'' => 9
		}
	},
	{#State 4
		DEFAULT => -2
	},
	{#State 5
		DEFAULT => -1
	},
	{#State 6
		ACTIONS => {
			"=" => 10
		}
	},
	{#State 7
		ACTIONS => {
			"then" => 11
		}
	},
	{#State 8
		ACTIONS => {
			"=" => 12
		},
		DEFAULT => -6
	},
	{#State 9
		DEFAULT => 0
	},
	{#State 10
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'expr' => 13,
			'id' => 8
		}
	},
	{#State 11
		ACTIONS => {
			"if" => 2,
			'ID' => 1
		},
		GOTOS => {
			'stmt' => 14,
			'assignstmt' => 4,
			'ifstmt' => 5,
			'id' => 6
		}
	},
	{#State 12
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'id' => 15
		}
	},
	{#State 13
		DEFAULT => -4
	},
	{#State 14
		DEFAULT => -3
	},
	{#State 15
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 230 ./PL_I_conflict.pm
	],
	[#Rule stmt_1
		 'stmt', 1,
sub {
#line 59 "PL_I_conflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 237 ./PL_I_conflict.pm
	],
	[#Rule stmt_2
		 'stmt', 1,
sub {
#line 59 "PL_I_conflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 244 ./PL_I_conflict.pm
	],
	[#Rule IF
		 'ifstmt', 4,
sub {
#line 59 "PL_I_conflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 251 ./PL_I_conflict.pm
	],
	[#Rule ASSIGN
		 'assignstmt', 3,
sub {
#line 59 "PL_I_conflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 258 ./PL_I_conflict.pm
	],
	[#Rule EQ
		 'expr', 3,
sub {
#line 59 "PL_I_conflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 265 ./PL_I_conflict.pm
	],
	[#Rule expr_6
		 'expr', 1,
sub {
#line 59 "PL_I_conflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 272 ./PL_I_conflict.pm
	],
	[#Rule ID
		 'id', 1,
sub {
#line 59 "PL_I_conflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 279 ./PL_I_conflict.pm
	]
],
#line 282 ./PL_I_conflict.pm
    yybypass       => 1,
    yybuildingtree => 1,
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
         'stmt_1', 
         'stmt_2', 
         'IF', 
         'ASSIGN', 
         'EQ', 
         'expr_6', 
         'ID', );
  $self;
}

#line 87 "PL_I_conflict.eyp"






=for None

=cut


#line 318 ./PL_I_conflict.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
