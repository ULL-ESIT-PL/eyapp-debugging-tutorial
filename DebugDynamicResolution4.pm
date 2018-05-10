#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.175.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'DebugDynamicResolution4.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package DebugDynamicResolution4;
use strict;

push @DebugDynamicResolution4::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "DebugDynamicResolution4.eyp"

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

       ./DebugDynamicResolution.pm -t -i -c 'D;D;S;S'

It will output s.t. like C<PROG(D(TERMINAL[D],D[D]),SS(TERMINAL[S],S[S]))>

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


#line 89 ./DebugDynamicResolution4.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@DebugDynamicResolution4::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.175',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'p', '$end' ], 0 ],
  [ 'PROG' => 'p', [ 'ds', ';', 'ss' ], 0 ],
  [ 'SS' => 'p', [ 'ss' ], 0 ],
  [ 'D' => 'ds', [ 'D', 'LD_explorer', 'LD', ';', 'ds' ], 0 ],
  [ 'D:LAST' => 'ds', [ 'D', 'LD_explorer', 'LD' ], 0 ],
  [ 'SS' => 'ss', [ 'S', ';', 'ss' ], 0 ],
  [ 'S' => 'ss', [ 'S' ], 0 ],
  [ 'LD' => 'LD', [  ], 0 ],
  [ 'LD_explorer' => 'LD_explorer', [  ], 0 ],
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
  'LD' => 7,
  'LD_explorer' => 8,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	D => { ISSEMANTIC => 1 },
	S => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'DebugDynamicResolution4.eyp',
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
		DEFAULT => -8,
		GOTOS => {
			'LD_explorer' => 8
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
		DEFAULT => -7,
		GOTOS => {
			'LD' => 11
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
			";" => 13
		}
	},
	{#State 12
		DEFAULT => -1
	},
	{#State 13
		ACTIONS => {
			'D' => 4
		},
		GOTOS => {
			'ds' => 14
		}
	},
	{#State 14
		DEFAULT => -3
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 225 ./DebugDynamicResolution4.pm
	],
	[#Rule PROG
		 'p', 3,
sub {
#line 36 "DebugDynamicResolution4.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 232 ./DebugDynamicResolution4.pm
	],
	[#Rule SS
		 'p', 1,
sub {
#line 36 "DebugDynamicResolution4.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 239 ./DebugDynamicResolution4.pm
	],
	[#Rule D
		 'ds', 5,
sub {
#line 36 "DebugDynamicResolution4.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 246 ./DebugDynamicResolution4.pm
	],
	[#Rule D:LAST
		 'ds', 3,
sub {
#line 36 "DebugDynamicResolution4.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 253 ./DebugDynamicResolution4.pm
	],
	[#Rule SS
		 'ss', 3,
sub {
#line 36 "DebugDynamicResolution4.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 260 ./DebugDynamicResolution4.pm
	],
	[#Rule S
		 'ss', 1,
sub {
#line 36 "DebugDynamicResolution4.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 267 ./DebugDynamicResolution4.pm
	],
	[#Rule LD
		 'LD', 0,
sub {
#line 61 "DebugDynamicResolution4.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 34 "DebugDynamicResolution4.eyp" 
    $self->YYIf('lastD', 'D:LAST', 'shift');
#line 277 ./DebugDynamicResolution4.pm
  }
}
#line 280 ./DebugDynamicResolution4.pm
	],
	[#Rule LD_explorer
		 'LD_explorer', 0,
sub {
#line 61 "DebugDynamicResolution4.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 34 "DebugDynamicResolution4.eyp" 
{ $self->YYNestedParse('lastD'); }
#line 290 ./DebugDynamicResolution4.pm
  }

}
#line 294 ./DebugDynamicResolution4.pm
	]
],
#line 297 ./DebugDynamicResolution4.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'LD' => {
                    'production' => {
                                      '-4' => [
                                                2
                                              ],
                                      '-3' => [
                                                2
                                              ]
                                    },
                    'explorerline' => 34,
                    'states' => [
                                  {
                                    '11' => [
                                              ';'
                                            ]
                                  }
                                ],
                    'total' => 2,
                    'line' => 34
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
         'LD', 
         'LD_explorer', );
  $self;
}

#line 61 "DebugDynamicResolution4.eyp"



=for None

=cut


#line 352 ./DebugDynamicResolution4.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
