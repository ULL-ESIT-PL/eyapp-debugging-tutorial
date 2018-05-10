#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.167.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'reuseconflicthandler.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package reuseconflicthandler;
use strict;

push @reuseconflicthandler::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 4 "reuseconflicthandler.eyp"

my $nxr = 0;
my $nxs = 0;


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\;)}gc and return ($1, $1);

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


#line 66 ./reuseconflicthandler.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@reuseconflicthandler::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.167',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'T', '$end' ], 0 ],
  [ 'T_is_isInTheMiddleExplorer_S_isInTheMiddleExplorer_S' => 'T', [ 'isInTheMiddle_explorer', 'S', ';', 'isInTheMiddle_explorer', 'S', ';' ], 0 ],
  [ 'S_is_x_S_x' => 'S', [ 'x', 'isInTheMiddle', 'S', 'x' ], 0 ],
  [ 'S_is_x:MIDx' => 'S', [ 'x', 'isInTheMiddle' ], 0 ],
  [ 'x_is_NUM' => 'x', [ 'NUM' ], 0 ],
  [ 'x_is_x_OP_NUM' => 'x', [ 'x', 'OP', 'NUM' ], 0 ],
  [ 'isInTheMiddle' => 'isInTheMiddle', [  ], 0 ],
  [ 'isInTheMiddle_explorer' => 'isInTheMiddle_explorer', [  ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	NUM => { ISSEMANTIC => 1 },
	OP => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'reuseconflicthandler.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -7,
		GOTOS => {
			'T' => 1,
			'isInTheMiddle_explorer' => 2
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
		DEFAULT => -4
	},
	{#State 5
		ACTIONS => {
			";" => 7
		}
	},
	{#State 6
		ACTIONS => {
			'NUM' => -6,
			";" => -6,
			'OP' => 8
		},
		GOTOS => {
			'isInTheMiddle' => 9
		}
	},
	{#State 7
		DEFAULT => -7,
		GOTOS => {
			'isInTheMiddle_explorer' => 10
		}
	},
	{#State 8
		ACTIONS => {
			'NUM' => 11
		}
	},
	{#State 9
		ACTIONS => {
			'NUM' => 4,
			";" => -3
		},
		GOTOS => {
			'S' => 12,
			'x' => 6
		}
	},
	{#State 10
		ACTIONS => {
			'NUM' => 4
		},
		GOTOS => {
			'S' => 13,
			'x' => 6
		}
	},
	{#State 11
		DEFAULT => -5
	},
	{#State 12
		ACTIONS => {
			'NUM' => 4
		},
		GOTOS => {
			'x' => 14
		}
	},
	{#State 13
		ACTIONS => {
			";" => 15
		}
	},
	{#State 14
		ACTIONS => {
			'NUM' => -2,
			";" => -2,
			'OP' => 8
		}
	},
	{#State 15
		DEFAULT => -1
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 203 ./reuseconflicthandler.pm
	],
	[#Rule T_is_isInTheMiddleExplorer_S_isInTheMiddleExplorer_S
		 'T', 6,
sub {
#line 0 "reuseconflicthandler.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 210 ./reuseconflicthandler.pm
	],
	[#Rule S_is_x_S_x
		 'S', 4,
sub {
#line 0 "reuseconflicthandler.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 217 ./reuseconflicthandler.pm
	],
	[#Rule S_is_x:MIDx
		 'S', 2,
sub {
#line 0 "reuseconflicthandler.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 224 ./reuseconflicthandler.pm
	],
	[#Rule x_is_NUM
		 'x', 1,
sub {
#line 0 "reuseconflicthandler.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 231 ./reuseconflicthandler.pm
	],
	[#Rule x_is_x_OP_NUM
		 'x', 3,
sub {
#line 0 "reuseconflicthandler.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 238 ./reuseconflicthandler.pm
	],
	[#Rule isInTheMiddle
		 'isInTheMiddle', 0,
sub {
#line 43 "reuseconflicthandler.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 9 "reuseconflicthandler.eyp" 


  $nxs++;

  if ($nxs == $nxr+1) { 
    print "Reducing by :MIDx input = '".unexpendedInput()."'\n";
    $self->YYSetReduce(['NUM', ], ':MIDx' );
    
    $nxr = $nxs = 0; 
  }
  else { $self->YYSetShift('NUM') } 
#line 258 ./reuseconflicthandler.pm
  }

}
#line 262 ./reuseconflicthandler.pm
	],
	[#Rule isInTheMiddle_explorer
		 'isInTheMiddle_explorer', 0,
sub {
#line 43 "reuseconflicthandler.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 22 "reuseconflicthandler.eyp" 

   ($nxr) = $self->YYPreParse('ExpList'); 
   print "Number of x's = $nxr\n";
   $nxr = int ($nxr/2);
#line 275 ./reuseconflicthandler.pm
  }

}
#line 279 ./reuseconflicthandler.pm
	]
],
#line 282 ./reuseconflicthandler.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'isInTheMiddle' => {
                               'production' => {
                                                 '-2' => [
                                                           1
                                                         ],
                                                 '-3' => [
                                                           1
                                                         ]
                                               },
                               'explorerline' => 22,
                               'line' => 9
                             }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'T_is_isInTheMiddleExplorer_S_isInTheMiddleExplorer_S', 
         'S_is_x_S_x', 
         'S_is_x:MIDx', 
         'x_is_NUM', 
         'x_is_x_OP_NUM', 
         'isInTheMiddle', 
         'isInTheMiddle_explorer', );
  $self;
}

#line 43 "reuseconflicthandler.eyp"


=head1 SYNOPSIS

This grammar is similar to the one in file C<nopackrat.eyp>.
It can't be parsed by LR(k) nor LL(k) algorithms.
Backtracking LR and GLR algorithms can but will perform poorly.

Compile it with:

   $ eyapp -P ExpList.eyp 
   $ eyapp -TC noPackratSolvedExpRGconcept.eyp

Run it with:

   $ ./noPackratSolvedExpRGconcept.pm -t -i -m 1 -c '2; 1 2+2 3-5;'

=head1 SEE ALSO

Files C<nopackrat.eyp>, C<noLRk_exp.eyp>, C<noLRk_expSolved.eyp>

=cut


#line 344 ./reuseconflicthandler.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
