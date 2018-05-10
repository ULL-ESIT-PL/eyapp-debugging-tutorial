####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package nopackrat;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;

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



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
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
		DEFAULT => -3,
		GOTOS => {
			'isInTheMiddle' => 3
		}
	},
	{#State 2
		ACTIONS => {
			'' => 4
		}
	},
	{#State 3
		ACTIONS => {
			"x" => 1
		},
		DEFAULT => -2,
		GOTOS => {
			'S' => 5
		}
	},
	{#State 4
		DEFAULT => 0
	},
	{#State 5
		ACTIONS => {
			"x" => 6
		}
	},
	{#State 6
		DEFAULT => -1
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'S', 4, undef
	],
	[#Rule 2
		 'S', 2, undef
	],
	[#Rule 3
		 'isInTheMiddle', 0, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 29 "nopackrat.yp"


%lexer {
  m{\G\s*}gc;
  m{\G(.)}gc  and return ($1, $1);
}


1;
