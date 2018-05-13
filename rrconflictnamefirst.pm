#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'rrconflictnamefirst.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package rrconflictnamefirst;
use strict;

push @rrconflictnamefirst::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "rrconflictnamefirst.eyp"

=head1 SYNOPSIS

This is an example of a non ambiguous grammar with a reduce-reduce conflict.

Compile it with:

            eyapp -b '' rrconflictnamefirst.eyp

run it with this options:

            ./rrconflictnamefirst.pm -t -i -m 1 -c 'a,b:c d:e,'

See also:

=over 2

=item * Files C<reducereduceconflict_fix1.eyp> and C<reducereduceconflict_fix2.eyp> 
offer other solutions to the problem. 

=item * Section "Reduce-Reduce Conflicts with Unambiguous Grammars" in Parse::Eyapp::debuggingtut

=back

=cut

#line 29 "rrconflictnamefirst.eyp"
__PACKAGE__->YYLexer( 
  sub { # lexical analyzer
    my $self = $_[0]; 
    for (${$self->input()}) {  # contextualize
#line 29 "rrconflictnamefirst.eyp"
      
      m{\G([ \t\n]*(\#.*)?\s*)}gc and $self->tokenline($1 =~ tr/\n//);

      m{\G([0-9]+(?:\.[0-9]+)?)}gc   and return ('NUM', $1);
      m{\G([A-Za-z][A-Za-z0-9_]*)}gc and return ('VAR', $1);
      m{\G(.)}gc                     and return ($1,    $1);
       
#line 71 ./rrconflictnamefirst.pm
      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      die("Error inside the lexical analyzer. Line: 35. File: rrconflictnamefirst.eyp. No regexp matched.\n");
    } 
  } # end lexical analyzer
);




#line 81 ./rrconflictnamefirst.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@rrconflictnamefirst::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'def', '$end' ], 0 ],
  [ 'def_is_paramSpec_returnSpec' => 'def', [ 'param_spec', 'return_spec', ',' ], 0 ],
  [ 'paramSpec_is_type' => 'param_spec', [ 'type' ], 0 ],
  [ 'paramSpec_is_nameList_type' => 'param_spec', [ 'name_list', ':', 'type' ], 0 ],
  [ 'returnSpec_is_type' => 'return_spec', [ 'type' ], 0 ],
  [ 'returnSpec_is_name_type' => 'return_spec', [ 'name', ':', 'type' ], 0 ],
  [ 'name_is_VAR' => 'name', [ 'VAR' ], 0 ],
  [ 'type_is_VAR' => 'type', [ 'VAR' ], 0 ],
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
  'name_is_VAR' => 6,
  'type_is_VAR' => 7,
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
    yyFILENAME  => 'rrconflictnamefirst.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'VAR' => 2
		},
		GOTOS => {
			'def' => 3,
			'name' => 1,
			'param_spec' => 5,
			'name_list' => 4,
			'type' => 6
		}
	},
	{#State 1
		ACTIONS => {
			"," => 7
		},
		DEFAULT => -8
	},
	{#State 2
		ACTIONS => {
			'VAR' => -7
		},
		DEFAULT => -6
	},
	{#State 3
		ACTIONS => {
			'' => 8
		}
	},
	{#State 4
		ACTIONS => {
			":" => 9
		}
	},
	{#State 5
		ACTIONS => {
			'VAR' => 2
		},
		GOTOS => {
			'name' => 10,
			'return_spec' => 11,
			'type' => 12
		}
	},
	{#State 6
		DEFAULT => -2
	},
	{#State 7
		ACTIONS => {
			'VAR' => 14
		},
		GOTOS => {
			'name' => 1,
			'name_list' => 13
		}
	},
	{#State 8
		DEFAULT => 0
	},
	{#State 9
		ACTIONS => {
			'VAR' => 16
		},
		GOTOS => {
			'type' => 15
		}
	},
	{#State 10
		ACTIONS => {
			":" => 17
		}
	},
	{#State 11
		ACTIONS => {
			"," => 18
		}
	},
	{#State 12
		DEFAULT => -4
	},
	{#State 13
		DEFAULT => -9
	},
	{#State 14
		DEFAULT => -6
	},
	{#State 15
		DEFAULT => -3
	},
	{#State 16
		DEFAULT => -7
	},
	{#State 17
		ACTIONS => {
			'VAR' => 16
		},
		GOTOS => {
			'type' => 19
		}
	},
	{#State 18
		DEFAULT => -1
	},
	{#State 19
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 241 ./rrconflictnamefirst.pm
	],
	[#Rule def_is_paramSpec_returnSpec
		 'def', 3,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 248 ./rrconflictnamefirst.pm
	],
	[#Rule paramSpec_is_type
		 'param_spec', 1,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 255 ./rrconflictnamefirst.pm
	],
	[#Rule paramSpec_is_nameList_type
		 'param_spec', 3,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 262 ./rrconflictnamefirst.pm
	],
	[#Rule returnSpec_is_type
		 'return_spec', 1,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 269 ./rrconflictnamefirst.pm
	],
	[#Rule returnSpec_is_name_type
		 'return_spec', 3,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 276 ./rrconflictnamefirst.pm
	],
	[#Rule name_is_VAR
		 'name', 1,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 283 ./rrconflictnamefirst.pm
	],
	[#Rule type_is_VAR
		 'type', 1,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 290 ./rrconflictnamefirst.pm
	],
	[#Rule nameList_is_name
		 'name_list', 1,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 297 ./rrconflictnamefirst.pm
	],
	[#Rule nameList_is_name_nameList
		 'name_list', 3,
sub {
#line 39 "rrconflictnamefirst.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 304 ./rrconflictnamefirst.pm
	]
],
#line 307 ./rrconflictnamefirst.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    yystateconflict => {  },
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
         'name_is_VAR', 
         'type_is_VAR', 
         'nameList_is_name', 
         'nameList_is_name_nameList', );
  $self;
}

#line 60 "rrconflictnamefirst.eyp"


__PACKAGE__->main('Try input "a,b:c d:e," then press CTRL-D (Unix) or CTRL-Z (Windows) to finish: ') unless caller();




=for None

=cut


#line 347 ./rrconflictnamefirst.pm



1;
