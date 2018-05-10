#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'pascalnestedeyappExplorerOnly.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package pascalnestedeyappExplorerOnly;
use strict;

push @pascalnestedeyappExplorerOnly::ISA, 'Parse::Eyapp::Driver';




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


#line 62 ./pascalnestedeyappExplorerOnly.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@pascalnestedeyappExplorerOnly::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'type_decl', '$end' ], 0 ],
  [ 'typeDecl_is_type_ID_rangeORenumExplorer_type' => 'type_decl', [ 'type', 'ID', '=', 'rangeORenum_explorer', 'type', ';' ], 0 ],
  [ 'ENUM' => 'type', [ '(', 'id_list', ')' ], 0 ],
  [ 'RANGE' => 'type', [ 'range' ], 0 ],
  [ 'range_is_expr_expr' => 'range', [ 'expr', '..', 'expr' ], 0 ],
  [ 'ID:ENUM' => 'id_list', [ 'ID', 'rangeORenum' ], 0 ],
  [ 'idList_is_idList_ID' => 'id_list', [ 'id_list', ',', 'ID' ], 0 ],
  [ 'expr_is_expr' => 'expr', [ '(', 'expr', ')' ], 0 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 0 ],
  [ 'MINUS' => 'expr', [ 'expr', '-', 'expr' ], 0 ],
  [ 'TIMES' => 'expr', [ 'expr', '*', 'expr' ], 0 ],
  [ 'DIV' => 'expr', [ 'expr', '/', 'expr' ], 0 ],
  [ 'COMMA' => 'expr', [ 'expr', ',', 'expr' ], 0 ],
  [ 'ID:RANGE' => 'expr', [ 'ID', 'rangeORenum' ], 0 ],
  [ 'NUM' => 'expr', [ 'NUM' ], 0 ],
  [ 'rangeORenum' => 'rangeORenum', [  ], 0 ],
  [ 'rangeORenum_explorer' => 'rangeORenum_explorer', [  ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'typeDecl_is_type_ID_rangeORenumExplorer_type' => 1,
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
  'rangeORenum' => 15,
  'rangeORenum_explorer' => 16,
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
    yyFILENAME  => 'pascalnestedeyappExplorerOnly.eyp',
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
			'rangeORenum_explorer' => 6
		}
	},
	{#State 6
		ACTIONS => {
			'ID' => 8,
			'NUM' => 7,
			"(" => 9
		},
		GOTOS => {
			'expr' => 10,
			'range' => 11,
			'type' => 12
		}
	},
	{#State 7
		DEFAULT => -14
	},
	{#State 8
		DEFAULT => -15,
		GOTOS => {
			'rangeORenum' => 13
		}
	},
	{#State 9
		ACTIONS => {
			'ID' => 14,
			'NUM' => 7,
			"(" => 16
		},
		GOTOS => {
			'id_list' => 15,
			'expr' => 17
		}
	},
	{#State 10
		ACTIONS => {
			".." => 19,
			"-" => 18,
			"*" => 20,
			"+" => 21,
			"/" => 23,
			"," => 22
		}
	},
	{#State 11
		DEFAULT => -3
	},
	{#State 12
		ACTIONS => {
			";" => 24
		}
	},
	{#State 13
		DEFAULT => -13
	},
	{#State 14
		DEFAULT => -15,
		GOTOS => {
			'rangeORenum' => 25
		}
	},
	{#State 15
		ACTIONS => {
			"," => 26,
			")" => 27
		}
	},
	{#State 16
		ACTIONS => {
			'ID' => 8,
			'NUM' => 7,
			"(" => 16
		},
		GOTOS => {
			'expr' => 17
		}
	},
	{#State 17
		ACTIONS => {
			"-" => 18,
			"*" => 20,
			"+" => 21,
			"/" => 23,
			"," => 22,
			")" => 28
		}
	},
	{#State 18
		ACTIONS => {
			'ID' => 8,
			'NUM' => 7,
			"(" => 16
		},
		GOTOS => {
			'expr' => 29
		}
	},
	{#State 19
		ACTIONS => {
			'ID' => 8,
			'NUM' => 7,
			"(" => 16
		},
		GOTOS => {
			'expr' => 30
		}
	},
	{#State 20
		ACTIONS => {
			'ID' => 8,
			'NUM' => 7,
			"(" => 16
		},
		GOTOS => {
			'expr' => 31
		}
	},
	{#State 21
		ACTIONS => {
			'ID' => 8,
			'NUM' => 7,
			"(" => 16
		},
		GOTOS => {
			'expr' => 32
		}
	},
	{#State 22
		ACTIONS => {
			'ID' => 8,
			'NUM' => 7,
			"(" => 16
		},
		GOTOS => {
			'expr' => 33
		}
	},
	{#State 23
		ACTIONS => {
			'ID' => 8,
			'NUM' => 7,
			"(" => 16
		},
		GOTOS => {
			'expr' => 34
		}
	},
	{#State 24
		DEFAULT => -1
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
			"/" => 23,
			"*" => 20
		},
		DEFAULT => -9
	},
	{#State 30
		ACTIONS => {
			"-" => 18,
			"*" => 20,
			"+" => 21,
			"/" => 23,
			"," => 22
		},
		DEFAULT => -4
	},
	{#State 31
		DEFAULT => -10
	},
	{#State 32
		ACTIONS => {
			"/" => 23,
			"*" => 20
		},
		DEFAULT => -8
	},
	{#State 33
		ACTIONS => {
			"-" => 18,
			"+" => 21,
			"/" => 23,
			"*" => 20
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
#line 382 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule typeDecl_is_type_ID_rangeORenumExplorer_type
		 'type_decl', 6,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 389 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule ENUM
		 'type', 3,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 396 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule RANGE
		 'type', 1,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 403 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule range_is_expr_expr
		 'range', 3,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 410 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule ID:ENUM
		 'id_list', 2,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 417 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule idList_is_idList_ID
		 'id_list', 3,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 424 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule expr_is_expr
		 'expr', 3,
sub {
#line 46 "pascalnestedeyappExplorerOnly.eyp"
 $_[2] }
#line 431 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 438 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule MINUS
		 'expr', 3,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 445 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule TIMES
		 'expr', 3,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 452 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule DIV
		 'expr', 3,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 459 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule COMMA
		 'expr', 3,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 466 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule ID:RANGE
		 'expr', 2,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 473 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 0 "pascalnestedeyappExplorerOnly.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 480 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule rangeORenum
		 'rangeORenum', 0,
sub {
#line 57 "pascalnestedeyappExplorerOnly.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 2 "pascalnestedeyappExplorerOnly.eyp" 

#line 490 ./pascalnestedeyappExplorerOnly.pm
  }

}
#line 494 ./pascalnestedeyappExplorerOnly.pm
	],
	[#Rule rangeORenum_explorer
		 'rangeORenum_explorer', 0,
sub {
#line 57 "pascalnestedeyappExplorerOnly.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 5 "pascalnestedeyappExplorerOnly.eyp" 
 
  my $is_range = 0;
  $is_range = $self->YYPreParse('range');

  if ($is_range) 
    { $self->YYSetReduce2('ID:RANGE' ); }
  else 
    { $self->YYSetReduce2('ID:ENUM' ); }
#line 511 ./pascalnestedeyappExplorerOnly.pm
  }

}
#line 515 ./pascalnestedeyappExplorerOnly.pm
	]
],
#line 518 ./pascalnestedeyappExplorerOnly.pm
    yybypass       => 0,
    yybuildingtree => 1,
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
                             'explorerline' => 5,
                             'totalviewpoint' => 1,
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
         'typeDecl_is_type_ID_rangeORenumExplorer_type', 
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
         'rangeORenum', 
         'rangeORenum_explorer', );
  $self;
}

#line 57 "pascalnestedeyappExplorerOnly.eyp"


=head1 SYNOPSIS

See 

=over 2

=item * File C<userange.pl>.

=item * File pascalenumeratedvsrange.eyp in examples/debuggintut/

=item * The Bison manual L<http://www.gnu.org/software/bison/manual/html_mono/bison.html>

=back

Compile it with:

      eyapp -TC pascalnestedeyappExplorerOnly.eyp

The compile it again, but using 'range' as start symbol (option -S)
and option -P to generate a parser that accepts if a prefix of the input matches:

      eyapp -P -S range pascalnestedeyappExplorerOnly.eyp 

Run it with this options:

    $ ./pascalnestedeyappExplorerOnly.pm -t -i -m 1 -c 'type e = (x, y, z);'
    $ ./pascalnestedeyappExplorerOnly.pm -t -i -m 1 -c 'type e = (x, @, z);'

Try also these inputs:

                type e = (x) .. (y);
                type r = (x) ..  y ;
                type r = (x+2)*3 ..  y/2 ;
                type e = (x, y, z);
                type e = (x);
                type e = (x, y, z) .. (u+v);


=cut


#line 618 ./pascalnestedeyappExplorerOnly.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
