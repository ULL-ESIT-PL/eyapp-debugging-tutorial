#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'minimalrr2.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package minimalrr2;
use strict;

push @minimalrr2::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "minimalrr2.eyp"


=head1  SYNOPSIS

Minimal example of a Reduce-Reduce conflict

Compile it with:

   eyapp -b '' minimalrr2.eyp

Execute it with:

   ./minimalrr.pm -t

=head1 SEE ALSO

  File C<minimalrr.eyp>

=cut

use base q{DebugTail}; 


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(a)}gc and return ($1, $1);



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


#line 83 ./minimalrr2.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@minimalrr2::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 's', '$end' ], 0 ],
  [ 'A_is_a' => 'A', [ 'a' ], 0 ],
  [ 'S_is_a' => 's', [ 'a' ], 0 ],
  [ 'A' => 's', [ 'A' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'A_is_a' => 1,
  'S_is_a' => 2,
  'A' => 3,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'a' => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'minimalrr2.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"a" => 3
		},
		GOTOS => {
			'A' => 1,
			's' => 2
		}
	},
	{#State 1
		DEFAULT => -3
	},
	{#State 2
		ACTIONS => {
			'' => 4
		}
	},
	{#State 3
		DEFAULT => -1
	},
	{#State 4
		DEFAULT => 0
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 146 ./minimalrr2.pm
	],
	[#Rule A_is_a
		 'A', 1,
sub {
#line 24 "minimalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 153 ./minimalrr2.pm
	],
	[#Rule S_is_a
		 's', 1,
sub {
#line 24 "minimalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 160 ./minimalrr2.pm
	],
	[#Rule A
		 's', 1,
sub {
#line 24 "minimalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 167 ./minimalrr2.pm
	]
],
#line 170 ./minimalrr2.pm
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
         'A_is_a', 
         'S_is_a', 
         'A', );
  $self;
}

#line 40 "minimalrr2.eyp"


unless (caller) {
  my $prompt = 'Try "a" and press <CR><CTRL-D>: ';
  __PACKAGE__->main($prompt)
}


=for None

=cut


#line 205 ./minimalrr2.pm



1;
