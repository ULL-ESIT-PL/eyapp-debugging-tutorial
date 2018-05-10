#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.173.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'tokenvar.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package tokenvar;
use strict;

push @tokenvar::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(NUM)}gc and return ($1, $1);

      /\G(\d+)/gc and return ('NUM', $1);


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


#line 61 ./tokenvar.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@tokenvar::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.173',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'A', '$end' ], 0 ],
  [ 'A_is_empty' => 'A', [  ], 0 ],
  [ 'A_is_NUM_NUM' => 'A', [ 'NUM', 'NUM' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'A_is_empty' => 1,
  'A_is_NUM_NUM' => 2,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'NUM' => { ISSEMANTIC => 0 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'tokenvar.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'NUM' => 1
		},
		DEFAULT => -1,
		GOTOS => {
			'A' => 2
		}
	},
	{#State 1
		ACTIONS => {
			"NUM" => 3
		}
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
#line 125 ./tokenvar.pm
	],
	[#Rule A_is_empty
		 'A', 0,
sub {
#line 0 "tokenvar.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 132 ./tokenvar.pm
	],
	[#Rule A_is_NUM_NUM
		 'A', 2,
sub {
#line 0 "tokenvar.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 139 ./tokenvar.pm
	]
],
#line 142 ./tokenvar.pm
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
         'A_is_empty', 
         'A_is_NUM_NUM', );
  $self;
}

#line 8 "tokenvar.eyp"




=for None

=cut


#line 171 ./tokenvar.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
