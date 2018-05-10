#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.173.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'reducereduceconflict.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package reducereduceconflict;
use strict;

push @reducereduceconflict::ISA, 'Parse::Eyapp::Driver';




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

      m{\G(\:|\,)}gc and return ($1, $1);

      /\G([A-Za-z][A-Za-z0-9_]*)/gc and return ('VAR', $1);


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


#line 61 ./reducereduceconflict.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@reducereduceconflict::ISA variable inside the header section of the eyapp program?
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
  [ 'type_is_VAR' => 'type', [ 'VAR' ], 0 ],
  [ 'name_is_VAR' => 'name', [ 'VAR' ], 0 ],
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
  'type_is_VAR' => 6,
  'name_is_VAR' => 7,
  'nameList_is_name' => 8,
  'nameList_is_name_nameList' => 9,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	',' => { ISSEMANTIC => 0 },
	':' => { ISSEMANTIC => 0 },
	VAR => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'reducereduceconflict.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'VAR' => 2
		},
		GOTOS => {
			'param_spec' => 1,
			'def' => 3,
			'name_list' => 5,
			'name' => 4,
			'type' => 6
		}
	},
	{#State 1
		ACTIONS => {
			'VAR' => 2
		},
		GOTOS => {
			'name' => 7,
			'return_spec' => 9,
			'type' => 8
		}
	},
	{#State 2
		ACTIONS => {
			":" => -7,
			'VAR' => -6,
			"," => -6
		}
	},
	{#State 3
		ACTIONS => {
			'' => 10
		}
	},
	{#State 4
		ACTIONS => {
			":" => -8,
			"," => 11
		}
	},
	{#State 5
		ACTIONS => {
			":" => 12
		}
	},
	{#State 6
		DEFAULT => -2
	},
	{#State 7
		ACTIONS => {
			":" => 13
		}
	},
	{#State 8
		DEFAULT => -4
	},
	{#State 9
		ACTIONS => {
			"," => 14
		}
	},
	{#State 10
		DEFAULT => 0
	},
	{#State 11
		ACTIONS => {
			'VAR' => 15
		},
		GOTOS => {
			'name_list' => 16,
			'name' => 4
		}
	},
	{#State 12
		ACTIONS => {
			'VAR' => 17
		},
		GOTOS => {
			'type' => 18
		}
	},
	{#State 13
		ACTIONS => {
			'VAR' => 17
		},
		GOTOS => {
			'type' => 19
		}
	},
	{#State 14
		DEFAULT => -1
	},
	{#State 15
		DEFAULT => -7
	},
	{#State 16
		DEFAULT => -9
	},
	{#State 17
		DEFAULT => -6
	},
	{#State 18
		DEFAULT => -3
	},
	{#State 19
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 222 ./reducereduceconflict.pm
	],
	[#Rule def_is_paramSpec_returnSpec
		 'def', 3,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 229 ./reducereduceconflict.pm
	],
	[#Rule paramSpec_is_type
		 'param_spec', 1,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 236 ./reducereduceconflict.pm
	],
	[#Rule paramSpec_is_nameList_type
		 'param_spec', 3,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 243 ./reducereduceconflict.pm
	],
	[#Rule returnSpec_is_type
		 'return_spec', 1,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 250 ./reducereduceconflict.pm
	],
	[#Rule returnSpec_is_name_type
		 'return_spec', 3,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 257 ./reducereduceconflict.pm
	],
	[#Rule type_is_VAR
		 'type', 1,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 264 ./reducereduceconflict.pm
	],
	[#Rule name_is_VAR
		 'name', 1,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 271 ./reducereduceconflict.pm
	],
	[#Rule nameList_is_name
		 'name_list', 1,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 278 ./reducereduceconflict.pm
	],
	[#Rule nameList_is_name_nameList
		 'name_list', 3,
sub {
#line 0 "reducereduceconflict.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 285 ./reducereduceconflict.pm
	]
],
#line 288 ./reducereduceconflict.pm
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
         'type_is_VAR', 
         'name_is_VAR', 
         'nameList_is_name', 
         'nameList_is_name_nameList', );
  $self;
}

#line 24 "reducereduceconflict.eyp"


=head1 SYNOPSIS

Compile it with:

            eyapp -wC reducereduceconflict.eyp

See the C<.output> file. Run it with this options:

            ./reducereduceconflict.pm -deb -c 'a,b:c d:e,'

=cut


#line 330 ./reducereduceconflict.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
