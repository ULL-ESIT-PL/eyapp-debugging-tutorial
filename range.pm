########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'range.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package range;
use strict;

push @range::ISA, 'Parse::Eyapp::Driver';




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

      m{\G(\.\.|\-|\+|\;|\,|\/|\(|\*|\))}gc and return ($1, $1);

      /\G([A-Za-z]\w*)/gc and return ('ID', $1);
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


#line 62 ./range.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@range::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'range', '$end' ], 0 ],
  [ 'range_1' => 'range', [ 'expr', '..', 'expr', ';' ], 0 ],
  [ 'expr_2' => 'expr', [ '(', 'expr', ')' ], 0 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 0 ],
  [ 'MINUS' => 'expr', [ 'expr', '-', 'expr' ], 0 ],
  [ 'TIMES' => 'expr', [ 'expr', '*', 'expr' ], 0 ],
  [ 'DIV' => 'expr', [ 'expr', '/', 'expr' ], 0 ],
  [ 'COMMA' => 'expr', [ 'expr', ',', 'expr' ], 0 ],
  [ 'ID:RANGE' => 'expr', [ 'ID' ], 0 ],
  [ 'NUM' => 'expr', [ 'NUM' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'range_1' => 1,
  'expr_2' => 2,
  'PLUS' => 3,
  'MINUS' => 4,
  'TIMES' => 5,
  'DIV' => 6,
  'COMMA' => 7,
  ':RANGE' => 8,
  'ID:RANGE' => 8,
  'NUM' => 9,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	'*' => { ISSEMANTIC => 0 },
	'+' => { ISSEMANTIC => 0 },
	',' => { ISSEMANTIC => 0 },
	'-' => { ISSEMANTIC => 0 },
	'..' => { ISSEMANTIC => 0 },
	'/' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'range.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 4,
			'range' => 5
		}
	},
	{#State 1
		DEFAULT => -9
	},
	{#State 2
		DEFAULT => -8
	},
	{#State 3
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 6
		}
	},
	{#State 4
		ACTIONS => {
			".." => 8,
			"-" => 7,
			"*" => 9,
			"+" => 10,
			"/" => 12,
			"," => 11
		}
	},
	{#State 5
		DEFAULT => 13
	},
	{#State 6
		ACTIONS => {
			"-" => 7,
			"*" => 9,
			"+" => 10,
			"/" => 12,
			"," => 11,
			")" => 14
		}
	},
	{#State 7
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 15
		}
	},
	{#State 8
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 16
		}
	},
	{#State 9
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 17
		}
	},
	{#State 10
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 18
		}
	},
	{#State 11
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 19
		}
	},
	{#State 12
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 20
		}
	},
	{#State 13
		DEFAULT => 0
	},
	{#State 14
		DEFAULT => -2
	},
	{#State 15
		ACTIONS => {
			"/" => 12,
			"*" => 9
		},
		DEFAULT => -4
	},
	{#State 16
		ACTIONS => {
			"-" => 7,
			"*" => 9,
			";" => 21,
			"+" => 10,
			"/" => 12,
			"," => 11
		}
	},
	{#State 17
		DEFAULT => -5
	},
	{#State 18
		ACTIONS => {
			"/" => 12,
			"*" => 9
		},
		DEFAULT => -3
	},
	{#State 19
		ACTIONS => {
			"-" => 7,
			"+" => 10,
			"/" => 12,
			"*" => 9
		},
		DEFAULT => -7
	},
	{#State 20
		DEFAULT => -6
	},
	{#State 21
		DEFAULT => -1
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 283 ./range.pm
	],
	[#Rule range_1
		 'range', 4, undef
#line 287 ./range.pm
	],
	[#Rule expr_2
		 'expr', 3, undef
#line 291 ./range.pm
	],
	[#Rule PLUS
		 'expr', 3, undef
#line 295 ./range.pm
	],
	[#Rule MINUS
		 'expr', 3, undef
#line 299 ./range.pm
	],
	[#Rule TIMES
		 'expr', 3, undef
#line 303 ./range.pm
	],
	[#Rule DIV
		 'expr', 3, undef
#line 307 ./range.pm
	],
	[#Rule COMMA
		 'expr', 3, undef
#line 311 ./range.pm
	],
	[#Rule ID:RANGE
		 'expr', 1, undef
#line 315 ./range.pm
	],
	[#Rule NUM
		 'expr', 1, undef
#line 319 ./range.pm
	]
],
#line 322 ./range.pm
    yybypass       => 0,
    yybuildingtree => 0,
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
         'range_1', 
         'expr_2', 
         'PLUS', 
         'MINUS', 
         'TIMES', 
         'DIV', 
         'COMMA', 
         'ID:RANGE', 
         'NUM', );
  $self;
}

#line 23 "range.eyp"




=for None

=cut


#line 359 ./range.pm



1;
