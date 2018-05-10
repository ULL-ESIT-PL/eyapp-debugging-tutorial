#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.166.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'pascalenumeratedvsrangesolvedviadyn.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package pascalenumeratedvsrangesolvedviadyn;
use strict;

push @pascalenumeratedvsrangesolvedviadyn::ISA, 'Parse::Eyapp::Driver';




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

      m{\G(type|\.\.|\-|\+|\;|\/|\,|\=|\(|\*|\))}gc and return ($1, $1);

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


sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }


#line 61 ./pascalenumeratedvsrangesolvedviadyn.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@pascalenumeratedvsrangesolvedviadyn::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.166',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'type_decl', '$end' ], 0 ],
  [ 'type_decl_1' => 'type_decl', [ 'type', 'ID', '=', 'type', ';' ], 0 ],
  [ 'ENUM' => 'type', [ '(', 'id_list', ')' ], 0 ],
  [ 'RANGE' => 'type', [ 'expr', '..', 'expr' ], 0 ],
  [ 'ID:ENUM' => 'id_list', [ 'ID', 'rangeORenum' ], 0 ],
  [ 'id_list_5' => 'id_list', [ 'id_list', ',', 'ID' ], 0 ],
  [ 'expr_6' => 'expr', [ '(', 'expr', ')' ], 0 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 0 ],
  [ 'MINUS' => 'expr', [ 'expr', '-', 'expr' ], 0 ],
  [ 'TIMES' => 'expr', [ 'expr', '*', 'expr' ], 0 ],
  [ 'DIV' => 'expr', [ 'expr', '/', 'expr' ], 0 ],
  [ 'COMMA' => 'expr', [ 'expr', ',', 'expr' ], 0 ],
  [ 'ID:RANGE' => 'expr', [ 'ID', 'rangeORenum' ], 0 ],
  [ 'NUM' => 'expr', [ 'NUM' ], 0 ],
  [ 'rangeORenum' => 'rangeORenum', [  ], 0 ],
],
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
	'=' => { ISSEMANTIC => 0 },
	'type' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'pascalenumeratedvsrangesolvedviadyn.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"type" => 2
		},
		GOTOS => {
			'type_decl' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 3
		}
	},
	{#State 2
		ACTIONS => {
			'ID' => 4
		}
	},
	{#State 3
		DEFAULT => 0
	},
	{#State 4
		ACTIONS => {
			"=" => 5
		}
	},
	{#State 5
		ACTIONS => {
			'ID' => 7,
			'NUM' => 6,
			"(" => 8
		},
		GOTOS => {
			'expr' => 9,
			'type' => 10
		}
	},
	{#State 6
		DEFAULT => -13
	},
	{#State 7
		DEFAULT => -14,
		GOTOS => {
			'rangeORenum' => 11
		}
	},
	{#State 8
		ACTIONS => {
			'ID' => 12,
			'NUM' => 6,
			"(" => 14
		},
		GOTOS => {
			'id_list' => 13,
			'expr' => 15
		}
	},
	{#State 9
		ACTIONS => {
			".." => 17,
			"-" => 16,
			"*" => 18,
			"+" => 19,
			"/" => 21,
			"," => 20
		}
	},
	{#State 10
		ACTIONS => {
			";" => 22
		}
	},
	{#State 11
		DEFAULT => -12
	},
	{#State 12
		DEFAULT => -14,
		GOTOS => {
			'rangeORenum' => 23
		}
	},
	{#State 13
		ACTIONS => {
			"," => 24,
			")" => 25
		}
	},
	{#State 14
		ACTIONS => {
			'ID' => 7,
			'NUM' => 6,
			"(" => 14
		},
		GOTOS => {
			'expr' => 15
		}
	},
	{#State 15
		ACTIONS => {
			"-" => 16,
			"*" => 18,
			"+" => 19,
			"/" => 21,
			"," => 20,
			")" => 26
		}
	},
	{#State 16
		ACTIONS => {
			'ID' => 7,
			'NUM' => 6,
			"(" => 14
		},
		GOTOS => {
			'expr' => 27
		}
	},
	{#State 17
		ACTIONS => {
			'ID' => 7,
			'NUM' => 6,
			"(" => 14
		},
		GOTOS => {
			'expr' => 28
		}
	},
	{#State 18
		ACTIONS => {
			'ID' => 7,
			'NUM' => 6,
			"(" => 14
		},
		GOTOS => {
			'expr' => 29
		}
	},
	{#State 19
		ACTIONS => {
			'ID' => 7,
			'NUM' => 6,
			"(" => 14
		},
		GOTOS => {
			'expr' => 30
		}
	},
	{#State 20
		ACTIONS => {
			'ID' => 7,
			'NUM' => 6,
			"(" => 14
		},
		GOTOS => {
			'expr' => 31
		}
	},
	{#State 21
		ACTIONS => {
			'ID' => 7,
			'NUM' => 6,
			"(" => 14
		},
		GOTOS => {
			'expr' => 32
		}
	},
	{#State 22
		DEFAULT => -1
	},
	{#State 23
		ACTIONS => {
			"," => -4,
			")" => -4
		},
		DEFAULT => -12
	},
	{#State 24
		ACTIONS => {
			'ID' => 33
		}
	},
	{#State 25
		DEFAULT => -2
	},
	{#State 26
		DEFAULT => -6
	},
	{#State 27
		ACTIONS => {
			"/" => 21,
			"*" => 18
		},
		DEFAULT => -8
	},
	{#State 28
		ACTIONS => {
			"-" => 16,
			"*" => 18,
			"+" => 19,
			"/" => 21,
			"," => 20
		},
		DEFAULT => -3
	},
	{#State 29
		DEFAULT => -9
	},
	{#State 30
		ACTIONS => {
			"/" => 21,
			"*" => 18
		},
		DEFAULT => -7
	},
	{#State 31
		ACTIONS => {
			"-" => 16,
			"+" => 19,
			"/" => 21,
			"*" => 18
		},
		DEFAULT => -11
	},
	{#State 32
		DEFAULT => -10
	},
	{#State 33
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 347 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule type_decl_1
		 'type_decl', 5, undef
#line 351 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule ENUM
		 'type', 3, undef
#line 355 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule RANGE
		 'type', 3, undef
#line 359 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule ID:ENUM
		 'id_list', 2, undef
#line 363 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule id_list_5
		 'id_list', 3, undef
#line 367 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule expr_6
		 'expr', 3,
sub {
#line 37 "pascalenumeratedvsrangesolvedviadyn.eyp"
 $_[2] }
#line 374 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule PLUS
		 'expr', 3, undef
#line 378 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule MINUS
		 'expr', 3, undef
#line 382 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule TIMES
		 'expr', 3, undef
#line 386 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule DIV
		 'expr', 3, undef
#line 390 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule COMMA
		 'expr', 3, undef
#line 394 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule ID:RANGE
		 'expr', 2, undef
#line 398 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule NUM
		 'expr', 1, undef
#line 402 ./pascalenumeratedvsrangesolvedviadyn.pm
	],
	[#Rule rangeORenum
		 'rangeORenum', 0,
sub {
#line 48 "pascalenumeratedvsrangesolvedviadyn.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 3 "pascalenumeratedvsrangesolvedviadyn.eyp" 

  my $s = $self->YYLookBothWays('type', ';');
  if ($s =~ /^type ID = \( ID ( , ID )* \) ;$/x) 
       { $self->YYSetReduce([',', ')'], 'ID:ENUM' ); }
  else { $self->YYSetReduce([',', ')'], 'ID:RANGE' ); }
#line 416 ./pascalenumeratedvsrangesolvedviadyn.pm
  }

}
#line 420 ./pascalenumeratedvsrangesolvedviadyn.pm
	]
],
#line 423 ./pascalenumeratedvsrangesolvedviadyn.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'rangeORenum' => {
                             'production' => {
                                               '-12' => [
                                                          1
                                                        ],
                                               '-4' => [
                                                         1
                                                       ]
                                             },
                             'line' => 3
                           }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'type_decl_1', 
         'ENUM', 
         'RANGE', 
         'ID:ENUM', 
         'id_list_5', 
         'expr_6', 
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

#line 48 "pascalenumeratedvsrangesolvedviadyn.eyp"


=head1 SYNOPSIS

See 

=over 2

=item * File pascalenumeratedvsrange.eyp in examples/debuggintut/

=item * The Bison manual L<http://www.gnu.org/software/bison/manual/html_mono/bison.html>

=back

Compile it with something like:

      eyapp -TC pascalenumeratedvsrangePPCR.eyp

Run it with this options:

    $ ./pascalenumeratedvsrangePPCR.pm -t -i -m 1 -c 'type e = (x, y, z);'

Try also these inputs:

                type e = (x) .. (y);
                type r = (x) ..  y ;
                type r = (x+2)*3 ..  y/2 ;
                type e = (x, y, z);
                type e = (x);
                type e = (x, y, z) .. (u+v);

=cut


#line 501 ./pascalenumeratedvsrangesolvedviadyn.pm



1;
