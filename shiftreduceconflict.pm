#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.173.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'shiftreduceconflict.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package shiftreduceconflict;
use strict;

push @shiftreduceconflict::ISA, 'Parse::Eyapp::Driver';




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

      

      /\G(IF)/gc and return ($1, $1);
      /\G(ELSE)/gc and return ($1, $1);
      /\G(THEN)/gc and return ($1, $1);
      /\G(EXPR)/gc and return ($1, $1);
      /\G(OTHERSTMT)/gc and return ($1, $1);


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


#line 65 ./shiftreduceconflict.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@shiftreduceconflict::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.173',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'stmt', '$end' ], 0 ],
  [ 'stmt_1' => 'stmt', [ 'IF', 'expr', 'THEN', 'stmt' ], 0 ],
  [ 'stmt_2' => 'stmt', [ 'IF', 'expr', 'THEN', 'stmt', 'ELSE', 'stmt' ], 0 ],
  [ 'stmt_3' => 'stmt', [ 'OTHERSTMT' ], 0 ],
  [ 'expr_4' => 'expr', [ 'EXPR' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'stmt_1' => 1,
  'stmt_2' => 2,
  'stmt_3' => 3,
  'expr_4' => 4,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	ELSE => { ISSEMANTIC => 1 },
	EXPR => { ISSEMANTIC => 1 },
	IF => { ISSEMANTIC => 1 },
	OTHERSTMT => { ISSEMANTIC => 1 },
	THEN => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'shiftreduceconflict.eyp',
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
			'' => -1,
			'ELSE' => 9
		}
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
#line 174 ./shiftreduceconflict.pm
	],
	[#Rule stmt_1
		 'stmt', 4, undef
#line 178 ./shiftreduceconflict.pm
	],
	[#Rule stmt_2
		 'stmt', 6, undef
#line 182 ./shiftreduceconflict.pm
	],
	[#Rule stmt_3
		 'stmt', 1, undef
#line 186 ./shiftreduceconflict.pm
	],
	[#Rule expr_4
		 'expr', 1, undef
#line 190 ./shiftreduceconflict.pm
	]
],
#line 193 ./shiftreduceconflict.pm
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
         'stmt_1', 
         'stmt_2', 
         'stmt_3', 
         'expr_4', );
  $self;
}

#line 12 "shiftreduceconflict.eyp"



=for None

=cut


#line 223 ./shiftreduceconflict.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
