#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.165.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'pascalnestedeyapp2.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package pascalnestedeyapp2;
use strict;

push @pascalnestedeyapp2::ISA, 'Parse::Eyapp::Driver';




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

#line 1 "pascalnestedeyapp2.eyp"

  my $is_range = 0;

#line 64 ./pascalnestedeyapp2.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@pascalnestedeyapp2::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.165',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'type_decl', '$end' ], 0 ],
  [ 'typeDecl_is_type_ID_type' => 'type_decl', [ 'type', 'ID', '=', 'type', ';' ], 0 ],
  [ 'ENUM' => 'type', [ 'Lookahead', '(', 'id_list', ')' ], 0 ],
  [ 'RANGE' => 'type', [ 'Lookahead', 'expr', '..', 'expr' ], 0 ],
  [ 'Lookahead_is_empty' => 'Lookahead', [  ], 0 ],
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
    yyFILENAME  => 'pascalnestedeyapp2.eyp',
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
		DEFAULT => -4,
		GOTOS => {
			'type' => 7,
			'Lookahead' => 6
		}
	},
	{#State 6
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 10
		},
		GOTOS => {
			'expr' => 11
		}
	},
	{#State 7
		ACTIONS => {
			";" => 12
		}
	},
	{#State 8
		DEFAULT => -14
	},
	{#State 9
		DEFAULT => -15,
		GOTOS => {
			'rangeORenum' => 13
		}
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
		DEFAULT => -1
	},
	{#State 13
		DEFAULT => -13
	},
	{#State 14
		DEFAULT => -15,
		GOTOS => {
			'rangeORenum' => 24
		}
	},
	{#State 15
		ACTIONS => {
			"," => 25,
			")" => 26
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
			")" => 27
		}
	},
	{#State 18
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 28
		}
	},
	{#State 19
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 29
		}
	},
	{#State 20
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 30
		}
	},
	{#State 21
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 31
		}
	},
	{#State 22
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 32
		}
	},
	{#State 23
		ACTIONS => {
			'ID' => 9,
			'NUM' => 8,
			"(" => 16
		},
		GOTOS => {
			'expr' => 33
		}
	},
	{#State 24
		ACTIONS => {
			"," => -5,
			")" => -5
		},
		DEFAULT => -13
	},
	{#State 25
		ACTIONS => {
			'ID' => 34
		}
	},
	{#State 26
		DEFAULT => -2
	},
	{#State 27
		DEFAULT => -7
	},
	{#State 28
		ACTIONS => {
			"/" => 23,
			"*" => 20
		},
		DEFAULT => -9
	},
	{#State 29
		ACTIONS => {
			"-" => 18,
			"*" => 20,
			"+" => 21,
			"/" => 23,
			"," => 22
		},
		DEFAULT => -3
	},
	{#State 30
		DEFAULT => -10
	},
	{#State 31
		ACTIONS => {
			"/" => 23,
			"*" => 20
		},
		DEFAULT => -8
	},
	{#State 32
		ACTIONS => {
			"-" => 18,
			"+" => 21,
			"/" => 23,
			"*" => 20
		},
		DEFAULT => -12
	},
	{#State 33
		DEFAULT => -11
	},
	{#State 34
		DEFAULT => -6
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 357 ./pascalnestedeyapp2.pm
	],
	[#Rule typeDecl_is_type_ID_type
		 'type_decl', 5,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 364 ./pascalnestedeyapp2.pm
	],
	[#Rule ENUM
		 'type', 4,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 371 ./pascalnestedeyapp2.pm
	],
	[#Rule RANGE
		 'type', 4,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 378 ./pascalnestedeyapp2.pm
	],
	[#Rule Lookahead_is_empty
		 'Lookahead', 0,
sub {
#line 33 "pascalnestedeyapp2.eyp"
 $is_range = $_[0]->YYPreParse('Range'); }
#line 385 ./pascalnestedeyapp2.pm
	],
	[#Rule ID:ENUM
		 'id_list', 2,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 392 ./pascalnestedeyapp2.pm
	],
	[#Rule idList_is_idList_ID
		 'id_list', 3,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 399 ./pascalnestedeyapp2.pm
	],
	[#Rule expr_is_expr
		 'expr', 3,
sub {
#line 42 "pascalnestedeyapp2.eyp"
 $_[2] }
#line 406 ./pascalnestedeyapp2.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 413 ./pascalnestedeyapp2.pm
	],
	[#Rule MINUS
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 420 ./pascalnestedeyapp2.pm
	],
	[#Rule TIMES
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 427 ./pascalnestedeyapp2.pm
	],
	[#Rule DIV
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 434 ./pascalnestedeyapp2.pm
	],
	[#Rule COMMA
		 'expr', 3,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 441 ./pascalnestedeyapp2.pm
	],
	[#Rule ID:RANGE
		 'expr', 2,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 448 ./pascalnestedeyapp2.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 0 "pascalnestedeyapp2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 455 ./pascalnestedeyapp2.pm
	],
	[#Rule rangeORenum
		 'rangeORenum', 0,
sub {
#line 53 "pascalnestedeyapp2.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 5 "pascalnestedeyapp2.eyp" 

  if ($is_range) 
    { $self->YYSetReduce([',', ')'], 'ID:RANGE' ); }
  else 
    { $self->YYSetReduce([',', ')'], 'ID:ENUM' ); }
#line 469 ./pascalnestedeyapp2.pm
  }

}
#line 473 ./pascalnestedeyapp2.pm
	]
],
#line 476 ./pascalnestedeyapp2.pm
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
                             'line' => 5
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
         'Lookahead_is_empty', 
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
         'rangeORenum', );
  $self;
}

#line 53 "pascalnestedeyapp2.eyp"


=head1 SYNOPSIS

See 

=over 2

=item * File C<userange.pl>.

=item * File C<Range.eyp>.

=item * File pascalenumeratedvsrange.eyp in examples/debuggintut/

=item * The Bison manual L<http://www.gnu.org/software/bison/manual/html_mono/bison.html>

=back

Compile it with:

      eyapp Range.eyp
      eyapp -TC pascalnestedeyapp2.eyp

Run it with this options:

    $ ./pascalnestedeyapp2.pm -t -i -m 1 -c 'type e = (x, y, z);'
    $ ./pascalnestedeyapp2.pm -t -i -m 1 -c 'type e = (x, @, z);'

Try also these inputs:

                type e = (x) .. (y);
                type r = (x) ..  y ;
                type r = (x+2)*3 ..  y/2 ;
                type e = (x, y, z);
                type e = (x);
                type e = (x, y, z) .. (u+v);


=cut


#line 562 ./pascalnestedeyapp2.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
