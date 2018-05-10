#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.177.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'PLIConflictNested.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package PLIConflictNested;
use strict;

push @PLIConflictNested::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "PLIConflictNested.eyp"

=head1 SYNOPSIS

This grammar deals with the famous ambiguous PL/I phrase:

                if then=if then if=then

The (partial) solution uses C<YYExpect> in the lexical analyzer to predict the token
that fulfills the parser expectatives.

Compile it with:

               eyapp -C PLIConflictNested.eyp
               eyapp -P Assign.eyp

Run it with:

               ./PLIConflictNested.pm -t -c 'if if=then then then=if'

for more detail:

               ./PLIConflictNested.pm -d -t -c 'if if=then then then=if'

and also

               ./PLIConflictNested.pm -t -i -c 'if then=if then if=then

The problem arises again

Also try:

                ./PLIConflictNested.pm -t -c 'if then=if then if a=b then c=d'

=cut



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\=)}gc and return ($1, $1);

      $self->expects('then') and /\Gthen\b/gc and return ('then', $1);
 
                  my $pos = pos();
                  if (/\Gif\b/gc) { 
                    if ($self->expects('if')) {   
                       if (!$self->YYPreParse('Assign')) {
                         return ('if', 'if'); 
                       }
                    }
                  }
                  pos($_) = $pos;
               
      /\G([a-zA-Z_]\w*)/gc and return ('ID', $1);


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


#line 109 ./PLIConflictNested.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@PLIConflictNested::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.177',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'stmt', '$end' ], 1 ],
  [ 'stmt_1' => 'stmt', [ 'ifstmt' ], 1 ],
  [ 'stmt_2' => 'stmt', [ 'assignstmt' ], 1 ],
  [ 'IF' => 'ifstmt', [ 'if', 'expr', 'then', 'stmt' ], 1 ],
  [ 'ASSIGN' => 'assignstmt', [ 'id', '=', 'expr' ], 1 ],
  [ 'EQ' => 'expr', [ 'id', '=', 'id' ], 1 ],
  [ 'expr_6' => 'expr', [ 'id' ], 1 ],
  [ 'ID' => 'id', [ 'ID' ], 1 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'stmt_1' => 1,
  'stmt_2' => 2,
  'IF' => 3,
  'ASSIGN' => 4,
  'EQ' => 5,
  'expr_6' => 6,
  'ID' => 7,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'=' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	if => { ISSEMANTIC => 1 },
	then => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'PLIConflictNested.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'ID' => 1,
			'if' => 6
		},
		GOTOS => {
			'stmt' => 2,
			'assignstmt' => 3,
			'ifstmt' => 4,
			'id' => 5
		}
	},
	{#State 1
		DEFAULT => -7
	},
	{#State 2
		ACTIONS => {
			'' => 7
		}
	},
	{#State 3
		DEFAULT => -2
	},
	{#State 4
		DEFAULT => -1
	},
	{#State 5
		ACTIONS => {
			"=" => 8
		}
	},
	{#State 6
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'expr' => 9,
			'id' => 10
		}
	},
	{#State 7
		DEFAULT => 0
	},
	{#State 8
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'expr' => 11,
			'id' => 10
		}
	},
	{#State 9
		ACTIONS => {
			'then' => 12
		}
	},
	{#State 10
		ACTIONS => {
			"=" => 13
		},
		DEFAULT => -6
	},
	{#State 11
		DEFAULT => -4
	},
	{#State 12
		ACTIONS => {
			'ID' => 1,
			'if' => 6
		},
		GOTOS => {
			'stmt' => 14,
			'assignstmt' => 3,
			'ifstmt' => 4,
			'id' => 5
		}
	},
	{#State 13
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'id' => 15
		}
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
#line 252 ./PLIConflictNested.pm
	],
	[#Rule stmt_1
		 'stmt', 1,
sub {
#line 55 "PLIConflictNested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 259 ./PLIConflictNested.pm
	],
	[#Rule stmt_2
		 'stmt', 1,
sub {
#line 55 "PLIConflictNested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 266 ./PLIConflictNested.pm
	],
	[#Rule IF
		 'ifstmt', 4,
sub {
#line 55 "PLIConflictNested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 273 ./PLIConflictNested.pm
	],
	[#Rule ASSIGN
		 'assignstmt', 3,
sub {
#line 55 "PLIConflictNested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 280 ./PLIConflictNested.pm
	],
	[#Rule EQ
		 'expr', 3,
sub {
#line 55 "PLIConflictNested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 287 ./PLIConflictNested.pm
	],
	[#Rule expr_6
		 'expr', 1,
sub {
#line 55 "PLIConflictNested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 294 ./PLIConflictNested.pm
	],
	[#Rule ID
		 'id', 1,
sub {
#line 55 "PLIConflictNested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 301 ./PLIConflictNested.pm
	]
],
#line 304 ./PLIConflictNested.pm
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

#line 83 "PLIConflictNested.eyp"






=for None

=cut


#line 340 ./PLIConflictNested.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
