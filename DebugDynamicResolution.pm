#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'DebugDynamicResolution.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package DebugDynamicResolution;
use strict;

push @DebugDynamicResolution::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "DebugDynamicResolution.eyp"

=head1 SYNOPSIS

See http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut
This file solves the conflict in Debug.eyp using dynamic 
conflict resolution techniques
(see section 'SOLVING CONFLICTS WITH THE POSTPONED CONFLICT STRATEGY' in
http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut)

Be sure C<DebugTail.pm> is reachable
compile it with 

      eyapp -C DebugDynamicResolution.eyp

Execute the generated modulino with:

       ./DebugDynamicResolution.pm -t -c 'D;D;S;S'


=head1 See also

    Debug.eyp Debug1.eyp Debug2.eyp DebugLookForward.eyp

=cut



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\;)}gc and return ($1, $1);

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


#line 88 ./DebugDynamicResolution.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@DebugDynamicResolution::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'p', '$end' ], 0 ],
  [ 'PROG' => 'p', [ 'ds', ';', 'ss' ], 0 ],
  [ 'SS' => 'p', [ 'ss' ], 0 ],
  [ 'D' => 'ds', [ 'D', 'LAST_OR_MORE', ';', 'ds' ], 0 ],
  [ 'D:LAST' => 'ds', [ 'D', 'LAST_OR_MORE' ], 0 ],
  [ 'SS' => 'ss', [ 'S', ';', 'ss' ], 0 ],
  [ 'S' => 'ss', [ 'S' ], 0 ],
  [ 'LAST_OR_MORE' => 'LAST_OR_MORE', [  ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'PROG' => 1,
  'SS' => 2,
  'D' => 3,
  ':LAST' => 4,
  'D:LAST' => 4,
  'SS' => 5,
  'S' => 6,
  'LAST_OR_MORE' => 7,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	D => { ISSEMANTIC => 1 },
	S => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'DebugDynamicResolution.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'S' => 1,
			'D' => 4
		},
		GOTOS => {
			'p' => 2,
			'ss' => 3,
			'ds' => 5
		}
	},
	{#State 1
		ACTIONS => {
			";" => 6
		},
		DEFAULT => -6
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
		DEFAULT => -7,
		GOTOS => {
			'LAST_OR_MORE' => 8
		}
	},
	{#State 5
		ACTIONS => {
			";" => 9
		}
	},
	{#State 6
		ACTIONS => {
			'S' => 1
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
			";" => 11
		}
	},
	{#State 9
		ACTIONS => {
			'S' => 1
		},
		GOTOS => {
			'ss' => 12
		}
	},
	{#State 10
		DEFAULT => -5
	},
	{#State 11
		ACTIONS => {
			'D' => 4
		},
		GOTOS => {
			'ds' => 13
		}
	},
	{#State 12
		DEFAULT => -1
	},
	{#State 13
		DEFAULT => -3
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 216 ./DebugDynamicResolution.pm
	],
	[#Rule PROG
		 'p', 3,
sub {
#line 35 "DebugDynamicResolution.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 223 ./DebugDynamicResolution.pm
	],
	[#Rule SS
		 'p', 1,
sub {
#line 35 "DebugDynamicResolution.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 230 ./DebugDynamicResolution.pm
	],
	[#Rule D
		 'ds', 4,
sub {
#line 35 "DebugDynamicResolution.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 237 ./DebugDynamicResolution.pm
	],
	[#Rule D:LAST
		 'ds', 2,
sub {
#line 35 "DebugDynamicResolution.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 244 ./DebugDynamicResolution.pm
	],
	[#Rule SS
		 'ss', 3,
sub {
#line 35 "DebugDynamicResolution.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 251 ./DebugDynamicResolution.pm
	],
	[#Rule S
		 'ss', 1,
sub {
#line 35 "DebugDynamicResolution.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 258 ./DebugDynamicResolution.pm
	],
	[#Rule LAST_OR_MORE
		 'LAST_OR_MORE', 0,
sub {
#line 60 "DebugDynamicResolution.eyp"
{   my $self = $_[0];
  for (${$self->input()}) {  
#line 30 "DebugDynamicResolution.eyp" 
{ $self->YYNestedRegexp('\G(?=\s*;\s*S)'); }
#line 268 ./DebugDynamicResolution.pm
  }

 }
{   my $self = $_[0];
  for (${$self->input()}) {  
#line 30 "DebugDynamicResolution.eyp" 
    $self->YYIf('.regexp', 'D:LAST', 'shift');
#line 276 ./DebugDynamicResolution.pm
  }
 }}
#line 279 ./DebugDynamicResolution.pm
	]
],
#line 282 ./DebugDynamicResolution.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'LAST_OR_MORE' => {
                              'production' => {
                                                '-4' => [
                                                          1
                                                        ],
                                                '-3' => [
                                                          1
                                                        ]
                                              },
                              'explorerline' => 30,
                              'states' => [
                                            {
                                              '8' => [
                                                       ';'
                                                     ]
                                            }
                                          ],
                              'total' => 2,
                              'line' => 30
                            }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'PROG', 
         'SS', 
         'D', 
         'D:LAST', 
         'SS', 
         'S', 
         'LAST_OR_MORE', );
  $self;
}

#line 60 "DebugDynamicResolution.eyp"



=for None

=cut


#line 336 ./DebugDynamicResolution.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
