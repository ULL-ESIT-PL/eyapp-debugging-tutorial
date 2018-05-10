#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'CplusplusExplorerOnly.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package CplusplusExplorerOnly;
use strict;

push @CplusplusExplorerOnly::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "CplusplusExplorerOnly.eyp"

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


#line 71 ./CplusplusExplorerOnly.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@CplusplusExplorerOnly::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'prog', '$end' ], 1 ],
  [ 'EMPTY' => 'prog', [  ], 1 ],
  [ 'PROG' => 'prog', [ 'prog', 'decORexp_explorer', 'stmt' ], 1 ],
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
  [ 'decORexp_explorer' => 'decORexp_explorer', [  ], 1 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'EMPTY' => 1,
  'PROG' => 2,
  'EXP' => 3,
  'DECL' => 4,
  ':EXP' => 5,
  'ID:EXP' => 5,
  'NUM' => 6,
  'TYPECAST' => 7,
  'PLUS' => 8,
  'ASSIGN' => 9,
  'DECLARATOR' => 10,
  'DECLARATORINIT' => 11,
  ':DEC' => 12,
  'ID:DEC' => 12,
  'declarator_13' => 13,
  'decORexp' => 14,
  'decORexp_explorer' => 15,
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
    yyFILENAME  => 'CplusplusExplorerOnly.eyp',
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
			'' => 2
		},
		DEFAULT => -15,
		GOTOS => {
			'decORexp_explorer' => 3
		}
	},
	{#State 2
		DEFAULT => 0
	},
	{#State 3
		ACTIONS => {
			'ID' => 5,
			'NUM' => 4,
			'INT' => 9
		},
		GOTOS => {
			'stmt' => 6,
			'expr' => 8,
			'decl' => 7
		}
	},
	{#State 4
		DEFAULT => -6
	},
	{#State 5
		DEFAULT => -14,
		GOTOS => {
			'decORexp' => 10
		}
	},
	{#State 6
		DEFAULT => -2
	},
	{#State 7
		DEFAULT => -4
	},
	{#State 8
		ACTIONS => {
			";" => 12,
			"+" => 11,
			"=" => 13
		}
	},
	{#State 9
		ACTIONS => {
			'ID' => 14,
			"(" => 15
		},
		GOTOS => {
			'declarator' => 16
		}
	},
	{#State 10
		DEFAULT => -5
	},
	{#State 11
		ACTIONS => {
			'ID' => 5,
			'NUM' => 4,
			'INT' => 18
		},
		GOTOS => {
			'expr' => 17
		}
	},
	{#State 12
		DEFAULT => -3
	},
	{#State 13
		ACTIONS => {
			'ID' => 5,
			'NUM' => 4,
			'INT' => 18
		},
		GOTOS => {
			'expr' => 19
		}
	},
	{#State 14
		DEFAULT => -14,
		GOTOS => {
			'decORexp' => 20
		}
	},
	{#State 15
		ACTIONS => {
			'ID' => 21,
			'NUM' => 4,
			"(" => 22,
			'INT' => 18
		},
		GOTOS => {
			'expr' => 23,
			'declarator' => 24
		}
	},
	{#State 16
		ACTIONS => {
			";" => 25,
			"=" => 26
		}
	},
	{#State 17
		DEFAULT => -8
	},
	{#State 18
		ACTIONS => {
			"(" => 27
		}
	},
	{#State 19
		ACTIONS => {
			"+" => 11,
			"=" => 13
		},
		DEFAULT => -9
	},
	{#State 20
		DEFAULT => -12
	},
	{#State 21
		DEFAULT => -14,
		GOTOS => {
			'decORexp' => 28
		}
	},
	{#State 22
		ACTIONS => {
			'ID' => 14,
			"(" => 22
		},
		GOTOS => {
			'declarator' => 24
		}
	},
	{#State 23
		ACTIONS => {
			"+" => 11,
			")" => 29,
			"=" => 13
		}
	},
	{#State 24
		ACTIONS => {
			")" => 30
		}
	},
	{#State 25
		DEFAULT => -10
	},
	{#State 26
		ACTIONS => {
			'ID' => 5,
			'NUM' => 4,
			'INT' => 18
		},
		GOTOS => {
			'expr' => 31
		}
	},
	{#State 27
		ACTIONS => {
			'ID' => 5,
			'NUM' => 4,
			'INT' => 18
		},
		GOTOS => {
			'expr' => 23
		}
	},
	{#State 28
		DEFAULT => -5
	},
	{#State 29
		DEFAULT => -7
	},
	{#State 30
		DEFAULT => -13
	},
	{#State 31
		ACTIONS => {
			";" => 32,
			"+" => 11,
			"=" => 13
		}
	},
	{#State 32
		DEFAULT => -11
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 342 ./CplusplusExplorerOnly.pm
	],
	[#Rule EMPTY
		 'prog', 0,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 349 ./CplusplusExplorerOnly.pm
	],
	[#Rule PROG
		 'prog', 3,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 356 ./CplusplusExplorerOnly.pm
	],
	[#Rule EXP
		 'stmt', 2,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 363 ./CplusplusExplorerOnly.pm
	],
	[#Rule DECL
		 'stmt', 1,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 370 ./CplusplusExplorerOnly.pm
	],
	[#Rule ID:EXP
		 'expr', 2,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 377 ./CplusplusExplorerOnly.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 384 ./CplusplusExplorerOnly.pm
	],
	[#Rule TYPECAST
		 'expr', 4,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 391 ./CplusplusExplorerOnly.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 398 ./CplusplusExplorerOnly.pm
	],
	[#Rule ASSIGN
		 'expr', 3,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 405 ./CplusplusExplorerOnly.pm
	],
	[#Rule DECLARATOR
		 'decl', 3,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 412 ./CplusplusExplorerOnly.pm
	],
	[#Rule DECLARATORINIT
		 'decl', 5,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 419 ./CplusplusExplorerOnly.pm
	],
	[#Rule ID:DEC
		 'declarator', 2,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 426 ./CplusplusExplorerOnly.pm
	],
	[#Rule declarator_13
		 'declarator', 3,
sub {
#line 30 "CplusplusExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 433 ./CplusplusExplorerOnly.pm
	],
	[#Rule decORexp
		 'decORexp', 0,
sub {
#line 73 "CplusplusExplorerOnly.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 17 "CplusplusExplorerOnly.eyp" 
 
#line 443 ./CplusplusExplorerOnly.pm
  }
}
#line 446 ./CplusplusExplorerOnly.pm
	],
	[#Rule decORexp_explorer
		 'decORexp_explorer', 0,
sub {
#line 73 "CplusplusExplorerOnly.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 19 "CplusplusExplorerOnly.eyp" 

   #print "***********************\n";
   $ISDEC = $self->YYPreParse('decl', 
      #0xF # debug
   ); 
  if ($ISDEC) { $self->YYSetReduce2('ID:DEC' ); }
  else { $self->YYSetReduce2('ID:EXP' ); }
#line 462 ./CplusplusExplorerOnly.pm
  }

}
#line 466 ./CplusplusExplorerOnly.pm
	]
],
#line 469 ./CplusplusExplorerOnly.pm
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
                          'explorerline' => 19,
                          'totalviewpoint' => 1,
                          'states' => [
                                        {
                                          '28' => [
                                                    ')'
                                                  ]
                                        }
                                      ],
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
         'decORexp', 
         'decORexp_explorer', );
  $self;
}

#line 73 "CplusplusExplorerOnly.eyp"


####################################################

=head1 SYNOPSIS

Compile it with
 
   eyapp -C CplusplusExplorerOnly

This compiletion must produce warnings

   eyapp -S decl -C CplusplusExplorerOnly

Execution:

  ./CplusplusExplorerOnly.pm -t -i -c 'int (x) + 2; int (z) = 4;'

=cut


#line 545 ./CplusplusExplorerOnly.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
