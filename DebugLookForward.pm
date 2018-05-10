#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'DebugLookForward.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package DebugLookForward;
use strict;

push @DebugLookForward::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 2 "DebugLookForward.eyp"

=head1 SYNOPSIS

See 
   
   http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut
   file DebugLookForward.eyp

This grammar fixes the conflicts an bugs in Debug.eyp and Debug1.eyp

Be sure C<DebugTail.pm> is reachable
compile it with 

      eyapp -C DebugLookForward.eyp

execute the generated modulino with:

      ./DebugLookForward.pm -t -i -c 'D;D;S'

=head1 See also

    Debug.eyp Debug1.eyp Debug2.eyp DebugLookForward2.eyp

=cut

our $VERSION = '0.01';



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      

      /\G(\;)/gc and return ($1, $1);
      /\G(SEMICOLONS)/gc and return ($1, $1);
      /\G(S)/gc and return ($1, $1);
      /\G(D)/gc and return ($1, $1);


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


#line 93 ./DebugLookForward.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@DebugLookForward::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'p', '$end' ], 0 ],
  [ 'P' => 'p', [ 'ds', 'SEMICOLONS', 'ss' ], 0 ],
  [ 'SS' => 'p', [ 'ss' ], 0 ],
  [ 'D2' => 'ds', [ 'D', ';', 'ds' ], 0 ],
  [ 'D1' => 'ds', [ 'D' ], 0 ],
  [ 'S2' => 'ss', [ 'S', 'SEMICOLONS', 'ss' ], 0 ],
  [ 'S1' => 'ss', [ 'S' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'P' => 1,
  'SS' => 2,
  'D2' => 3,
  'D1' => 4,
  'S2' => 5,
  'S1' => 6,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	'D' => { ISSEMANTIC => 1 },
	'S' => { ISSEMANTIC => 1 },
	SEMICOLONS => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'DebugLookForward.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"D" => 4,
			"S" => 1
		},
		GOTOS => {
			'p' => 3,
			'ds' => 5,
			'ss' => 2
		}
	},
	{#State 1
		ACTIONS => {
			'SEMICOLONS' => 6
		},
		DEFAULT => -6
	},
	{#State 2
		DEFAULT => -2
	},
	{#State 3
		ACTIONS => {
			'' => 7
		}
	},
	{#State 4
		ACTIONS => {
			";" => 8
		},
		DEFAULT => -4
	},
	{#State 5
		ACTIONS => {
			'SEMICOLONS' => 9
		}
	},
	{#State 6
		ACTIONS => {
			"S" => 1
		},
		GOTOS => {
			'ss' => 10
		}
	},
	{#State 7
		DEFAULT => 0
	},
	{#State 8
		ACTIONS => {
			"D" => 4
		},
		GOTOS => {
			'ds' => 11
		}
	},
	{#State 9
		ACTIONS => {
			"S" => 1
		},
		GOTOS => {
			'ss' => 12
		}
	},
	{#State 10
		DEFAULT => -5
	},
	{#State 11
		DEFAULT => -3
	},
	{#State 12
		DEFAULT => -1
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 214 ./DebugLookForward.pm
	],
	[#Rule P
		 'p', 3,
sub {
#line 38 "DebugLookForward.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 221 ./DebugLookForward.pm
	],
	[#Rule SS
		 'p', 1,
sub {
#line 38 "DebugLookForward.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 228 ./DebugLookForward.pm
	],
	[#Rule D2
		 'ds', 3,
sub {
#line 38 "DebugLookForward.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 235 ./DebugLookForward.pm
	],
	[#Rule D1
		 'ds', 1,
sub {
#line 38 "DebugLookForward.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 242 ./DebugLookForward.pm
	],
	[#Rule S2
		 'ss', 3,
sub {
#line 38 "DebugLookForward.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 249 ./DebugLookForward.pm
	],
	[#Rule S1
		 'ss', 1,
sub {
#line 38 "DebugLookForward.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 256 ./DebugLookForward.pm
	]
],
#line 259 ./DebugLookForward.pm
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
         'P', 
         'SS', 
         'D2', 
         'D1', 
         'S2', 
         'S1', );
  $self;
}

#line 62 "DebugLookForward.eyp"




=for None

=cut


#line 293 ./DebugLookForward.pm



1;
