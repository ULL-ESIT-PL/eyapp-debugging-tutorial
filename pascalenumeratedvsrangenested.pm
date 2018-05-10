#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.165.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'pascalenumeratedvsrangenested.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package pascalenumeratedvsrangenested;
use strict;

push @pascalenumeratedvsrangenested::ISA, 'Parse::Eyapp::Driver';




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

      m{\G(\.\.|\-|\+|\;|\/|\,|\=|\(|\*|\))}gc and return ($1, $1);

      /\Gtype/gc and return ('TYPE', $1);
      /\G([A-Za-z][A-Za-z0-9_]*)/gc and return ('ID', $1);
      /\G(\d+)/gc and return ('NUM', $1);


      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
     # /\G\s*(\S+)/;
     # my $near = substr($1,0,10); 
     # die( "Error inside the lexical analyzer near '". $near
     #     ."'. Line: ".$self->line()
     #     .". File: '".$self->YYFilename()."'. No match found.\n");
    }
  }
;


sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 2 "pascalenumeratedvsrangenested.eyp"

  my $ID = qr{[A-Za-z][A-Za-z0-9_]*};         
  my ($PREFIX, $POSTFIX);
  {
     use Regexp::Grammars;
     qr{
         <grammar: ConflictSolver>

         <rule: Prefix>  TYPE ID = \( ID$
         <rule: Postfix> \G ( , <id> )* \) ;
         <token: id>     [A-Za-z_][A-Za-z0-9_]*
     }x;

    $PREFIX = qr{
         <Prefix>
         <extends: ConflictSolver>
    }x;

    $POSTFIX = qr{
         <Postfix>
         <extends: ConflictSolver>
    }x;
  }

#line 83 ./pascalenumeratedvsrangenested.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@pascalenumeratedvsrangenested::ISA variable inside the header section of the eyapp program?
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
  [ 'typeDecl_is_TYPE_ID_type' => 'type_decl', [ 'TYPE', 'ID', '=', 'type', ';' ], 0 ],
  [ 'ENUM' => 'type', [ '(', 'id_list', ')' ], 0 ],
  [ 'RANGE' => 'type', [ 'expr', '..', 'expr' ], 0 ],
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
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	TYPE => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'pascalenumeratedvsrangenested.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'TYPE' => 2
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
#line 369 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule typeDecl_is_TYPE_ID_type
		 'type_decl', 5,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 376 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule ENUM
		 'type', 3,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 383 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule RANGE
		 'type', 3,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 390 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule ID:ENUM
		 'id_list', 2,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 397 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule idList_is_idList_ID
		 'id_list', 3,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 404 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule expr_is_expr
		 'expr', 3,
sub {
#line 61 "pascalenumeratedvsrangenested.eyp"
 $_[2] }
#line 411 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule PLUS
		 'expr', 3,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 418 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule MINUS
		 'expr', 3,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 425 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule TIMES
		 'expr', 3,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 432 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule DIV
		 'expr', 3,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 439 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule COMMA
		 'expr', 3,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 446 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule ID:RANGE
		 'expr', 2,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 453 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule NUM
		 'expr', 1,
sub {
#line 0 "pascalenumeratedvsrangenested.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 460 ./pascalenumeratedvsrangenested.pm
	],
	[#Rule rangeORenum
		 'rangeORenum', 0,
sub {
#line 72 "pascalenumeratedvsrangenested.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 27 "pascalenumeratedvsrangenested.eyp" 

  my $pre = join '', $self->YYSymbolStack("TYPE",-1);
  if ($pre =~ /$PREFIX$/ && /$POSTFIX/) { $self->YYSetReduce([',', ')'], 'ID:ENUM' ); }
  else { $self->YYSetReduce([',', ')'], 'ID:RANGE' ); }
#line 473 ./pascalenumeratedvsrangenested.pm
  }

}
#line 477 ./pascalenumeratedvsrangenested.pm
	]
],
#line 480 ./pascalenumeratedvsrangenested.pm
    yybypass       => 0,
    yybuildingtree => 1,
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
                             'line' => 27
                           }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'typeDecl_is_TYPE_ID_type', 
         'ENUM', 
         'RANGE', 
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

#line 72 "pascalenumeratedvsrangenested.eyp"


=head1 SYNOPSIS

See 

=over 2

=item * File pascalenumeratedvsrange.eyp in examples/debuggintut/

=item * The Bison manual L<http://www.gnu.org/software/bison/manual/html_mono/bison.html>

=back

Compile it with something like:

      eyapp -TC pascalenumeratedvsrangenested.eyp

if your Perl version is higher than 5.10, otherwise:

      eyapp -T -b '/usr/bin/env perl5.10.1' -B '' pascalenumeratedvsrangenested.eyp

Substitute the perl5.10.1 part 
for whatever you have, but be sure 
you use a version of the Perl nterpreter equal or higher than 5.10. 
Be also sure to have installed the last version of L<Regexp::Grammars>.
Run it with this options:

    $ ./pascalenumeratedvsrangenested.pm -t -i -m 1 -c 'type e = (x, y, z);'

Try also these inputs:

                type e = (x) .. (y);
                type r = (x) ..  y ;
                type r = (x+2)*3 ..  y/2 ;
                type e = (x, y, z);
                type e = (x);
                type e = (x, y, z) .. (u+v);

=cut


#line 566 ./pascalenumeratedvsrangenested.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
