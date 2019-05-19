#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'minimalrr.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package minimalrr;
use strict;

push @minimalrr::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "minimalrr.eyp"


=head1  SYNOPSIS

Minimal example of a Reduce-Reduce conflict.
It illustrates how in case of a reduce-reduce conflict the first 
conflicting production is chosen.

Compile it with:

   eyapp -b '' minimalrr.eyp

Execute it with:

   ./minimalrr.pm -t

=head1 SEE ALSO

  File C<minimalrr2.eyp>

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


#line 85 ./minimalrr.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@minimalrr::ISA variable inside the header section of the eyapp program?
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
  [ 'S_is_a' => 's', [ 'a' ], 0 ],
  [ 's_2' => 's', [ 'A' ], 0 ],
  [ 'A_is_a' => 'A', [ 'a' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'S_is_a' => 1,
  's_2' => 2,
  'A_is_a' => 3,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'a' => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'minimalrr.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"a" => 1
		},
		GOTOS => {
			's' => 2,
			'A' => 3
		}
	},
	{#State 1
		DEFAULT => -1
	},
	{#State 2
		ACTIONS => {
			'' => 4
		}
	},
	{#State 3
		DEFAULT => -2
	},
	{#State 4
		DEFAULT => 0
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 148 ./minimalrr.pm
	],
	[#Rule S_is_a
		 's', 1,
sub {
#line 26 "minimalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 155 ./minimalrr.pm
	],
	[#Rule s_2
		 's', 1,
sub {
#line 26 "minimalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 162 ./minimalrr.pm
	],
	[#Rule A_is_a
		 'A', 1,
sub {
#line 26 "minimalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 169 ./minimalrr.pm
	]
],
#line 172 ./minimalrr.pm
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
         'S_is_a', 
         's_2', 
         'A_is_a', );
  $self;
}

#line 39 "minimalrr.eyp"


unless (caller) {
  my $prompt = 'Try "a" and press <CR><CTRL-D>: ';
  __PACKAGE__->main($prompt)
}


=for None

=cut


#line 207 ./minimalrr.pm



1;
