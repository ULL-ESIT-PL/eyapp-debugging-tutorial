#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.173.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'reducereduceconflict_fix1.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package reducereduceconflict_fix1;
use strict;

push @reducereduceconflict_fix1::ISA, 'Parse::Eyapp::Driver';




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
      

      /\G([ \t]*(?:#.*)?)/gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(BOGUS|\:|\,)}gc and return ($1, $1);

      /\G([A-Za-z][A-Za-z0-9_]*)/gc and return ('ID', $1);


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


#line 61 ./reducereduceconflict_fix1.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@reducereduceconflict_fix1::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.173',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'def', '$end' ], 0 ],
  [ 'def_is_paramSpec_returnSpec' => 'def', [ 'param_spec', 'return_spec', ',' ], 0 ],
  [ 'paramSpec_is_type' => 'param_spec', [ 'type' ], 0 ],
  [ 'paramSpec_is_nameList_type' => 'param_spec', [ 'name_list', ':', 'type' ], 0 ],
  [ 'returnSpec_is_type' => 'return_spec', [ 'type' ], 0 ],
  [ 'returnSpec_is_name_type' => 'return_spec', [ 'name', ':', 'type' ], 0 ],
  [ 'returnSpec_is_ID_BOGUS' => 'return_spec', [ 'ID', 'BOGUS' ], 0 ],
  [ 'type_is_ID' => 'type', [ 'ID' ], 0 ],
  [ 'name_is_ID' => 'name', [ 'ID' ], 0 ],
  [ 'nameList_is_name' => 'name_list', [ 'name' ], 0 ],
  [ 'nameList_is_name_nameList' => 'name_list', [ 'name', ',', 'name_list' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'def_is_paramSpec_returnSpec' => 1,
  'paramSpec_is_type' => 2,
  'paramSpec_is_nameList_type' => 3,
  'returnSpec_is_type' => 4,
  'returnSpec_is_name_type' => 5,
  'returnSpec_is_ID_BOGUS' => 6,
  'type_is_ID' => 7,
  'name_is_ID' => 8,
  'nameList_is_name' => 9,
  'nameList_is_name_nameList' => 10,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	',' => { ISSEMANTIC => 0 },
	':' => { ISSEMANTIC => 0 },
	BOGUS => { ISSEMANTIC => 1 },
	ID => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'reducereduceconflict_fix1.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'param_spec' => 2,
			'def' => 3,
			'name_list' => 5,
			'name' => 4,
			'type' => 6
		}
	},
	{#State 1
		ACTIONS => {
			":" => -8,
			'ID' => -7,
			"," => -8
		}
	},
	{#State 2
		ACTIONS => {
			'ID' => 7
		},
		GOTOS => {
			'name' => 8,
			'return_spec' => 10,
			'type' => 9
		}
	},
	{#State 3
		ACTIONS => {
			'' => 11
		}
	},
	{#State 4
		ACTIONS => {
			":" => -9,
			"," => 12
		}
	},
	{#State 5
		ACTIONS => {
			":" => 13
		}
	},
	{#State 6
		DEFAULT => -2
	},
	{#State 7
		ACTIONS => {
			":" => -8,
			"," => -7,
			'BOGUS' => 14
		}
	},
	{#State 8
		ACTIONS => {
			":" => 15
		}
	},
	{#State 9
		DEFAULT => -4
	},
	{#State 10
		ACTIONS => {
			"," => 16
		}
	},
	{#State 11
		DEFAULT => 0
	},
	{#State 12
		ACTIONS => {
			'ID' => 17
		},
		GOTOS => {
			'name_list' => 18,
			'name' => 4
		}
	},
	{#State 13
		ACTIONS => {
			'ID' => 19
		},
		GOTOS => {
			'type' => 20
		}
	},
	{#State 14
		DEFAULT => -6
	},
	{#State 15
		ACTIONS => {
			'ID' => 19
		},
		GOTOS => {
			'type' => 21
		}
	},
	{#State 16
		DEFAULT => -1
	},
	{#State 17
		DEFAULT => -8
	},
	{#State 18
		DEFAULT => -10
	},
	{#State 19
		DEFAULT => -7
	},
	{#State 20
		DEFAULT => -3
	},
	{#State 21
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 235 ./reducereduceconflict_fix1.pm
	],
	[#Rule def_is_paramSpec_returnSpec
		 'def', 3,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 242 ./reducereduceconflict_fix1.pm
	],
	[#Rule paramSpec_is_type
		 'param_spec', 1,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 249 ./reducereduceconflict_fix1.pm
	],
	[#Rule paramSpec_is_nameList_type
		 'param_spec', 3,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 256 ./reducereduceconflict_fix1.pm
	],
	[#Rule returnSpec_is_type
		 'return_spec', 1,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 263 ./reducereduceconflict_fix1.pm
	],
	[#Rule returnSpec_is_name_type
		 'return_spec', 3,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 270 ./reducereduceconflict_fix1.pm
	],
	[#Rule returnSpec_is_ID_BOGUS
		 'return_spec', 2,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 277 ./reducereduceconflict_fix1.pm
	],
	[#Rule type_is_ID
		 'type', 1,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 284 ./reducereduceconflict_fix1.pm
	],
	[#Rule name_is_ID
		 'name', 1,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 291 ./reducereduceconflict_fix1.pm
	],
	[#Rule nameList_is_name
		 'name_list', 1,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 298 ./reducereduceconflict_fix1.pm
	],
	[#Rule nameList_is_name_nameList
		 'name_list', 3,
sub {
#line 7 "reducereduceconflict_fix1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 305 ./reducereduceconflict_fix1.pm
	]
],
#line 308 ./reducereduceconflict_fix1.pm
    yybypass       => 0,
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
         'def_is_paramSpec_returnSpec', 
         'paramSpec_is_type', 
         'paramSpec_is_nameList_type', 
         'returnSpec_is_type', 
         'returnSpec_is_name_type', 
         'returnSpec_is_ID_BOGUS', 
         'type_is_ID', 
         'name_is_ID', 
         'nameList_is_name', 
         'nameList_is_name_nameList', );
  $self;
}

#line 30 "reducereduceconflict_fix1.eyp"



=for None

=cut


#line 344 ./reducereduceconflict_fix1.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
