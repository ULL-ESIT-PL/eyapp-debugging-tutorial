########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.175.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'pascalnestedeyapp3_5.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package range_conflict;
use strict;

push @range_conflict::ISA, 'Parse::Eyapp::Driver';




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

      m{\G(\.\.|\-|\+|\/|\,|\(|\*|\))}gc and return ($1, $1);

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


#line 62 range_conflict.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@range_conflict::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.175',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'range', '$end' ], 0 ],
  [ 'range_1' => 'range', [ 'expr', '..', 'expr' ], 0 ],
  [ 'expr_2' => 'expr', [ '(', 'expr', ')' ], 0 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 0 ],
  [ 'MINUS' => 'expr', [ 'expr', '-', 'expr' ], 0 ],
  [ 'TIMES' => 'expr', [ 'expr', '*', 'expr' ], 0 ],
  [ 'DIV' => 'expr', [ 'expr', '/', 'expr' ], 0 ],
  [ 'COMMA' => 'expr', [ 'expr', ',', 'expr' ], 0 ],
  [ 'ID:RANGE' => 'expr', [ 'ID', 'rangeORenum' ], 0 ],
  [ 'NUM' => 'expr', [ 'NUM' ], 0 ],
  [ 'rangeORenum' => 'rangeORenum', [  ], 0 ],
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
  'rangeORenum' => 10,
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
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'pascalnestedeyapp3_5.eyp',
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
		DEFAULT => -10,
		GOTOS => {
			'rangeORenum' => 6
		}
	},
	{#State 3
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 7
		}
	},
	{#State 4
		ACTIONS => {
			".." => 9,
			"-" => 8,
			"*" => 10,
			"+" => 11,
			"/" => 13,
			"," => 12
		}
	},
	{#State 5
		DEFAULT => 14
	},
	{#State 6
		DEFAULT => -8
	},
	{#State 7
		ACTIONS => {
			"-" => 8,
			"*" => 10,
			"+" => 11,
			"/" => 13,
			"," => 12,
			")" => 15
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
		ACTIONS => {
			'ID' => 2,
			'NUM' => 1,
			"(" => 3
		},
		GOTOS => {
			'expr' => 21
		}
	},
	{#State 14
		DEFAULT => 0
	},
	{#State 15
		DEFAULT => -2
	},
	{#State 16
		ACTIONS => {
			"/" => 13,
			"*" => 10
		},
		DEFAULT => -4
	},
	{#State 17
		ACTIONS => {
			"-" => 8,
			"*" => 10,
			"+" => 11,
			"/" => 13,
			"," => 12
		},
		DEFAULT => -1
	},
	{#State 18
		DEFAULT => -5
	},
	{#State 19
		ACTIONS => {
			"/" => 13,
			"*" => 10
		},
		DEFAULT => -3
	},
	{#State 20
		ACTIONS => {
			"-" => 8,
			"+" => 11,
			"/" => 13,
			"*" => 10
		},
		DEFAULT => -7
	},
	{#State 21
		DEFAULT => -6
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 287 range_conflict.pm
	],
	[#Rule range_1
		 'range', 3, undef
#line 291 range_conflict.pm
	],
	[#Rule expr_2
		 'expr', 3,
sub {
#line 46 "pascalnestedeyapp3_5.eyp"
 $_[2] }
#line 298 range_conflict.pm
	],
	[#Rule PLUS
		 'expr', 3, undef
#line 302 range_conflict.pm
	],
	[#Rule MINUS
		 'expr', 3, undef
#line 306 range_conflict.pm
	],
	[#Rule TIMES
		 'expr', 3, undef
#line 310 range_conflict.pm
	],
	[#Rule DIV
		 'expr', 3, undef
#line 314 range_conflict.pm
	],
	[#Rule COMMA
		 'expr', 3, undef
#line 318 range_conflict.pm
	],
	[#Rule ID:RANGE
		 'expr', 2, undef
#line 322 range_conflict.pm
	],
	[#Rule NUM
		 'expr', 1, undef
#line 326 range_conflict.pm
	],
	[#Rule rangeORenum
		 'rangeORenum', 0,
sub {
#line 57 "pascalnestedeyapp3_5.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 9 "pascalnestedeyapp3_5.eyp" 

  $self->YYIf('range', 'ID:RANGE', 'ID:ENUM');
#line 337 range_conflict.pm
  }

}
#line 341 range_conflict.pm
	]
],
#line 344 range_conflict.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'rangeORenum' => {
                             'production' => {
                                               '-13' => [
                                                          1
                                                        ],
                                               '-5' => [
                                                         1
                                                       ]
                                             },
                             'explorerline' => 13,
                             'total' => 2,
                             'line' => 9
                           }
        }
,
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
         'NUM', 
         'rangeORenum', );
  $self;
}

#line 57 "pascalnestedeyapp3_5.eyp"


=head1 SYNOPSIS

See 

=over 2

=item * File C<userange.pl>.

=item * File pascalenumeratedvsrange.eyp in examples/debuggintut/

=item * The Bison manual L<http://www.gnu.org/software/bison/manual/html_mono/bison.html>

=back

Compile it with:

      eyapp -TC pascalnestedeyapp3_5.eyp

The compile it again, but using 'range' as start symbol (option -S)
and option -P to generate a parser that accepts if a prefix of the input matches:

      eyapp -P -S range pascalnestedeyapp3_5.eyp 

Run it with this options:

    $ ./pascalnestedeyapp3_5.pm -t -i -m 1 -c 'type e = (x, y, z);'
    $ ./pascalnestedeyapp3_5.pm -t -i -m 1 -c 'type e = (x, @, z);'

Try also these inputs:

                type e = (x) .. (y);
                type r = (x) ..  y ;
                type r = (x+2)*3 ..  y/2 ;
                type e = (x, y, z);
                type e = (x);
                type e = (x, y, z) .. (u+v);


=cut


#line 429 range_conflict.pm



1;
