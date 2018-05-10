#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.171.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'dynamicgrammar624.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package dynamicgrammar624;
use strict;

push @dynamicgrammar624::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "dynamicgrammar624.eyp"

=head1 SYNOPSIS

This example shows how the dynamic conflict resolution
technique makes possible to change the behavior of the parser
at the programmer's command.

Compile it with:

    eyapp -C dynamicgrammar.eyp 

Run with:

    $ ./dynamicgrammar.pm -f input_for_dynamicgrammar.txt 

The file C<input_for_dynamicgrammar.txt> contains:

            2-1-1 # left: 0
            RIGHT
            2-1-1 # right: 2
            LEFT
            3-1-1 # left: 1
            RIGHT
            3-1-1 # right: 3

=head1 SEE ALSO

File C<examples/debuggingtut/dynamicgrammar0.eyp> is similar
to this grammar, but the shift-reduce conflict is left unsolved

=cut

my $reduce = 1;


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      /\G(\s*(?:#.*)?\s*)/gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(RIGHT|LEFT|\-|\(|\))}gc and return ($1, $1);

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


#line 95 ./dynamicgrammar624.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@dynamicgrammar624::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.171',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'p', '$end' ], 0 ],
  [ '_STAR_LIST' => 'STAR-1', [ 'STAR-1', 'c' ], 0 ],
  [ '_STAR_LIST' => 'STAR-1', [  ], 0 ],
  [ 'p_3' => 'p', [ 'STAR-1' ], 0 ],
  [ 'c_4' => 'c', [ 'expr' ], 0 ],
  [ 'c_5' => 'c', [ 'RIGHT' ], 0 ],
  [ 'c_6' => 'c', [ 'LEFT' ], 0 ],
  [ 'expr_7' => 'expr', [ '(', 'expr', ')' ], 0 ],
  [ 'expr_8:M' => 'expr', [ 'expr', 'leftORright', '-', 'expr', 'leftORright' ], 0 ],
  [ 'expr_9' => 'expr', [ 'NUM' ], 0 ],
  [ 'leftORright' => 'leftORright', [  ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	'-' => { ISSEMANTIC => 0 },
	LEFT => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	RIGHT => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'dynamicgrammar624.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -2,
		GOTOS => {
			'p' => 1,
			'STAR-1' => 2
		}
	},
	{#State 1
		ACTIONS => {
			'' => 3
		}
	},
	{#State 2
		ACTIONS => {
			'NUM' => 4,
			"(" => 5,
			'LEFT' => 8,
			'RIGHT' => 9
		},
		DEFAULT => -3,
		GOTOS => {
			'c' => 6,
			'expr' => 7
		}
	},
	{#State 3
		DEFAULT => 0
	},
	{#State 4
		DEFAULT => -9
	},
	{#State 5
		ACTIONS => {
			'NUM' => 4,
			"(" => 5
		},
		GOTOS => {
			'expr' => 10
		}
	},
	{#State 6
		DEFAULT => -1
	},
	{#State 7
		ACTIONS => {
			"-" => -10
		},
		DEFAULT => -4,
		GOTOS => {
			'leftORright' => 11
		}
	},
	{#State 8
		DEFAULT => -6
	},
	{#State 9
		DEFAULT => -5
	},
	{#State 10
		ACTIONS => {
			")" => 12
		},
		DEFAULT => -10,
		GOTOS => {
			'leftORright' => 11
		}
	},
	{#State 11
		ACTIONS => {
			"-" => 13
		}
	},
	{#State 12
		DEFAULT => -7
	},
	{#State 13
		ACTIONS => {
			'NUM' => 4,
			"(" => 5
		},
		GOTOS => {
			'expr' => 14
		}
	},
	{#State 14
		DEFAULT => -10,
		GOTOS => {
			'leftORright' => 15
		}
	},
	{#State 15
		ACTIONS => {
			"-" => 13
		},
		DEFAULT => -8
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 236 ./dynamicgrammar624.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 2,
sub {
#line 49 "dynamicgrammar624.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 243 ./dynamicgrammar624.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 0,
sub {
#line 49 "dynamicgrammar624.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 250 ./dynamicgrammar624.pm
	],
	[#Rule p_3
		 'p', 1,
sub {
#line 49 "dynamicgrammar624.eyp"
}
#line 257 ./dynamicgrammar624.pm
	],
	[#Rule c_4
		 'c', 1,
sub {
#line 52 "dynamicgrammar624.eyp"
my $expr = $_[1];  print "$expr\n" }
#line 264 ./dynamicgrammar624.pm
	],
	[#Rule c_5
		 'c', 1,
sub {
#line 53 "dynamicgrammar624.eyp"
 $reduce = 0}
#line 271 ./dynamicgrammar624.pm
	],
	[#Rule c_6
		 'c', 1,
sub {
#line 54 "dynamicgrammar624.eyp"
 $reduce = 1}
#line 278 ./dynamicgrammar624.pm
	],
	[#Rule expr_7
		 'expr', 3,
sub {
#line 59 "dynamicgrammar624.eyp"
my $expr = $_[2];  $expr }
#line 285 ./dynamicgrammar624.pm
	],
	[#Rule expr_8:M
		 'expr', 5,
sub {
#line 63 "dynamicgrammar624.eyp"
my $left = $_[1]; my $right = $_[4];  $left - $right }
#line 292 ./dynamicgrammar624.pm
	],
	[#Rule expr_9
		 'expr', 1, undef
#line 296 ./dynamicgrammar624.pm
	],
	[#Rule leftORright
		 'leftORright', 0,
sub {
#line 68 "dynamicgrammar624.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 39 "dynamicgrammar624.eyp" 

  # reduce if $reduce and next token is '-'
  if ($reduce && m{\G(?=-)}gc) 
       { $self->YYSetReduce('-', ':M' ); }
  else { $self->YYSetShift('-'); }
#line 310 ./dynamicgrammar624.pm
  }

}
#line 314 ./dynamicgrammar624.pm
	]
],
#line 317 ./dynamicgrammar624.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'leftORright' => {
                             'production' => {
                                               '-8' => [
                                                         1,
                                                         4
                                                       ]
                                             },
                             'states' => [
                                           {
                                             '15' => [
                                                       '\'-\''
                                                     ]
                                           }
                                         ],
                             'line' => 39
                           }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'p_3', 
         'c_4', 
         'c_5', 
         'c_6', 
         'expr_7', 
         'expr_8:M', 
         'expr_9', 
         'leftORright', );
  $self;
}

#line 68 "dynamicgrammar624.eyp"



=for None

=cut


#line 370 ./dynamicgrammar624.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
