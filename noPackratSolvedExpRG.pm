#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.165.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'noPackratSolvedExpRG.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package noPackratSolvedExpRG;
use strict;

push @noPackratSolvedExpRG::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(other)}gc and return ($1, $1);

      /\G(\d+)/gc and return ('NUM', $1);
      /\G([-+*\/])/gc and return ('OP', $1);


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


sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 4 "noPackratSolvedExpRG.eyp"

use feature 'state';

my $nxr = 0;


#line 67 ./noPackratSolvedExpRG.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@noPackratSolvedExpRG::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.165',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'T', '$end' ], 0 ],
  [ 'T_is_preproc_S_other' => 'T', [ 'preproc', 'S', 'other' ], 0 ],
  [ 'preproc_is_empty' => 'preproc', [  ], 0 ],
  [ 'S_is_x_S_x' => 'S', [ 'x', 'isInTheMiddle', 'S', 'x' ], 0 ],
  [ 'S_is_x:MIDx' => 'S', [ 'x', 'isInTheMiddle' ], 0 ],
  [ 'x_is_NUM' => 'x', [ 'NUM' ], 0 ],
  [ 'x_is_x_OP_NUM' => 'x', [ 'x', 'OP', 'NUM' ], 0 ],
  [ 'isInTheMiddle' => 'isInTheMiddle', [  ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'other' => { ISSEMANTIC => 0 },
	NUM => { ISSEMANTIC => 1 },
	OP => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'noPackratSolvedExpRG.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -2,
		GOTOS => {
			'T' => 1,
			'preproc' => 2
		}
	},
	{#State 1
		ACTIONS => {
			'' => 3
		}
	},
	{#State 2
		ACTIONS => {
			'NUM' => 4
		},
		GOTOS => {
			'S' => 5,
			'x' => 6
		}
	},
	{#State 3
		DEFAULT => 0
	},
	{#State 4
		DEFAULT => -5
	},
	{#State 5
		ACTIONS => {
			"other" => 7
		}
	},
	{#State 6
		ACTIONS => {
			'NUM' => -7,
			'OP' => 8,
			"other" => -7
		},
		GOTOS => {
			'isInTheMiddle' => 9
		}
	},
	{#State 7
		DEFAULT => -1
	},
	{#State 8
		ACTIONS => {
			'NUM' => 10
		}
	},
	{#State 9
		ACTIONS => {
			'NUM' => 4,
			"other" => -4
		},
		GOTOS => {
			'S' => 11,
			'x' => 6
		}
	},
	{#State 10
		DEFAULT => -6
	},
	{#State 11
		ACTIONS => {
			'NUM' => 4
		},
		GOTOS => {
			'x' => 12
		}
	},
	{#State 12
		ACTIONS => {
			'NUM' => -3,
			'OP' => 8,
			"other" => -3
		}
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 184 ./noPackratSolvedExpRG.pm
	],
	[#Rule T_is_preproc_S_other
		 'T', 3,
sub {
#line 0 "noPackratSolvedExpRG.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 191 ./noPackratSolvedExpRG.pm
	],
	[#Rule preproc_is_empty
		 'preproc', 0,
sub {
#line 31 "noPackratSolvedExpRG.eyp"

     ($nxr) = $_[0]->YYPreParse('ExpList'); 
     warn "Number of x's = $nxr\n";
     $nxr = int ($nxr/2);
   }
#line 202 ./noPackratSolvedExpRG.pm
	],
	[#Rule S_is_x_S_x
		 'S', 4,
sub {
#line 0 "noPackratSolvedExpRG.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 209 ./noPackratSolvedExpRG.pm
	],
	[#Rule S_is_x:MIDx
		 'S', 2,
sub {
#line 0 "noPackratSolvedExpRG.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 216 ./noPackratSolvedExpRG.pm
	],
	[#Rule x_is_NUM
		 'x', 1,
sub {
#line 0 "noPackratSolvedExpRG.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 223 ./noPackratSolvedExpRG.pm
	],
	[#Rule x_is_x_OP_NUM
		 'x', 3,
sub {
#line 0 "noPackratSolvedExpRG.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 230 ./noPackratSolvedExpRG.pm
	],
	[#Rule isInTheMiddle
		 'isInTheMiddle', 0,
sub {
#line 48 "noPackratSolvedExpRG.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 11 "noPackratSolvedExpRG.eyp" 


  state $nxs = 0;

  $nxs++;

  if ($nxs == $nxr+1) { 
    print "Reducing by :MIDx\n";
    $self->YYSetReduce(['NUM','OP'], ':MIDx' );
    
    $nxr = $nxs = 0; 
  }
  else { $self->YYSetShift('NUM') } 
#line 252 ./noPackratSolvedExpRG.pm
  }

}
#line 256 ./noPackratSolvedExpRG.pm
	]
],
#line 259 ./noPackratSolvedExpRG.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'isInTheMiddle' => {
                               'production' => {
                                                 '-4' => [
                                                           1
                                                         ],
                                                 '-3' => [
                                                           1
                                                         ]
                                               },
                               'line' => 11
                             }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'T_is_preproc_S_other', 
         'preproc_is_empty', 
         'S_is_x_S_x', 
         'S_is_x:MIDx', 
         'x_is_NUM', 
         'x_is_x_OP_NUM', 
         'isInTheMiddle', );
  $self;
}

#line 48 "noPackratSolvedExpRG.eyp"


=head1 SYNOPSIS

This grammar is similar to the one in file C<nopackrat.eyp>.
It can't be parsed by LR(k) nor LL(k) algorithms.
Backtracking LR and GLR algorithms can but will perform poorly.

Compile it with:

   $ eyapp -TC noPackratPPCR.eyp.eyp

Run it with:

   $ ./noPackratPPCR.pm -t -i -c '2-3 3*4 5+2'

=head1 SEE ALSO

Files C<nopackrat.eyp>, C<noLRk_exp.eyp>, C<noLRk_expSolved.eyp>

=cut


#line 319 ./noPackratSolvedExpRG.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
