#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.179.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'noPackratSolvedExpRGconcept.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package noPackratSolvedExpRGconcept;
use strict;

push @noPackratSolvedExpRGconcept::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 4 "noPackratSolvedExpRGconcept.eyp"

my $nxs = 0;


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      

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


#line 65 ./noPackratSolvedExpRGconcept.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@noPackratSolvedExpRGconcept::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.179',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'T', '$end' ], 0 ],
  [ 'T_is_S' => 'T', [ 'isInTheMiddle', 'S' ], 0 ],
  [ 'S_is_x_S_x' => 'S', [ 'x', 'S', 'x' ], 0 ],
  [ 'S_is_x:MIDx' => 'S', [ 'x' ], 0 ],
  [ 'x_is_NUM' => 'x', [ 'NUM' ], 0 ],
  [ 'x_is_x_OP_NUM' => 'x', [ 'x', 'OP', 'NUM' ], 0 ],
  [ 'isInTheMiddle' => 'isInTheMiddle', [  ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'T_is_S' => 1,
  'S_is_x_S_x' => 2,
  ':MIDx' => 3,
  'S_is_x:MIDx' => 3,
  'x_is_NUM' => 4,
  'x_is_x_OP_NUM' => 5,
  'isInTheMiddle' => 6,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	NUM => { ISSEMANTIC => 1 },
	OP => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'noPackratSolvedExpRGconcept.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -6,
		GOTOS => {
			'T' => 1,
			'isInTheMiddle' => 2
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
		DEFAULT => -1
	},
	{#State 6
		ACTIONS => {
			'' => -3,
			'NUM' => 4,
			'OP' => 8
		},
		GOTOS => {
			'S' => 7,
			'x' => 6
		}
	},
	{#State 7
		ACTIONS => {
			'NUM' => 4
		},
		GOTOS => {
			'x' => 9
		}
	},
	{#State 8
		ACTIONS => {
			'NUM' => 10
		}
	},
	{#State 9
		ACTIONS => {
			'' => -2,
			'NUM' => -2,
			'OP' => 8
		}
	},
	{#State 10
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 177 ./noPackratSolvedExpRGconcept.pm
	],
	[#Rule T_is_S
		 'T', 2,
sub {
#line 0 "noPackratSolvedExpRGconcept.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 184 ./noPackratSolvedExpRGconcept.pm
	],
	[#Rule S_is_x_S_x
		 'S', 3,
sub {
#line 0 "noPackratSolvedExpRGconcept.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 191 ./noPackratSolvedExpRGconcept.pm
	],
	[#Rule S_is_x:MIDx
		 'S', 1,
sub {
#line 0 "noPackratSolvedExpRGconcept.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 198 ./noPackratSolvedExpRGconcept.pm
	],
	[#Rule x_is_NUM
		 'x', 1,
sub {
#line 0 "noPackratSolvedExpRGconcept.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 205 ./noPackratSolvedExpRGconcept.pm
	],
	[#Rule x_is_x_OP_NUM
		 'x', 3,
sub {
#line 0 "noPackratSolvedExpRGconcept.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 212 ./noPackratSolvedExpRGconcept.pm
	],
	[#Rule isInTheMiddle
		 'isInTheMiddle', 0,
sub {
#line 38 "noPackratSolvedExpRGconcept.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 21 "noPackratSolvedExpRGconcept.eyp" 
{ $self->YYNestedParse('ExpList'); }
#line 222 ./noPackratSolvedExpRGconcept.pm
  }

}
#line 226 ./noPackratSolvedExpRGconcept.pm
	]
],
#line 229 ./noPackratSolvedExpRGconcept.pm
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
                               'explorerline' => 21,
                               'codeh' => '  my $self = $_[0];
  for (${$self->input()}) {  
#line 8 "noPackratSolvedExpRGconcept.eyp" 


  $nxs++;

  if ($nxs == $self->YYVal(ExpList)) { 
    print "Reducing by :MIDx\\n";
    $self->YYSetReduce(:MIDx );
    
    $nxs = 0; 
  }
  else { $self->YYSetShift() } 
#line 260 ./noPackratSolvedExpRGconcept.pm
  }

',
                               'totalviewpoint' => 1,
                               'states' => [
                                             {
                                               '6' => [
                                                        'NUM'
                                                      ]
                                             }
                                           ],
                               'total' => 2,
                               'line' => 8
                             }
        }
,
    yystateconflict => { 6 => [                    { 
                      name => 'isInTheMiddle', 
                      codeh => sub {   my $self = $_[0];
  for (${$self->input()}) {  
#line 8 "noPackratSolvedExpRGconcept.eyp" 


  $nxs++;

  if ($nxs == $self->YYVal('ExpList')) { 
    print "Reducing by :MIDx\n";
    $self->YYSetReduce(':MIDx' );
    
    $nxs = 0; 
  }
  else { $self->YYSetShift() } 
#line 293 ./noPackratSolvedExpRGconcept.pm
  }

 },
                   },
 ], },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'T_is_S', 
         'S_is_x_S_x', 
         'S_is_x:MIDx', 
         'x_is_NUM', 
         'x_is_x_OP_NUM', 
         'isInTheMiddle', );
  $self;
}

#line 38 "noPackratSolvedExpRGconcept.eyp"


=head1 SYNOPSIS

This grammar is similar to the one in file C<nopackrat.eyp>.
It can't be parsed by LR(k) nor LL(k) algorithms.
Backtracking LR and GLR algorithms can but will perform poorly.

Compile it with:

   $ eyapp -P ExpList.eyp 
   $ eyapp -TC noPackratSolvedExpRGconcept.eyp

Run it with:

   $ ./noPackratSolvedExpRGconcept.pm -t -i -m 1 -c '2-3 3*4 5+2'

=head1 SEE ALSO

Files C<nopackrat.eyp>, C<noLRk_exp.eyp>, C<noLRk_expSolved.eyp>

=cut


#line 339 ./noPackratSolvedExpRGconcept.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
