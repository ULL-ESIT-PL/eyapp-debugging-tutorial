#!/opt/local/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.155.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'DebugLookForward2.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package DebugLookForward2;
use strict;

push @DebugLookForward2::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  



sub unexpendedInput { substr($_, pos $_) }

#line 2 "DebugLookForward2.eyp"

=head1 SYNOPSIS

See 
   
   http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut
   file DebugLookForward2.eyp

This grammar fixes the conflicts an bugs in Debug.eyp and Debug1.eyp

Be sure C<DebugTail.pm> is reachable
compile it with 

      eyapp -b '' DebugLookForward2.eyp

execute the generated modulino with:

      ./DebugLookForward2.pm -t -i -nos

=head1 See also

    Debug.eyp Debug1.eyp Debug2.eyp 

=cut

our $VERSION = '0.01';

#line 31 "DebugLookForward2.eyp"
__PACKAGE__->YYLexer( 
  sub { # lexical analyzer
    my $self = $_[0]; 
    for (${$self->input()}) {  # contextualize
#line 31 "DebugLookForward2.eyp"
      
       s{^(\s+)}{} and $self->tokenline($1 =~ tr{\n}{});
       return ('',undef) unless $_;

       return ($1,$1) if s/^([sSDd])//;
       return ('SEMICOLONS', 'SEMICOLONS') if s/^;\s*S/S/;
       return (';', ';') if s/^;//;
       die "Syntax error at line num ${$self->line()}: ${substr($_,0,10)}\n";
           
#line 74 ./DebugLookForward2.pm
      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      die("Error inside the lexical analyzer. Line: 39. File: DebugLookForward2.eyp. No regexp matched.\n");
    } 
  } # end lexical analyzer
);

#line 81 ./DebugLookForward2.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@DebugLookForward2::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.155',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'p', '$end' ], 0 ],
  [ 'P' => 'p', [ 'ds', 'SEMICOLONS', 'ss' ], 0 ],
  [ 'SS' => 'p', [ 'ss' ], 0 ],
  [ 'D2' => 'ds', [ 'D', ';', 'ds' ], 0 ],
  [ 'D1' => 'ds', [ 'D' ], 0 ],
  [ 'S2' => 'ss', [ 'S', 'SEMICOLONS', 'ss' ], 0 ],
  [ 'S1' => 'ss', [ 'S' ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	D => { ISSEMANTIC => 1 },
	S => { ISSEMANTIC => 1 },
	SEMICOLONS => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'DebugLookForward2.eyp',
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
			'SEMICOLONS' => 6
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
			'D' => 4
		},
		GOTOS => {
			'ds' => 11
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
#line 192 ./DebugLookForward2.pm
	],
	[#Rule P
		 'p', 3,
sub {
#line 44 "DebugLookForward2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 199 ./DebugLookForward2.pm
	],
	[#Rule SS
		 'p', 1,
sub {
#line 44 "DebugLookForward2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 206 ./DebugLookForward2.pm
	],
	[#Rule D2
		 'ds', 3,
sub {
#line 44 "DebugLookForward2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 213 ./DebugLookForward2.pm
	],
	[#Rule D1
		 'ds', 1,
sub {
#line 44 "DebugLookForward2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 220 ./DebugLookForward2.pm
	],
	[#Rule S2
		 'ss', 3,
sub {
#line 44 "DebugLookForward2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 227 ./DebugLookForward2.pm
	],
	[#Rule S1
		 'ss', 1,
sub {
#line 44 "DebugLookForward2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 234 ./DebugLookForward2.pm
	]
],
#line 237 ./DebugLookForward2.pm
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
         'P', 
         'SS', 
         'D2', 
         'D1', 
         'S2', 
         'S1', );
  $self;
}

#line 68 "DebugLookForward2.eyp"


__PACKAGE__->main('Provide a statement like "D; D; S" and press <CR><CTRL-D>: ') unless caller;



=for None

=cut


#line 272 ./DebugLookForward2.pm



1;
