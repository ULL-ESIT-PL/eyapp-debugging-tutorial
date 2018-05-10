#!/opt/local/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'pascalnestedeyapp3.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package pascalnestedeyapp3;
use strict;

push @pascalnestedeyapp3::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "pascalnestedeyapp3.eyp"

  my $is_range = 0;


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


#line 65 ./pascalnestedeyapp3.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@pascalnestedeyapp3::ISA variable inside the header section of the eyapp program?
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
  [ 'typeDecl_is_type_ID_type' => 'type_decl', [ 'type', 'ID', '=', 'type', ';' ], 0 ],
  [ 'ENUM' => 'type', [ 'rangeORenum_explorer', '(', 'id_list', ')' ], 0 ],
  [ 'RANGE' => 'type', [ 'rangeORenum_explorer', 'range' ], 0 ],
  [ 'range_is_expr_expr' => 'range', [ 'expr', '..', 'expr' ], 0 ],
  [ 'ID:ENUM' => 'id_list', [ 'ID' ], 0 ],
  [ 'idList_is_idList_ID' => 'id_list', [ 'id_list', ',', 'ID' ], 0 ],
  [ 'expr_is_expr' => 'expr', [ '(', 'expr', ')' ], 0 ],
  [ 'PLUS' => 'expr', [ 'expr', '+', 'expr' ], 0 ],
  [ 'MINUS' => 'expr', [ 'expr', '-', 'expr' ], 0 ],
  [ 'TIMES' => 'expr', [ 'expr', '*', 'expr' ], 0 ],
  [ 'DIV' => 'expr', [ 'expr', '/', 'expr' ], 0 ],
  [ 'COMMA' => 'expr', [ 'expr', ',', 'expr' ], 0 ],
  [ 'ID:RANGE' => 'expr', [ 'ID' ], 0 ],
  [ 'NUM' => 'expr', [ 'NUM' ], 0 ],
  [ 'rangeORenum_explorer' => 'rangeORenum_explorer', [  ], 0 ],
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
  'rangeORenum_explorer' => 15,
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
    yyFILENAME  => 'pascalnestedeyapp3.eyp',
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
		DEFAULT => -15,
		GOTOS => {
			'rangeORenum_explorer' => 6,
			'type' => 7
		}
	},
	{#State 6
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 10
		},
		GOTOS => {
			'expr' => 11,
			'range' => 12
		}
	},
	{#State 7
		ACTIONS => {
			";" => 13
		}
	},
	{#State 8
		DEFAULT => -14
	},
	{#State 9
		DEFAULT => -13
	},
	{#State 10
		ACTIONS => {
			'ID' => 14,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'id_list' => 15,
			'expr' => 17
		}
	},
	{#State 11
		ACTIONS => {
			".." => 19,
			"-" => 18,
			"*" => 20,
			"+" => 21,
			"/" => 23,
			"," => 22
		}
	},
	{#State 12
		DEFAULT => -3
	},
	{#State 13
		DEFAULT => -1
	},
	{#State 14
		ACTIONS => {
			"," => -5,
			")" => -5
		},
		DEFAULT => -13
	},
	{#State 15
		ACTIONS => {
			"," => 24,
			")" => 25
		}
	},
	{#State 16
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
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
			")" => 26
		}
	},
	{#State 18
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 27
		}
	},
	{#State 19
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 28
		}
	},
	{#State 20
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 29
		}
	},
	{#State 21
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 30
		}
	},
	{#State 22
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 31
		}
	},
	{#State 23
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 32
		}
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
		DEFAULT => -7
	},
	{#State 27
		ACTIONS => {
			"/" => 23,
			"*" => 20
		},
		DEFAULT => -9
	},
	{#State 28
		ACTIONS => {
			"-" => 18,
			"*" => 20,
			"+" => 21,
			"/" => 23,
			"," => 22
		},
		DEFAULT => -4
	},
	{#State 29
		DEFAULT => -10
	},
	{#State 30
		ACTIONS => {
			"/" => 23,
			"*" => 20
		},
		DEFAULT => -8
	},
	{#State 31
		ACTIONS => {
			"-" => 18,
			"+" => 21,
			"/" => 23,
			"*" => 20
		},
		DEFAULT => -12
	},
	{#State 32
		DEFAULT => -11
	},
	{#State 33
		DEFAULT => -6
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 371 ./pascalnestedeyapp3.pm
	],
	[#Rule typeDecl_is_type_ID_type
		 'type_decl', 5,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 378 ./pascalnestedeyapp3.pm
	],
	[#Rule ENUM
		 'type', 4,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 385 ./pascalnestedeyapp3.pm
	],
	[#Rule RANGE
		 'type', 2,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 392 ./pascalnestedeyapp3.pm
	],
	[#Rule range_is_expr_expr
		 'range', 3,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 399 ./pascalnestedeyapp3.pm
	],
	[#Rule ID:ENUM
		 'id_list', 1,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 406 ./pascalnestedeyapp3.pm
	],
	[#Rule idList_is_idList_ID
		 'id_list', 3,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 413 ./pascalnestedeyapp3.pm
	],
	[#Rule expr_is_expr
		 'expr', 3,
sub {
#line 45 "pascalnestedeyapp3.eyp"
 $_[2] }
#line 420 ./pascalnestedeyapp3.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 427 ./pascalnestedeyapp3.pm
	],
	[#Rule MINUS
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 434 ./pascalnestedeyapp3.pm
	],
	[#Rule TIMES
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 441 ./pascalnestedeyapp3.pm
	],
	[#Rule DIV
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 448 ./pascalnestedeyapp3.pm
	],
	[#Rule COMMA
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 455 ./pascalnestedeyapp3.pm
	],
	[#Rule ID:RANGE
		 'expr', 1,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 462 ./pascalnestedeyapp3.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 0 "pascalnestedeyapp3.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 469 ./pascalnestedeyapp3.pm
	],
	[#Rule rangeORenum_explorer
		 'rangeORenum_explorer', 0,
sub {
#line 56 "pascalnestedeyapp3.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 12 "pascalnestedeyapp3.eyp" 
 $is_range = $self->YYPreParse('range'); 
#line 479 ./pascalnestedeyapp3.pm
  }
}
#line 482 ./pascalnestedeyapp3.pm
	]
],
#line 485 ./pascalnestedeyapp3.pm
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
                             'explorerline' => 12,
                             'codeh' => '  my $self = $_[0];
  for (${$self->input()}) {  
#line 5 "pascalnestedeyapp3.eyp" 

  if ($is_range) 
    { $self->YYSetReduce2([,, )], ID:RANGE ); }
  else 
    { $self->YYSetReduce2([,, )], ID:ENUM ); }
