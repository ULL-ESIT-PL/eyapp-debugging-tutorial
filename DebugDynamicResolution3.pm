########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.174.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'DebugDynamicResolution3.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package DebugDynamicResolution3;
use strict;

push @DebugDynamicResolution3::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "DebugDynamicResolution3.eyp"

=head1 SYNOPSIS

Experimental syntaxis.
Not imlemented yet.

See http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut
This file solves the conflict in Debug.eyp using dynamic 
conflict resolution techniques
(see section 'SOLVING CONFLICTS WITH THE POSTPONED CONFLICT STRATEGY' in
http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut)

Be sure C<DebugTail.pm> is reachable
compile it with 

      eyapp -C DebugDynamicResolution3.eyp

Execute the generated modulino with:

       ./DebugDynamicResolution3.pm -t -i -c 'D;D;S;S'

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


#line 92 ./DebugDynamicResolution3.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@DebugDynamicResolution3::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.174',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'p', '$end' ], 1 ],
  [ 'PROG' => 'p', [ 'ds', ';', 'ss' ], 1 ],
  [ 'SS' => 'p', [ 'ss' ], 1 ],
  [ 'D' => 'ds', [ 'D', 'LAST_OR_MORE', ';', 'ds' ], 1 ],
  [ 'D:LAST' => 'ds', [ 'D', 'LAST_OR_MORE' ], 1 ],
  [ 'SS' => 'ss', [ 'S', ';', 'ss' ], 1 ],
  [ 'S' => 'ss', [ 'S' ], 1 ],
  [ 'LAST_OR_MORE' => 'LAST_OR_MORE', [  ], 1 ],
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
    yyFILENAME  => 'DebugDynamicResolution3.eyp',
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
#line 220 ./DebugDynamicResolution3.pm
	],
	[#Rule PROG
		 'p', 3,
sub {
#line 38 "DebugDynamicResolution3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 227 ./DebugDynamicResolution3.pm
	],
	[#Rule SS
		 'p', 1,
sub {
#line 38 "DebugDynamicResolution3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 234 ./DebugDynamicResolution3.pm
	],
	[#Rule D
		 'ds', 4,
sub {
#line 38 "DebugDynamicResolution3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 241 ./DebugDynamicResolution3.pm
	],
	[#Rule D:LAST
		 'ds', 2,
sub {
#line 38 "DebugDynamicResolution3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 248 ./DebugDynamicResolution3.pm
	],
	[#Rule SS
		 'ss', 3,
sub {
#line 38 "DebugDynamicResolution3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 255 ./DebugDynamicResolution3.pm
	],
	[#Rule S
		 'ss', 1,
sub {
#line 38 "DebugDynamicResolution3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 262 ./DebugDynamicResolution3.pm
	],
	[#Rule LAST_OR_MORE
		 'LAST_OR_MORE', 0,
sub {
#line 63 "DebugDynamicResolution3.eyp"
}
#line 269 ./DebugDynamicResolution3.pm
	]
],
#line 272 ./DebugDynamicResolution3.pm
    yybypass       => 1,
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
                              'states' => [
                                            {
                                              '8' => [
                                                       '\';\''
                                                     ]
                                            }
                                          ]
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

#line 63 "DebugDynamicResolution3.eyp"



=for None

=cut


#line 323 ./DebugDynamicResolution3.pm



1;
