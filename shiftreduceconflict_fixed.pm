#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.173.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'shiftreduceconflict_fixed.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package shiftreduceconflict_fixed;
use strict;

push @shiftreduceconflict_fixed::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      

      /\G(?i:if)/gc and return ('IF', $1);
      /\G(?i:else)/gc and return ('ELSE', $1);
      /\G(?i:then)/gc and return ('THEN', $1);
      /\G(?i:(e))/gc and return ('EXPR', $1);
      /\G(?i:(o))/gc and return ('OTHERSTMT', $1);


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


#line 65 ./shiftreduceconflict_fixed.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@shiftreduceconflict_fixed::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.173',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'stmt', '$end' ], 1 ],
  [ 'IFTHEN' => 'stmt', [ 'IF', 'expr', 'THEN', 'stmt' ], 1 ],
  [ 'IFTHENELSE' => 'stmt', [ 'IF', 'expr', 'THEN', 'stmt', 'ELSE', 'stmt' ], 1 ],
  [ 'stmt_3' => 'stmt', [ 'OTHERSTMT' ], 1 ],
  [ 'expr_4' => 'expr', [ 'EXPR' ], 1 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'IFTHEN' => 1,
  'IFTHENELSE' => 2,
  'stmt_3' => 3,
  'expr_4' => 4,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	ELSE => { ISSEMANTIC => 0 },
	EXPR => { ISSEMANTIC => 1 },
	IF => { ISSEMANTIC => 0 },
	OTHERSTMT => { ISSEMANTIC => 1 },
	THEN => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'shiftreduceconflict_fixed.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'IF' => 2,
			'OTHERSTMT' => 3
		},
		GOTOS => {
			'stmt' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 4
		}
	},
	{#State 2
		ACTIONS => {
			'EXPR' => 6
		},
		GOTOS => {
			'expr' => 5
		}
	},
	{#State 3
		DEFAULT => -3
	},
	{#State 4
		DEFAULT => 0
	},
	{#State 5
		ACTIONS => {
			'THEN' => 7
		}
	},
	{#State 6
		DEFAULT => -4
	},
	{#State 7
		ACTIONS => {
			'IF' => 2,
			'OTHERSTMT' => 3
		},
		GOTOS => {
			'stmt' => 8
		}
	},
	{#State 8
		ACTIONS => {
			'ELSE' => 9
		},
		DEFAULT => -1
	},
	{#State 9
		ACTIONS => {
			'IF' => 2,
			'OTHERSTMT' => 3
		},
		GOTOS => {
			'stmt' => 10
		}
	},
	{#State 10
		DEFAULT => -2
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 174 ./shiftreduceconflict_fixed.pm
	],
	[#Rule IFTHEN
		 'stmt', 4,
sub {
#line 24 "shiftreduceconflict_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 181 ./shiftreduceconflict_fixed.pm
	],
	[#Rule IFTHENELSE
		 'stmt', 6,
sub {
#line 24 "shiftreduceconflict_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 188 ./shiftreduceconflict_fixed.pm
	],
	[#Rule stmt_3
		 'stmt', 1,
sub {
#line 24 "shiftreduceconflict_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 195 ./shiftreduceconflict_fixed.pm
	],
	[#Rule expr_4
		 'expr', 1,
sub {
#line 24 "shiftreduceconflict_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 202 ./shiftreduceconflict_fixed.pm
	]
],
#line 205 ./shiftreduceconflict_fixed.pm
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
         'IFTHEN', 
         'IFTHENELSE', 
         'stmt_3', 
         'expr_4', );
  $self;
}

#line 37 "shiftreduceconflict_fixed.eyp"



=for None

=cut


#line 235 ./shiftreduceconflict_fixed.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
