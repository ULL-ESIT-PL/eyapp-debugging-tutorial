#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.173.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'reducereduceconflictPPCR.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package reducereduceconflictPPCR;
use strict;

push @reducereduceconflictPPCR::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }


my $istype = 0;


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


################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@reducereduceconflictPPCR::ISA variable inside the header section of the eyapp program?
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
  [ 'def_is_paramSpec_returnSpec' => 'def', [ 'param_spec', '@1-1', 'return_spec', ',' ], 0 ],
  [ '_CODE' => '@1-1', [  ], 0 ],
  [ 'paramSpec_is_type' => 'param_spec', [ 'type' ], 0 ],
  [ 'paramSpec_is_nameList_type' => 'param_spec', [ 'name_list', ':', 'type' ], 0 ],
  [ 'returnSpec_is_type' => 'return_spec', [ 'type' ], 0 ],
  [ 'returnSpec_is_name_type' => 'return_spec', [ 'name', ':', 'type' ], 0 ],
  [ 'TYPE:VAR' => 'type', [ 'VAR', 'ToN' ], 0 ],
  [ 'NAME:VAR' => 'name', [ 'VAR', 'ToN' ], 0 ],
  [ 'nameList_is_name' => 'name_list', [ 'name' ], 0 ],
  [ 'nameList_is_name_nameList' => 'name_list', [ 'name', ',', 'name_list' ], 0 ],
  [ 'ToN' => 'ToN', [  ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'def_is_paramSpec_returnSpec' => 1,
  '_CODE' => 2,
  'paramSpec_is_type' => 3,
  'paramSpec_is_nameList_type' => 4,
  'returnSpec_is_type' => 5,
  'returnSpec_is_name_type' => 6,
  ':VAR' => 7,
  'TYPE:VAR' => 7,
  ':VAR' => 8,
  'NAME:VAR' => 8,
  'nameList_is_name' => 9,
  'nameList_is_name_nameList' => 10,
  'ToN' => 11,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	',' => { ISSEMANTIC => 0 },
	':' => { ISSEMANTIC => 0 },
	VAR => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'reducereduceconflictPPCR.eyp',
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
		DEFAULT => -2,
		GOTOS => {
			'@1-1' => 7
		}
	},
	{#State 2
		DEFAULT => -11,
		GOTOS => {
			'ToN' => 8
		}
	},
	{#State 3
		ACTIONS => {
			'' => 9
		}
	},
	{#State 4
		ACTIONS => {
			"," => 10
		},
		DEFAULT => -9
	},
	{#State 5
		ACTIONS => {
			":" => 11
		}
	},
	{#State 6
		DEFAULT => -3
	},
	{#State 7
		ACTIONS => {
			'VAR' => 2
		},
		GOTOS => {
			'name' => 12,
			'return_spec' => 14,
			'type' => 13
		}
	},
	{#State 8
		ACTIONS => {
			":" => -8
		},
		DEFAULT => -7
	},
	{#State 9
		DEFAULT => 0
	},
	{#State 10
		ACTIONS => {
			'VAR' => 15
		},
		GOTOS => {
			'name_list' => 16,
			'name' => 4
		}
	},
	{#State 11
		ACTIONS => {
			'VAR' => 17
		},
		GOTOS => {
			'type' => 18
		}
	},
	{#State 12
		ACTIONS => {
			":" => 19
		}
	},
	{#State 13
		DEFAULT => -5
	},
	{#State 14
		ACTIONS => {
			"," => 20
		}
	},
	{#State 15
		DEFAULT => -11,
		GOTOS => {
			'ToN' => 21
		}
	},
	{#State 16
		DEFAULT => -10
	},
	{#State 17
		DEFAULT => -11,
		GOTOS => {
			'ToN' => 22
		}
	},
	{#State 18
		DEFAULT => -4
	},
	{#State 19
		ACTIONS => {
			'VAR' => 17
		},
		GOTOS => {
			'type' => 23
		}
	},
	{#State 20
		DEFAULT => -1
	},
	{#State 21
		DEFAULT => -8
	},
	{#State 22
		DEFAULT => -7
	},
	{#State 23
		DEFAULT => -6
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule def_is_paramSpec_returnSpec
		 'def', 4,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule _CODE
		 '@1-1', 0,
sub {  $istype = 1 }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule paramSpec_is_type
		 'param_spec', 1,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule paramSpec_is_nameList_type
		 'param_spec', 3,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule returnSpec_is_type
		 'return_spec', 1,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule returnSpec_is_name_type
		 'return_spec', 3,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule TYPE:VAR
		 'type', 2,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule NAME:VAR
		 'name', 2,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule nameList_is_name
		 'name_list', 1,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule nameList_is_name_nameList
		 'name_list', 3,
sub {  goto &Parse::Eyapp::Driver::YYBuildAST }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	],
	[#Rule ToN
		 'ToN', 0,
sub {   my $self = $_[0];
  for (${$self->input()}) {  
#line 8 "reducereduceconflictPPCR.eyp" 

  if ($istype) 
    { $self->YYSetReduce(',', 'TYPE:VAR' ); }
  else 
    { $self->YYSetReduce(',', 'NAME:VAR' ); }
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
  }

}
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
	]
],
################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'ToN' => {
                     'production' => {
                                       '-8' => [
                                                 1
                                               ],
                                       '-7' => [
                                                 1
                                               ]
                                     },
                     'states' => [
                                   {
                                     '8' => [
                                              '\',\''
                                            ]
                                   }
                                 ],
                     'line' => 8
                   }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'def_is_paramSpec_returnSpec', 
         '_CODE', 
         'paramSpec_is_type', 
         'paramSpec_is_nameList_type', 
         'returnSpec_is_type', 
         'returnSpec_is_name_type', 
         'TYPE:VAR', 
         'NAME:VAR', 
         'nameList_is_name', 
         'nameList_is_name_nameList', 
         'ToN', );
  $self;
}



=head1 SYNOPSIS

Compile it with:

            eyapp -wC reducereduceconflict.eyp

See the C<.output> file. Run it with this options:

            ./reducereduceconflict.pm -deb -c 'a,b:c d:e,'

=cut


################ @@@@@@@@@ End of User Code @@@@@@@@@ ###################

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
