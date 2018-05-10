#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'CplusplusStartOption.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package CplusplusStartOption;
use strict;

push @CplusplusStartOption::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "CplusplusStartOption.eyp"

my $INT    = '(int)\b';
my $ID     = '([a-zA-Z_][a-zA-Z_0-9]*)';
my $NUM    = '(\d+)';

my $ISDEC;



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\(|\+|\;|\)|\=)}gc and return ($1, $1);

      /\G$NUM/gc and return ('NUM', $1);
      /\G$INT/gc and return ('INT', $1);
      /\G$ID/gc and return ('ID', $1);


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


#line 71 ./CplusplusStartOption.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@CplusplusStartOption::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'decl', '$end' ], 1 ],
  [ 'ID:EXP' => 'expr', [ 'ID', 'decORexp' ], 1 ],
  [ 'NUM' => 'expr', [ 'NUM' ], 1 ],
  [ 'TYPECAST' => 'expr', [ 'INT', '(', 'expr', ')' ], 1 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 1 ],
  [ 'ASSIGN' => 'expr', [ 'expr', '=', 'expr' ], 1 ],
  [ 'DECLARATOR' => 'decl', [ 'INT', 'declarator', ';' ], 1 ],
  [ 'DECLARATORINIT' => 'decl', [ 'INT', 'declarator', '=', 'expr', ';' ], 1 ],
  [ 'ID:DEC' => 'declarator', [ 'ID', 'decORexp' ], 1 ],
  [ 'declarator_9' => 'declarator', [ '(', 'declarator', ')' ], 1 ],
  [ 'decORexp' => 'decORexp', [  ], 1 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  ':EXP' => 1,
  'ID:EXP' => 1,
  'NUM' => 2,
  'TYPECAST' => 3,
  'PLUS' => 4,
  'ASSIGN' => 5,
  'DECLARATOR' => 6,
  'DECLARATORINIT' => 7,
  ':DEC' => 8,
  'ID:DEC' => 8,
  'declarator_9' => 9,
  'decORexp' => 10,
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
    yyFILENAME  => 'CplusplusStartOption.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'INT' => 2
		},
		GOTOS => {
			'decl' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 3
		}
	},
	{#State 2
		ACTIONS => {
			'ID' => 4,
			"(" => 5
		},
		GOTOS => {
			'declarator' => 6
		}
	},
	{#State 3
		DEFAULT => 0
	},
	{#State 4
		DEFAULT => -10,
		GOTOS => {
			'decORexp' => 7
		}
	},
	{#State 5
		ACTIONS => {
			'ID' => 4,
			"(" => 5
		},
		GOTOS => {
			'declarator' => 8
		}
	},
	{#State 6
		ACTIONS => {
			";" => 9,
			"=" => 10
		}
	},
	{#State 7
		DEFAULT => -8
	},
	{#State 8
		ACTIONS => {
			")" => 11
		}
	},
	{#State 9
		DEFAULT => -6
	},
	{#State 10
		ACTIONS => {
			'ID' => 13,
			'NUM' => 12,
			'INT' => 15
		},
		GOTOS => {
			'expr' => 14
		}
	},
	{#State 11
		DEFAULT => -9
	},
	{#State 12
		DEFAULT => -2
	},
	{#State 13
		DEFAULT => -10,
		GOTOS => {
			'decORexp' => 16
		}
	},
	{#State 14
		ACTIONS => {
			";" => 18,
			"+" => 17,
			"=" => 19
		}
	},
	{#State 15
		ACTIONS => {
			"(" => 20
		}
	},
	{#State 16
		DEFAULT => -1
	},
	{#State 17
		ACTIONS => {
			'ID' => 13,
			'NUM' => 12,
			'INT' => 15
		},
		GOTOS => {
			'expr' => 21
		}
	},
	{#State 18
		DEFAULT => -7
	},
	{#State 19
		ACTIONS => {
			'ID' => 13,
			'NUM' => 12,
			'INT' => 15
		},
		GOTOS => {
			'expr' => 22
		}
	},
	{#State 20
		ACTIONS => {
			'ID' => 13,
			'NUM' => 12,
			'INT' => 15
		},
		GOTOS => {
			'expr' => 23
		}
	},
	{#State 21
		DEFAULT => -4
	},
	{#State 22
		ACTIONS => {
			"+" => 17,
			"=" => 19
		},
		DEFAULT => -5
	},
	{#State 23
		ACTIONS => {
			"+" => 17,
			")" => 24,
			"=" => 19
		}
	},
	{#State 24
		DEFAULT => -3
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 281 ./CplusplusStartOption.pm
	],
	[#Rule ID:EXP
		 'expr', 2,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 288 ./CplusplusStartOption.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 295 ./CplusplusStartOption.pm
	],
	[#Rule TYPECAST
		 'expr', 4,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 302 ./CplusplusStartOption.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 309 ./CplusplusStartOption.pm
	],
	[#Rule ASSIGN
		 'expr', 3,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 316 ./CplusplusStartOption.pm
	],
	[#Rule DECLARATOR
		 'decl', 3,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 323 ./CplusplusStartOption.pm
	],
	[#Rule DECLARATORINIT
		 'decl', 5,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 330 ./CplusplusStartOption.pm
	],
	[#Rule ID:DEC
		 'declarator', 2,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 337 ./CplusplusStartOption.pm
	],
	[#Rule declarator_9
		 'declarator', 3,
sub {
#line 31 "CplusplusStartOption.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 344 ./CplusplusStartOption.pm
	],
	[#Rule decORexp
		 'decORexp', 0,
sub {
#line 75 "CplusplusStartOption.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 17 "CplusplusStartOption.eyp" 

  if ($ISDEC) { $self->YYSetReduce(')', 'ID:DEC' ); }
  else { $self->YYSetReduce(')', 'ID:EXP' ); }
#line 356 ./CplusplusStartOption.pm
  }

}
#line 360 ./CplusplusStartOption.pm
	]
],
#line 363 ./CplusplusStartOption.pm
    yybypass       => 1,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'decORexp' => {
                          'production' => {
                                            '-5' => [
                                                      1
                                                    ],
                                            '-12' => [
                                                       1
                                                     ]
                                          },
                          'explorerline' => 22,
                          'totalviewpoint' => 1,
                          'total' => 2,
                          'line' => 17
                        }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'ID:EXP', 
         'NUM', 
         'TYPECAST', 
         'PLUS', 
         'ASSIGN', 
         'DECLARATOR', 
         'DECLARATORINIT', 
         'ID:DEC', 
         'declarator_9', 
         'decORexp', );
  $self;
}

#line 75 "CplusplusStartOption.eyp"


####################################################

=head1 SYNOPSIS

Compile it with
 
   eyapp -C CplusplusStartOption

This compiletion must produce warnings

   eyapp -S decl -C CplusplusStartOption

=cut


#line 423 ./CplusplusStartOption.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
