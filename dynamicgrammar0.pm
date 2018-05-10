#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.155.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'dynamicgrammar0.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package dynamicgrammar0;
use strict;

push @dynamicgrammar0::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

#line 1 "dynamicgrammar0.eyp"

=head1 SYNOPSIS

Compile it with:

    eyapp -C dynamicgrammar0.eyp 

and see the C<dynamicgrammar.output> file. 
By default, right associativity is always chosen. Run it with

    $ ./dynamicgrammar0.pm -f input_for_dynamicgrammar.txt 

=head1 SEE ALSO 

    This grammar has a conflict that is solved in file
    C<examples/debuggintut/dynamicgrammar.eyp>

=cut

my $reduce = 1;
#line 23 "dynamicgrammar0.eyp"
__PACKAGE__->YYLexer( 
  sub { # lexical analyzer
    my $self = $_[0]; 
    for (${$self->input()}) {  # contextualize
#line 23 "dynamicgrammar0.eyp"
      
    m{\G(\s*)(?:#.*)?(\s*)}gc and $self->tokenline("$1$2" =~ tr{\n}{});
    m{\G(LEFT|RIGHT)\b}gic         and return (uc($1), uc($1));
    m{\G([0-9]+)}gc                and return ('NUM', $1);
    m{\G(.)}gc                     and return ($1,    $1);
       
#line 60 ./dynamicgrammar0.pm
      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      die("Error at the end of lexical analyzer. Line: 28. File: dynamicgrammar0.eyp. No regexp matched.\n");
    } 
  } # end lexical analyzer
);

#line 67 ./dynamicgrammar0.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@dynamicgrammar0::ISA variable inside the header section of the eyapp program?
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
  [ 'p_1' => 'p', [  ], 0 ],
  [ 'p_2' => 'p', [ 'p', 'c' ], 0 ],
  [ 'c_3' => 'c', [ 'expr' ], 0 ],
  [ 'c_4' => 'c', [ 'RIGHT' ], 0 ],
  [ 'c_5' => 'c', [ 'LEFT' ], 0 ],
  [ 'expr_6' => 'expr', [ '(', 'expr', ')' ], 0 ],
  [ 'expr_7:MINUS' => 'expr', [ 'expr', '-', 'expr' ], 0 ],
  [ 'expr_8' => 'expr', [ 'NUM' ], 0 ],
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
    yyFILENAME  => 'dynamicgrammar0.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -1,
		GOTOS => {
			'p' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 3,
			'NUM' => 2,
			"(" => 4,
			'LEFT' => 7,
			'RIGHT' => 8
		},
		GOTOS => {
			'c' => 5,
			'expr' => 6
		}
	},
	{#State 2
		DEFAULT => -8
	},
	{#State 3
		DEFAULT => 0
	},
	{#State 4
		ACTIONS => {
			'NUM' => 2,
			"(" => 4
		},
		GOTOS => {
			'expr' => 9
		}
	},
	{#State 5
		DEFAULT => -2
	},
	{#State 6
		ACTIONS => {
			"-" => 10
		},
		DEFAULT => -3
	},
	{#State 7
		DEFAULT => -5
	},
	{#State 8
		DEFAULT => -4
	},
	{#State 9
		ACTIONS => {
			"-" => 10,
			")" => 11
		}
	},
	{#State 10
		ACTIONS => {
			'NUM' => 2,
			"(" => 4
		},
		GOTOS => {
			'expr' => 12
		}
	},
	{#State 11
		DEFAULT => -6
	},
	{#State 12
		ACTIONS => {
			"-" => 10
		},
		DEFAULT => -7
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 183 ./dynamicgrammar0.pm
	],
	[#Rule p_1
		 'p', 0,
sub {
#line 32 "dynamicgrammar0.eyp"
}
#line 190 ./dynamicgrammar0.pm
	],
	[#Rule p_2
		 'p', 2,
sub {
#line 33 "dynamicgrammar0.eyp"
}
#line 197 ./dynamicgrammar0.pm
	],
	[#Rule c_3
		 'c', 1,
sub {
#line 37 "dynamicgrammar0.eyp"
my $expr = $_[1];  print "$expr\n" }
#line 204 ./dynamicgrammar0.pm
	],
	[#Rule c_4
		 'c', 1,
sub {
#line 38 "dynamicgrammar0.eyp"
 $reduce = 0}
#line 211 ./dynamicgrammar0.pm
	],
	[#Rule c_5
		 'c', 1,
sub {
#line 39 "dynamicgrammar0.eyp"
 $reduce = 1}
#line 218 ./dynamicgrammar0.pm
	],
	[#Rule expr_6
		 'expr', 3,
sub {
#line 44 "dynamicgrammar0.eyp"
my $expr = $_[2];  $expr }
#line 225 ./dynamicgrammar0.pm
	],
	[#Rule expr_7:MINUS
		 'expr', 3,
sub {
#line 47 "dynamicgrammar0.eyp"
my $left = $_[1]; my $right = $_[3];  $left - $right }
#line 232 ./dynamicgrammar0.pm
	],
	[#Rule expr_8
		 'expr', 1, undef
#line 236 ./dynamicgrammar0.pm
	]
],
#line 239 ./dynamicgrammar0.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'p_1', 
         'p_2', 
         'c_3', 
         'c_4', 
         'c_5', 
         'expr_6', 
         'expr_7:MINUS', 
         'expr_8', );
  $self;
}

#line 52 "dynamicgrammar0.eyp"



=for None

=cut


#line 271 ./dynamicgrammar0.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
