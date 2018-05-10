########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.170.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'paulocustodio.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package paulocustodio;
use strict;

push @paulocustodio::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "paulocustodio.eyp"

  my $stmt;


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(nop|\n)}gc and return ($1, $1);



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


#line 63 ./paulocustodio.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@paulocustodio::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.170',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'prg', '$end' ], 0 ],
  [ '_STAR_LIST' => 'STAR-1', [ 'STAR-1', 'stmt' ], 0 ],
  [ '_STAR_LIST' => 'STAR-1', [  ], 0 ],
  [ 'prg_3' => 'prg', [ 'STAR-1' ], 0 ],
  [ 'sos_4' => 'sos', [  ], 0 ],
  [ 'stmt_5' => 'stmt', [ '\n' ], 0 ],
  [ 'stmt_6' => 'stmt', [ 'sos', 'nop', '\n' ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'\n' => { ISSEMANTIC => 0 },
	'nop' => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'paulocustodio.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -2,
		GOTOS => {
			'prg' => 2,
			'STAR-1' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => -3,
			"nop" => -4,
			"\n" => 5
		},
		GOTOS => {
			'stmt' => 3,
			'sos' => 4
		}
	},
	{#State 2
		ACTIONS => {
			'' => 6
		}
	},
	{#State 3
		DEFAULT => -1
	},
	{#State 4
		ACTIONS => {
			"nop" => 7
		}
	},
	{#State 5
		DEFAULT => -5
	},
	{#State 6
		DEFAULT => 0
	},
	{#State 7
		ACTIONS => {
			"\n" => 8
		}
	},
	{#State 8
		DEFAULT => -6
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 145 ./paulocustodio.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 2,
sub {
#line 5 "paulocustodio.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 152 ./paulocustodio.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 0,
sub {
#line 5 "paulocustodio.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 159 ./paulocustodio.pm
	],
	[#Rule prg_3
		 'prg', 1, undef
#line 163 ./paulocustodio.pm
	],
	[#Rule sos_4
		 'sos', 0,
sub {
#line 9 "paulocustodio.eyp"
 $stmt++ }
#line 170 ./paulocustodio.pm
	],
	[#Rule stmt_5
		 'stmt', 1, undef
#line 174 ./paulocustodio.pm
	],
	[#Rule stmt_6
		 'stmt', 3, undef
#line 178 ./paulocustodio.pm
	]
],
#line 181 ./paulocustodio.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'prg_3', 
         'sos_4', 
         'stmt_5', 
         'stmt_6', );
  $self;
}

#line 17 "paulocustodio.eyp"


my @input = ("nop", "\n", "org", "\n");
sub my_lexer {
  my $t = shift(@input);
  ($t, $t);
}

sub my_error {
  my($self) = @_;
  my $t = $self->YYCurval || "eof";
  my @expected = map { $_ eq "\n"? q{'\\n'} : qq{'$_'} } $self->YYExpect();
  local $" = ', ';
  die("Statement $stmt: Syntax error at $t. Expected (@expected).\n");
}

sub main {
  __PACKAGE__->new->YYParse( yylex => \&my_lexer, yyerror => \&my_error);
}

main();


=for None

=cut


#line 233 ./paulocustodio.pm



1;
