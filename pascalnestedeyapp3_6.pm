#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.175.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'pascalnestedeyapp3_6.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package pascalnestedeyapp3_6;
use strict;

push @pascalnestedeyapp3_6::ISA, 'Parse::Eyapp::Driver';




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


#line 62 ./pascalnestedeyapp3_6.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@pascalnestedeyapp3_6::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.175',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'type_decl', '$end' ], 0 ],
  [ 'typeDecl_is_type_ID_type' => 'type_decl', [ 'type', 'ID', '=', 'type', ';' ], 0 ],
  [ 'ENUM' => 'type', [ 'rORe_explorer', '(', 'id_list', ')' ], 0 ],
  [ 'RANGE' => 'type', [ 'rORe_explorer', 'range' ], 0 ],
  [ 'range_is_expr_expr' => 'range', [ 'expr', '..', 'expr' ], 0 ],
  [ 'ID:ENUM' => 'id_list', [ 'ID', 'rORe' ], 0 ],
  [ 'idList_is_idList_ID' => 'id_list', [ 'id_list', ',', 'ID' ], 0 ],
  [ 'expr_is_expr' => 'expr', [ '(', 'expr', ')' ], 0 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 0 ],
  [ 'MINUS' => 'expr', [ 'expr', '-', 'expr' ], 0 ],
  [ 'TIMES' => 'expr', [ 'expr', '*', 'expr' ], 0 ],
  [ 'DIV' => 'expr', [ 'expr', '/', 'expr' ], 0 ],
  [ 'COMMA' => 'expr', [ 'expr', ',', 'expr' ], 0 ],
  [ 'ID:RANGE' => 'expr', [ 'ID', 'rORe' ], 0 ],
  [ 'NUM' => 'expr', [ 'NUM' ], 0 ],
  [ 'rORe' => 'rORe', [  ], 0 ],
  [ 'rORe_explorer' => 'rORe_explorer', [  ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'typeDecl_is_type_ID_type' => 1,
  'ENUM' => 2,
  'RANGE' => 3,
  'range_is_expr_expr' => 4,
  ':ENUM' => 5,
  'ID:ENUM' => 5,
  'idList_is_idList_ID' => 6,
  'expr_is_expr' => 7,
  'PLUS' => 8,
  'MINUS' => 9,
  'TIMES' => 10,
  'DIV' => 11,
  'COMMA' => 12,
  ':RANGE' => 13,
  'ID:RANGE' => 13,
  'NUM' => 14,
  'rORe' => 15,
  'rORe_explorer' => 16,
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
	'=' => { ISSEMANTIC => 0 },
	'type' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'pascalnestedeyapp3_6.eyp',
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
		DEFAULT => -16,
		GOTOS => {
			'type' => 6,
			'rORe_explorer' => 7
		}
	},
	{#State 6
		ACTIONS => {
			";" => 8
		}
	},
	{#State 7
		ACTIONS => {
			'ID' => 10,
			'NUM' => 9,
			"(" => 11
		},
		GOTOS => {
			'expr' => 12,
			'range' => 13
		}
	},
	{#State 8
		DEFAULT => -1
	},
	{#State 9
		DEFAULT => -14
	},
	{#State 10
		DEFAULT => -15,
		GOTOS => {
			'rORe' => 14
		}
	},
	{#State 11
		ACTIONS => {
			'ID' => 15,
			'NUM' => 9,
			"(" => 17
		},
		GOTOS => {
			'id_list' => 16,
			'expr' => 18
		}
	},
	{#State 12
		ACTIONS => {
			".." => 20,
			"-" => 19,
			"*" => 21,
			"+" => 22,
			"/" => 24,
			"," => 23
		}
	},
	{#State 13
		DEFAULT => -3
	},
	{#State 14
		DEFAULT => -13
	},
	{#State 15
		DEFAULT => -15,
		GOTOS => {
			'rORe' => 25
		}
	},
	{#State 16
		ACTIONS => {
			"," => 26,
			")" => 27
		}
	},
	{#State 17
		ACTIONS => {
			'ID' => 10,
			'NUM' => 9,
			"(" => 17
		},
		GOTOS => {
			'expr' => 18
		}
	},
	{#State 18
		ACTIONS => {
			"-" => 19,
			"*" => 21,
			"+" => 22,
			"/" => 24,
			"," => 23,
			")" => 28
		}
	},
	{#State 19
		ACTIONS => {
			'ID' => 10,
			'NUM' => 9,
			"(" => 17
		},
		GOTOS => {
			'expr' => 29
		}
	},
	{#State 20
		ACTIONS => {
			'ID' => 10,
			'NUM' => 9,
			"(" => 17
		},
		GOTOS => {
			'expr' => 30
		}
	},
	{#State 21
		ACTIONS => {
			'ID' => 10,
			'NUM' => 9,
			"(" => 17
		},
		GOTOS => {
			'expr' => 31
		}
	},
	{#State 22
		ACTIONS => {
			'ID' => 10,
			'NUM' => 9,
			"(" => 17
		},
		GOTOS => {
			'expr' => 32
		}
	},
	{#State 23
		ACTIONS => {
			'ID' => 10,
			'NUM' => 9,
			"(" => 17
		},
		GOTOS => {
			'expr' => 33
		}
	},
	{#State 24
		ACTIONS => {
			'ID' => 10,
			'NUM' => 9,
			"(" => 17
		},
		GOTOS => {
			'expr' => 34
		}
	},
	{#State 25
		ACTIONS => {
			"," => -5,
			")" => -5
		},
		DEFAULT => -13
	},
	{#State 26
		ACTIONS => {
			'ID' => 35
		}
	},
	{#State 27
		DEFAULT => -2
	},
	{#State 28
		DEFAULT => -7
	},
	{#State 29
		ACTIONS => {
			"/" => 24,
			"*" => 21
		},
		DEFAULT => -9
	},
	{#State 30
		ACTIONS => {
			"-" => 19,
			"*" => 21,
			"+" => 22,
			"/" => 24,
			"," => 23
		},
		DEFAULT => -4
	},
	{#State 31
		DEFAULT => -10
	},
	{#State 32
		ACTIONS => {
			"/" => 24,
			"*" => 21
		},
		DEFAULT => -8
	},
	{#State 33
		ACTIONS => {
			"-" => 19,
			"+" => 22,
			"/" => 24,
			"*" => 21
		},
		DEFAULT => -12
	},
	{#State 34
		DEFAULT => -11
	},
	{#State 35
		DEFAULT => -6
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 382 ./pascalnestedeyapp3_6.pm
	],
	[#Rule typeDecl_is_type_ID_type
		 'type_decl', 5,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 389 ./pascalnestedeyapp3_6.pm
	],
	[#Rule ENUM
		 'type', 4,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 396 ./pascalnestedeyapp3_6.pm
	],
	[#Rule RANGE
		 'type', 2,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 403 ./pascalnestedeyapp3_6.pm
	],
	[#Rule range_is_expr_expr
		 'range', 3,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 410 ./pascalnestedeyapp3_6.pm
	],
	[#Rule ID:ENUM
		 'id_list', 2,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 417 ./pascalnestedeyapp3_6.pm
	],
	[#Rule idList_is_idList_ID
		 'id_list', 3,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 424 ./pascalnestedeyapp3_6.pm
	],
	[#Rule expr_is_expr
		 'expr', 3,
sub {
#line 35 "pascalnestedeyapp3_6.eyp"
 $_[2] }
#line 431 ./pascalnestedeyapp3_6.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 438 ./pascalnestedeyapp3_6.pm
	],
	[#Rule MINUS
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 445 ./pascalnestedeyapp3_6.pm
	],
	[#Rule TIMES
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 452 ./pascalnestedeyapp3_6.pm
	],
	[#Rule DIV
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 459 ./pascalnestedeyapp3_6.pm
	],
	[#Rule COMMA
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 466 ./pascalnestedeyapp3_6.pm
	],
	[#Rule ID:RANGE
		 'expr', 2,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 473 ./pascalnestedeyapp3_6.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 0 "pascalnestedeyapp3_6.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 480 ./pascalnestedeyapp3_6.pm
	],
	[#Rule rORe
		 'rORe', 0,
sub {
#line 46 "pascalnestedeyapp3_6.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 2 "pascalnestedeyapp3_6.eyp" 
    $self->YYIf('range', 'ID:RANGE', 'ID:ENUM');
#line 490 ./pascalnestedeyapp3_6.pm
  }
}
#line 493 ./pascalnestedeyapp3_6.pm
	],
	[#Rule rORe_explorer
		 'rORe_explorer', 0,
sub {
#line 46 "pascalnestedeyapp3_6.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 2 "pascalnestedeyapp3_6.eyp" 
{ $self->YYNestedParse('range'); }
#line 503 ./pascalnestedeyapp3_6.pm
  }

}
#line 507 ./pascalnestedeyapp3_6.pm
	]
],
#line 510 ./pascalnestedeyapp3_6.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'rORe' => {
                      'production' => {
                                        '-13' => [
                                                   1
                                                 ],
                                        '-5' => [
                                                  1
                                                ]
                                      },
                      'explorerline' => 2,
                      'states' => [
                                    {
                                      '25' => [
                                                ',',
                                                ')'
                                              ]
                                    }
                                  ],
                      'total' => 2,
                      'line' => 2
                    }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'typeDecl_is_type_ID_type', 
         'ENUM', 
         'RANGE', 
         'range_is_expr_expr', 
         'ID:ENUM', 
         'idList_is_idList_ID', 
         'expr_is_expr', 
         'PLUS', 
         'MINUS', 
         'TIMES', 
         'DIV', 
         'COMMA', 
         'ID:RANGE', 
         'NUM', 
         'rORe', 
         'rORe_explorer', );
  $self;
}

#line 46 "pascalnestedeyapp3_6.eyp"


=head1 SYNOPSIS

See 

=over 2

=item * File C<userange.pl>.

=item * File pascalenumeratedvsrange.eyp in examples/debuggintut/

=item * The Bison manual L<http://www.gnu.org/software/bison/manual/html_mono/bison.html>

=back

Compile it with:

      eyapp -TC pascalnestedeyapp3_6.eyp

The compile it again, but using 'range' as start symbol (option -S)
and option -P to generate a parser that accepts if a prefix of the input matches:

      eyapp -P -S range pascalnestedeyapp3_6.eyp 

Run it with this options:

    $ ./pascalnestedeyapp3_6.pm -t -i -m 1 -c 'type e = (x, y, z);'
    $ ./pascalnestedeyapp3_6.pm -t -i -m 1 -c 'type e = (x, @, z);'

Try also these inputs:

                type e = (x) .. (y);
                type r = (x) ..  y ;
                type r = (x+2)*3 ..  y/2 ;
                type e = (x, y, z);
                type e = (x);
                type e = (x, y, z) .. (u+v);


=cut


#line 609 ./pascalnestedeyapp3_6.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
