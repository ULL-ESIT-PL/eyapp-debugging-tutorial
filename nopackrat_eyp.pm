########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.155.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'nopackrat.yp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package nopackrat;
use strict;

push @nopackrat::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

#line 1 "nopackrat.yp"

=head1 SYNOPSIS

Packrat parsers cannot recognize some unambiguous grammars, such as the following 
Example taken from Bryan Ford (2002): 
I<Functional Pearl: Packrat Parsing: Simple, Powerful, Lazy, Linear Time>

    S ← 'x' S 'x' | 'x'

In fact, neither LL(k) nor LR(k) parsing algorithms are capable of recognizing this example.

=head1 SEE ALSO

   http://en.wikipedia.org/wiki/Parsing_expression_grammar I
   'Parsing expression grammar' in the Wikipedia

#line 44 nopackrat_eyp.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@nopackrat::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.155',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'S', '$end' ], 0 ],
  [ 'S_1' => 'S', [ 'x', 'S', 'x' ], 0 ],
  [ 'S_2' => 'S', [ 'x' ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'x' => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'nopackrat.yp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"x" => 1
		},
		GOTOS => {
			'S' => 2
		}
	},
	{#State 1
		ACTIONS => {
			"x" => 1
		},
		DEFAULT => -2,
		GOTOS => {
			'S' => 3
		}
	},
	{#State 2
		ACTIONS => {
			'' => 4
		}
	},
	{#State 3
		ACTIONS => {
			"x" => 5
		}
	},
	{#State 4
		DEFAULT => 0
	},
	{#State 5
		DEFAULT => -1
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 109 nopackrat_eyp.pm
	],
	[#Rule S_1
		 'S', 3, undef
#line 113 nopackrat_eyp.pm
	],
	[#Rule S_2
		 'S', 1, undef
#line 117 nopackrat_eyp.pm
	]
],
#line 120 nopackrat_eyp.pm
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
         'S_1', 
         'S_2', );
  $self;
}

#line 25 "nopackrat.yp"


%lexer {
  m{\G\s*}gc;
  m{\G(.)}gc  and return ($1, $1);
}



=for None

=cut


#line 152 nopackrat_eyp.pm



1;
