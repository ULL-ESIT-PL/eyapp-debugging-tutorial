#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'Debug.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Debug;
use strict;

push @Debug::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "Debug.eyp"

=head1 SYNOPSIS

This grammar has an unsolved shift-reduce conflict.

Compile it with 

      eyapp -C Debug.eyp

See the C<Debug.output> file generated.
Execute the generated modulino with:

      ./Debug.pm -d  # to activate debugging
      ./Debug.pm -h  # for help
      ./Debug.pm -d -c  'D; S' 

The generated parser will not recognize any input, since its shifts forever.
Try input C<'D; D; S'>.

=head1 See also
   
    http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut

    Debug1.eyp Debug2.eyp DebugLookForward.eyp DebugDynamicResolution.eyp

=cut



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(D|S|\;)}gc and return ($1, $1);



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


#line 89 ./Debug.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Debug::ISA variable inside the header section of the eyapp program?
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
  [ 'p_1' => 'p', [ 'ds', ';', 'ss' ], 0 ],
  [ 'p_2' => 'p', [ 'ss' ], 0 ],
  [ 'ds_3' => 'ds', [ 'D', ';', 'ds' ], 0 ],
  [ 'ds_4' => 'ds', [ 'D' ], 0 ],
  [ 'ss_5' => 'ss', [ 'S', ';', 'ss' ], 0 ],
  [ 'ss_6' => 'ss', [ 'S' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'p_1' => 1,
  'p_2' => 2,
  'ds_3' => 3,
  'ds_4' => 4,
  'ss_5' => 5,
  'ss_6' => 6,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	D => { ISSEMANTIC => 1 },
	S => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'Debug.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'D' => 3,
			'S' => 1
		},
		GOTOS => {
			'ds' => 2,
			'ss' => 5,
			'p' => 4
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
			";" => 7
		}
	},
	{#State 3
		ACTIONS => {
			";" => 8
		}
	},
	{#State 4
		ACTIONS => {
			'' => 9
		}
	},
	{#State 5
		DEFAULT => -2
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
		ACTIONS => {
			'S' => 1
		},
		GOTOS => {
			'ss' => 11
		}
	},
	{#State 8
		ACTIONS => {
			'D' => 3
		},
		GOTOS => {
			'ds' => 12
		}
	},
	{#State 9
		DEFAULT => 0
	},
	{#State 10
		DEFAULT => -5
	},
	{#State 11
		DEFAULT => -1
	},
	{#State 12
		DEFAULT => -3
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 208 ./Debug.pm
	],
	[#Rule p_1
		 'p', 3, undef
#line 212 ./Debug.pm
	],
	[#Rule p_2
		 'p', 1, undef
#line 216 ./Debug.pm
	],
	[#Rule ds_3
		 'ds', 3, undef
#line 220 ./Debug.pm
	],
	[#Rule ds_4
		 'ds', 1, undef
#line 224 ./Debug.pm
	],
	[#Rule ss_5
		 'ss', 3, undef
#line 228 ./Debug.pm
	],
	[#Rule ss_6
		 'ss', 1, undef
#line 232 ./Debug.pm
	]
],
#line 235 ./Debug.pm
    yybypass       => 0,
    yybuildingtree => 0,
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
         'p_1', 
         'p_2', 
         'ds_3', 
         'ds_4', 
         'ss_5', 
         'ss_6', );
  $self;
}

#line 46 "Debug.eyp"




=for None

=cut


#line 269 ./Debug.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