#line 510 ./pascalnestedeyapp3.pm
  }

',
                             'totalviewpoint' => 2,
                             'states' => [
                                           {
                                             '14' => [
                                                       ',',
                                                       ')'
                                                     ]
                                           }
                                         ],
                             'total' => 2,
                             'line' => 5
                           }
        }
,
    yystateconflict => { 14 => [                    { 
                      name => 'rangeORenum', 
                      codeh => sub {   my $self = $_[0];
  for (${$self->input()}) {  
#line 5 "pascalnestedeyapp3.eyp" 

  if ($is_range) 
    { $self->YYSetReduce2([',', ')'], 'ID:RANGE' ); }
  else 
    { $self->YYSetReduce2([',', ')'], 'ID:ENUM' ); }
#line 538 ./pascalnestedeyapp3.pm
  }

 },
                   },
 ], },
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
         'rangeORenum_explorer', );
  $self;
}

#line 56 "pascalnestedeyapp3.eyp"


=head1 SYNOPSIS

See 

=over 2

=item * File C<userange.pl>.

=item * File pascalenumeratedvsrange.eyp in examples/debuggintut/

=item * The Bison manual L<http://www.gnu.org/software/bison/manual/html_mono/bison.html>

=back

Compile it with:

      eyapp -TC pascalnestedeyapp3.eyp

The compile it again, but using 'range' as start symbol (option -S)
and option -P to generate a parser that accepts if a prefix of the input matches:

      eyapp -P -S range pascalnestedeyapp3.eyp 

Run it with this options:

    $ ./pascalnestedeyapp3.pm -t -i -m 1 -c 'type e = (x) .. (z);'
    $ ./pascalnestedeyapp3.pm -t -i -m 1 -c 'type e = (x, y, z);'
    $ ./pascalnestedeyapp3.pm -t -i -m 1 -c 'type e = (x, @, z);'

Try also these inputs:

                type e = (x) .. (y);
                type r = (x) ..  y ;
                type r = (x+2)*3 ..  y/2 ;
                type e = (x, y, z);
                type e = (x);
                type e = (x, y, z) .. (u+v);


=cut


#line 613 ./pascalnestedeyapp3.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
