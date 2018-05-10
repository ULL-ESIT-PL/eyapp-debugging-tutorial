#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'Debug1.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Debug1;
use strict;

push @Debug1::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "Debug1.eyp"


=head1 SYNOPSIS

See http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut
This files is almost like Debug.eyp
It only changes the rules

             ds:
                 D ';' ds    
               | D       
for a left-recursive version. 

Be sure C<DebugTail.pm> is reachable
compile it with 

      eyapp -b '' Debug1.eyp

Execute the generated modulino with:

      ./Debug1.pm -t

There is an error in the lexical analyzer.
Can you find it?

Try first with input "D;S" and then 
with input "D; S" 


=head1 See also

    Debug1.eyp Debug2.eyp DebugLookForward.eyp DebugDynamicResolution.eyp

=cut

our $VERSION = '0.01';
use base q{DebugTail}; 

# This is an exercise:
# There is an error somewhere below ...
# Can you find it?

#line 47 "Debug1.eyp"
__PACKAGE__->YYLexer( 
  sub { # lexical analyzer
    my $self = $_[0]; 
    for (${$self->input()}) {  # contextualize
#line 47 "Debug1.eyp"
      
        s{^(\s)}{} and $self->tokenline($1 =~ tr{\n}{});

        return ($1, $1) if s/^(.)//;
           
#line 85 ./Debug1.pm
      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      die("Error inside the lexical analyzer. Line: 51. File: Debug1.eyp. No regexp matched.\n");
    } 
  } # end lexical analyzer
);




#line 95 ./Debug1.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Debug1::ISA variable inside the header section of the eyapp program?
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
  [ 'P' => 'p', [ 'ds', ';', 'ss' ], 0 ],
  [ 'SS' => 'p', [ 'ss' ], 0 ],
  [ 'D2' => 'ds', [ 'ds', ';', 'D' ], 0 ],
  [ 'D1' => 'ds', [ 'D' ], 0 ],
  [ 'S2' => 'ss', [ 'S', ';', 'ss' ], 0 ],
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
	D => { ISSEMANTIC => 1 },
	S => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'Debug1.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'D' => 4,
			'S' => 3
		},
		GOTOS => {
			'p' => 5,
			'ss' => 2,
			'ds' => 1
		}
	},
	{#State 1
		ACTIONS => {
			";" => 6
		}
	},
	{#State 2
		DEFAULT => -2
	},
	{#State 3
		ACTIONS => {
			";" => 7
		},
		DEFAULT => -6
	},
	{#State 4
		DEFAULT => -4
	},
	{#State 5
		ACTIONS => {
			'' => 8
		}
	},
	{#State 6
		ACTIONS => {
			'S' => 3,
			'D' => 9
		},
		GOTOS => {
			'ss' => 10
		}
	},
	{#State 7
		ACTIONS => {
			'S' => 3
		},
		GOTOS => {
			'ss' => 11
		}
	},
	{#State 8
		DEFAULT => 0
	},
	{#State 9
		DEFAULT => -3
	},
	{#State 10
		DEFAULT => -1
	},
	{#State 11
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 205 ./Debug1.pm
	],
	[#Rule P
		 'p', 3,
sub {
#line 53 "Debug1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 212 ./Debug1.pm
	],
	[#Rule SS
		 'p', 1,
sub {
#line 53 "Debug1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 219 ./Debug1.pm
	],
	[#Rule D2
		 'ds', 3,
sub {
#line 53 "Debug1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 226 ./Debug1.pm
	],
	[#Rule D1
		 'ds', 1,
sub {
#line 53 "Debug1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 233 ./Debug1.pm
	],
	[#Rule S2
		 'ss', 3,
sub {
#line 53 "Debug1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 240 ./Debug1.pm
	],
	[#Rule S1
		 'ss', 1,
sub {
#line 53 "Debug1.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 247 ./Debug1.pm
	]
],
#line 250 ./Debug1.pm
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

#line 78 "Debug1.eyp"


my $prompt = 'Try first "D;S" and then "D; D;  S" '.
             '(press <CR><CTRL-D> to finish): ';
__PACKAGE__->main($prompt) unless caller();



=for None

=cut


#line 288 ./Debug1.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
